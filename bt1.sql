-- DROP TABLE DocGia;
-- DROP TABLE TreEm;
-- DROP TABLE NguoiLon;
-- DROP TABLE Muon;
-- DROP TABLE CuonSach;
-- DROP TABLE DauSach;
-- DROP TABLE TuaSach;
-- DROP TABLE QuaTrinhMuon;
-- DROP TABLE DangKy;

CREATE TABLE DocGia(
    ma_docgia SMALLINT,
    ho NVARCHAR2(15),
    tenlot NVARCHAR2(1),
    ten NVARCHAR2(15),
    NgaySinh DATE,

    CONSTRAINT PK_docgia PRIMARY KEY(ma_docgia)
);
CREATE TABLE TreEm (
    ma_docgia SMALLINT,
    ma_docgia_nguoilon SMALLINT,

    CONSTRAINT PK_treem PRIMARY KEY(ma_docgia)
);

CREATE TABLE NguoiLon(
    ma_docgia SMALLINT,
    sonha NVARCHAR2(15),
    duong NVARCHAR2(15),
    quan NVARCHAR2(2),
    dienthoai NVARCHAR2(13),
    han_sd DATE,

    CONSTRAINT PK_nguoilon PRIMARY KEY(ma_docgia)
);

CREATE TABLE Muon(
    isbn INT,
    ma_cuonsach SMALLINT,
    ma_docgia SMALLINT,
    ngayGio_muon DATE,
    ngay_hethan DATE,

    CONSTRAINT PK_muon PRIMARY KEY(isbn)
    -- CONSTRAINT FK_muon_docgia FOREIGN KEY(ma_docgia) REFERENCES DocGia(ma_docgia),
    -- CONSTRAINT FK_muon_cuonsach FOREIGN KEY(ma_cuonsach) REFERENCES CuonSach(ma_cuonsach)
);

CREATE TABLE CuonSach(
    isbn INT NOT NULL,
    ma_cuonsach SMALLINT NOT NULL,
    TinhTrang NVARCHAR2(1),

    CONSTRAINT PK_cuonsach PRIMARY KEY(isbn, ma_cuonsach)
);

CREATE TABLE DangKy(
    isbn INT,
    ma_docgia INT,
    ngayGio_dk DATE,
    ghichu NVARCHAR2(255),

    CONSTRAINT PK_dangky PRIMARY KEY(isbn)
);
CREATE TABLE DauSach(
    isbn INT,
    ma_tuasach INT,
    ngonngu NVARCHAR2(15),
    bia NVARCHAR2(15),
    trangthai NVARCHAR2(1),

    CONSTRAINT PK_dausach PRIMARY KEY(isbn)
);

CREATE TABLE TuaSach(
    ma_tuasach INT,
    TuaSach NVARCHAR2(15),
    tacgia NVARCHAR2(31),
    tomtat NVARCHAR2(222),

    CONSTRAINT PK_tuasach PRIMARY KEY(ma_tuasach)
);
-- NUMBER(19,4)	 - money
CREATE TABLE QuaTrinhMuon(
    isbn INT NOT NULL,
    ma_cuonsach SMALLINT NOT NULL,
    ngayGio_muon DATE NOT NULL,
    ma_docgia SMALLINT,
    ngayGio_tra DATE,
    tien_muon NUMBER(19,4),
    tien_datra NUMBER(19,4),
    tien_datcoc NUMBER(19,4), 
    ghichu NVARCHAR2(255),

    CONSTRAINT PK_quatrinhmuon PRIMARY KEY(isbn, ma_cuonsach, ngayGio_muon)
);
/**-- CONSTRAINTS --**/

-- DocGia
-- TreEm
    ALTER TABLE TreEm ADD CONSTRAINT FK_treem_docgia FOREIGN KEY(ma_docgia) REFERENCES DocGia(ma_docgia);
    ALTER TABLE TreEm ADD CONSTRAINT FK_treem_nguoilon FOREIGN KEY(ma_docgia_nguoilon) REFERENCES NguoiLon(ma_docgia);
-- NguoiLon
    
    ALTER TABLE NguoiLon ADD CONSTRAINT FK_nguoilon_docgia FOREIGN KEY(ma_docgia) REFERENCES DocGia(ma_docgia);
-- Muon
    ALTER TABLE Muon ADD CONSTRAINT FK_muon_docgia FOREIGN KEY(ma_docgia) REFERENCES DocGia(ma_docgia);
    ALTER TABLE Muon ADD CONSTRAINT FK_muon_cuonsach FOREIGN KEY(isbn, ma_cuonsach) REFERENCES CuonSach(isbn, ma_cuonsach);
-- CuonSach
    ALTER TABLE CuonSach ADD CONSTRAINT FK_cuonsach_dausach FOREIGN KEY(isbn) REFERENCES DauSach(isbn);
-- DangKy
    ALTER TABLE DangKy ADD CONSTRAINT FK_dangky_dausach FOREIGN KEY(isbn) REFERENCES DauSach(isbn);
    ALTER TABLE DangKy ADD CONSTRAINT FK_dangky_docgia FOREIGN KEY(ma_docgia) REFERENCES DocGia(ma_docgia);
-- DauSach
    AlTER TABLE DauSach ADD CONSTRAINT FK_dausach_tuasach FOREIGN KEY(ma_tuasach) REFERENCES DauSach(isbn);
-- TuaSach
-- QuaTrinhMuon
    ALTER TABLE QuaTrinhMuon ADD CONSTRAINT FK_quatrinhmuon_cuonsach FOREIGN KEY(isbn, ma_cuonsach) REFERENCES CuonSach(isbn, ma_cuonsach);
    ALTER TABLE QuaTrinhMuon ADD CONSTRAINT FK_quatrinhmuon_docgia FOREIGN KEY(ma_docgia) REFERENCES DocGia(ma_docgia);