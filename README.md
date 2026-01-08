# 4x4 Matrix Keypad

![Language](https://img.shields.io/badge/languages-Verilog%20|%20C-orange)
![Hardware](https://img.shields.io/badge/hardware-Basys3%20|%20ESP32-green)
![EDA](https://img.shields.io/badge/EDA-KiCad%20-blueviolet)
![IDE](https://img.shields.io/badge/IDE-ArduinoIDE%20|%20Vivado%20-blue)

## 📖 Genel Bakış
Bu repo, **ESP32** ve **FPGA** üzerinde gerçekleştirilmiş kapsamlı bir **4x4 Matris Keypad** tasarımını ve uygulamasını içerir. Ayrıca **KiCad** ile tasarlanmış özel bir PCB tasarımını da içermektedir.

## 📂 Klasör Yapısı

```text
├── 📁 esp32_firmware/       # ESP32 için C kodları
│   ├── keypad.ino
├── 📁 keypad_fpga/         # Basys3 için Verilog tasarımı
│   ├── keypad.v        # Verilog kaynak kodu
│   └── constraints.xdc     # Basys3 için pin planlaması 
├── 📁 kicad_design/         # PCB tasarım Dosyaları
│   ├── keypad.kicad_sch  # Şematik Dosyası
│   └── keypad.kicad_pcb  # PCB layout
└── README.md
