-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 02, 2024 at 06:25 AM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diemdanhsv1`
--

-- --------------------------------------------------------

--
-- Table structure for table `bangdiemdanh`
--

DROP TABLE IF EXISTS `bangdiemdanh`;
CREATE TABLE IF NOT EXISTS `bangdiemdanh` (
  `MaDD` varchar(11) NOT NULL,
  `MaSV` varchar(11) DEFAULT NULL,
  `MaLop` varchar(11) DEFAULT NULL,
  `TrangThaiDiemDanh` int DEFAULT NULL,
  `NgayDiemDanh` datetime DEFAULT NULL,
  `GhiChu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MaDD`),
  KEY `MaLop` (`MaLop`),
  KEY `MaSV` (`MaSV`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bangdiemdanh`
--

INSERT INTO `bangdiemdanh` (`MaDD`, `MaSV`, `MaLop`, `TrangThaiDiemDanh`, `NgayDiemDanh`, `GhiChu`) VALUES
('DD006', 'SV004', 'LHP001', 1, '2024-06-01 00:00:00', NULL),
('DD005', 'SV003', 'LHP001', 1, '2024-06-01 00:00:00', NULL),
('DD004', 'SV002', 'LHP001', 0, '2024-06-01 00:00:00', NULL),
('DD003', 'SV001', 'LHP001', 1, '2024-06-01 00:00:00', NULL),
('DD002', 'SV005', 'LHP002', 0, '2024-06-02 00:00:00', NULL),
('DD001', 'SV001', 'LHP002', 1, '2024-06-02 00:00:00', NULL);

--
-- Triggers `bangdiemdanh`
--
DROP TRIGGER IF EXISTS `TRG_BangDiemDanh`;
DELIMITER $$
CREATE TRIGGER `TRG_BangDiemDanh` BEFORE INSERT ON `bangdiemdanh` FOR EACH ROW BEGIN
    DECLARE max_code INT;

    -- Lấy giá trị số lớn nhất hiện có trong student_code
    SELECT IFNULL(MAX(CAST(SUBSTRING(MaDD, 3, 3) AS UNSIGNED)), 0) INTO max_code
    FROM BangDiemDanh;

    -- Tạo mã mới theo mẫu SV###
    SET NEW.MaDD = CONCAT('DD', LPAD(max_code + 1, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `chitietngayhoc`
--

DROP TABLE IF EXISTS `chitietngayhoc`;
CREATE TABLE IF NOT EXISTS `chitietngayhoc` (
  `MaNH` varchar(11) NOT NULL,
  `MaTH` varchar(11) NOT NULL,
  `MaLop` varchar(11) NOT NULL,
  PRIMARY KEY (`MaNH`,`MaTH`,`MaLop`),
  KEY `MaTH` (`MaTH`),
  KEY `MaLop` (`MaLop`),
  KEY `MaNH` (`MaNH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chitietngayhoc`
--

INSERT INTO `chitietngayhoc` (`MaNH`, `MaTH`, `MaLop`) VALUES
('N001', 'TH001', 'LHP001'),
('N002', 'TH001', 'LHP002'),
('N003', 'TH002', 'LHP003');

-- --------------------------------------------------------

--
-- Table structure for table `chitietphanquyen`
--

DROP TABLE IF EXISTS `chitietphanquyen`;
CREATE TABLE IF NOT EXISTS `chitietphanquyen` (
  `MaCTPQ` varchar(11) NOT NULL,
  `QuyenDuocCapPhep` varchar(100) DEFAULT NULL,
  `KiemTraHanhDong` int DEFAULT NULL,
  `MaPQ` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`MaCTPQ`),
  KEY `MaPQ` (`MaPQ`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chitietphanquyen`
--

INSERT INTO `chitietphanquyen` (`MaCTPQ`, `QuyenDuocCapPhep`, `KiemTraHanhDong`, `MaPQ`) VALUES
('CTPQ001', 'Cập nhật dữ liệu', 1, 'PQ001'),
('CTPQ002', 'Điểm danh', 1, 'PQ002'),
('CTPQ003', 'Xem điểm danh', 1, 'PQ003');

--
-- Triggers `chitietphanquyen`
--
DROP TRIGGER IF EXISTS `TRG_ChiTietPhanQuyen`;
DELIMITER $$
CREATE TRIGGER `TRG_ChiTietPhanQuyen` BEFORE INSERT ON `chitietphanquyen` FOR EACH ROW BEGIN
    DECLARE max_code INT;

    -- Lấy giá trị số lớn nhất hiện có trong student_code
    SELECT IFNULL(MAX(CAST(SUBSTRING(MaCTPQ, 5, 3) AS UNSIGNED)), 0) INTO max_code
    FROM ChiTietPhanQuyen;

    -- Tạo mã mới theo mẫu SV###
    SET NEW.MaCTPQ = CONCAT('CTPQ', LPAD(max_code + 1, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `chitiettgh`
--

DROP TABLE IF EXISTS `chitiettgh`;
CREATE TABLE IF NOT EXISTS `chitiettgh` (
  `MaTGH` varchar(11) NOT NULL,
  `MaLop` varchar(11) NOT NULL,
  PRIMARY KEY (`MaTGH`,`MaLop`),
  KEY `MaLop` (`MaLop`),
  KEY `MaTGH` (`MaTGH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chuyenmon`
--

DROP TABLE IF EXISTS `chuyenmon`;
CREATE TABLE IF NOT EXISTS `chuyenmon` (
  `MaCM` varchar(11) NOT NULL,
  `TenCM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaCM`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chuyenmon`
--

INSERT INTO `chuyenmon` (`MaCM`, `TenCM`) VALUES
('CM001', 'Nghệ thuật'),
('CM002', 'Huấn luyện thể thao'),
('CM003', 'Giáo dục thể chất'),
('CM004', 'Huấn luyện thể thao'),
('CM005', 'Máy tính và công nghệ thông tin'),
('CM006', 'Ngôn ngữ'),
('CM007', 'Văn học và văn hóa nước ngoài'),
('CM008', 'Ngôn ngữ, văn học và văn hóa Việt Nam');

--
-- Triggers `chuyenmon`
--
DROP TRIGGER IF EXISTS `TRG_ChuyenMon`;
DELIMITER $$
CREATE TRIGGER `TRG_ChuyenMon` BEFORE INSERT ON `chuyenmon` FOR EACH ROW BEGIN
    DECLARE max_code INT;

    -- Lấy giá trị số lớn nhất hiện có trong student_code
    SELECT IFNULL(MAX(CAST(SUBSTRING(MaCM, 3, 3) AS UNSIGNED)), 0) INTO max_code
    FROM ChuyenMon;

    -- Tạo mã mới theo mẫu SV###
    SET NEW.MaCM = CONCAT('CM', LPAD(max_code + 1, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `danhsachsinhvien_lophocphan`
--

DROP TABLE IF EXISTS `danhsachsinhvien_lophocphan`;
CREATE TABLE IF NOT EXISTS `danhsachsinhvien_lophocphan` (
  `MaSV` varchar(11) NOT NULL,
  `MaLop` varchar(11) NOT NULL,
  `SoLanVang` int DEFAULT NULL,
  `SoLanCoMat` int DEFAULT NULL,
  PRIMARY KEY (`MaSV`,`MaLop`),
  KEY `MaLop` (`MaLop`),
  KEY `MaSV` (`MaSV`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `danhsachsinhvien_lophocphan`
--

INSERT INTO `danhsachsinhvien_lophocphan` (`MaSV`, `MaLop`, `SoLanVang`, `SoLanCoMat`) VALUES
('SV001', 'LHP001', NULL, NULL),
('SV002', 'LHP001', NULL, NULL),
('SV003', 'LHP001', NULL, NULL),
('SV004', 'LHP001', NULL, NULL),
('SV001', 'LHP002', NULL, NULL),
('SV005', 'LHP002', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `giaovien`
--

DROP TABLE IF EXISTS `giaovien`;
CREATE TABLE IF NOT EXISTS `giaovien` (
  `MaGV` varchar(11) NOT NULL,
  `HoTenGV` varchar(100) DEFAULT NULL,
  `NamSinh` date DEFAULT NULL,
  `GioiTinh` varchar(100) DEFAULT NULL,
  `DiaChi` varchar(100) DEFAULT NULL,
  `MaCM` varchar(11) DEFAULT NULL,
  `MaTD` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`MaGV`),
  KEY `MaCM` (`MaCM`),
  KEY `MaTD` (`MaTD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `giaovien`
--

INSERT INTO `giaovien` (`MaGV`, `HoTenGV`, `NamSinh`, `GioiTinh`, `DiaChi`, `MaCM`, `MaTD`) VALUES
('GV001', 'Nguyen Van A', '1980-05-10', 'Nam', '123 Đường A, Thành phố B', 'CM001', 'TD001'),
('GV002', 'Le Thi B', '1985-07-15', 'Nữ', '456 Đường C, Thành phố D', 'CM002', 'TD002'),
('GV003', 'Tran Van C', '1990-03-20', 'Nam', '789 Đường E, Thành phố F', 'CM003', 'TD003'),
('GV004', 'Pham Thi D', '1982-11-30', 'Nữ', '101 Đường G, Thành phố H', 'CM004', 'TD004'),
('GV005', 'Hoang Van E', '1975-01-25', 'Nam', '202 Đường I, Thành phố J', 'CM005', 'TD005'),
('GV006', 'Vu Thi F', '1978-09-12', 'Nữ', '303 Đường K, Thành phố L', 'CM001', 'TD001'),
('GV007', 'Do Van G', '1983-06-22', 'Nam', '404 Đường M, Thành phố N', 'CM002', 'TD002'),
('GV008', 'Nguyen Thi H', '1987-08-19', 'Nữ', '505 Đường O, Thành phố P', 'CM003', 'TD003'),
('GV009', 'Tran Van I', '1992-12-05', 'Nam', '606 Đường Q, Thành phố R', 'CM004', 'TD004'),
('GV010', 'Le Thi K', '1974-04-30', 'Nữ', '707 Đường S, Thành phố T', 'CM005', 'TD005'),
('GV011', 'Nguyen Van L', '1981-02-14', 'Nam', '808 Đường U, Thành phố V', 'CM001', 'TD001'),
('GV012', 'Pham Thi M', '1986-10-10', 'Nữ', '909 Đường W, Thành phố X', 'CM002', 'TD002'),
('GV013', 'Hoang Van N', '1979-05-20', 'Nam', '1010 Đường Y, Thành phố Z', 'CM003', 'TD003'),
('GV014', 'Do Thi O', '1984-07-17', 'Nữ', '1111 Đường AA, Thành phố AB', 'CM004', 'TD004'),
('GV015', 'Vu Van P', '1991-09-25', 'Nam', '1212 Đường AC, Thành phố AD', 'CM005', 'TD005'),
('GV016', 'Nguyen Thi Q', '1988-03-18', 'Nữ', '1313 Đường AE, Thành phố AF', 'CM001', 'TD001'),
('GV017', 'Tran Van R', '1985-11-01', 'Nam', '1414 Đường AG, Thành phố AH', 'CM002', 'TD002'),
('GV018', 'Le Thi S', '1977-06-30', 'Nữ', '1515 Đường AI, Thành phố AJ', 'CM003', 'TD003'),
('GV019', 'Pham Van T', '1989-08-27', 'Nam', '1616 Đường AK, Thành phố AL', 'CM004', 'TD004'),
('GV020', 'Do Thi U', '1982-12-24', 'Nữ', '1717 Đường AM, Thành phố AN', 'CM005', 'TD005');

--
-- Triggers `giaovien`
--
DROP TRIGGER IF EXISTS `TRG_GiaoVien`;
DELIMITER $$
CREATE TRIGGER `TRG_GiaoVien` BEFORE INSERT ON `giaovien` FOR EACH ROW BEGIN
    DECLARE max_code INT;

    -- Lấy giá trị số lớn nhất hiện có trong student_code
    SELECT IFNULL(MAX(CAST(SUBSTRING(MaGV, 3, 3) AS UNSIGNED)), 0) INTO max_code
    FROM GiaoVien;

    -- Tạo mã mới theo mẫu SV###
    SET NEW.MaGV = CONCAT('GV', LPAD(max_code + 1, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `khoa`
--

DROP TABLE IF EXISTS `khoa`;
CREATE TABLE IF NOT EXISTS `khoa` (
  `MaKhoa` varchar(11) NOT NULL,
  `TenKhoa` varchar(100) DEFAULT NULL,
  `SoLuongSV` int DEFAULT NULL,
  PRIMARY KEY (`MaKhoa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `khoa`
--

INSERT INTO `khoa` (`MaKhoa`, `TenKhoa`, `SoLuongSV`) VALUES
('KH001', 'Khoa tự nhiên', 1500),
('KH002', 'Khoa giáo dục thể chất', 500),
('KH003', 'Khoa khoa học tự nhiên', 1000),
('KH004', 'Khoa khoa học chính trị', 800),
('KH005', 'Khoa luật', 600),
('KH006', 'Khoa môi trường và tài nguyên thiên nhiên', 350),
('KH007', 'Khoa ngoại ngữ', 560),
('KH008', 'Khoa phát triển nông thôn', 600),
('KH009', 'Khoa sư phạm', 600);

--
-- Triggers `khoa`
--
DROP TRIGGER IF EXISTS `TRG_Khoa`;
DELIMITER $$
CREATE TRIGGER `TRG_Khoa` BEFORE INSERT ON `khoa` FOR EACH ROW BEGIN
    DECLARE max_code INT;

    -- Lấy giá trị số lớn nhất hiện có trong student_code
    SELECT IFNULL(MAX(CAST(SUBSTRING(MaKhoa, 3, 3) AS UNSIGNED)), 0) INTO max_code
    FROM Khoa;

    -- Tạo mã mới theo mẫu SV###
    SET NEW.MaKhoa = CONCAT('KH', LPAD(max_code + 1, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `lophocphan`
--

DROP TABLE IF EXISTS `lophocphan`;
CREATE TABLE IF NOT EXISTS `lophocphan` (
  `MaLop` varchar(11) NOT NULL,
  `TenLop` varchar(100) DEFAULT NULL,
  `SiSo` int DEFAULT NULL,
  `MaGV` varchar(11) DEFAULT NULL,
  `MaMH` varchar(11) DEFAULT NULL,
  `MaPH` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`MaLop`),
  KEY `MaPH` (`MaPH`),
  KEY `MaMH` (`MaMH`),
  KEY `MaGV` (`MaGV`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lophocphan`
--

INSERT INTO `lophocphan` (`MaLop`, `TenLop`, `SiSo`, `MaGV`, `MaMH`, `MaPH`) VALUES
('LHP001', 'KhoaHocMayTinh12DHTH01', 30, 'GV001', 'MH001', 'PH001'),
('LHP002', 'KinhTe12DHTH02', 35, 'GV002', 'MH002', 'PH002'),
('LHP003', 'Luat12DHTH03', 28, 'GV003', 'MH003', 'PH003'),
('LHP004', 'VatLy12DHTH04', 25, 'GV004', 'MH004', 'PH004'),
('LHP005', 'NgonNgu12DHTH05', 32, 'GV005', 'MH005', 'PH005'),
('LHP006', 'Toan12DHTH06', 29, 'GV006', 'MH006', 'PH006'),
('LHP007', 'QuanTriKinhDoanh12DHTH07', 31, 'GV007', 'MH007', 'PH007'),
('LHP008', 'DuLich12DHTH08', 27, 'GV008', 'MH008', 'PH008'),
('LHP009', 'YHoc12DHTH09', 33, 'GV009', 'MH009', 'PH009'),
('LHP010', 'KeToan12DHTH10', 26, 'GV010', 'MH010', 'PH010'),
('LHP011', 'CongNgheThongTin12DHTH11', 34, 'GV011', 'MH011', 'PH011'),
('LHP012', 'Marketing12DHTH12', 30, 'GV012', 'MH012', 'PH012'),
('LHP013', 'VanHoc12DHTH13', 28, 'GV013', 'MH013', 'PH013'),
('LHP014', 'DiaLy12DHTH14', 32, 'GV014', 'MH014', 'PH014'),
('LHP015', 'AmNhac12DHTH15', 29, 'GV015', 'MH015', 'PH015'),
('LHP016', 'LichSu12DHTH16', 31, 'GV016', 'MH016', 'PH016'),
('LHP017', 'HoaHoc12DHTH17', 27, 'GV017', 'MH017', 'PH017'),
('LHP018', 'GiaoDuc12DHTH18', 33, 'GV018', 'MH018', 'PH018'),
('LHP019', 'QuocTeHoc12DHTH19', 26, 'GV019', 'MH019', 'PH019'),
('LHP020', 'NghiepVuBanHang12DHTH20', 34, 'GV020', 'MH020', 'PH020');

--
-- Triggers `lophocphan`
--
DROP TRIGGER IF EXISTS `TRG_LopHocPhan`;
DELIMITER $$
CREATE TRIGGER `TRG_LopHocPhan` BEFORE INSERT ON `lophocphan` FOR EACH ROW BEGIN
    DECLARE max_code INT;

    -- Lấy giá trị số lớn nhất hiện có trong student_code
    SELECT IFNULL(MAX(CAST(SUBSTRING(MaLop, 4, 3) AS UNSIGNED)), 0) INTO max_code
    FROM LopHocPhan;

    -- Tạo mã mới theo mẫu SV###
    SET NEW.MaLop = CONCAT('LHP', LPAD(max_code + 1, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `lopnienche`
--

DROP TABLE IF EXISTS `lopnienche`;
CREATE TABLE IF NOT EXISTS `lopnienche` (
  `MaLNC` varchar(11) NOT NULL,
  `TenLNC` varchar(100) DEFAULT NULL,
  `SiSo` int DEFAULT NULL,
  `MaGV` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`MaLNC`),
  KEY `MaGV` (`MaGV`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lopnienche`
--

INSERT INTO `lopnienche` (`MaLNC`, `TenLNC`, `SiSo`, `MaGV`) VALUES
('LNC001', '12DHTH01', 30, 'GV001'),
('LNC002', '12DHTH02', 35, 'GV002'),
('LNC003', '12DHTH03', 28, 'GV003'),
('LNC004', '12DHTH04', 40, 'GV004'),
('LNC005', '12DHTH05', 25, 'GV005'),
('LNC006', '12DHTH06', 32, 'GV006'),
('LNC007', '12DHTH07', 27, 'GV007'),
('LNC008', '12DHTH08', 34, 'GV008'),
('LNC009', '12DHTH09', 30, 'GV009'),
('LNC010', '12DHTH10', 36, 'GV010'),
('LNC011', '12DHTH11', 29, 'GV011'),
('LNC012', '12DHTH12', 31, 'GV012'),
('LNC013', '12DHTH13', 33, 'GV013'),
('LNC014', '12DHTH14', 37, 'GV014'),
('LNC015', '12DHTH15', 28, 'GV015'),
('LNC016', '12DHTH16', 39, 'GV016'),
('LNC017', '12DHTH17', 30, 'GV017'),
('LNC018', '12DHTH18', 35, 'GV018'),
('LNC019', '12DHTH19', 27, 'GV019'),
('LNC020', '12DHTH20', 32, 'GV020');

--
-- Triggers `lopnienche`
--
DROP TRIGGER IF EXISTS `TRG_LopNienChe`;
DELIMITER $$
CREATE TRIGGER `TRG_LopNienChe` BEFORE INSERT ON `lopnienche` FOR EACH ROW BEGIN
    DECLARE max_code INT;

    -- Lấy giá trị số lớn nhất hiện có trong student_code
    SELECT IFNULL(MAX(CAST(SUBSTRING(MaLNC, 4, 3) AS UNSIGNED)), 0) INTO max_code
    FROM LopNienChe;

    -- Tạo mã mới theo mẫu SV###
    SET NEW.MaLNC = CONCAT('LNC', LPAD(max_code + 1, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `monhoc`
--

DROP TABLE IF EXISTS `monhoc`;
CREATE TABLE IF NOT EXISTS `monhoc` (
  `MaMH` varchar(11) NOT NULL,
  `TenMH` varchar(100) DEFAULT NULL,
  `SoTietLyThuyet` int DEFAULT NULL,
  `SoTietThucHanh` int DEFAULT NULL,
  `TongSoTiet` int DEFAULT NULL,
  `SoTinChi` int DEFAULT NULL,
  PRIMARY KEY (`MaMH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `monhoc`
--

INSERT INTO `monhoc` (`MaMH`, `TenMH`, `SoTietLyThuyet`, `SoTietThucHanh`, `TongSoTiet`, `SoTinChi`) VALUES
('MH001', 'Toán cao cấp', 30, 15, 45, 3),
('MH002', 'Vật lý đại cương', 35, 10, 45, 3),
('MH003', 'Hóa học đại cương', 28, 17, 45, 3),
('MH004', 'Giải tích', 40, 5, 45, 3),
('MH005', 'Đại số tuyến tính', 32, 13, 45, 3),
('MH006', 'Giáo dục thể chất 1', 0, 45, 45, 1),
('MH007', 'Giáo dục thể chất 2', 0, 45, 45, 1),
('MH008', 'Bóng đá', 0, 45, 45, 2),
('MH009', 'Bóng rổ', 0, 45, 45, 2),
('MH010', 'Điền kinh', 0, 45, 45, 2),
('MH011', 'Sinh học đại cương', 25, 20, 45, 3),
('MH012', 'Địa lý tự nhiên', 30, 15, 45, 3),
('MH013', 'Hóa sinh', 35, 10, 45, 3),
('MH014', 'Cơ học lý thuyết', 40, 5, 45, 3),
('MH015', 'Địa chất học', 28, 17, 45, 3),
('MH016', 'Triết học Mác-Lênin', 45, 0, 45, 3),
('MH017', 'Kinh tế chính trị', 40, 5, 45, 3),
('MH018', 'Chủ nghĩa xã hội khoa học', 45, 0, 45, 3),
('MH019', 'Tư tưởng Hồ Chí Minh', 40, 5, 45, 3),
('MH020', 'Lịch sử Đảng', 35, 10, 45, 3),
('MH021', 'Luật hiến pháp', 45, 0, 45, 3),
('MH022', 'Luật dân sự', 40, 5, 45, 3),
('MH023', 'Luật hình sự', 35, 10, 45, 3),
('MH024', 'Luật quốc tế', 30, 15, 45, 3),
('MH025', 'Luật hành chính', 25, 20, 45, 3),
('MH026', 'Môi trường học', 20, 25, 45, 3),
('MH027', 'Quản lý tài nguyên', 15, 30, 45, 3),
('MH028', 'Sinh thái học', 20, 25, 45, 3),
('MH029', 'Địa chất môi trường', 25, 20, 45, 3),
('MH030', 'Công nghệ môi trường', 30, 15, 45, 3),
('MH031', 'Tiếng Anh cơ bản', 35, 10, 45, 3),
('MH032', 'Tiếng Pháp cơ bản', 30, 15, 45, 3),
('MH033', 'Tiếng Nhật cơ bản', 25, 20, 45, 3),
('MH034', 'Tiếng Trung cơ bản', 20, 25, 45, 3),
('MH035', 'Tiếng Hàn cơ bản', 35, 10, 45, 3),
('MH036', 'Phát triển nông thôn', 30, 15, 45, 3),
('MH037', 'Kinh tế nông nghiệp', 25, 20, 45, 3),
('MH038', 'Quản lý nông thôn', 20, 25, 45, 3),
('MH039', 'Công nghệ sinh học', 35, 10, 45, 3),
('MH040', 'Quy hoạch nông thôn', 30, 15, 45, 3),
('MH041', 'Lý luận dạy học', 25, 20, 45, 3),
('MH042', 'Phương pháp dạy học', 20, 25, 45, 3),
('MH043', 'Tâm lý học giáo dục', 35, 10, 45, 3),
('MH044', 'Giáo dục học', 30, 15, 45, 3),
('MH045', 'Quản lý giáo dục', 25, 20, 45, 3);

--
-- Triggers `monhoc`
--
DROP TRIGGER IF EXISTS `TRG_MonHoc`;
DELIMITER $$
CREATE TRIGGER `TRG_MonHoc` BEFORE INSERT ON `monhoc` FOR EACH ROW BEGIN
    DECLARE max_code INT;

    -- Lấy giá trị số lớn nhất hiện có trong student_code
    SELECT IFNULL(MAX(CAST(SUBSTRING(MaMH, 3, 3) AS UNSIGNED)), 0) INTO max_code
    FROM MonHoc;

    -- Tạo mã mới theo mẫu SV###
    SET NEW.MaMH = CONCAT('MH', LPAD(max_code + 1, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `nganh`
--

DROP TABLE IF EXISTS `nganh`;
CREATE TABLE IF NOT EXISTS `nganh` (
  `MaNganh` varchar(11) NOT NULL,
  `TenNganh` varchar(100) DEFAULT NULL,
  `SoLuongSV` int DEFAULT NULL,
  PRIMARY KEY (`MaNganh`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nganh`
--

INSERT INTO `nganh` (`MaNganh`, `TenNganh`, `SoLuongSV`) VALUES
('NH001', 'Công nghệ thông tin', 200),
('NH002', 'Kỹ thuật phần mềm', 150),
('NH003', 'Hệ thống thông tin', 180),
('NH004', 'Khoa học máy tính', 120),
('NH005', 'Truyền thông và mạng máy tính', 130),
('NH006', 'Công nghệ kỹ thuật cơ khí', 110),
('NH007', 'Công nghệ kỹ thuật điện tử', 140),
('NH008', 'Công nghệ kỹ thuật ô tô', 100),
('NH009', 'Công nghệ kỹ thuật hóa học', 90),
('NH010', 'Kỹ thuật xây dựng', 160),
('NH011', 'Kỹ thuật điện', 130),
('NH012', 'Kỹ thuật điện tử viễn thông', 110),
('NH013', 'Kỹ thuật môi trường', 80),
('NH014', 'Quản trị kinh doanh', 210),
('NH015', 'Tài chính - Ngân hàng', 190),
('NH016', 'Kế toán', 170),
('NH017', 'Kinh tế quốc tế', 150),
('NH018', 'Marketing', 140),
('NH019', 'Luật kinh tế', 130),
('NH020', 'Quản trị dịch vụ du lịch và lữ hành', 120);

--
-- Triggers `nganh`
--
DROP TRIGGER IF EXISTS `TRG_Nganh`;
DELIMITER $$
CREATE TRIGGER `TRG_Nganh` BEFORE INSERT ON `nganh` FOR EACH ROW BEGIN
    DECLARE max_code INT;

    -- Lấy giá trị số lớn nhất hiện có trong student_code
    SELECT IFNULL(MAX(CAST(SUBSTRING(MaNganh, 3, 3) AS UNSIGNED)), 0) INTO max_code
    FROM Nganh;

    -- Tạo mã mới theo mẫu SV###
    SET NEW.MaNganh = CONCAT('NH', LPAD(max_code + 1, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ngayhoc`
--

DROP TABLE IF EXISTS `ngayhoc`;
CREATE TABLE IF NOT EXISTS `ngayhoc` (
  `MaNH` varchar(11) NOT NULL,
  `Ngay` date DEFAULT NULL,
  `Thu` int DEFAULT NULL,
  PRIMARY KEY (`MaNH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ngayhoc`
--

INSERT INTO `ngayhoc` (`MaNH`, `Ngay`, `Thu`) VALUES
('N001', '2024-06-01', NULL),
('N002', '2024-06-02', NULL);

--
-- Triggers `ngayhoc`
--
DROP TRIGGER IF EXISTS `TRG_NgayHoc`;
DELIMITER $$
CREATE TRIGGER `TRG_NgayHoc` BEFORE INSERT ON `ngayhoc` FOR EACH ROW BEGIN
    DECLARE max_code INT;

    -- Lấy giá trị số lớn nhất hiện có trong student_code
    SELECT IFNULL(MAX(CAST(SUBSTRING(MaNH, 3, 3) AS UNSIGNED)), 0) INTO max_code
    FROM NgayHoc;

    -- Tạo mã mới theo mẫu SV###
    SET NEW.MaNH = CONCAT('NH', LPAD(max_code + 1, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `nguoidung`
--

DROP TABLE IF EXISTS `nguoidung`;
CREATE TABLE IF NOT EXISTS `nguoidung` (
  `MaND` varchar(11) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `MatKhau` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaND`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nguoidung`
--

INSERT INTO `nguoidung` (`MaND`, `Email`, `MatKhau`) VALUES
('ND001', 'ngtrhoangphuc@gmail.com', '202cb962ac59075b964b07152d234b70'),
('ND002', 'quangphuong@gmail.com', '289dff07669d7a23de0ef88d2f7129e7'),
('ND003', 'dangphuc@gmail.com', 'd81f9c1be2e08964bf9f24b15f0e4900');

--
-- Triggers `nguoidung`
--
DROP TRIGGER IF EXISTS `TRG_BEFORE_INSERT_NGUOIDUNG`;
DELIMITER $$
CREATE TRIGGER `TRG_BEFORE_INSERT_NGUOIDUNG` BEFORE INSERT ON `nguoidung` FOR EACH ROW BEGIN
    -- Mã hóa mật khẩu
    SET NEW.MatKhau = MD5(NEW.MatKhau);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `TRG_NguoiDung`;
DELIMITER $$
CREATE TRIGGER `TRG_NguoiDung` BEFORE INSERT ON `nguoidung` FOR EACH ROW BEGIN
    DECLARE max_code INT;

    -- Lấy giá trị số lớn nhất hiện có trong student_code
    SELECT IFNULL(MAX(CAST(SUBSTRING(MaND, 3, 3) AS UNSIGNED)), 0) INTO max_code
    FROM NguoiDung;

    -- Tạo mã mới theo mẫu SV###
    SET NEW.MaND = CONCAT('ND', LPAD(max_code + 1, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `nguoidung_phanquyen`
--

DROP TABLE IF EXISTS `nguoidung_phanquyen`;
CREATE TABLE IF NOT EXISTS `nguoidung_phanquyen` (
  `MaND` varchar(11) NOT NULL,
  `MaPQ` varchar(11) NOT NULL,
  PRIMARY KEY (`MaND`,`MaPQ`),
  KEY `MaPQ` (`MaPQ`),
  KEY `MaND` (`MaND`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nguoidung_phanquyen`
--

INSERT INTO `nguoidung_phanquyen` (`MaND`, `MaPQ`) VALUES
('ND001', 'PQ001'),
('ND002', 'PQ003'),
('ND003', 'PQ002');

-- --------------------------------------------------------

--
-- Table structure for table `phanquyen`
--

DROP TABLE IF EXISTS `phanquyen`;
CREATE TABLE IF NOT EXISTS `phanquyen` (
  `MaPQ` varchar(11) NOT NULL,
  `TenNhomQuyen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaPQ`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `phanquyen`
--

INSERT INTO `phanquyen` (`MaPQ`, `TenNhomQuyen`) VALUES
('PQ001', 'Quản lý'),
('PQ002', 'Giáo viên'),
('PQ003', 'Sinh viên');

--
-- Triggers `phanquyen`
--
DROP TRIGGER IF EXISTS `TRG_PhanQuyen`;
DELIMITER $$
CREATE TRIGGER `TRG_PhanQuyen` BEFORE INSERT ON `phanquyen` FOR EACH ROW BEGIN
    DECLARE max_code INT;

    -- Lấy giá trị số lớn nhất hiện có trong student_code
    SELECT IFNULL(MAX(CAST(SUBSTRING(MaPQ, 3, 3) AS UNSIGNED)), 0) INTO max_code
    FROM PhanQuyen;

    -- Tạo mã mới theo mẫu SV###
    SET NEW.MaPQ = CONCAT('PQ', LPAD(max_code + 1, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `phonghoc`
--

DROP TABLE IF EXISTS `phonghoc`;
CREATE TABLE IF NOT EXISTS `phonghoc` (
  `MaPH` varchar(11) NOT NULL,
  `TenPH` varchar(100) DEFAULT NULL,
  `DiaChiPH` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaPH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `phonghoc`
--

INSERT INTO `phonghoc` (`MaPH`, `TenPH`, `DiaChiPH`) VALUES
('PH001', 'A101', 'Dãy A, lầu 1, phòng 01'),
('PH002', 'A102', 'Dãy A, lầu 1, phòng 02'),
('PH003', 'A103', 'Dãy A, lầu 1, phòng 03'),
('PH004', 'A201', 'Dãy A, lầu 2, phòng 01'),
('PH005', 'A202', 'Dãy A, lầu 2, phòng 02'),
('PH006', 'A203', 'Dãy A, lầu 2, phòng 03'),
('PH007', 'A301', 'Dãy A, lầu 3, phòng 01'),
('PH008', 'A302', 'Dãy A, lầu 3, phòng 02'),
('PH009', 'A303', 'Dãy A, lầu 3, phòng 03'),
('PH010', 'B101', 'Dãy B, lầu 1, phòng 01'),
('PH011', 'B102', 'Dãy B, lầu 1, phòng 02'),
('PH012', 'B103', 'Dãy B, lầu 1, phòng 03'),
('PH013', 'B201', 'Dãy B, lầu 2, phòng 01'),
('PH014', 'B202', 'Dãy B, lầu 2, phòng 02'),
('PH015', 'B203', 'Dãy B, lầu 2, phòng 03'),
('PH016', 'B301', 'Dãy B, lầu 3, phòng 01'),
('PH017', 'B302', 'Dãy B, lầu 3, phòng 02'),
('PH018', 'B303', 'Dãy B, lầu 3, phòng 03'),
('PH019', 'C101', 'Dãy C, lầu 1, phòng 01'),
('PH020', 'C102', 'Dãy C, lầu 1, phòng 02');

--
-- Triggers `phonghoc`
--
DROP TRIGGER IF EXISTS `TRG_PhongHoc`;
DELIMITER $$
CREATE TRIGGER `TRG_PhongHoc` BEFORE INSERT ON `phonghoc` FOR EACH ROW BEGIN
    DECLARE max_code INT;

    -- Lấy giá trị số lớn nhất hiện có trong student_code
    SELECT IFNULL(MAX(CAST(SUBSTRING(MaPH, 3, 3) AS UNSIGNED)), 0) INTO max_code
    FROM PhongHoc;

    -- Tạo mã mới theo mẫu SV###
    SET NEW.MaPH = CONCAT('PH', LPAD(max_code + 1, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sinhvien`
--

DROP TABLE IF EXISTS `sinhvien`;
CREATE TABLE IF NOT EXISTS `sinhvien` (
  `MaSV` varchar(11) NOT NULL,
  `HoTenSV` varchar(100) DEFAULT NULL,
  `GioiTinh` varchar(5) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `SoDienThoai` varchar(12) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DiaChi` varchar(100) DEFAULT NULL,
  `MaKhoa` varchar(100) DEFAULT NULL,
  `MaNganh` varchar(100) DEFAULT NULL,
  `MaLNC` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`MaSV`),
  KEY `MaKhoa` (`MaKhoa`),
  KEY `MaNganh` (`MaNganh`),
  KEY `MaLNC` (`MaLNC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sinhvien`
--

INSERT INTO `sinhvien` (`MaSV`, `HoTenSV`, `GioiTinh`, `NgaySinh`, `SoDienThoai`, `Email`, `DiaChi`, `MaKhoa`, `MaNganh`, `MaLNC`) VALUES
('SV001', 'Nguyen Van A', 'Nam', '2000-05-01', '0901234567', 'nguyenvana@example.com', 'Dia chi 1', 'KH001', 'NH001', 'LNC001'),
('SV002', 'Tran Thi B', 'Nữ', '2001-06-02', '0902345678', 'tranthib@example.com', 'Dia chi 2', 'KH002', 'NH002', 'LNC002'),
('SV003', 'Le Van C', 'Nam', '2000-07-03', '0903456789', 'levanc@example.com', 'Dia chi 3', 'KH003', 'NH003', 'LNC003'),
('SV004', 'Pham Thi D', 'Nữ', '2001-08-04', '0904567890', 'phamthid@example.com', 'Dia chi 4', 'KH001', 'NH001', 'LNC004'),
('SV005', 'Hoang Van E', 'Nam', '2000-09-05', '0905678901', 'hoangvane@example.com', 'Dia chi 5', 'KH002', 'NH002', 'LNC005'),
('SV006', 'Vo Thi F', 'Nữ', '2001-10-06', '0906789012', 'vothif@example.com', 'Dia chi 6', 'KH003', 'NH003', 'LNC006'),
('SV007', 'Nguyen Van G', 'Nam', '2000-11-07', '0907890123', 'nguyenvang@example.com', 'Dia chi 7', 'KH001', 'NH001', 'LNC007'),
('SV008', 'Tran Thi H', 'Nữ', '2001-12-08', '0908901234', 'tranthih@example.com', 'Dia chi 8', 'KH002', 'NH002', 'LNC008'),
('SV009', 'Le Van I', 'Nam', '2000-01-09', '0909012345', 'levani@example.com', 'Dia chi 9', 'KH003', 'NH003', 'LNC009'),
('SV010', 'Pham Thi J', 'Nữ', '2001-02-10', '0900123456', 'phamthij@example.com', 'Dia chi 10', 'KH001', 'NH001', 'LNC010'),
('SV011', 'Hoang Van K', 'Nam', '2000-03-11', '0901234501', 'hoangvank@example.com', 'Dia chi 11', 'KH002', 'NH002', 'LNC011'),
('SV012', 'Vo Thi L', 'Nữ', '2001-04-12', '0902345601', 'vothil@example.com', 'Dia chi 12', 'KH003', 'NH003', 'LNC012'),
('SV013', 'Nguyen Van M', 'Nam', '2000-05-13', '0903456701', 'nguyenvanm@example.com', 'Dia chi 13', 'KH001', 'NH001', 'LNC013'),
('SV014', 'Tran Thi N', 'Nữ', '2001-06-14', '0904567801', 'tranthin@example.com', 'Dia chi 14', 'KH002', 'NH002', 'LNC014'),
('SV015', 'Le Van O', 'Nam', '2000-07-15', '0905678902', 'levano@example.com', 'Dia chi 15', 'KH003', 'NH003', 'LNC015'),
('SV016', 'Pham Thi P', 'Nữ', '2001-08-16', '0906789012', 'phamthip@example.com', 'Dia chi 16', 'KH001', 'NH001', 'LNC016'),
('SV017', 'Hoang Van Q', 'Nam', '2000-09-17', '0907890123', 'hoangvanq@example.com', 'Dia chi 17', 'KH002', 'NH002', 'LNC017'),
('SV018', 'Vo Thi R', 'Nữ', '2001-10-18', '0908901234', 'vothir@example.com', 'Dia chi 18', 'KH003', 'NH003', 'LNC018'),
('SV019', 'Nguyen Van S', 'Nam', '2000-11-19', '0909012345', 'nguyenvans@example.com', 'Dia chi 19', 'KH001', 'NH001', 'LNC019'),
('SV020', 'Tran Thi T', 'Nữ', '2001-12-20', '0900123456', 'tranthit@example.com', 'Dia chi 20', 'KH002', 'NH002', 'LNC020'),
('SV021', 'Le Van U', 'Nam', '2000-01-21', '0901234561', 'levanu@example.com', 'Dia chi 21', 'KH003', 'NH003', 'LNC001'),
('SV022', 'Pham Thi V', 'Nữ', '2001-02-22', '0902345672', 'phamthiv@example.com', 'Dia chi 22', 'KH001', 'NH001', 'LNC002'),
('SV023', 'Hoang Van W', 'Nam', '2000-03-23', '0903456783', 'hoangvanw@example.com', 'Dia chi 23', 'KH002', 'NH002', 'LNC003'),
('SV024', 'Vo Thi X', 'Nữ', '2001-04-24', '0904567894', 'vothix@example.com', 'Dia chi 24', 'KH003', 'NH003', 'LNC004'),
('SV025', 'Nguyen Van Y', 'Nam', '2000-05-25', '0905678905', 'nguyenvany@example.com', 'Dia chi 25', 'KH001', 'NH001', 'LNC005'),
('SV026', 'Tran Thi Z', 'Nữ', '2001-06-26', '0906789016', 'tranthiz@example.com', 'Dia chi 26', 'KH002', 'NH002', 'LNC006'),
('SV027', 'Le Van AA', 'Nam', '2000-07-27', '0907890127', 'levanaa@example.com', 'Dia chi 27', 'KH003', 'NH003', 'LNC007'),
('SV028', 'Pham Thi AB', 'Nữ', '2001-08-28', '0908901238', 'phamthiab@example.com', 'Dia chi 28', 'KH001', 'NH001', 'LNC008'),
('SV029', 'Hoang Van AC', 'Nam', '2000-09-29', '0909012349', 'hoangvanac@example.com', 'Dia chi 29', 'KH002', 'NH002', 'LNC009'),
('SV030', 'Vo Thi AD', 'Nữ', '2001-10-30', '0900123450', 'vothiad@example.com', 'Dia chi 30', 'KH003', 'NH003', 'LNC010'),
('SV031', 'Nguyen Van AE', 'Nam', '0000-00-00', '0901234561', 'nguyenvanae@example.com', 'Dia chi 31', 'KH001', 'NH001', 'LNC011'),
('SV032', 'Tran Thi AF', 'Nữ', '2001-12-01', '0902345672', 'tranthiaf@example.com', 'Dia chi 32', 'KH002', 'NH002', 'LNC012'),
('SV033', 'Le Van AG', 'Nam', '2000-01-02', '0903456783', 'levanag@example.com', 'Dia chi 33', 'KH003', 'NH003', 'LNC013'),
('SV034', 'Pham Thi AH', 'Nữ', '2001-02-03', '0904567894', 'phamthiah@example.com', 'Dia chi 34', 'KH001', 'NH001', 'LNC014'),
('SV035', 'Hoang Van AI', 'Nam', '2000-03-04', '0905678905', 'hoangvanai@example.com', 'Dia chi 35', 'KH002', 'NH002', 'LNC015'),
('SV036', 'Vo Thi AJ', 'Nữ', '2001-04-05', '0906789016', 'vothiaj@example.com', 'Dia chi 36', 'KH003', 'NH003', 'LNC016'),
('SV037', 'Nguyen Van AK', 'Nam', '2000-05-06', '0907890127', 'nguyenvanak@example.com', 'Dia chi 37', 'KH001', 'NH001', 'LNC017'),
('SV038', 'Tran Thi AL', 'Nữ', '2001-06-07', '0908901238', 'tranthial@example.com', 'Dia chi 38', 'KH002', 'NH002', 'LNC018'),
('SV039', 'Le Van AM', 'Nam', '2000-07-08', '0909012349', 'levanam@example.com', 'Dia chi 39', 'KH003', 'NH003', 'LNC019'),
('SV040', 'Pham Thi AN', 'Nữ', '2001-08-09', '0900123450', 'phamthian@example.com', 'Dia chi 40', 'KH001', 'NH001', 'LNC020'),
('SV041', 'Hoang Van AO', 'Nam', '2000-09-10', '0901234561', 'hoangvanao@example.com', 'Dia chi 41', 'KH002', 'NH002', 'LNC001'),
('SV042', 'Vo Thi AP', 'Nữ', '2001-10-11', '0902345672', 'vothiap@example.com', 'Dia chi 42', 'KH003', 'NH003', 'LNC002'),
('SV043', 'Nguyen Van AQ', 'Nam', '2000-11-12', '0903456783', 'nguyenvanaq@example.com', 'Dia chi 43', 'KH001', 'NH001', 'LNC003'),
('SV044', 'Tran Thi AR', 'Nữ', '2001-12-13', '0904567894', 'tranthiar@example.com', 'Dia chi 44', 'KH002', 'NH002', 'LNC004'),
('SV045', 'Le Van AS', 'Nam', '2000-01-14', '0905678905', 'levanas@example.com', 'Dia chi 45', 'KH003', 'NH003', 'LNC005'),
('SV046', 'Pham Thi AT', 'Nữ', '2001-02-15', '0906789016', 'phamthiat@example.com', 'Dia chi 46', 'KH001', 'NH001', 'LNC006'),
('SV047', 'Hoang Van AU', 'Nam', '2000-03-16', '0907890127', 'hoangvanau@example.com', 'Dia chi 47', 'KH002', 'NH002', 'LNC007'),
('SV048', 'Vo Thi AV', 'Nữ', '2001-04-17', '0908901238', 'vothiav@example.com', 'Dia chi 48', 'KH003', 'NH003', 'LNC008'),
('SV049', 'Nguyen Van AW', 'Nam', '2000-05-18', '0909012349', 'nguyenvanaw@example.com', 'Dia chi 49', 'KH001', 'NH001', 'LNC009'),
('SV050', 'Tran Thi AX', 'Nữ', '2001-06-19', '0900123450', 'tranthiax@example.com', 'Dia chi 50', 'KH002', 'NH002', 'LNC010'),
('SV051', 'Le Van AY', 'Nam', '2000-07-20', '0901234561', 'levanay@example.com', 'Dia chi 51', 'KH003', 'NH003', 'LNC011'),
('SV052', 'Pham Thi AZ', 'Nữ', '2001-08-21', '0902345672', 'phamthiaz@example.com', 'Dia chi 52', 'KH001', 'NH001', 'LNC012'),
('SV053', 'Hoang Van BA', 'Nam', '2000-09-22', '0903456783', 'hoangvanba@example.com', 'Dia chi 53', 'KH002', 'NH002', 'LNC013'),
('SV054', 'Vo Thi BB', 'Nữ', '2001-10-23', '0904567894', 'vothibb@example.com', 'Dia chi 54', 'KH003', 'NH003', 'LNC014'),
('SV055', 'Nguyen Van BC', 'Nam', '2000-11-24', '0905678905', 'nguyenvanbc@example.com', 'Dia chi 55', 'KH001', 'NH001', 'LNC015'),
('SV056', 'Tran Thi BD', 'Nữ', '2001-12-25', '0906789016', 'tranthibd@example.com', 'Dia chi 56', 'KH002', 'NH002', 'LNC016'),
('SV057', 'Le Van BE', 'Nam', '2000-01-26', '0907890127', 'levanbe@example.com', 'Dia chi 57', 'KH003', 'NH003', 'LNC017'),
('SV058', 'Pham Thi BF', 'Nữ', '2001-02-27', '0908901238', 'phamthibf@example.com', 'Dia chi 58', 'KH001', 'NH001', 'LNC018'),
('SV059', 'Hoang Van BG', 'Nam', '2000-03-28', '0909012349', 'hoangvanbg@example.com', 'Dia chi 59', 'KH002', 'NH002', 'LNC019'),
('SV060', 'Vo Thi BH', 'Nữ', '2001-04-29', '0900123450', 'vothibh@example.com', 'Dia chi 60', 'KH003', 'NH003', 'LNC020'),
('SV061', 'Nguyen Van BI', 'Nam', '2000-05-30', '0901234561', 'nguyenvanbi@example.com', 'Dia chi 61', 'KH001', 'NH001', 'LNC001'),
('SV062', 'Tran Thi BJ', 'Nữ', '2001-06-01', '0902345672', 'tranthibj@example.com', 'Dia chi 62', 'KH002', 'NH002', 'LNC002'),
('SV063', 'Le Van BK', 'Nam', '2000-07-02', '0903456783', 'levanbk@example.com', 'Dia chi 63', 'KH003', 'NH003', 'LNC003'),
('SV064', 'Pham Thi BL', 'Nữ', '2001-08-03', '0904567894', 'phamthibl@example.com', 'Dia chi 64', 'KH001', 'NH001', 'LNC004'),
('SV065', 'Hoang Van BM', 'Nam', '2000-09-04', '0905678905', 'hoangvanbm@example.com', 'Dia chi 65', 'KH002', 'NH002', 'LNC005'),
('SV066', 'Vo Thi BN', 'Nữ', '2001-10-05', '0906789016', 'vothibn@example.com', 'Dia chi 66', 'KH003', 'NH003', 'LNC006'),
('SV067', 'Nguyen Van BO', 'Nam', '2000-11-06', '0907890127', 'nguyenvanbo@example.com', 'Dia chi 67', 'KH001', 'NH001', 'LNC007'),
('SV068', 'Tran Thi BP', 'Nữ', '2001-12-07', '0908901238', 'tranthibp@example.com', 'Dia chi 68', 'KH002', 'NH002', 'LNC008'),
('SV069', 'Le Van BQ', 'Nam', '2000-01-08', '0909012349', 'levanbq@example.com', 'Dia chi 69', 'KH003', 'NH003', 'LNC009'),
('SV070', 'Pham Thi BR', 'Nữ', '2001-02-09', '0900123450', 'phamthibr@example.com', 'Dia chi 70', 'KH001', 'NH001', 'LNC010'),
('SV071', 'Hoang Van BS', 'Nam', '2000-03-10', '0901234561', 'hoangvanbs@example.com', 'Dia chi 71', 'KH002', 'NH002', 'LNC011'),
('SV072', 'Vo Thi BT', 'Nữ', '2001-04-11', '0902345672', 'vothibt@example.com', 'Dia chi 72', 'KH003', 'NH003', 'LNC012'),
('SV073', 'Nguyen Van BU', 'Nam', '2000-05-12', '0903456783', 'nguyenvanbu@example.com', 'Dia chi 73', 'KH001', 'NH001', 'LNC013'),
('SV074', 'Tran Thi BV', 'Nữ', '2001-06-13', '0904567894', 'tranthibv@example.com', 'Dia chi 74', 'KH002', 'NH002', 'LNC014'),
('SV075', 'Le Van BW', 'Nam', '2000-07-14', '0905678905', 'levanbw@example.com', 'Dia chi 75', 'KH003', 'NH003', 'LNC015'),
('SV076', 'Pham Thi BX', 'Nữ', '2001-08-15', '0906789016', 'phamthibx@example.com', 'Dia chi 76', 'KH001', 'NH001', 'LNC016'),
('SV077', 'Hoang Van BY', 'Nam', '2000-09-16', '0907890127', 'hoangvanby@example.com', 'Dia chi 77', 'KH002', 'NH002', 'LNC017'),
('SV078', 'Vo Thi BZ', 'Nữ', '2001-10-17', '0908901238', 'vothibz@example.com', 'Dia chi 78', 'KH003', 'NH003', 'LNC018'),
('SV079', 'Nguyen Van CA', 'Nam', '2000-11-18', '0909012349', 'nguyenvanca@example.com', 'Dia chi 79', 'KH001', 'NH001', 'LNC019'),
('SV080', 'Tran Thi CB', 'Nữ', '2001-12-19', '0900123450', 'tranthicb@example.com', 'Dia chi 80', 'KH002', 'NH002', 'LNC020'),
('SV081', 'Le Van CC', 'Nam', '2000-01-20', '0901234561', 'levancc@example.com', 'Dia chi 81', 'KH003', 'NH003', 'LNC001'),
('SV082', 'Pham Thi CD', 'Nữ', '2001-02-21', '0902345672', 'phamthicd@example.com', 'Dia chi 82', 'KH001', 'NH001', 'LNC002'),
('SV083', 'Hoang Van CE', 'Nam', '2000-03-22', '0903456783', 'hoangvance@example.com', 'Dia chi 83', 'KH002', 'NH002', 'LNC003'),
('SV084', 'Vo Thi CF', 'Nữ', '2001-04-23', '0904567894', 'vothicf@example.com', 'Dia chi 84', 'KH003', 'NH003', 'LNC004'),
('SV085', 'Nguyen Van CG', 'Nam', '2000-05-24', '0905678905', 'nguyenvancg@example.com', 'Dia chi 85', 'KH001', 'NH001', 'LNC005'),
('SV086', 'Tran Thi CH', 'Nữ', '2001-06-25', '0906789016', 'tranthich@example.com', 'Dia chi 86', 'KH002', 'NH002', 'LNC006'),
('SV087', 'Le Van CI', 'Nam', '2000-07-26', '0907890127', 'levanci@example.com', 'Dia chi 87', 'KH003', 'NH003', 'LNC007'),
('SV088', 'Pham Thi CJ', 'Nữ', '2001-08-27', '0908901238', 'phamthicj@example.com', 'Dia chi 88', 'KH001', 'NH001', 'LNC008'),
('SV089', 'Hoang Van CK', 'Nam', '2000-09-28', '0909012349', 'hoangvanck@example.com', 'Dia chi 89', 'KH002', 'NH002', 'LNC009'),
('SV090', 'Vo Thi CL', 'Nữ', '2001-10-29', '0900123450', 'vothicl@example.com', 'Dia chi 90', 'KH003', 'NH003', 'LNC010'),
('SV091', 'Nguyen Van CM', 'Nam', '2000-11-30', '0901234561', 'nguyenvancm@example.com', 'Dia chi 91', 'KH001', 'NH001', 'LNC011'),
('SV092', 'Tran Thi CN', 'Nữ', '2001-12-31', '0902345672', 'tranthicn@example.com', 'Dia chi 92', 'KH002', 'NH002', 'LNC012'),
('SV093', 'Le Van CO', 'Nam', '2000-01-01', '0903456783', 'levanco@example.com', 'Dia chi 93', 'KH003', 'NH003', 'LNC013'),
('SV094', 'Pham Thi CP', 'Nữ', '2001-02-02', '0904567894', 'phamthicp@example.com', 'Dia chi 94', 'KH001', 'NH001', 'LNC014'),
('SV095', 'Hoang Van CQ', 'Nam', '2000-03-03', '0905678905', 'hoangvancq@example.com', 'Dia chi 95', 'KH002', 'NH002', 'LNC015'),
('SV096', 'Vo Thi CR', 'Nữ', '2001-04-04', '0906789016', 'vothicr@example.com', 'Dia chi 96', 'KH003', 'NH003', 'LNC016'),
('SV097', 'Nguyen Van CS', 'Nam', '2000-05-05', '0907890127', 'nguyenvancs@example.com', 'Dia chi 97', 'KH001', 'NH001', 'LNC017'),
('SV098', 'Tran Thi CT', 'Nữ', '2001-06-06', '0908901238', 'tranthict@example.com', 'Dia chi 98', 'KH002', 'NH002', 'LNC018'),
('SV099', 'Le Van CU', 'Nam', '2000-07-07', '0909012349', 'levancu@example.com', 'Dia chi 99', 'KH003', 'NH003', 'LNC019'),
('SV100', 'Pham Thi CV', 'Nữ', '2001-08-08', '0900123450', 'phamthicv@example.com', 'Dia chi 100', 'KH001', 'NH001', 'LNC020');

--
-- Triggers `sinhvien`
--
DROP TRIGGER IF EXISTS `TRG_AFTER_UPDATE_SINHVIEN`;
DELIMITER $$
CREATE TRIGGER `TRG_AFTER_UPDATE_SINHVIEN` AFTER UPDATE ON `sinhvien` FOR EACH ROW BEGIN
    -- Kiểm tra nếu department_id thay đổi
    IF sinhvien.MaPH != sinhvien.MaPH THEN
        -- Giảm số lượng sinh viên trong Khoa cũ
        UPDATE PhongHoc
        SET SoLuongSV = SoLuongSV - 1
        WHERE MaPH = sinhvien.MaPH;

        -- Tăng số lượng sinh viên trong Khoa mới
        UPDATE PhongHoc
        SET SoLuongSV = SoLuongSV + 1
        WHERE MaPH = sinhvien.MaPH;
    END IF;

    -- Kiểm tra nếu major_id thay đổi
    IF sinhvien.MaNganh != sinhvien.MaNganh THEN
        -- Giảm số lượng sinh viên trong Ngành cũ
        UPDATE Nganh
        SET SoLuongSV = SoLuongSV - 1
        WHERE MaNganh = sinhvien.MaNganh;

        -- Tăng số lượng sinh viên trong Ngành mới
        UPDATE Nganh
        SET SoLuongSV = SoLuongSV + 1
        WHERE MaNganh = sinhvien.MaNganh;
    END IF;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `TRG_BEFORE_INSERT_SINHVIEN`;
DELIMITER $$
CREATE TRIGGER `TRG_BEFORE_INSERT_SINHVIEN` BEFORE INSERT ON `sinhvien` FOR EACH ROW BEGIN
    -- Kiểm tra nếu giá trị của cột gender chỉ là 'Nam' hoặc 'Nữ'
    IF NEW.GioiTinh NOT IN ('Nam', 'Nữ', 'Khác') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Giới tính không hợp lệ. Giới tính chỉ có Nam, Nữ hoặc Khác.';
    END IF;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `TRG_SinhVien`;
DELIMITER $$
CREATE TRIGGER `TRG_SinhVien` BEFORE INSERT ON `sinhvien` FOR EACH ROW BEGIN
    DECLARE max_code INT;

    -- Lấy giá trị số lớn nhất hiện có trong student_code
    SELECT IFNULL(MAX(CAST(SUBSTRING(MaSV, 3, 3) AS UNSIGNED)), 0) INTO max_code
    FROM SinhVien;

    -- Tạo mã mới theo mẫu SV###
    SET NEW.MaSV = CONCAT('SV', LPAD(max_code + 1, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `thoigianhoc`
--

DROP TABLE IF EXISTS `thoigianhoc`;
CREATE TABLE IF NOT EXISTS `thoigianhoc` (
  `MaTGH` varchar(100) NOT NULL,
  `SoLuongNgayHoc` int DEFAULT NULL,
  `NgayBD` date DEFAULT NULL,
  `NgayKT` date DEFAULT NULL,
  PRIMARY KEY (`MaTGH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `thoigianhoc`
--
DROP TRIGGER IF EXISTS `TRG_ThoiGianHoc`;
DELIMITER $$
CREATE TRIGGER `TRG_ThoiGianHoc` BEFORE INSERT ON `thoigianhoc` FOR EACH ROW BEGIN
    DECLARE max_code INT;

    -- Lấy giá trị số lớn nhất hiện có trong student_code
    SELECT IFNULL(MAX(CAST(SUBSTRING(MaTGH, 3, 3) AS UNSIGNED)), 0) INTO max_code
    FROM ThoiGianHoc;

    -- Tạo mã mới theo mẫu SV###
    SET NEW.MaTGH = CONCAT('TGH', LPAD(max_code + 1, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tiethoc`
--

DROP TABLE IF EXISTS `tiethoc`;
CREATE TABLE IF NOT EXISTS `tiethoc` (
  `MaTH` varchar(11) NOT NULL,
  `TenTH` varchar(100) DEFAULT NULL,
  `GioBD` time DEFAULT NULL,
  `GioKT` time DEFAULT NULL,
  PRIMARY KEY (`MaTH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tiethoc`
--

INSERT INTO `tiethoc` (`MaTH`, `TenTH`, `GioBD`, `GioKT`) VALUES
('TH001', 'Tiết 1', '07:00:00', '07:45:00'),
('TH002', 'Tiết 2', '07:45:00', '08:30:00'),
('TH003', 'Tiết 3', '08:30:00', '09:15:00'),
('TH004', 'Tiết 4', '09:15:00', '10:00:00'),
('TH005', 'Tiết 5', '10:00:00', '10:45:00'),
('TH006', 'Tiết 6', '10:45:00', '11:30:00'),
('TH007', 'Tiết 7', '12:30:00', '13:15:00'),
('TH008', 'Tiết 8', '13:15:00', '14:00:00'),
('TH009', 'Tiết 9', '14:00:00', '14:45:00'),
('TH010', 'Tiết 10', '14:45:00', '15:30:00'),
('TH011', 'Tiết 11', '15:30:00', '16:15:00'),
('TH012', 'Tiết 12', '16:15:00', '17:00:00'),
('TH013', 'Tiết 13', '18:00:00', '18:45:00'),
('TH014', 'Tiết 14', '18:45:00', '19:30:00'),
('TH015', 'Tiết 15', '19:30:00', '20:15:00'),
('TH016', 'Tiết 16', '20:15:00', '21:00:00'),
('TH017', 'Tiết 17', '21:00:00', '21:45:00');

--
-- Triggers `tiethoc`
--
DROP TRIGGER IF EXISTS `TRG_TietHoc`;
DELIMITER $$
CREATE TRIGGER `TRG_TietHoc` BEFORE INSERT ON `tiethoc` FOR EACH ROW BEGIN
    DECLARE max_code INT;

    -- Lấy giá trị số lớn nhất hiện có trong student_code
    SELECT IFNULL(MAX(CAST(SUBSTRING(MaTH, 3, 3) AS UNSIGNED)), 0) INTO max_code
    FROM TietHoc;

    -- Tạo mã mới theo mẫu SV###
    SET NEW.MaTH = CONCAT('TH', LPAD(max_code + 1, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `trinhdo`
--

DROP TABLE IF EXISTS `trinhdo`;
CREATE TABLE IF NOT EXISTS `trinhdo` (
  `MaTD` varchar(11) NOT NULL,
  `TenTD` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaTD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trinhdo`
--

INSERT INTO `trinhdo` (`MaTD`, `TenTD`) VALUES
('TD001', 'Cử nhân'),
('TD002', 'Kỹ sư'),
('TD003', 'Thạc sĩ'),
('TD004', 'Tiến sĩ'),
('TD005', 'Giáo sư');

--
-- Triggers `trinhdo`
--
DROP TRIGGER IF EXISTS `TRG_TrinhDo`;
DELIMITER $$
CREATE TRIGGER `TRG_TrinhDo` BEFORE INSERT ON `trinhdo` FOR EACH ROW BEGIN
    DECLARE max_code INT;

    -- Lấy giá trị số lớn nhất hiện có trong student_code
    SELECT IFNULL(MAX(CAST(SUBSTRING(MaTD, 3, 3) AS UNSIGNED)), 0) INTO max_code
    FROM TrinhDo;

    -- Tạo mã mới theo mẫu SV###
    SET NEW.MaTD = CONCAT('TD', LPAD(max_code + 1, 3, '0'));
END
$$
DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
