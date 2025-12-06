# 📘 PinjamRuang App

**Nama:** Alif Fakhrul Hakim  
**NIM:** 230605110016  

Laporan Project: https://drive.google.com/file/d/1bKiuTpoB9D8VC0x1dKlSwPrqQRLfKFPc/view?usp=sharing 

PinjamRuang App adalah aplikasi mobile berbasis **Flutter** yang dirancang untuk mempermudah proses peminjaman ruangan di lingkungan kampus. Aplikasi ini memiliki tampilan antarmuka yang sederhana, responsif, dan mudah digunakan oleh mahasiswa maupun dosen.

---

## 🎯 Tema dan Tujuan Aplikasi

Dalam kegiatan akademik, sering kali pengguna kesulitan mengetahui ruangan mana yang tersedia atau sudah dibooking.  
PinjamRuang hadir sebagai solusi digital untuk:

- Mempermudah proses peminjaman ruangan secara cepat dan transparan.  
- Menampilkan status peminjaman ruangan (diajukan, ditolak, atau diterima).  
- Menyediakan informasi detail tiap ruangan, seperti kapasitas, fasilitas, dan jadwal penggunaan.  
- Meningkatkan efisiensi administrasi peminjaman ruang di kampus.

---

## 📱 Daftar Halaman dan Fungsinya

1. **Login Page (`login.dart`)**  
   Halaman pertama aplikasi yang berfungsi untuk autentikasi pengguna.  
   Pengguna dapat masuk menggunakan akun yang telah terdaftar.

2. **Home Page (`home_user.dart`)**  
   Halaman utama yang menampilkan informasi ringkas tentang jumlah ruangan yang tersedia, sedang digunakan, dan total ruangan.  
   Terdapat juga tombol **“Tampilkan Semua”** untuk melihat daftar ruangan lengkap.

3. **List Ruangan (`list_ruangan.dart`)**  
   Berisi daftar semua ruangan yang dapat dipinjam.  
   Setiap ruangan ditampilkan dalam bentuk **card** dengan status dan kapasitasnya.

4. **Detail Ruangan (`detail_ruangan.dart`)**  
   Menampilkan informasi detail ruangan seperti nama, kapasitas, fasilitas, serta tombol **“Pinjam Ruangan”**.  
   Terdapat juga ikon **Back berwarna putih** di bagian atas untuk kembali ke halaman sebelumnya.

5. **Profil Page (`profile_user.dart`)**  
   Menampilkan data pengguna dan histori peminjaman ruangan yang pernah dilakukan.  
   Pengguna juga dapat keluar dari aplikasi melalui tombol **Logout**.

---

## 🧩 Perancangan Antarmuka

Warna utama aplikasi ini adalah **biru**, karena biru identik dengan **Teknik Informatika** dan memberikan kesan profesional, familiar, serta nyaman untuk dilihat.  
Desain dibuat dengan gaya **minimalis**, menggunakan ikon-ikon sederhana dari **Flutter Icons** agar tampilan tetap modern dan ringan.

---

## ⚙️Langkah Menjalankan Aplikasi

1.  Pastikan Anda telah menginstal Flutter SDK di komputer Anda.
2.  Clone repositori ini: `git clone [URL_GITHUB_ANDA]`
3.  Pindah ke direktori proyek: `cd uts_mobile_programming`
4.  Jalankan perintah untuk mengunduh dependensi: `flutter pub get`
5.  Hubungkan perangkat (emulator atau perangkat fisik).
6.  Jalankan aplikasi dengan perintah: `flutter run`
