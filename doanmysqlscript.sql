ALTER TABLE Ve ADD diemTichLuySuDung INT NOT NULL DEFAULT '0' AFTER taiKhoan;
ALTER TABLE Ve CHANGE ngayDat ngayDat DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `LoaiNguoiDung` CHANGE `tenLoai` `tenLoai` VARCHAR(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL;
ALTER TABLE `Users` CHANGE `hoTen` `hoTen` VARCHAR(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL;
ALTER TABLE `Phim` CHANGE `tenPhim` `tenPhim` VARCHAR(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL;
ALTER TABLE `Users` CHANGE `tongDiemTichLuy` `tongDiemTichLuy` INT(11) NOT NULL AFTER `maLoaiNguoiDung`;

ALTER TABLE `Ve` ENGINE=InnoDB;
ALTER TABLE `Ghe` ENGINE=InnoDB;
ALTER TABLE `Users` ENGINE=InnoDB;
ALTER TABLE `UserCredentials` ENGINE=InnoDB;
ALTER TABLE `TheLoai` ENGINE=InnoDB;
ALTER TABLE `Rap` ENGINE=InnoDB;
ALTER TABLE `PhimTheLoai` ENGINE=InnoDB;
ALTER TABLE `Phim` ENGINE=InnoDB;
ALTER TABLE `LoaiNguoiDung` ENGINE=InnoDB;
ALTER TABLE `LoaiGhe` ENGINE=InnoDB;
ALTER TABLE `LichChieu` ENGINE=InnoDB;
ALTER TABLE `HeThongRap` ENGINE=InnoDB;
ALTER TABLE `GheDaDat` ENGINE=InnoDB;
ALTER TABLE `DatVe` ENGINE=InnoDB;
ALTER TABLE `CumRap` ENGINE=InnoDB;
set time_zone = '+07:00';
-- USERS
ALTER TABLE Users ADD CONSTRAINT FK_nguoidung_loainguoidung FOREIGN KEY(maLoaiNguoiDung) REFERENCES LoaiNguoiDung(maLoaiNguoiDung) ON DELETE CASCADE;

-- USERCREDENTIALS
ALTER TABLE UserCredentials ADD CONSTRAINT FK_usercredentials_user FOREIGN KEY(taiKhoan) REFERENCES Users(taiKhoan) ON DELETE CASCADE;

-- LOAINGUOIDUNG

-- VE
ALTER TABLE Ve ADD CONSTRAINT FK_ve_nguoidung FOREIGN KEY(taiKhoan) REFERENCES Users(taiKhoan) ON DELETE CASCADE;
ALTER TABLE Ve ADD CONSTRAINT FK_ve_lichchieu FOREIGN KEY (maLichChieu) REFERENCES LichChieu(maLichChieu) ON DELETE CASCADE;
ALTER TABLE Ve CHANGE ngayDat ngayDat DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
-- GHE
ALTER TABLE Ghe ADD CONSTRAINT FK_ghe_maloaighe FOREIGN KEY(maLoaiGhe) REFERENCES LoaiGhe(maLoaiGhe) ON DELETE CASCADE;
ALTER TABLE Ghe ADD CONSTRAINT FK_ghe_maRap FOREIGN KEY(maRap) references Rap(maRap) ON DELETE CASCADE;
-- RAP
ALTER TABLE Rap ADD CONSTRAINT FK_rap_cumrap FOREIGN KEY(maCumRap) REFERENCES CumRap(maCumRap) ON DELETE CASCADE;

-- CUMRAP
ALTER TABLE CumRap ADD CONSTRAINT FK_cumrap_hethongrap FOREIGN KEY(maHeThongRap) REFERENCES HeThongRap(maHeThongRap) ON DELETE CASCADE;
-- HETHONGRAP
-- PHIM
-- THELOAI
-- PHIMTHELOAI
ALTER TABLE PhimTheLoai ADD CONSTRAINT FK_phim_theloai_phim FOREIGN KEY(maPhim) REFERENCES Phim(maPhim) ON DELETE CASCADE;
ALTER TABLE PhimTheLoai ADD CONSTRAINT FK_phim_theloai_theloai FOREIGN KEY(maTheLoai) REFERENCES TheLoai(maTheLoai) ON DELETE CASCADE;

-- LICHCHIEU
ALTER TABLE LichChieu ADD CONSTRAINT FK_lichchieu_phim FOREIGN KEY(maPhim) REFERENCES Phim(maPhim) ON DELETE CASCADE;
ALTER TABLE LichChieu ADD CONSTRAINT FK_lichchieu_rap FOREIGN KEY(maRap) REFERENCES Rap(maRap) ON DELETE CASCADE;
ALTER TABLE LichChieu ADD CONSTRAINT FK_lichchieu_cumrap FOREIGN KEY(maCumRap) REFERENCES CumRap(maCumRap) ON DELETE CASCADE;
ALTER TABLE LichChieu ADD CONSTRAINT FK_lichchieu_hethongrap FOREIGN KEY(maHeThongRap) REFERENCES HeThongRap(maHeThongRap) ON DELETE CASCADE;
ALTER TABLE `LichChieu` CHANGE `gioChieu` `gioChieu` TIME NOT NULL;

-- DATVE
ALTER TABLE DatVe ADD CONSTRAINT FK_datve_ve FOREIGN KEY(maVe)REFERENCES Ve(maVe) ON DELETE CASCADE;
ALTER TABLE DatVe ADD CONSTRAINT FK_datve_ghe FOREIGN KEY(maGhe)REFERENCES Ghe(maGhe) ON DELETE CASCADE;

-- GHEDADAT
ALTER TABLE GheDaDat ADD CONSTRAINT FK_ghedadat_lichchieu FOREIGN KEY(maLichChieu)REFERENCES LichChieu(maLichChieu) ON DELETE CASCADE;
ALTER TABLE GheDaDat ADD CONSTRAINT FK_ghedadat_ghe FOREIGN KEY(maGhe)REFERENCES Ghe(maGhe) ON DELETE CASCADE;


DROP PROCEDURE IF EXISTS sp1;
DELIMITER //
CREATE PROCEDURE sp1()
BEGIN
SELECT MONTH(v.ngayDat) as thang, SUM(v.giaVe) as doanhThu
FROM Ve v
GROUP BY thang;
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS sp2;
DELIMITER //
CREATE PROCEDURE sp2(IN thang INT, IN nam INT, IN maPhimArg INT)
BEGIN
SELECT SUM(v.giaVe) as doanhThu, p.maPhim as maPhim, p.tenPhim as tenPhim
FROM Ve v, Phim p, LichChieu lc
where v.maLichChieu = lc.maLichChieu
and lc.maPhim = p.maPhim
and p.maPhim = maPhimArg
and MONTH(v.ngayDat) = thang
and YEAR(v.ngayDat)= nam
GROUP BY v.maVe;
END //
DELIMITER ;


DROP TRIGGER IF EXISTS DIEMTICHLUY_DATVE;
DELIMITER $$

CREATE TRIGGER DIEMTICHLUY_DATVE BEFORE INSERT ON Ve
for each row
begin
declare diemCongThem INT;
declare taiKhoanVar INT;
declare giaVeVar SMALLINT;
declare diemTichLuyVar SMALLINT;
declare diemTichLuyTongCongVar SMALLINT;
DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Custom error';
END;

    select diemTichLuy, tongDiemTichLuy into diemTichLuyVar, diemTichLuyTongCongVar
    from Users
    where taiKhoan = new.taiKhoan;
    set diemCongThem=new.giaVe/1000;
    update Users
    set diemTichLuy = diemTichLuyVar + diemCongThem - new.diemTichLuySuDung, tongDiemTichLuy = diemTichLuyTongCongVar + diemCongThem
    where taiKhoan = new.taiKhoan;

end$$
DELIMITER ;


DROP TRIGGER IF EXISTS DIEMTICHLUY_USERS;
DELIMITER $$
CREATE TRIGGER DIEMTICHLUY_USERS
AFTER INSERT ON Ve
for each row

begin

declare tongDiem INT;
declare maLoaiNguoiDungCu INT;
declare taiKhoanVal INT DEFAULT NEW.taiKhoan;
DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Custom error';
END;
    select tongDiemTichLuy, maLoaiNguoiDung into tongDiem, maLoaiNguoiDungCu
    from Users
    where taiKhoan = taiKhoanVal;
    -- Than Thiet
    if(tongDiem between 400 and 600) then
    update Users
    set maLoaiNguoiDung = 3
    where taiKhoan = taiKhoanVal;
    -- Bac
    elseif (tongDiem between 601 and 800) then
    update Users
    set maLoaiNguoiDung = 4
    where taiKhoan = taiKhoanVal;
    -- Vang
    elseif (tongDiem between 801 and 1000) then
    update Users
    set maLoaiNguoiDung = 5
    where taiKhoan = taiKhoanVal;
    -- Kim Cuong
    elseif (tongDiem between 1001 and 1200) then
    update Users
    set maLoaiNguoiDung = 6
    where taiKhoan = taiKhoanVal;
    elseif (maLoaiNguoiDungCu <> 1 and maLoaiNguoiDungCu <> 6 and tongDiem > 1200) then
    update Users
    set maLoaiNguoiDung = 6
    where taiKhoan = taiKhoanVal;
    end if;
end$$
DELIMITER ;



DROP TRIGGER IF EXISTS INSERT_NGAYCHIEU_GIOCHIEU;
DELIMITER $$
CREATE TRIGGER INSERT_NGAYCHIEU_GIOCHIEU
BEFORE INSERT ON LichChieu
FOR EACH ROW
begin
DECLARE vNgayKhoiChieu varchar(100);
DECLARE errMessage varchar(50);
    select ngayKhoiChieu into vNgayKhoiChieu
    from Phim
    where New.maPhim = maPhim;

    if(vNgayKhoiChieu > NEW.ngayChieu) then
    set errMessage = concat('Ngay chieu phai sau ngay khoi chieu Ngay khoi chieu ', vNgayKhoiChieu, ' - Ngay chieu ', new.ngayChieu);
    SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = errMessage;
    end if;
end$$
DELIMITER ;

DROP TRIGGER IF EXISTS UPDATE_NGAYCHIEU_GIOCHIEU;
DELIMITER $$
CREATE TRIGGER UPDATE_NGAYCHIEU_GIOCHIEU
BEFORE UPDATE ON LichChieu
FOR EACH ROW
begin
DECLARE vNgayKhoiChieu varchar(100);
DECLARE errMessage varchar(50);
    select ngayKhoiChieu into vNgayKhoiChieu
    from Phim
    where New.maPhim = maPhim;

    if(vNgayKhoiChieu > NEW.ngayChieu) then
    set errMessage = concat('Ngay chieu phai sau ngay khoi chieu Ngay khoi chieu ', vNgayKhoiChieu, ' - Ngay chieu ', new.ngayChieu);
    SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = errMessage;
    end if;
end$$
DELIMITER ;

DROP TRIGGER IF EXISTS INSERT_LICHCHIEU_GIOCHIEU_HOPLY;
DELIMITER $$
CREATE TRIGGER INSERT_LICHCHIEU_GIOCHIEU_HOPLY
BEFORE INSERT ON LichChieu
FOR EACH ROW FOLLOWS INSERT_NGAYCHIEU_GIOCHIEU

BEGIN

DECLARE done INT DEFAULT FALSE;
DECLARE ngayChieuVal varchar(100) DEFAULT DATE_FORMAT(NEW.ngayChieu,"%M %d %Y");
DECLARE thoiGianBatDau varchar(100) DEFAULT NEW.gioChieu;
DECLARE thoiGianKetThuc varchar(100) DEFAULT DATE_ADD(cast(NEW.gioChieu as time), INTERVAL NEW.thoiLuong + 15 MINUTE);
DECLARE minuteToAdd INT;
DECLARE gioChieuBatDau varchar(100);
DECLARE gioChieuXong varchar(100);
DECLARE curMaLichChieu INT;
DECLARE errorText varchar(100);

DECLARE c_lichChieu_gioHopLy CURSOR FOR select maLichChieu, thoiLuong, gioChieu
                               from LichChieu
                               where DATE_FORMAT(ngayChieu,"%M %d %Y") = ngayChieuVal and maRap=NEW.maRap;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        OPEN c_lichChieu_gioHopLy;
        lc : loop
        FETCH c_lichChieu_gioHopLy INTO curMaLichChieu, minuteToAdd, gioChieuBatDau;
         	IF done THEN
      		LEAVE lc;
    		END IF;
        begin
        set minuteToAdd = minuteToAdd + 15;
        set gioChieuXong = DATE_ADD(cast(gioChieuBatDau as time),  INTERVAL minuteToAdd + 15 MINUTE);
        set errorText = concat(thoiGianBatDau, ' ', thoiGianKetThuc, ' Loi: Gio chieu bat dau ', gioChieuBatDau, ' - Gio chieu xong ', gioChieuXong, ' Xung dot voi lich chieu ', curMaLichChieu);
            if( (thoiGianBatDau BETWEEN gioChieuBatDau and gioChieuXong) OR (thoiGianKetThuc BETWEEN gioChieuBatDau and gioChieuXong) ) then
                  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = errorText;
            end if;
        end;
        end loop;
        CLOSE c_lichChieu_gioHopLy;
end$$
DELIMITER ;

DROP TRIGGER IF EXISTS UPDATE_LICHCHIEU_GIOCHIEU_HOPLY;
DELIMITER $$
CREATE TRIGGER UPDATE_LICHCHIEU_GIOCHIEU_HOPLY
BEFORE UPDATE ON LichChieu
FOR EACH ROW FOLLOWS UPDATE_NGAYCHIEU_GIOCHIEU

BEGIN

DECLARE done INT DEFAULT FALSE;
DECLARE ngayChieuVal varchar(100) DEFAULT DATE_FORMAT(NEW.ngayChieu,"%M %d %Y");
DECLARE thoiGianBatDau varchar(100) DEFAULT NEW.gioChieu;
DECLARE thoiGianKetThuc varchar(100) DEFAULT DATE_ADD(cast(NEW.gioChieu as time), INTERVAL NEW.thoiLuong + 15 MINUTE);
DECLARE minuteToAdd INT;
DECLARE gioChieuBatDau varchar(100);
DECLARE gioChieuXong varchar(100);
DECLARE curMaLichChieu INT;
DECLARE errorText varchar(100);

DECLARE c_lichChieu_gioHopLy CURSOR FOR select maLichChieu, thoiLuong, gioChieu
                               from LichChieu
                               where DATE_FORMAT(ngayChieu,"%M %d %Y") = ngayChieuVal and maRap=NEW.maRap and maLichChieu != new.maLichChieu;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        OPEN c_lichChieu_gioHopLy;
        lc : loop
        FETCH c_lichChieu_gioHopLy INTO curMaLichChieu, minuteToAdd, gioChieuBatDau;
         	IF done THEN
      		LEAVE lc;
    		END IF;
        begin
        set minuteToAdd = minuteToAdd + 15;
        set gioChieuXong = DATE_ADD(cast(gioChieuBatDau as time),  INTERVAL minuteToAdd + 15 MINUTE);
        set errorText = concat(thoiGianBatDau, ' ', thoiGianKetThuc, ' Loi: Gio chieu bat dau ', gioChieuBatDau, ' - Gio chieu xong ', gioChieuXong, ' Xung dot voi lich chieu ', curMaLichChieu);
            if( (thoiGianBatDau BETWEEN gioChieuBatDau and gioChieuXong) OR (thoiGianKetThuc BETWEEN gioChieuBatDau and gioChieuXong) ) then
                  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = errorText;
            end if;
        end;
        end loop;
        CLOSE c_lichChieu_gioHopLy;
end$$
DELIMITER ;

DROP Procedure if EXISTS testTrigger;
DELIMITER $$
CREATE PROCEDURE testTrigger()
  BEGIN
 DECLARE done INT DEFAULT FALSE;
DECLARE ngayChieuVal varchar(100) DEFAULT DATE_FORMAT('2021-02-24 17:00:00',"%M %d %Y");
DECLARE thoiGianBatDau varchar(100) DEFAULT '11:05:00';
DECLARE thoiGianKetThuc varchar(100) DEFAULT DATE_ADD(cast('11:05:00' as time) , INTERVAL 112 + 15 MINUTE);
DECLARE minuteToAdd INT;
DECLARE gioChieuBatDau varchar(100);
DECLARE gioChieuXong varchar(100);
DECLARE curMaLichChieu INT;
DECLARE errorText varchar(100);

DECLARE c_lichChieu_gioHopLy CURSOR FOR select maLichChieu, thoiLuong, gioChieu
                               from LichChieu
                               where DATE_FORMAT(ngayChieu,"%M %d %Y") = ngayChieuVal and maRap=3 and maLichChieu != 8;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        OPEN c_lichChieu_gioHopLy;
        lc : loop
        FETCH c_lichChieu_gioHopLy INTO curMaLichChieu, minuteToAdd, gioChieuBatDau;
         	IF done THEN
      		LEAVE lc;
    		END IF;
        begin
        set minuteToAdd = minuteToAdd + 15;
        set gioChieuXong = DATE_ADD(cast(gioChieuBatDau as time),  INTERVAL minuteToAdd + 15 MINUTE);
        set errorText = concat(thoiGianBatDau, ' ', thoiGianKetThuc, ' Loi: Gio chieu bat dau ', gioChieuBatDau, ' - Gio chieu xong ', gioChieuXong, ' Xung dot voi lich chieu ', curMaLichChieu);
            if( (thoiGianBatDau BETWEEN gioChieuBatDau and gioChieuXong) OR (thoiGianKetThuc BETWEEN gioChieuBatDau and gioChieuXong) ) then
                  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = errorText;
            end if;
        end;
        end loop;
        CLOSE c_lichChieu_gioHopLy;
        			-- 	SELECT curMaLichChieu;
                    --    SELECT thoiGianBatDau;
                    --   SELECT thoiGianKetThuc;
                        SELECT gioChieuBatDau;
                    --    SELECT gioChieuKetThuc;
                    --    SELECT errorText;

  END $$
 call p2()
