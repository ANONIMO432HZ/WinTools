# 🙏 Créditos y Agradecimientos

Este proyecto utiliza e integra varios scripts y herramientas externas. A continuación se detallan todos los créditos correspondientes:

---

## 🛠️ Scripts Externos Integrados

### 1. **Chris Titus Tech - Windows Optimization Script**
- **Autor**: Chris Titus
- **Sitio Web**: https://christitus.com/
- **GitHub**: https://github.com/ChrisTitusTech/win10script
- **Descripción**: Script de optimización y configuración de Windows
- **Uso en WinTools**: Menú 5 - Optimización de Rendimiento
- **Licencia**: MIT License
- **Comando utilizado**: `iwr -useb https://christitus.com/win | iex`

### 2. **Ninite - Software Installer**
- **Autor**: Ninite LLC
- **Sitio Web**: https://ninite.com/
- **Descripción**: Instalador de programas populares de forma desatendida
- **Uso en WinTools**: Menú 3 - Abrir instalador de programas (Ninite)
- **Licencia**: Propietaria (uso gratuito)
- **Acceso**: Enlace directo al sitio web

### 3. **Massgrave - Microsoft Activation Scripts**
- **Autor**: Massgrave
- **GitHub**: https://github.com/massgravel/Microsoft-Activation-Scripts
- **Descripción**: Scripts para activación de productos Microsoft
- **Uso en WinTools**: Menú 4 - Activador (Massgrave)
- **Licencia**: MIT License
- **Comando utilizado**: `irm https://get.activated.win | iex`

### 4. **Windows10Debloater - Debloat Scripts**
- **Autor**: Sycnex
- **GitHub**: https://github.com/Sycnex/Windows10Debloater
- **Descripción**: Scripts para eliminar bloatware de Windows 10
- **Uso en WinTools**: Menú 5 - Eliminar Bloatware (debloat)
- **Licencia**: MIT License
- **Comando utilizado**: `irm https://git.io/debloat | iex`

### 5. **Bat To Exe Converter - Executable Converter**
- **Autor**: Bat To Exe Converter Team
- **Sitio Web**: https://www.battoexeconverter.com/
- **Descripción**: Herramienta para convertir scripts batch (.bat) a ejecutables (.exe)
- **Uso en WinTools**: Conversión de WinTools.bat a WinTools_1.0.0.1_x86.exe y WinTools_1.0.0.1_x64.exe
- **Licencia**: Propietaria (uso gratuito)
- **Archivos generados**: 
  - `WinTools_1.0.0.1_x86.exe` (versión 32-bit, firmado digitalmente)
- `WinTools_1.0.0.1_x64.exe` (versión 64-bit, firmado digitalmente)

---

## 🛠️ Herramientas de Windows Utilizadas

### **Windows Defender**
- **Desarrollador**: Microsoft Corporation
- **Descripción**: Antivirus integrado de Windows
- **Uso en WinTools**: Menú 3 - Escaneo Rápido con Windows Defender
- **Comando**: `MpCmdRun.exe -Scan -ScanType 1`

### **BitLocker**
- **Desarrollador**: Microsoft Corporation
- **Descripción**: Cifrado de disco integrado de Windows
- **Uso en WinTools**: Menú 3 - Obtener Claves de Recuperación de BitLocker
- **Módulo PowerShell**: `Get-BitLockerVolume`

### **DirectX Diagnostic Tool**
- **Desarrollador**: Microsoft Corporation
- **Descripción**: Herramienta de diagnóstico de gráficos
- **Uso en WinTools**: Menú 4 - Diagnóstico de DirectX
- **Comando**: `dxdiag.exe`

### **System Information**
- **Desarrollador**: Microsoft Corporation
- **Descripción**: Información detallada del sistema
- **Uso en WinTools**: Menú 4 - Información del Sistema
- **Comando**: `msinfo32.exe`

### **Power Configuration**
- **Desarrollador**: Microsoft Corporation
- **Descripción**: Configuración de energía y batería
- **Uso en WinTools**: Menú 4 - Reporte de Batería
- **Comando**: `powercfg /batteryreport`

### **Software Licensing Management**
- **Desarrollador**: Microsoft Corporation
- **Descripción**: Gestión de licencias de software
- **Uso en WinTools**: Menú 4 - Información de Licencias
- **Comando**: `slmgr.vbs`

---

## 🛠️ Herramientas Administrativas de Windows

### **Microsoft Management Console (MMC) Snap-ins**
- **Administrador de Certificados**: `certlm.msc`
- **Directivas de Grupo Local**: `gpedit.msc`
- **Servicios**: `services.msc`
- **Administrador de Dispositivos**: `devmgmt.msc`
- **Administrador de Discos**: `diskmgmt.msc`

### **Panel de Control Applets**
- **Variables de Entorno**: `sysdm.cpl`
- **Configuración del Sistema**: `msconfig.exe`
- **Conexiones de Red**: `ncpa.cpl`
- **Opciones de Energía**: `powercfg.cpl`
- **Configuración de Fecha y Hora**: `timedate.cpl`
- **Programas y Características**: `appwiz.cpl`

### **Utilidades del Sistema**
- **Teclado en Pantalla**: `osk.exe`
- **Grabador de Pasos**: `psr.exe`
- **Limpieza de Disco**: `cleanmgr.exe`
- **Información de Windows**: `winver.exe`

---

## 🔧 Herramientas de Desarrollo

### **Batch Scripting**
- **Lenguaje**: Batch Script (CMD)
- **Desarrollador**: Microsoft Corporation
- **Descripción**: Scripting nativo de Windows
- **Uso**: Base del proyecto WinTools

### **PowerShell**
- **Desarrollador**: Microsoft Corporation
- **Descripción**: Automatización y administración del sistema
- **Uso**: Scripts integrados para funcionalidades avanzadas

### **Windows Command Line**
- **Desarrollador**: Microsoft Corporation
- **Descripción**: Interfaz de línea de comandos de Windows
- **Uso**: Ejecución de comandos del sistema

---

## 🔄 Herramientas de Conversión y Empaquetado

### **Bat To Exe Converter**
- **Desarrollador**: Bat To Exe Converter Team
- **Sitio Web**: https://www.battoexeconverter.com/
- **Descripción**: Herramienta para convertir scripts batch a ejecutables
- **Funcionalidades**:
  - Conversión de .bat a .exe
  - Soporte para 32-bit y 64-bit
  - Empaquetado standalone
  - Personalización de iconos
- **Uso en WinTools**: Generación de ejecutables para distribución
- **Archivos generados**:
  - `WinTools_1.0.0.1_x86.exe` (199 KB, 32-bit, firmado digitalmente)
- `WinTools_1.0.0.1_x64.exe` (232 KB, 64-bit, firmado digitalmente)
- **Nota**: Los ejecutables pueden ser detectados por antivirus como falsos positivos

### **Archivos Generados por WinTools**

#### **Script Original**
- **WinTools.bat** (36 KB)
  - **Tipo**: Script batch nativo
  - **Ventajas**: No detectado por antivirus, código visible
  - **Uso**: Recomendado para uso diario

#### **Ejecutables Convertidos**
- **WinTools_1.0.0.1_x86.exe** (199 KB, firmado digitalmente)
  - **Arquitectura**: 32-bit (x86)
  - **Compatibilidad**: Windows 7/8/10/11 (32-bit y 64-bit)
  - **Convertidor**: Bat To Exe Converter

- **WinTools_1.0.0.1_x64.exe** (232 KB, firmado digitalmente)
  - **Arquitectura**: 64-bit (x64)
  - **Compatibilidad**: Windows 7/8/10/11 (64-bit)
  - **Convertidor**: Bat To Exe Converter

#### **Notas Importantes**
- **Recomendación**: Usar el script original (`WinTools.bat`) cuando sea posible
- **Problema**: Los ejecutables pueden ser detectados por Windows Defender
- **Solución**: Ver [`SOLUCION_ANTIVIRUS.md`](SOLUCION_ANTIVIRUS.md) para instrucciones
- **Seguridad**: Todos los archivos son seguros y verificables

---

## 📚 Recursos y Referencias

### **Documentación de Microsoft**
- **Windows 10/11 Documentation**: https://docs.microsoft.com/en-us/windows/
- **PowerShell Documentation**: https://docs.microsoft.com/en-us/powershell/
- **Batch Scripting Reference**: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/

### **Comunidad y Foros**
- **Stack Overflow**: https://stackoverflow.com/
- **Microsoft Community**: https://answers.microsoft.com/
- **Reddit r/Windows10**: https://www.reddit.com/r/Windows10/

---

## 📄 Información Legal

### **Licencias de Scripts Externos**

Todos los scripts externos utilizados en este proyecto mantienen sus licencias originales:

- **MIT License**: Chris Titus Tech, Massgrave, Windows10Debloater
- **Propietaria**: Ninite (uso gratuito permitido), Bat To Exe Converter (uso gratuito)
- **Microsoft EULA**: Herramientas de Windows

### **Cumplimiento de Licencias**

Este proyecto cumple con todas las licencias de los scripts externos utilizados:

1. **Atribución**: Se proporcionan créditos completos a todos los autores
2. **Enlaces**: Se incluyen enlaces a los repositorios originales
3. **Licencias**: Se respetan los términos de licencia originales
4. **Uso**: Se utiliza únicamente para fines legítimos y educativos

---

## 🤝 Agradecimientos Especiales

### **Comunidad de Desarrolladores**
- **GitHub Community**: Por proporcionar una plataforma para el código abierto
- **Stack Overflow Community**: Por las respuestas y soluciones técnicas
- **Microsoft Developer Community**: Por las herramientas y documentación

### **Contribuidores Indirectos**
- **Testers y Usuarios**: Por probar y reportar problemas
- **Documentadores**: Por crear guías y tutoriales
- **Traductores**: Por hacer el software accesible globalmente

---

## 📞 Contacto y Soporte

### **Para Créditos y Licencias**
- **Email**: usuario432hz@gmail.com
- **GitHub**: https://github.com/ANONIMO432HZ
- **Issues**: https://github.com/ANONIMO432HZ/WinTools/issues

### **Para Scripts Externos**
- **Chris Titus Tech**: https://christitus.com/
- **Massgrave**: https://github.com/massgravel/Microsoft-Activation-Scripts
- **Ninite**: https://ninite.com/
- **Windows10Debloater**: https://github.com/Sycnex/Windows10Debloater
- **Bat To Exe Converter**: https://www.battoexeconverter.com/

---

**Nota**: Este archivo se actualiza regularmente para reflejar cualquier cambio en los scripts externos utilizados. Si encuentras algún error o omisión, por favor abre un issue en el repositorio. 