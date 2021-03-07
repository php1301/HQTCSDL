-- DROP TABLE VE;
-- DROP TABLE LOAINGUOIDUNG;
-- DROP TABLE NGUOIDUNG;
-- DROP TABLE LICHCHIEU;
-- DROP TABLE GHE;
-- DROP TABLE LOAIGHE;
-- DROP TABLE HETHONGRAP;
-- DROP TABLE CUMRAP;
-- DROP TABLE RAP;
-- DROP TABLE PHIM_THELOAI;
-- DROP TABLE PHIM;
-- DROP TABLE THELOAI;
-- DROP TABLE DATVE;

CREATE TABLE NGUOIDUNG (
    taiKhoan SMALLINT NOT NULL,
    matKhau NVARCHAR2(30),
    email NVARCHAR2(30),
    soDT NVARCHAR2(15),
    maLoaiNguoiDung SMALLINT NOT NULL,
    hoTen NVARCHAR2(15),

    CONSTRAINT PK_nguoidung PRIMARY KEY(taiKhoan)
);

CREATE TABLE LOAINGUOIDUNG (
    maLoaiNguoiDung SMALLINT NOT NULL,
    tenLoai NVARCHAR2(30),

    CONSTRAINT PK_loainguoidung PRIMARY KEY(maLoaiNguoiDung)
);

CREATE TABLE VE (
    maVe SMALLINT NOT NULL,
    ngayDat DATE,
    giaVe NUMBER,
    taiKhoanNguoiDung SMALLINT NOT NULL,
    maLichChieu SMALLINT NOT NULL,
    
    CONSTRAINT PK_ve PRIMARY KEY(maVe)
);

CREATE TABLE GHE (
    maGhe SMALLINT NOT NULL,
    tenGhe NVARCHAR2(30),
    maRap SMALLINT NOT NULL,
    stt SMALLINT NOT NULL,
    maLoaiGhe SMALLINT NOT NULL,
    -- 0 chua kich hoat, 1 da kich hoat
    kichHoat char(1) DEFAULT '0',

    CONSTRAINT PK_ghe PRIMARY KEY(maGhe)
);

CREATE TABLE LOAIGHE (
    maLoaiGhe SMALLINT NOT NULL,
    tenLoaiGhe NVARCHAR2(50),
    moTa NVARCHAR2(50),
    chietKhau NUMBER(4,2),

    CONSTRAINT PK_loaighe PRIMARY KEY(maLoaiGhe)
);

CREATE TABLE RAP (
    maRap SMALLINT NOT NULL,
    tenRap NVARCHAR2(50),
    soGhe INT,
    maCumRap SMALLINT NOT NULL,

    CONSTRAINT PK_rap PRIMARY KEY(maRap)
);


CREATE TABLE CUMRAP (
    maCumRap SMALLINT NOT NULL,
    tenCumRap NVARCHAR2(50),
    thongTin NVARCHAR2(50),
    maHeThongRap SMALLINT NOT NULL,

    CONSTRAINT PK_cumrap PRIMARY KEY(maCumRap)
);

CREATE TABLE HETHONGRAP (
    maHeThongRap SMALLINT NOT NULL,
    tenHeThongRap NVARCHAR2(50),
    biDanh NVARCHAR2(20),
    logo NVARCHAR2(50),

    CONSTRAINT PK_hethongrap PRIMARY KEY(maHeThongRap)
);


CREATE TABLE PHIM (
    maPhim SMALLINT NOT NULL,
    tenPhim NVARCHAR2(50),
    trailer NVARCHAR2(50),
    hinhAnh NVARCHAR2(50),
    moTa NVARCHAR2(50),
    ngayKhoiChieu DATE,
    danhGia NUMBER(2, 1),
    biDanh NVARCHAR2(30),
    daXoa char(1) DEFAULT '0',

    CONSTRAINT PK_phim PRIMARY KEY(maPhim)
);

CREATE TABLE THELOAI (
    maTheLoai SMALLINT NOT NULL,
    tenTheLoai NVARCHAR2(50),

    CONSTRAINT PK_theloai PRIMARY KEY(maTheLoai)
);

CREATE TABLE PHIM_THELOAI (
    maPhim SMALLINT NOT NULL,
    maTheLoai SMALLINT NOT NULL,

    CONSTRAINT PK_phim_theloai PRIMARY KEY(maPhim, maTheLoai)
);

CREATE TABLE LICHCHIEU (
    maLichChieu SMALLINT NOT NULL,
    maPhim SMALLINT NOT NULL,
    maRap SMALLINT NOT NULL,
    maCumRap SMALLINT NOT NULL,
    maHeThongRap SMALLINT NOT NULL,
    ngayChieuGioChieu DATE,
    giaVe NUMBER,
    thoiLuong SMALLINT,

    CONSTRAINT PK_lichchieu PRIMARY KEY(maLichChieu)
);

CREATE TABLE DATVE (
    maVe SMALLINT NOT NULL,
    maGhe SMALLINT NOT NULL,

    CONSTRAINT PK_datve PRIMARY KEY(maVe, maGhe)
);


-- NGUOIDUNG
ALTER TABLE NGUOIDUNG ADD CONSTRAINT FK_nguoidung_loainguoidung FOREIGN KEY(maLoaiNguoiDung) REFERENCES LOAINGUOIDUNG(maLoaiNguoiDung);

-- LOAINGUOIDUNG
-- VE
ALTER TABLE VE ADD CONSTRAINT FK_ve_nguoidung FOREIGN KEY(taiKhoanNguoiDung) REFERENCES NGUOIDUNG(taiKhoan);
ALTER TABLE LICHCHIEU ADD CONSTRAINT FK_ve_lichchieu FOREIGN KEY (maLichChieu) REFERENCES LICHCHIEU(maLichChieu);

-- GHE
ALTER TABLE GHE ADD CONSTRAINT FK_ghe_maloaighe FOREIGN KEY(maLoaiGhe) REFERENCES LOAIGHE(maLoaiGhe);

-- RAP
ALTER TABLE RAP ADD CONSTRAINT FK_rap_cumrap FOREIGN KEY(maCumRap) REFERENCES CUMRAP(maCumRap);

-- CUMRAP
ALTER TABLE CUMRAP ADD CONSTRAINT FK_cumrap_hethongrap FOREIGN KEY(maHeThongRap) REFERENCES HETHONGRAP(maHeThongRap);

-- HETHONGRAP
-- PHIM
-- THELOAI
-- PHIM_THELOAI
ALTER TABLE PHIM_THELOAI ADD CONSTRAINT FK_phim_theloai_phim FOREIGN KEY(maPhim) REFERENCES PHIM(maPhim);
ALTER TABLE PHIM_THELOAI ADD CONSTRAINT FK_phim_theloai_theloai FOREIGN KEY(maTheLoai) REFERENCES THELOAI(maTheLoai);

-- LICHCHIEU
ALTER TABLE LICHCHIEU ADD CONSTRAINT FK_lichchieu_phim FOREIGN KEY(maPhim) REFERENCES PHIM(maPhim);
ALTER TABLE LICHCHIEU ADD CONSTRAINT FK_lichchieu_rap FOREIGN KEY(maRap) REFERENCES RAP(maRap);
ALTER TABLE LICHCHIEU ADD CONSTRAINT FK_lichchieu_cumrap FOREIGN KEY(maCumRap) REFERENCES CUMRAP(maCumRap);
ALTER TABLE LICHCHIEU ADD CONSTRAINT FK_lichchieu_hethongrap FOREIGN KEY(maHeThongRap) REFERENCES HETHONGRAP(maHeThongRap);

-- DATVE
ALTER TABLE DATVE ADD CONSTRAINT FK_datve_ve FOREIGN KEY(maVe)REFERENCES VE(maVe);
ALTER TABLE DATVE ADD CONSTRAINT FK_datve_ghe FOREIGN KEY(maGhe)REFERENCES GHE(maGhe);


-- TRIGGER 1: GIA VE KHONG DUOC BE HON 0
CREATE OR REPLACE TRIGGER VE_GIAVE
BEFORE INSERT OR UPDATE
ON VE    
declare   
v_giave ve.giave%TYPE;
FOR EACH ROW 
BEGIN 
v_giave := :NEW.giave;
    IF (v_giave < 0)
    THEN
        RAISE_APPLICATION_ERROR(-2000, 'GIA VE KHONG DUOC BE HON KHONG')
    ELSE 
        DBMS_OUTPUT.PUT_LINE('THEM VE THANH CONG')
    END IF;
END;