-- Jalankan melalui phpMyAdmin pada database db_portofolio.
-- Skrip ini menyesuaikan isi tabel dengan profil pada portofolio.

START TRANSACTION;

UPDATE services SET
    title = 'Otomasi & Sistem PLC',
    description = 'Merancang dan memrogram sistem kontrol otomatis industri menggunakan PLC, HMI, dan sensor terintegrasi.'
WHERE id = 1;

UPDATE services SET
    title = 'Desain Mekanik & CAD',
    description = 'Pembuatan model 3D komponen mekanik, simulasi beban, dan desain prototyping menggunakan perangkat lunak CAD.'
WHERE id = 2;

UPDATE services SET
    title = 'Embedded Systems & IoT',
    description = 'Pengembangan sistem tertanam menggunakan STM32, ESP32, atau Arduino untuk kontrol aktuator dan komunikasi data.'
WHERE id = 3;

UPDATE statistics SET label = 'Proyek Mesin', value = 12 WHERE id = 1;
UPDATE statistics SET label = 'Presisi Kontrol (%)', value = 100 WHERE id = 2;
UPDATE statistics SET label = 'Riset Hardware (Tahun)', value = 3 WHERE id = 3;

INSERT INTO statistics (label, value)
SELECT 'Sertifikasi', 3
WHERE NOT EXISTS (
    SELECT 1 FROM statistics WHERE label = 'Sertifikasi'
);

COMMIT;
