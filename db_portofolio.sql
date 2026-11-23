-- Database lengkap untuk website portofolio Kanisius Nikolas Candra
-- Import file ini melalui phpMyAdmin.

CREATE DATABASE IF NOT EXISTS db_portofolio
  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE db_portofolio;

CREATE TABLE IF NOT EXISTS services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS statistics (
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(100) NOT NULL,
    value INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    subject VARCHAR(150),
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data awal services
INSERT INTO services (id, title, description) VALUES
(1, 'Otomasi & Sistem PLC', 'Merancang dan memrogram sistem kontrol otomatis industri menggunakan PLC, HMI, dan sensor terintegrasi.'),
(2, 'Desain Mekanik & CAD', 'Pembuatan model 3D komponen mekanik, simulasi beban, dan desain prototyping menggunakan perangkat lunak CAD.'),
(3, 'Embedded Systems & IoT', 'Pengembangan sistem tertanam menggunakan STM32, ESP32, atau Arduino untuk kontrol aktuator dan komunikasi data.')
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description);

-- Data awal statistik
INSERT INTO statistics (id, label, value) VALUES
(1, 'Proyek Mesin', 12),
(2, 'Presisi Kontrol (%)', 100),
(3, 'Riset Hardware (Tahun)', 3),
(4, 'Sertifikasi', 3)
ON DUPLICATE KEY UPDATE label=VALUES(label), value=VALUES(value);

-- Tabel contacts sengaja kosong; data akan masuk melalui Contact Form.
