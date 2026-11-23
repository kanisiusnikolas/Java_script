// ================================================
// FITUR JAVASCRIPT PORTOFOLIO MEKATRONIKA
// 1. Menu active sesuai section yang dipilih
// 2. Perpindahan section dengan smooth autoscroll
// 3. Grafik data statis menggunakan Chart.js
// ================================================

document.addEventListener('DOMContentLoaded', function () {
    const navLinks = document.querySelectorAll('.nav-menu .nav-link');
    const sections = document.querySelectorAll('section[id]');

    // Mengubah status active pada menu navigasi.
    function setActiveMenu(sectionId) {
        navLinks.forEach(function (link) {
            const isActive = link.getAttribute('href') === '#' + sectionId;
            link.classList.toggle('active', isActive);

            if (isActive) {
                link.setAttribute('aria-current', 'page');
            } else {
                link.removeAttribute('aria-current');
            }
        });
    }

    // Klik menu akan menggulir halaman ke section tujuan secara halus.
    navLinks.forEach(function (link) {
        link.addEventListener('click', function (event) {
            const targetId = this.getAttribute('href').substring(1);
            const targetSection = document.getElementById(targetId);

            if (targetSection) {
                event.preventDefault();
                setActiveMenu(targetId);
                targetSection.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
                history.replaceState(null, '', '#' + targetId);
            }
        });
    });

    // Menu active juga mengikuti section yang sedang terlihat saat scroll manual.
    if ('IntersectionObserver' in window) {
        const sectionObserver = new IntersectionObserver(function (entries) {
            entries.forEach(function (entry) {
                if (entry.isIntersecting) {
                    setActiveMenu(entry.target.id);
                }
            });
        }, {
            root: null,
            rootMargin: '-25% 0px -55% 0px',
            threshold: 0
        });

        sections.forEach(function (section) {
            sectionObserver.observe(section);
        });
    }

    // Grafik jumlah proyek per bidang (data contoh/statis).
    const chartCanvas = document.getElementById('projectChart');

    if (chartCanvas && typeof Chart !== 'undefined') {
        new Chart(chartCanvas, {
            type: 'bar',
            data: {
                labels: ['Otomasi & PLC', 'Desain CAD', 'Embedded Systems', 'IoT'],
                datasets: [{
                    label: 'Jumlah Proyek (data simulasi)',
                    data: [5, 4, 8, 6],
                    backgroundColor: [
                        'rgba(13, 110, 253, 0.65)',
                        'rgba(25, 135, 84, 0.65)',
                        'rgba(255, 193, 7, 0.70)',
                        'rgba(220, 53, 69, 0.65)'
                    ],
                    borderColor: [
                        'rgb(13, 110, 253)',
                        'rgb(25, 135, 84)',
                        'rgb(255, 193, 7)',
                        'rgb(220, 53, 69)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: true,
                        position: 'bottom'
                    },
                    tooltip: {
                        enabled: true
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            precision: 0
                        },
                        title: {
                            display: true,
                            text: 'Jumlah Proyek'
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Bidang'
                        }
                    }
                }
            }
        });
    } else if (chartCanvas) {
        console.error('Chart.js belum berhasil dimuat. Periksa koneksi internet.');
    }
});
