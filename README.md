## CRUD & Styling — Implementasi Dasar API Eksternal pada Flutter

# 1. Tujuan Praktikum

~ Memahami konsep dasar API dan REST API.
~ Menggunakan package http untuk melakukan request ke API eksternal.
~ Melakukan operasi CRUD (Create, Read, Update, Delete).
~ Menampilkan data JSON ke UI Flutter.
~ Mengimplementasikan styling dasar pada komponen UI.

# 2. Alat dan Bahan

~ Flutter SDK
~ Android Studio / VS Code
~ Emulator atau perangkat fisik Android
~ Package: http: ^1.2.1
~ API: https://reqres.in

# 3. Dasar Teori (Singkat)

~ API (Application Programming Interface): Jembatan antara client (Flutter) dan server.
~ REST API: Menggunakan metode HTTP seperti GET, POST, PUT, DELETE.
~ JSON: Format pertukaran data yang ringan dan mudah dibaca.
~ Package http: Digunakan untuk mengirim dan menerima data dari API.

# 4. Langkah Implementasi

1. Setup Proyek Flutter
2. Membuat project baru praktikum_api_crud.
3. Menambahkan dependency http.
4. Model Data (user_model.dart)
5. Membuat class User untuk menampung data dari API.
6. API Service (api_service.dart)
7. Membuat fungsi fetchUsers(), createUser(), updateUser(), deleteUser().
8. Tampilan Utama (main.dart)
9. Menampilkan daftar pengguna dari API menggunakan FutureBuilder dan ListView.
10. Form Tambah Data (add_user_page.dart)
11. Menggunakan TextFormField dan validasi form untuk menambahkan user baru.
12. Fitur Update & Delete
13. Menghapus dan mengedit data melalui API (tugas lanjutan).

# 5. Hasil Pengujian

~ Aplikasi berhasil menampilkan daftar pengguna dari API ReqRes.
~ Data dapat ditambahkan menggunakan tombol “+”.
~ Fitur edit dan delete berjalan sesuai instruksi modul.
~ Styling menggunakan Card, CircleAvatar, dan FloatingActionButton.

# 6. Kesimpulan

~ Aplikasi Flutter dapat berinteraksi dengan API eksternal menggunakan package http.
Proses CRUD berhasil dilakukan dengan format JSON.
Penggunaan FutureBuilder memudahkan pengelolaan data asinkron.
