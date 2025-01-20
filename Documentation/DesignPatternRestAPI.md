# Basic Rest API (Vapor Framework)

## 1. Aliran Data

1. **Request Client**
   - Permintaan masuk dari client berupa Protocol HTTP (`GET`, `POST`, `PUT`, `DELETE`) dengan endpoint tertentu.

2. **Routing**
   - Memetakan jalur permintaan dengan mencocokkannya ke Controller yang sesuai.

3. **Controllers**
   - Menerima jalur routing dan memanggil Service.
   - Melakukan transisi dari Model ke DTO jika diperlukan.

4. **Services**
   - Melakukan interaksi dengan Models untuk mengambil data yang diminta oleh Controller.
   - Melakukan transisi dari Model ke DTO jika tanggung jawab ini diletakkan di Service.

5. **Models**
   - Berinteraksi dengan sumber data seperti database atau API lain.

6. **DTO (Data Transfer Object)**
   - Merubah bentuk data dari Model menjadi format yang siap dikirimkan ke client.
   - Melindungi data sensitif dan menyusun model response yang standar untuk client.

7. **Response API**
   - Data yang dikirimkan kembali ke client dalam format seperti JSON atau XML.

**Proses Aliran Data:**
```
Database -> Models -> Service -> DTO -> Controller -> Routing -> (Response API)
```
**Request/Response:**
```
(Request) <- Client -> (Response API)
```

**NOTE:** Transisi dari Model ke DTO bisa dilakukan di Controller atau Service sesuai kebutuhan aplikasi.

---

## 2. Struktur Folder

### **Source/App/Controller**
- Menangani logika dan endpoint API.
- Menerima permintaan dari client seperti `POST`, `GET`, `PUT`, `DELETE` dan merespon kembali ke client.
- Melakukan filter data sensitif yang akan dikembalikan ke client.
- Menjadi penghubung antara client dengan Services dan Models.
- Mengembalikan response ke client dalam format seperti JSON atau XML.

### **Source/App/DTOs**
- Standarisasi format request dan response antara client dan server.
- Representasi dari data yang akan dikirim kembali ke client.
- Melakukan filter data sensitif dengan menyembunyikan informasi yang tidak boleh dikirim ke client.

### **Source/App/Migrations**
- Membuat database berikut dengan tabel-tabel yang dibutuhkan aplikasi.
- Mendefinisikan kolom (field) termasuk tipe data, panjang, dan atribut lainnya.
- Melakukan CRUD pada database.
- Menyediakan version control pada database, mirip dengan cara kerja Git.
- Menjamin konsistensi struktur database dalam aplikasi.

### **Source/App/Models**
- Merepresentasikan data dari database atau sumber data lain ke dalam aplikasi.
- Menyediakan representasi lengkap dari data tanpa mempertimbangkan apakah data tertentu akan dikirimkan ke client atau tidak.

### **Source/App/Routes**
- Mengatur dan mengkonfigurasi seluruh akses rute API.
- Menghubungkan URL endpoint dengan fungsi di Controller yang sesuai.

### **Source/App/Service**
- Mengelola logika bisnis dari aplikasi.
- Mengambil data dari database melalui Models dan melakukan pengolahan sesuai kebutuhan aplikasi.

---

## Contoh Proses
**1. Client Request:** Client mengirimkan request HTTP ke server dengan endpoint tertentu.
**2. Routing:** Jalur permintaan dicocokkan ke fungsi Controller melalui Routes.
**3. Controller:**
   - Memvalidasi request dan memanggil Service.
   - Melakukan transisi dari Model ke DTO jika diperlukan.
**4. Service:**
   - Mengambil data mentah dari database melalui Models.
   - Mengolah data mentah sesuai logika bisnis.
   - (Opsional) Melakukan transisi ke DTO.
**5. DTO:**
   - Menyusun data menjadi format response yang aman dan sesuai standar.
**6. Response:** Response API dikembalikan ke client.
