# 📱 InteriorRoom Catalog App  
**Nama : ALIF FAKHRUL HAKIM**  
**NIM : 240605110086**

Berikut merupakan link untuk seluruh modul, uts, dan uas = https://github.com/aliffakhrul/MOBILE-PROGRAMMING-B
(karena saya tidak mengambil mata kuliah prraktikum mobile, maka saya kumpulkan lewat sini)

InteriorRoom Catalog App adalah aplikasi mobile berbasis **Flutter** yang digunakan untuk menampilkan daftar interior room atau produk dekorasi ruangan. Aplikasi ini memanfaatkan **FakeStoreAPI** sebagai sumber data publik dan menampilkan produk berdasarkan kategori, harga, gambar, serta deskripsi lengkap. Aplikasi ini dibuat dengan desain sederhana, navigasi intuitif, dan fitur pencarian untuk memudahkan pengguna menemukan kategori interior yang diinginkan.

---

## 📖 Penjelasan Aplikasi

### 🎨 Tema dan Tujuan
Aplikasi ini memiliki tema katalog interior rumah dengan fokus pada kemudahan eksplorasi dan pencarian produk. Pengguna dapat melihat detail produk secara lengkap, memfilter produk berdasarkan kategori, dan melakukan pencarian secara real-time. Tujuan utama aplikasi ini adalah menyediakan gambaran sederhana tentang bagaimana aplikasi katalog e-commerce bekerja, mulai dari mengambil data dari API, menampilkan ke layar, hingga navigasi ke detail item.

Aplikasi ini cocok sebagai proyek latihan Flutter dalam memahami:
- Cara memanggil **REST API**
- Pengelolaan **state** dengan StatefulWidget
- Implementasi filter, search bar, dan list builder
- Navigasi ke halaman kategori dan halaman detail produk
- Penanganan error dan loading state

---

## 🗂️ Daftar Halaman dan Fungsinya

| No | Halaman | File | Deskripsi |
|---|---|---|---|
| 1 | **Splash Screen** | `splash_screen.dart` | Halaman awal dengan logo sebelum masuk ke Home |
| 2 | **Home Screen** | `home_screen.dart` | Menampilkan semua produk + filter kategori + search |
| 3 | **Category Screen** | `category_screen.dart` | Menampilkan daftar kategori dari API |
| 4 | **Category Detail Screen** | `category_detail_screen.dart` | Menampilkan produk berdasarkan kategori pilihan |
| 5 | **Product Detail Screen** | `product_detail_screen.dart` | Menampilkan detail produk seperti gambar, harga, deskripsi |

---

## 🔌 API yang Digunakan (FakeStoreAPI)

Aplikasi menggunakan API publik **FakeStoreAPI**, yang umum digunakan untuk latihan pembuatan aplikasi katalog atau e-commerce sederhana.

### 1️⃣ Endpoint Utama yang Dipakai

| Endpoint | Method | Deskripsi |
|---------|--------|-----------|
| `/products` | GET | Mengambil semua data produk |
| `/products/categories` | GET | Mengambil daftar kategori produk |
| `/products/category/{category}` | GET | Mengambil produk berdasarkan kategori tertentu |

### 🧩 Contoh Response Produk
```json
{
  "id": 1,
  "title": "Fjallraven Backpack",
  "price": 109.95,
  "description": "Your perfect pack for everyday use.",
  "category": "men's clothing",
  "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
}
