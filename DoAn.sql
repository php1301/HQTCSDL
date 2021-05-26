--
--BEGIN
--
--FOR c IN (SELECT table_name FROM user_tables) LOOP
--EXECUTE IMMEDIATE ('DROP TABLE "' || c.table_name || '" CASCADE CONSTRAINTS');
--END LOOP;
--
--FOR s IN (SELECT sequence_name FROM user_sequences) LOOP
--EXECUTE IMMEDIATE ('DROP SEQUENCE ' || s.sequence_name);
--END LOOP;
--
--END;
----
----
--purge recyclebin
-- bonus point
-- Gioi tinh khuyen mai

CREATE TABLE USERS (
    taiKhoan SMALLINT GENERATED as IDENTITY(START with 1 INCREMENT by 1),
    password NVARCHAR2(100),
    email NVARCHAR2(30) UNIQUE,
    soDT NVARCHAR2(15),
    maLoaiNguoiDung SMALLINT DEFAULT 3,
    hoTen NVARCHAR2(15),
    avatar NVARCHAR2(15),
    
    CONSTRAINT PK_nguoidung PRIMARY KEY(taiKhoan)
);

CREATE TABLE USERCREDENTIALS (
    isbn SMALLINT GENERATED as IDENTITY(START with 1 INCREMENT by 1),
    password NVARCHAR2(100),
    taiKhoan SMALLINT not null,
    
    CONSTRAINT PK_usercredentials PRIMARY KEY(isbn)
);

CREATE TABLE LOAINGUOIDUNG (
    maLoaiNguoiDung SMALLINT NOT NULL,
    tenLoai VARCHAR2(30),

    CONSTRAINT PK_loainguoidung PRIMARY KEY(maLoaiNguoiDung)
);

CREATE TABLE VE (
    maVe SMALLINT GENERATED as IDENTITY(START with 1 INCREMENT by 1),
    ngayDat DATE,
    giaVe NUMBER,
    taiKhoan SMALLINT NOT NULL,
    giamGia SMALLINT NOT NULL,
    loaiVe varchar2(30),
    hinhAnh varchar2(50),
    maLichChieu SMALLINT NOT NULL,
    
    CONSTRAINT PK_ve PRIMARY KEY(maVe)
);

CREATE TABLE GHE (
    maGhe SMALLINT GENERATED as IDENTITY(START with 1 INCREMENT by 1),
    tenGhe NVARCHAR2(30),
    maRap SMALLINT NOT NULL,
    stt SMALLINT NOT NULL,
    maLoaiGhe SMALLINT NOT NULL,
    -- 0 chua kich hoat, 1 da kich hoat
--    kichHoat char(1) DEFAULT '0',

    CONSTRAINT PK_ghe PRIMARY KEY(maGhe)
);

CREATE TABLE LOAIGHE (
    maLoaiGhe SMALLINT GENERATED as IDENTITY(START with 1 INCREMENT by 1),
    tenLoaiGhe NVARCHAR2(50),
    moTa NVARCHAR2(50),
    chietKhau NUMBER(4,2),

    CONSTRAINT PK_loaighe PRIMARY KEY(maLoaiGhe)
);

CREATE TABLE RAP (
    maRap SMALLINT GENERATED as IDENTITY(START with 1 INCREMENT by 1),
    tenRap NVARCHAR2(50),
    soGhe INT,
    maCumRap VARCHAR2(1024),

    CONSTRAINT PK_rap PRIMARY KEY(maRap)
);


CREATE TABLE CUMRAP (
    maCumRap VARCHAR2(1024),
    tenCumRap NVARCHAR2(50),
    thongTin NVARCHAR2(50),
    maHeThongRap VARCHAR2(1024),

    CONSTRAINT PK_cumrap PRIMARY KEY(maCumRap)
);

CREATE TABLE HETHONGRAP (
    maHeThongRap VARCHAR2(1024),
    tenHeThongRap NVARCHAR2(50),
    biDanh NVARCHAR2(20),
    logo NVARCHAR2(50),

    CONSTRAINT PK_hethongrap PRIMARY KEY(maHeThongRap)
);


CREATE TABLE PHIM (
    maPhim SMALLINT GENERATED as IDENTITY(START with 1 INCREMENT by 1),
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
    maTheLoai SMALLINT GENERATED as IDENTITY(START with 1 INCREMENT by 1),
    tenTheLoai NVARCHAR2(50),

    CONSTRAINT PK_theloai PRIMARY KEY(maTheLoai)
);

CREATE TABLE PHIMTHELOAI (
    isbn SMALLINT GENERATED as IDENTITY(START with 1 INCREMENT by 1),
    maPhim SMALLINT NOT NULL,
    maTheLoai SMALLINT NOT NULL,

    CONSTRAINT PK_phim_theloai PRIMARY KEY(maPhim, maTheLoai)
);

CREATE TABLE LICHCHIEU (
    maLichChieu SMALLINT GENERATED as IDENTITY(START with 1 INCREMENT by 1),
    maPhim SMALLINT NOT NULL,
    maRap SMALLINT NOT NULL,
    maCumRap VARCHAR2(1024),
    maHeThongRap VARCHAR2(1024),
    ngayChieuGioChieu DATE,
    giaVe NUMBER,
    thoiLuong SMALLINT,

    CONSTRAINT PK_lichchieu PRIMARY KEY(maLichChieu)
);

CREATE TABLE DATVE (
    isbn SMALLINT GENERATED as IDENTITY(START with 1 INCREMENT by 1),
    maVe SMALLINT NOT NULL,
    maGhe SMALLINT NOT NULL,

    CONSTRAINT PK_datve PRIMARY KEY(maVe, maGhe)
);

CREATE TABLE GHEDADAT(
    isbn SMALLINT GENERATED as IDENTITY(START with 1 INCREMENT by 1),
    maGhe SMALLINT NOT NULL,
    maLichChieu SMALLINT NOT NULL,

    CONSTRAINT PK_ghedadat PRIMARY KEY(maGhe, maLichChieu)
);

-- USERS
ALTER TABLE USERS ADD CONSTRAINT FK_nguoidung_loainguoidung FOREIGN KEY(maLoaiNguoiDung) REFERENCES LOAINGUOIDUNG(maLoaiNguoiDung);

-- USERCREDENTIALS
ALTER TABLE USERCREDENTIALS ADD CONSTRAINT FK_usercredentials_user FOREIGN KEY(taiKhoan) REFERENCES USERS(taiKhoan);

-- LOAINGUOIDUNG

-- VE
ALTER TABLE VE ADD CONSTRAINT FK_ve_nguoidung FOREIGN KEY(taiKhoan) REFERENCES USERS(taiKhoan);
ALTER TABLE VE ADD CONSTRAINT FK_ve_lichchieu FOREIGN KEY (maLichChieu) REFERENCES LICHCHIEU(maLichChieu);
-- GHE
ALTER TABLE GHE ADD CONSTRAINT FK_ghe_maloaighe FOREIGN KEY(maLoaiGhe) REFERENCES LOAIGHE(maLoaiGhe);
ALTER TABLE GHE ADD CONSTRAINT FK_ghe_maRap FOREIGN KEY(maRap) references Rap(maRap);
-- RAP
ALTER TABLE RAP ADD CONSTRAINT FK_rap_cumrap FOREIGN KEY(maCumRap) REFERENCES CUMRAP(maCumRap);

-- CUMRAP
ALTER TABLE CUMRAP ADD CONSTRAINT FK_cumrap_hethongrap FOREIGN KEY(maHeThongRap) REFERENCES HETHONGRAP(maHeThongRap);
--INSERT INTO CUMRAP VALUES('CGV','CGV','CGV','CGV');

--alter table cumrap modify mahethongrap nvarchar2(50);
-- HETHONGRAP
-- PHIM
-- THELOAI
-- PHIMTHELOAI
ALTER TABLE PHIMTHELOAI ADD CONSTRAINT FK_phim_theloai_phim FOREIGN KEY(maPhim) REFERENCES PHIM(maPhim);
ALTER TABLE PHIMTHELOAI ADD CONSTRAINT FK_phim_theloai_theloai FOREIGN KEY(maTheLoai) REFERENCES THELOAI(maTheLoai);

-- LICHCHIEU
ALTER TABLE LICHCHIEU ADD CONSTRAINT FK_lichchieu_phim FOREIGN KEY(maPhim) REFERENCES PHIM(maPhim);
ALTER TABLE LICHCHIEU ADD CONSTRAINT FK_lichchieu_rap FOREIGN KEY(maRap) REFERENCES RAP(maRap);
ALTER TABLE LICHCHIEU ADD CONSTRAINT FK_lichchieu_cumrap FOREIGN KEY(maCumRap) REFERENCES CUMRAP(maCumRap);
ALTER TABLE LICHCHIEU ADD CONSTRAINT FK_lichchieu_hethongrap FOREIGN KEY(maHeThongRap) REFERENCES HETHONGRAP(maHeThongRap);

-- DATVE
ALTER TABLE DATVE ADD CONSTRAINT FK_datve_ve FOREIGN KEY(maVe)REFERENCES VE(maVe);
ALTER TABLE DATVE ADD CONSTRAINT FK_datve_ghe FOREIGN KEY(maGhe)REFERENCES GHE(maGhe);

-- GHEDADAT
ALTER TABLE GHEDADAT ADD CONSTRAINT FK_ghedadat_lichchieu FOREIGN KEY(maLichChieu)REFERENCES LICHCHIEU(maLichChieu);
ALTER TABLE GHEDADAT ADD CONSTRAINT FK_ghedadat_ghe FOREIGN KEY(maGhe)REFERENCES GHE(maGhe);

-- To ADD: https://github.com/ciaranRoche/mySQL-movie-db/blob/master/database-triggers-scripts.sql
-- TRIGGER 1: GIA VE KHONG DUOC BE HON 0
--CREATE OR REPLACE TRIGGER VE_GIAVE
--BEFORE INSERT OR UPDATE
--ON VE    
--declare   
--v_giave ve.giave%TYPE;
--FOR EACH ROW 
--BEGIN 
--v_giave := :NEW.giave;
--    IF (v_giave < 0)
--    THEN
--        RAISE_APPLICATION_ERROR(-2000, 'GIA VE KHONG DUOC BE HON KHONG')
--    ELSE 
--        DBMS_OUTPUT.PUT_LINE('THEM VE THANH CONG')
--    END IF;
--END;


-- Stored Procedure 

-- SP-1: Paggination and sorting
--create or replace procedure GetResults 
--(
-- p_userId In Number,
-- p_dueDateFrom In Date,
-- p_dueDateTo in Date,
-- p_durationMax in Number,
-- p_durationMin in Number,
-- p_sortColumn In Varchar2,
-- p_sortOrder In Varchar2,
-- p_pageSize In Number,
-- p_pageIndex in number,
-- cv_1 OUT SYS_REFCURSOR
--)
--as 
--v_FirstIndex   NUMBER;
--v_LastIndex    NUMBER;
--begin
---- Paging
--  v_LastIndex := p_pageSize * (p_pageIndex + 1);
--  v_FirstIndex := v_LastIndex - p_pageSize + 1;
--
-- OPEN cv_1 FOR 
--
--  SELECT * FROM (SELECT a.*, ROWNUM AS rnum
--              FROM (Select * From Newjob nj Where nj.userId = p_userId  
--               -- Filtering
--             And ((p_dueDateFrom IS NULL AND p_dueDateTo Is NULL) OR 
--                  (nj.Due_Date >= p_dueDateFrom and nj.Due_Date <= p_dueDateTo)
--                 )
--             And ((p_durationMax IS NULL AND p_durationMin Is NULL) OR 
--                  (nj.Duration >= p_durationMax and nj.Duration <= p_durationMin)
--                 )   
--             -- Sorting     
--            order by   
--            Case when p_sortOrder = 'Ascending' And p_sortColumn = 'DUE_DATE' then  nj.Due_Date End,
--            Case When p_sortOrder = 'Ascending' And p_sortColumn = 'DURATION' then nj.DURATION end,     
--            Case when p_sortOrder = 'Descending' And p_sortColumn = 'DUE_DATE' then  nj.Due_Date End desc,
--            Case When p_sortOrder = 'Descending' And p_sortColumn = 'DURATION' then nj.DURATION end desc)a
--   WHERE ROWNUM <= v_LastIndex)    
--   WHERE rnum >= v_FirstIndex;
--end;



-- Trigger 1 - Kiem tra ghe trung
CREATE OR REPLACE TRIGGER GHETRUNG_DATVE
BEFORE INSERT OR UPDATE ON GHEDADAT
FOR EACH ROW
DECLARE
v_checkTrung number;
begin    
    select count(gdd.maLichChieu) into v_checkTrung
    from GheDaDat gdd
    Where gdd.maGhe = :new.maGhe and gdd.maLichChieu = :new.maLichChieu;
    
    IF(v_checkTrung>=1)
    THEN
        RAISE_APPLICATION_ERROR(-20000, 'Ghe ' || :NEW.maGhe || ' nay da co nguoi dat');
--    else

--        insert into GHEDADAT values(default, :NEW.maGhe, vlichchieu);
    end if;
end;
/
---- Trigger 2 cancelled - INSERT VAO GHEDADAT
--CREATE OR REPLACE TRIGGER THEM_VAO_GHEDADAT
--AFTER INSERT OR UPDATE ON DATVE
--FOR EACH ROW
----FOLLOWS GHETRUNG_DATVE
--declare 
--vlichchieu number;
--cursor c_ghe_ve(mv Ve.maVe%type) IS select maGhe 
--                                    from DATVE 
--                                    where maVe = mv;
--begin
--    select distinct maLichChieu into vlichchieu
--    from DATVE dv, VE v 
--    where dv.maVe = v.maVe;
--    
--    for g in c_ghe_ve(:new.maVe)
--    loop
--    insert into GHEDADAT values(default, g.maGhe, vlichchieu);
--    end loop;
--end;
--/
--alter trigger THEM_VAO_GHEDADAT disable;
-- Trigger 2 - Kiem tra maCumRap va maHeThongRap
CREATE OR REPLACE TRIGGER KIEMTRA_MACUMRAP_MAHETHONGRAP
BEFORE INSERT OR UPDATE ON CUMRAP
FOR EACH ROW
DECLARE 
prefix varchar2(50);
BEGIN
SELECT NVL(SUBSTR(:new.tencumrap, 0, INSTR(:new.tencumrap, ' ')-1), :new.tencumrap) into prefix
  FROM DUAL;
  if(upper(prefix)!= upper(:new.mahethongrap)) then
  raise_application_error(-20000,'Ma cum rap, ten cum rap phai co chu cai bat dau giong voi ma he thong rap' || prefix || :new.mahethongrap );
  end if;
END;
/
-- Trigger 3 - ngayChieuGioChieu phai sau ngayKhoiChieu cua phim
CREATE OR REPLACE TRIGGER NGAYCHIEU_GIOCHIEU
BEFORE INSERT OR UPDATE ON LICHCHIEU
FOR EACH ROW
DECLARE
vNgayKhoiChieu DATE;
begin
    select TO_DATE(ngayKhoiChieu,'DD-MON-YYYY') into vNgayKhoiChieu
    from Phim
    where :New.maPhim = phim.maPhim;
    
    if(vNgayKhoiChieu > TO_DATE(:NEW.ngayChieuGioChieu,'DD-MON-YYYY')) then
    raise_application_error(-20001 ,'Ngay chieu phai sau ngay khoi chieu ' || vNgayKhoiChieu || ' ' || TO_DATE(:NEW.ngayChieuGioChieu,'DD-MON-YYYY') );
    end if;
end;
/
--SELECT NVL(SUBSTR('ABC blah', 0, INSTR('ABC blah', ' ')-1), 'ABC blah') AS output
--  FROM DUAL
-- Stored Procedure ho tro output
--create or replace D
--  vret integer := 0;
--  vtxt varchar2(4000);
--begin
--  dbms_output.enable;
--  while vret = 0 loop
--    dbms_output.get_line(vtxt, vret);
--    if vret = 0 then
--      if p_output  is null then
--        p_output := vtxt;
--      else
--       p_output := p_output || chr(10) || vtxt;
--      end if;
--    end if;
--  end loop;
--  dbms_output.disable;
--end;
-- Stored Procedure 1: Tinh tien ghe

-- Function 1: Tinh tien ghe
create or replace Function Ve_TinhTien(idGhe ghe.maGhe%type, giaVe number) return number
as
    giaTienMotGhe number;
    chietKhau number;
begin
    select chietKhau into chietKhau
    from LoaiGhe join Ghe
    on LoaiGhe.maLoaiGhe = Ghe.maLoaiGhe
    where Ghe.maGhe = idGhe;
    giaTienMotGhe := giave - giave * (chietkhau/100);
    return giaTienMotGhe;
end;
/
set serveroutput on
--declare kq number;
--begin
--kq:=Ve_TinhTien(15, 30000);
--  declare
--    kq number;
--    begin
--    kq:=Ve_TinhTien(15, 30000);
--    DBMS_OUTPUT.PUT_LINE('KET QUA LA: ' || kq);
--    end;
--    Select Ve_TinhTien(15, 30000) from dual;
--    
--    
--      declare
--             rc sys_refcursor;
--            begin
--            open rc for Select Ve_TinhTien(15, 30000) from dual;
--            dbms_sql.return_result(rc);
--            end;