# 📋 Registro de Cambios (Changelog)

Todos los cambios notables en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0.1] - 2025-01-18

### 🔐 Mejora de Seguridad

#### ✨ Agregado
- **Certificados Digitales**: Ejecutables firmados digitalmente
- **Verificación de Integridad**: Certificados autofirmados para mayor seguridad
- **Nuevos Nombres**: WinTools_1.0.0.1_x86.exe y WinTools_1.0.0.1_x64.exe

#### 🔧 Mejorado
- **Seguridad**: Reducción de falsos positivos de antivirus
- **Confianza**: Mayor confianza del sistema operativo
- **Documentación**: Actualización de EJECUTABLES.md con información de certificados

#### 📊 Cambios Técnicos
- **Tamaño x86**: 192KB → 199KB (+7KB por certificado)
- **Tamaño x64**: 225KB → 232KB (+7KB por certificado)
- **Certificados**: Firmas digitales incluidas
- **Verificación**: Comandos para verificar certificados documentados

---

## [1.0.0] - 2025-01-18

### 🎉 Lanzamiento Inicial

#### ✨ Agregado
- **Menú Principal**: Interfaz principal con 6 categorías de herramientas
- **Gestión de Arranque y Recuperación**: 5 opciones para controlar el arranque del sistema
  - Reinicio en modo normal
  - Reinicio a modo seguro (sin red)
  - Reinicio a modo seguro (con red)
  - Reinicio a opciones avanzadas de inicio
  - Reinicio al BIOS/UEFI
- **Herramientas del Sistema y Administración**: 14 herramientas administrativas
  - Administrador de Certificados
  - Directivas de Grupo Local
  - Variables de Entorno
  - Configuración del Sistema
  - Servicios
  - Conexiones de Red
  - Administrador de Dispositivos
  - Administrador de Discos
  - Opciones de Energía
  - Configuración de Fecha y Hora
  - Programas y Características
  - Cuentas de Usuario Avanzadas
  - Programas Predeterminados
  - Carpeta de Aplicaciones
- **Utilidades y Mantenimiento**: 8 herramientas de mantenimiento
  - Escaneo Rápido con Windows Defender
  - Obtener Claves de Recuperación de BitLocker
  - Instalador de programas desatendido (CTT)
  - Abrir instalador de programas (Ninite)
  - Teclado en Pantalla (OSK)
  - Grabador de Pasos (PSR)
  - Limpieza de Disco (cleanmgr)
  - Explorador en Unidad C:\
- **Información y Licencias**: 7 herramientas de diagnóstico
  - Activador (Massgrave)
  - Ver Versión de Windows
  - Diagnóstico de DirectX
  - Información del Sistema
  - Reporte de Batería
  - Caducidad de Licencia de Windows
  - Información Detallada de Licencia
- **Optimización y Limpieza**: 2 herramientas de optimización
  - Optimización de Rendimiento (Script PowerShell)
  - Eliminar Bloatware (debloat)
- **Enlaces**: Acceso directo al perfil de GitHub del creador

#### 🔧 Características Técnicas
- **Elevación Automática de Privilegios**: Solicita permisos de administrador automáticamente
- **Interfaz en Español**: Todos los menús y mensajes en español
- **Navegación Intuitiva**: Sistema de menús fácil de usar
- **Manejo de Errores**: Validación de opciones y mensajes de error informativos
- **Compatibilidad**: Funciona en Windows 10 y 11
- **Integración de Scripts Externos**: Integración con herramientas populares

#### 🛠️ Scripts Externos Integrados
- **Chris Titus Tech**: Script de optimización de Windows
- **Ninite**: Instalador de programas populares
- **Massgrave**: Activador de Windows
- **Windows10Debloater**: Eliminación de bloatware

#### 📚 Documentación
- **README.md**: Documentación completa del proyecto
- **LICENSE**: Licencia GNU GPLv3 en español
- **CREDITS.md**: Créditos a scripts externos
- **CHANGELOG.md**: Registro de cambios
- **.gitignore**: Archivos ignorados por Git

#### 🎨 Interfaz
- **Logo ASCII**: Logo decorativo en la consola
- **Paleta de Colores**: Interfaz con colores azules
- **Mensajes Informativos**: Feedback claro para el usuario
- **Navegación Clara**: Opciones numeradas y menús organizados

---

## [0.9.0] - 2025-01-XX

### 🚧 Versión Beta

#### ✨ Agregado
- Estructura básica del menú principal
- Funciones de elevación de privilegios
- Integración inicial con herramientas de Windows

#### 🔧 Mejorado
- Sistema de navegación entre menús
- Manejo de errores básico
- Interfaz de usuario mejorada

#### 🐛 Corregido
- Problemas de codificación de caracteres
- Errores en la elevación de privilegios
- Navegación entre menús

---

## [0.8.0] - 2025-01-XX

### 🚧 Versión Alpha

#### ✨ Agregado
- Concepto inicial del proyecto
- Script básico de herramientas
- Integración con algunas utilidades de Windows

#### 🔧 Mejorado
- Estructura del código
- Documentación básica

---

## 📝 Notas de Versión

### 🔄 Convenciones de Versionado

Este proyecto utiliza [Semantic Versioning](https://semver.org/):

- **MAJOR.MINOR.PATCH**
  - **MAJOR**: Cambios incompatibles con versiones anteriores
  - **MINOR**: Nuevas funcionalidades compatibles
  - **PATCH**: Correcciones de errores compatibles

### 📋 Tipos de Cambios

- **✨ Agregado**: Nuevas funcionalidades
- **🔧 Mejorado**: Mejoras en funcionalidades existentes
- **🐛 Corregido**: Correcciones de errores
- **🚫 Eliminado**: Funcionalidades removidas
- **⚠️ Deprecado**: Funcionalidades marcadas para eliminación
- **🔒 Seguridad**: Mejoras de seguridad
- **📚 Documentación**: Cambios en documentación
- **🎨 Interfaz**: Cambios en la interfaz de usuario

---

## 🔮 Roadmap

### 🎯 Versión 1.1.0 (Próxima)
- [ ] Agregar más herramientas de diagnóstico
- [ ] Mejorar la interfaz de usuario
- [ ] Agregar soporte para múltiples idiomas
- [ ] Implementar sistema de logs

### 🎯 Versión 1.2.0
- [ ] Agregar herramientas de red avanzadas
- [ ] Implementar sistema de configuración
- [ ] Agregar herramientas de seguridad
- [ ] Mejorar la documentación

### 🎯 Versión 2.0.0
- [ ] Interfaz gráfica (GUI)
- [ ] Sistema de plugins
- [ ] Integración con más herramientas externas
- [ ] Soporte para Windows Server

---

## 📞 Soporte

### 🐛 Reportar Errores
- **GitHub Issues**: https://github.com/ANONIMO432HZ/WinTools/issues
- **Email**: usuario432hz@gmail.com

### 💡 Sugerencias
- **GitHub Discussions**: https://github.com/ANONIMO432HZ/WinTools/discussions
- **Pull Requests**: Bienvenidos para nuevas funcionalidades

---

## 📄 Información Legal

- **Licencia**: GNU GPLv3
- **Autor**: ANONIMO432HZ
- **Contacto**: usuario432hz@gmail.com
- **GitHub**: https://github.com/ANONIMO432HZ/WinTools

---

**Nota**: Este changelog se actualiza con cada nueva versión del proyecto. Para más detalles sobre cambios específicos, consulta los commits en el repositorio de GitHub. 