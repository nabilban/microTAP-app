---
trigger: always_on
---

# 📱 microTAP - Knowledge Base

> Desain UI yang kamu hasilkan sangat solid! Nuansa dark mode dengan aksen biru elektriknya benar-benar memberikan kesan aplikasi utilitas profesional.

Berikut adalah draf file `MICROTAP_INFO.md` yang sangat detail berdasarkan desain tersebut. Kamu bisa memberikan file ini kepada agen AI kamu (Antigravity Agent) sebagai basis pengetahuan (knowledge base) agar ia memahami setiap inci dari aplikasi yang sedang kamu bangun.

---

## 1. 🎯 Project Overview

**microTAP** adalah aplikasi otomatisasi macro berbasis Android yang memungkinkan pengguna merekam dan memutar ulang simulasi sentuhan (tap), geseran (swipe), dan gerakan kompleks lainnya tanpa memerlukan akses root.

Aplikasi ini dirancang untuk:

- ✅ Produktivitas
- ✅ Pengujian aplikasi
- ✅ Otomatisasi tugas berulang

---

## 2. 🏗️ Core Technical Architecture

| Component          | Technology                                                 |
| ------------------ | ---------------------------------------------------------- |
| **Framework**      | Flutter (Frontend & Overlay UI)                            |
| **Primary Engine** | Android Accessibility Service (Kotlin Native)              |
| **OS Support**     | Android 7.0 (API 24) ke atas (mendukung `dispatchGesture`) |
| **Overlay Tech**   | `flutter_overlay_window` untuk kontroler melayang          |

---

## 3. 🎨 UI/UX Analysis (Based on Design v1.0)

### A. Main Dashboard & Macro Management

| Feature                  | Description                                                                                              |
| ------------------------ | -------------------------------------------------------------------------------------------------------- |
| **Saved Macros**         | Menampilkan daftar rekaman tersimpan dengan metadata (nama, durasi total, dan waktu terakhir dijalankan) |
| **Quick Action**         | Tombol Play langsung dari dashboard untuk eksekusi cepat                                                 |
| **Start Service Button** | Tombol utama di bagian bawah untuk mengaktifkan mesin latar belakang aplikasi                            |

### B. Configuration & Gesture Settings

Aplikasi menyediakan kontrol granular terhadap bagaimana macro dieksekusi:

#### ⏱️ Gesture Timing

| Setting                | Description                                      | Default  |
| ---------------------- | ------------------------------------------------ | -------- |
| **Gesture Delay**      | Mengatur jeda antar sentuhan                     | `50ms`   |
| **Touch & Hold Delay** | Durasi untuk simulasi tekanan lama               | `1000ms` |
| **Motion Duration**    | Pengaturan spesifik untuk durasi Swipe dan Pinch | -        |

#### 🔄 Execution Rules

| Setting         | Description                                                                |
| --------------- | -------------------------------------------------------------------------- |
| **Start Delay** | Waktu tunggu sebelum macro dimulai (memberi waktu user berpindah aplikasi) |
| **Script Runs** | Jumlah perulangan (Loop count)                                             |
| **Loop Delay**  | Jeda waktu antar putaran macro                                             |

### C. Floating Overlay Controller

Widget melayang yang muncul di atas aplikasi pihak ketiga, terdiri dari:

#### 📊 Status Bar

- Menampilkan jumlah repetisi yang sedang berjalan dan timer durasi

#### 🎛️ Action Bar

| Button         | Icon             | Function                                                              |
| -------------- | ---------------- | --------------------------------------------------------------------- |
| **Add/Remove** | `+ / -`          | Menambah atau menghapus titik target secara manual                    |
| **Record**     | 🔴 Red Circle    | Mulai merekam aktivitas layar secara real-time                        |
| **Play**       | 🔵 Blue Triangle | Memulai eksekusi macro yang dipilih                                   |
| **Settings**   | ⚙️ Gear          | Akses cepat ke pengaturan konfigurasi tanpa kembali ke aplikasi utama |

---

## 4. 🚀 Feature Roadmap

| Feature                 | Description                                                                                                                           |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| **Recording Mode**      | Menangkap koordinat $(x, y)$ melalui `AccessibilityEvent`                                                                             |
| **Playback Mode**       | Simulasi gerakan menggunakan `GestureDescription.StrokeDescription`                                                                   |
| **Permissions Manager** | Antarmuka khusus untuk memandu pengguna mengaktifkan Overlay Permission dan Accessibility Service                                     |
| **Anti-Ban Logic**      | Penambahan variasi koordinat acak kecil (pixel jitter) agar aktivitas tidak terdeteksi sebagai bot oleh sistem keamanan aplikasi lain |

---

## 5. 📋 Metadata & Versioning

| Property               | Value              |
| ---------------------- | ------------------ |
| **App Name**           | microTAP           |
| **Version**            | 1.0.0              |
| **Developer Identity** | nabilban / bancorp |

---

> 💡 _This document serves as the comprehensive knowledge base for the microTAP application development._
