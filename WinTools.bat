@echo off
chcp 65001 > nul
mode CON: COLS=88 LINES=60 2>nul
title [WinTools]

::============================================================================
:: Get Administrator Rights (Integracion de Elevacion de Privilegios)
set /a _Debug=0
set _Args=%*
if "%~1" NEQ "" (
  set _Args=%_Args:"=%
)
fltmc 1>nul 2>nul || (
  cd /d "%~dp0"
  cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~dp0"" && ""%~dpnx0"" ""%_Args%""", "", "runas", 1 > "%temp%\GetAdmin.vbs"
  "%temp%\GetAdmin.vbs"
  del /f /q "%temp%\GetAdmin.vbs" 1>nul 2>nul
  exit
)
::============================================================================


:: Paleta de Color
color 09

:: Variables para un código más limpio y mantenimiento
set "USUARIO_ACTUAL=%USERNAME%"
set "MENU_TITLE=[MULTI HERRAMIENTAS PARA WINDOWS]"
set "OPTION_INVALID=Opción inválida. Intente de nuevo."
set "PRESS_ANY_KEY=Presione cualquier tecla para continuar..."

:MAIN_MENU
cls
:: Logo ASCII decorativo compatible con batch
echo ***************************************************************************************
echo * __     __     __     __   __     ______   ______     ______     __         ______   *
echo */\ \  _ \ \   /\ \   /\ "-.\ \   /\__  _\ /\  __ \   /\  __ \   /\ \       /\  ___\  *
echo *\ \ \/ ".\ \  \ \ \  \ \ \-.  \  \/_/\ \/ \ \ \/\ \  \ \ \/\ \  \ \ \____  \ \___  \ *
echo * \ \__/".~\_\  \ \_\  \ \_\\"\_\    \ \_\  \ \_____\  \ \_____\  \ \_____\  \/\_____\*
echo *  \/_/   \/_/   \/_/   \/_/ \/_/     \/_/   \/_____/   \/_____/   \/_____/   \/_____/*
echo ***************************************************************************************
echo.
echo =======================================================================================
echo    %MENU_TITLE%
echo =======================================================================================
echo    Made By: ANONIMO432HZ [github.com/ANONIMO432HZ]
echo ---------------------------------------------------------------------------------------
echo    [1]  Gestion de Arranque y Recuperacion
echo    [2]  Herramientas del Sistema y Administracion
echo    [3]  Utilidades y Mantenimiento
echo    [4]  Informacion y Licencias
echo    [5]  Optimizacion y Limpieza
echo    [6]  Abrir Perfil de GitHub del Creador
echo ---------------------------------------------------------------------------------------
echo    [0]  Salir
echo =======================================================================================
echo.
set /p choice="Por favor, digite el número de la opción deseada: "

if "%choice%"=="1" goto BOOT_RECOVERY_MENU
if "%choice%"=="2" goto SYSTEM_ADMIN_MENU
if "%choice%"=="3" goto UTILITIES_MENU
if "%choice%"=="4" goto INFO_LICENSE_MENU
if "%choice%"=="5" goto OPTIMIZATION_MENU
if "%choice%"=="6" goto OPEN_GITHUB_PROFILE
if "%choice%"=="0" goto END_SCRIPT
goto INVALID_CHOICE

:BOOT_RECOVERY_MENU
set choice_menu=BOOT_RECOVERY_MENU
cls
:: Logo ASCII decorativo compatible con batch
echo ***************************************************************************************
echo * __     __     __     __   __     ______   ______     ______     __         ______   *
echo */\ \  _ \ \   /\ \   /\ "-.\ \   /\__  _\ /\  __ \   /\  __ \   /\ \       /\  ___\  *
echo *\ \ \/ ".\ \  \ \ \  \ \ \-.  \  \/_/\ \/ \ \ \/\ \  \ \ \/\ \  \ \ \____  \ \___  \ *
echo * \ \__/".~\_\  \ \_\  \ \_\\"\_\    \ \_\  \ \_____\  \ \_____\  \ \_____\  \/\_____\*
echo *  \/_/   \/_/   \/_/   \/_/ \/_/     \/_/   \/_____/   \/_____/   \/_____/   \/_____/*
echo ***************************************************************************************
echo.
echo =======================================================================================
echo            MENÚ: Gestion de Arranque y Recuperacion
echo =======================================================================================
echo    Made By: ANONIMO432HZ [github.com/ANONIMO432HZ]
echo ---------------------------------------------------------------------------------------
echo    [1] Reiniciar en Modo Normal
echo    [2] Reiniciar a Modo Seguro (Sin Red)
echo    [3] Reiniciar a Modo Seguro (Con Red)
echo    [4] Reiniciar a Opciones Avanzadas de Inicio
echo    [5] Reiniciar en el BIOS/UEFI
echo ---------------------------------------------------------------------------------------
echo    [99] Volver al Menu Principal
echo    [0]  Salir
echo =======================================================================================
echo.
set /p choice="Por favor, digite el número de la opción deseada: "
if "%choice%"=="1" goto NORMAL_BOOT
if "%choice%"=="2" goto SAFEMODE_MINIMAL
if "%choice%"=="3" goto SAFEMODE_NETWORK
if "%choice%"=="4" goto ADVANCED_STARTUP
if "%choice%"=="5" goto REBOOT_TO_BIOS
if "%choice%"=="99" goto MAIN_MENU
if "%choice%"=="0" goto END_SCRIPT
goto INVALID_CHOICE_SUBMENU

:NORMAL_BOOT
cls
echo Restaurando el arranque normal de Windows...
echo.
bcdedit /deletevalue {current} safeboot > "%TEMP%\normalboot.log" 2>&1
findstr /C:"No se ha encontrado el elemento" "%TEMP%\normalboot.log" >nul
if %errorlevel% equ 0 (
    echo El sistema ya estaba en modo normal. No es necesario reiniciar.
    del "%TEMP%\normalboot.log"
    echo.
    echo %PRESS_ANY_KEY%
    pause >nul
    goto BOOT_RECOVERY_MENU
)
findstr /C:"se ha completado correctamente" "%TEMP%\normalboot.log" >nul
if %errorlevel% equ 0 (
    echo Arranque normal restaurado. Reiniciando...
    del "%TEMP%\normalboot.log"
    shutdown /r /t 0
    goto :EOF
) else (
    type "%TEMP%\normalboot.log"
    echo Error: No se pudo restaurar el arranque normal.
    echo Asegurese de ejecutar el script como Administrador.
    del "%TEMP%\normalboot.log"
    pause
    goto BOOT_RECOVERY_MENU
)

:SAFEMODE_MINIMAL
cls
echo Reiniciando a Modo Seguro (Sin Red)...
echo.
echo Advertencia: El sistema se iniciara en Modo Seguro.
echo Para volver a la normalidad, ejecute este script en Modo Seguro
echo y seleccione la opcion [8] (Deshabilitar Modo Seguro) o ejecute:
echo bcdedit /deletevalue {current} safeboot
echo.
pause
bcdedit /set {current} safeboot minimal
if %errorlevel% neq 0 (
    echo Error: No se pudo establecer la configuracion de arranque.
    echo Asegurese de ejecutar el script como Administrador.
    pause
    goto BOOT_RECOVERY_MENU
)
echo Configuracion de arranque establecida. Reiniciando...
shutdown /r /t 0
goto :EOF

:SAFEMODE_NETWORK
cls
echo Reiniciando a Modo Seguro (Con Red)...
echo.
echo Advertencia: El sistema se iniciara en Modo Seguro con funciones de red.
echo Para volver a la normalidad, ejecute este script en Modo Seguro
echo y seleccione la opcion [8] (Deshabilitar Modo Seguro) o ejecute:
echo bcdedit /deletevalue {current} safeboot
echo.
pause
bcdedit /set {current} safeboot network
if %errorlevel% neq 0 (
    echo Error: No se pudo establecer la configuracion de arranque.
    echo Asegurese de ejecutar el script como Administrador.
    pause
    goto BOOT_RECOVERY_MENU
)
echo Configuracion de arranque establecida. Reiniciando...
shutdown /r /t 0
goto :EOF

:ADVANCED_STARTUP
cls
echo Reiniciando a Opciones Avanzadas de Inicio...
echo Desde ahi, puede seleccionar 'Solucionar problemas' > 'Opciones avanzadas' > 'Configuracion de inicio' > 'Reiniciar'.
echo.
pause
shutdown /r /o /t 0
if %errorlevel% neq 0 (
    echo Error: No se pudo reiniciar en opciones avanzadas.
    echo Asegurese de ejecutar el script como Administrador.
    echo.
    pause
)
goto BOOT_RECOVERY_MENU

:REBOOT_TO_BIOS
cls
echo Reiniciando para acceder a la configuracion del BIOS/UEFI...
echo.
echo Advertencia: El sistema se reiniciara y entrara directamente
echo en la configuracion de firmware (BIOS/UEFI).
echo.
pause
shutdown /r /fw /t 0
if %errorlevel% neq 0 (
    echo Error: No se pudo reiniciar en la configuracion del BIOS/UEFI.
    echo Asegurese de que su sistema soporta esta opcion y que el script se ejecuta como Administrador.
    echo.
    pause
)
goto BOOT_RECOVERY_MENU

:SYSTEM_ADMIN_MENU
set choice_menu=SYSTEM_ADMIN_MENU
cls
:: Logo ASCII decorativo compatible con batch
echo ***************************************************************************************
echo * __     __     __     __   __     ______   ______     ______     __         ______   *
echo */\ \  _ \ \   /\ \   /\ "-.\ \   /\__  _\ /\  __ \   /\  __ \   /\ \       /\  ___\  *
echo *\ \ \/ ".\ \  \ \ \  \ \ \-.  \  \/_/\ \/ \ \ \/\ \  \ \ \/\ \  \ \ \____  \ \___  \ *
echo * \ \__/".~\_\  \ \_\  \ \_\\"\_\    \ \_\  \ \_____\  \ \_____\  \ \_____\  \/\_____\*
echo *  \/_/   \/_/   \/_/   \/_/ \/_/     \/_/   \/_____/   \/_____/   \/_____/   \/_____/*
echo ***************************************************************************************
echo.
echo =======================================================================================
echo            MENÚ: Herramientas del Sistema y Administracion
echo =======================================================================================
echo    Made By: ANONIMO432HZ [github.com/ANONIMO432HZ]
echo ---------------------------------------------------------------------------------------
echo    [1]  Abrir Administrador de Certificados (certlm.msc)
echo    [2]  Abrir Directivas de Grupo Local (gpedit.msc)
echo    [3]  Abrir Variables de Entorno (sysdm.cpl)
echo    [4]  Abrir Configuracion del Sistema (msconfig)
echo    [5]  Abrir Servicios (services.msc)
echo    [6]  Abrir Conexiones de Red (ncpa.cpl)
echo    [7]  Abrir Administrador de Dispositivos (devmgmt.msc)
echo    [8]  Abrir Administrador de Discos (diskmgmt.msc)
echo    [9]  Abrir Opciones de Energia (powercfg.cpl)
echo    [10] Abrir Configuracion de Fecha y Hora (timedate.cpl)
echo    [11] Abrir Programas y Caracteristicas (appwiz.cpl)
echo    [12] Abrir Cuentas de Usuario Avanzadas (panel control)
echo    [13] Abrir Programas Predeterminados (computerdefaults)
echo    [14] Acceder a Carpeta de Aplicaciones (shell:AppsFolder)
echo ---------------------------------------------------------------------------------------
echo    [99] Volver al Menu Principal
echo    [0]  Salir
echo =======================================================================================
echo.
set /p choice="Por favor, digite el número de la opción deseada: "
if "%choice%"=="1" goto OPEN_CERTLM
if "%choice%"=="2" goto OPEN_GPEDIT
if "%choice%"=="3" goto OPEN_ENVIRONMENT_VARIABLES
if "%choice%"=="4" goto OPEN_MSCONFIG
if "%choice%"=="5" goto OPEN_SERVICES
if "%choice%"=="6" goto OPEN_NCPACPL
if "%choice%"=="7" goto OPEN_DEVMGMT
if "%choice%"=="8" goto OPEN_DISKMGMT
if "%choice%"=="9" goto OPEN_POWERCFGCPL
if "%choice%"=="10" goto OPEN_TIMEDATECPL
if "%choice%"=="11" goto OPEN_APPWIZCPL
if "%choice%"=="12" goto OPEN_USERPASSWORDS2
if "%choice%"=="13" goto OPEN_COMPUTERDEFAULTS
if "%choice%"=="14" goto OPEN_APPSFOLDER
if "%choice%"=="99" goto MAIN_MENU
if "%choice%"=="0" goto END_SCRIPT
goto INVALID_CHOICE_SUBMENU

:UTILITIES_MENU
set choice_menu=UTILITIES_MENU
cls
:: Logo ASCII decorativo compatible con batch
echo ***************************************************************************************
echo * __     __     __     __   __     ______   ______     ______     __         ______   *
echo */\ \  _ \ \   /\ \   /\ "-.\ \   /\__  _\ /\  __ \   /\  __ \   /\ \       /\  ___\  *
echo *\ \ \/ ".\ \  \ \ \  \ \ \-.  \  \/_/\ \/ \ \ \/\ \  \ \ \/\ \  \ \ \____  \ \___  \ *
echo * \ \__/".~\_\  \ \_\  \ \_\\"\_\    \ \_\  \ \_____\  \ \_____\  \ \_____\  \/\_____\*
echo *  \/_/   \/_/   \/_/   \/_/ \/_/     \/_/   \/_____/   \/_____/   \/_____/   \/_____/*
echo ***************************************************************************************
echo.
echo =======================================================================================
echo                   MENÚ: Utilidades y Mantenimiento
echo =======================================================================================
echo    Made By: ANONIMO432HZ [github.com/ANONIMO432HZ]
echo ---------------------------------------------------------------------------------------
echo    [1]  Ejecutar Escaneo Rapido con Windows Defender
echo    [2]  Obtener Claves de Recuperacion de BitLocker
echo    [3]  Instalador de programas desatendido (CTT)
echo    [4]  Abrir instalador de programas (Ninite)
echo    [5]  Abrir Teclado en Pantalla (OSK)
echo    [6]  Iniciar Grabador de Pasos (PSR)
echo    [7]  Iniciar Limpieza de Disco (cleanmgr)
echo    [8]  Abrir Explorador en Unidad C:\
echo ---------------------------------------------------------------------------------------
echo    [99] Volver al Menu Principal
echo    [0]  Salir
echo =======================================================================================
echo.
set /p choice="Por favor, digite el número de la opción deseada: "
if "%choice%"=="1" goto DEFENDER_SCAN
if "%choice%"=="2" goto GET_BITLOCKER_KEYS_INTEGRATED
if "%choice%"=="3" goto UNATTENDED_INSTALLER_CTT
if "%choice%"=="4" goto OPEN_NINITE
if "%choice%"=="5" goto OPEN_OSK
if "%choice%"=="6" goto START_PSR
if "%choice%"=="7" goto START_CLEANMGR
if "%choice%"=="8" goto OPEN_C_DRIVE
if "%choice%"=="99" goto MAIN_MENU
if "%choice%"=="0" goto END_SCRIPT
goto INVALID_CHOICE_SUBMENU

:INFO_LICENSE_MENU
set choice_menu=INFO_LICENSE_MENU
cls
:: Logo ASCII decorativo compatible con batch
echo ***************************************************************************************
echo * __     __     __     __   __     ______   ______     ______     __         ______   *
echo */\ \  _ \ \   /\ \   /\ "-.\ \   /\__  _\ /\  __ \   /\  __ \   /\ \       /\  ___\  *
echo *\ \ \/ ".\ \  \ \ \  \ \ \-.  \  \/_/\ \/ \ \ \/\ \  \ \ \/\ \  \ \ \____  \ \___  \ *
echo * \ \__/".~\_\  \ \_\  \ \_\\"\_\    \ \_\  \ \_____\  \ \_____\  \ \_____\  \/\_____\*
echo *  \/_/   \/_/   \/_/   \/_/ \/_/     \/_/   \/_____/   \/_____/   \/_____/   \/_____/*
echo ***************************************************************************************
echo.
echo =======================================================================================
echo                  MENÚ: Informacion y Licencias
echo =======================================================================================
echo    Made By: ANONIMO432HZ [github.com/ANONIMO432HZ]
echo ---------------------------------------------------------------------------------------
echo    [1]  Activador (Massgrave)
echo    [2]  Ver Version de Windows (winver)
echo    [3]  Abrir Diagnostico de DirectX (dxdiag)
echo    [4]  Abrir Informacion del Sistema (msinfo32)
echo    [5]  Generar Reporte de Bateria (powercfg /batteryreport)
echo    [6]  Mostrar Caducidad de Licencia de Windows (slmgr /xpr)
echo    [7]  Mostrar Informacion Detallada de Licencia de Windows (slmgr /dli)
echo ---------------------------------------------------------------------------------------
echo    [99] Volver al Menu Principal
echo    [0]  Salir
echo =======================================================================================
echo.
set /p choice="Por favor, digite el número de la opción deseada: "
if "%choice%"=="1" goto KYS_ACTIVATOR
if "%choice%"=="2" goto SHOW_WINVER
if "%choice%"=="3" goto OPEN_DXDIAG
if "%choice%"=="4" goto OPEN_MSINFO32
if "%choice%"=="5" goto GENERATE_BATTERY_REPORT
if "%choice%"=="6" goto SHOW_LICENSE_EXPIRATION
if "%choice%"=="7" goto SHOW_LICENSE_INFO
if "%choice%"=="99" goto MAIN_MENU
if "%choice%"=="0" goto END_SCRIPT
goto INVALID_CHOICE_SUBMENU

:OPTIMIZATION_MENU
set choice_menu=OPTIMIZATION_MENU
cls
:: Logo ASCII decorativo compatible con batch
echo ***************************************************************************************
echo * __     __     __     __   __     ______   ______     ______     __         ______   *
echo */\ \  _ \ \   /\ \   /\ "-.\ \   /\__  _\ /\  __ \   /\  __ \   /\ \       /\  ___\  *
echo *\ \ \/ ".\ \  \ \ \  \ \ \-.  \  \/_/\ \/ \ \ \/\ \  \ \ \/\ \  \ \ \____  \ \___  \ *
echo * \ \__/".~\_\  \ \_\  \ \_\\"\_\    \ \_\  \ \_____\  \ \_____\  \ \_____\  \/\_____\*
echo *  \/_/   \/_/   \/_/   \/_/ \/_/     \/_/   \/_____/   \/_____/   \/_____/   \/_____/*
echo ***************************************************************************************
echo.
echo =======================================================================================
echo                   MENÚ: Optimizacion y Limpieza
echo =======================================================================================
echo    Made By: ANONIMO432HZ [github.com/ANONIMO432HZ]
echo ---------------------------------------------------------------------------------------
echo    [1] Optimizacion de Rendimiento (Script PowerShell)
echo    [2] Eliminar Bloatware (debloat)
echo ---------------------------------------------------------------------------------------
echo    [99] Volver al Menu Principal
echo    [0]  Salir
echo =======================================================================================
echo.
set /p choice="Por favor, digite el número de la opción deseada: "
if "%choice%"=="1" goto OPTIMIZE_PERFORMANCE
if "%choice%"=="2" goto DEBLOAT_SYSTEM
if "%choice%"=="99" goto MAIN_MENU
if "%choice%"=="0" goto END_SCRIPT
goto INVALID_CHOICE_SUBMENU


:: --- SUBRUTINAS DE ACCIONES ---

:OPEN_CERTLM
cls
echo Abriendo Administrador de Certificados...
echo.
start "" "%windir%\System32\certlm.msc"
echo %PRESS_ANY_KEY%
pause >nul
goto SYSTEM_ADMIN_MENU

:OPEN_GPEDIT
cls
echo Abriendo Directivas de Grupo Local...
echo.
start "" "%windir%\System32\gpedit.msc"
echo %PRESS_ANY_KEY%
pause >nul
goto SYSTEM_ADMIN_MENU

:OPEN_ENVIRONMENT_VARIABLES
cls
echo Abriendo Variables de Entorno...
echo.
start "" "%windir%\System32\rundll32.exe" sysdm.cpl,EditEnvironmentVariables
echo %PRESS_ANY_KEY%
pause >nul
goto SYSTEM_ADMIN_MENU

:OPEN_MSCONFIG
cls
echo Abriendo Configuracion del Sistema (msconfig)...
echo.
start "" "%windir%\System32\msconfig.exe"
echo %PRESS_ANY_KEY%
pause >nul
goto SYSTEM_ADMIN_MENU

:OPEN_SERVICES
cls
echo Abriendo Servicios (services.msc)...
echo.
start "" "%windir%\System32\services.msc"
echo %PRESS_ANY_KEY%
pause >nul
goto SYSTEM_ADMIN_MENU

:OPEN_NCPACPL
cls
echo Abriendo Conexiones de Red (ncpa.cpl)...
echo.
start "" "%windir%\System32\ncpa.cpl"
echo %PRESS_ANY_KEY%
pause >nul
goto SYSTEM_ADMIN_MENU

:OPEN_DEVMGMT
cls
echo Abriendo Administrador de Dispositivos (devmgmt.msc)...
echo.
start "" "%windir%\System32\devmgmt.msc"
echo %PRESS_ANY_KEY%
pause >nul
goto SYSTEM_ADMIN_MENU

:OPEN_DISKMGMT
cls
echo Abriendo Administrador de Discos (diskmgmt.msc)...
echo.
start "" "%windir%\System32\diskmgmt.msc"
echo %PRESS_ANY_KEY%
pause >nul
goto SYSTEM_ADMIN_MENU

:OPEN_POWERCFGCPL
cls
echo Abriendo Opciones de Energia (powercfg.cpl)...
echo.
start "" "%windir%\System32\powercfg.cpl"
echo %PRESS_ANY_KEY%
pause >nul
goto SYSTEM_ADMIN_MENU

:OPEN_TIMEDATECPL
cls
echo Abriendo Configuracion de Fecha y Hora (timedate.cpl)...
echo.
start "" "%windir%\System32\timedate.cpl"
echo %PRESS_ANY_KEY%
pause >nul
goto SYSTEM_ADMIN_MENU

:OPEN_APPWIZCPL
cls
echo Abriendo Programas y Caracteristicas (appwiz.cpl)...
echo.
start "" "%windir%\System32\appwiz.cpl"
echo %PRESS_ANY_KEY%
pause >nul
goto SYSTEM_ADMIN_MENU

:OPEN_USERPASSWORDS2
cls
echo Abriendo Cuentas de Usuario Avanzadas (panel control)...
echo.
start "" "%windir%\System32\netplwiz.exe"
echo %PRESS_ANY_KEY%
pause >nul
goto SYSTEM_ADMIN_MENU

:OPEN_COMPUTERDEFAULTS
cls
echo Abriendo Programas Predeterminados (computerdefaults)...
echo.
start "" "%windir%\System32\control.exe" /name Microsoft.DefaultPrograms
echo %PRESS_ANY_KEY%
pause >nul
goto SYSTEM_ADMIN_MENU

:OPEN_APPSFOLDER
cls
echo Accediendo a Carpeta de Aplicaciones (shell:AppsFolder)...
echo.
start "" shell:AppsFolder
echo %PRESS_ANY_KEY%
pause >nul
goto SYSTEM_ADMIN_MENU

:DEFENDER_SCAN
cls
echo Iniciando Escaneo Rapido con Windows Defender...
echo.

:: Comprobamos si el ejecutable de Defender esta presente
if not exist "%ProgramFiles%\Windows Defender\MpCmdRun.exe" goto DefenderScan_NoExe

:: Si el ejecutable existe, procedemos con el escaneo
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1

if %errorlevel% equ 0 (
    echo Escaneo de Windows Defender finalizado.
) else (
    echo Error al iniciar el escaneo de Windows Defender.
    echo Asegurese de ejecutar el script como Administrador.
)
goto DefenderScan_End

:DefenderScan_NoExe
echo El ejecutable de Windows Defender (MpCmdRun.exe) no se encontro.
echo Asegurese de que Windows Defender este instalado y actualizado.
goto DefenderScan_End

:DefenderScan_End
echo.
echo Tenga en cuenta que el escaneo completo puede tardar mucho tiempo.
echo %PRESS_ANY_KEY%
pause >nul
goto UTILITIES_MENU

:GET_BITLOCKER_KEYS_INTEGRATED
cls
echo Intentando obtener las claves de recuperacion de BitLocker...
echo.
echo Esto requerira permisos de Administrador y el modulo de BitLocker de PowerShell.
echo El resultado se guardara en un archivo de texto en C:\Temp\.
echo.
pause

:: Crear un archivo temporal de PowerShell para el script de BitLocker
echo $OutputEncoding = [System.Text.Encoding]::UTF8 > "%TEMP%\BitlockerKeysRecovery.ps1"
echo $ErrorActionPreference = 'Stop' >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo. >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo try { >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo     if ^(-not ^(Get-Module -Name BitLocker -ListAvailable^)^) { >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo         Write-Host "Modulo BitLocker no disponible. Intentando cargarlo..." -ForegroundColor Yellow >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo         Import-Module BitLocker -ErrorAction Stop >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo     } >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo. >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo     if ^(Get-Command -Name Get-BitLockerVolume -ErrorAction SilentlyContinue^) { >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo         $OutputFile = "C:\Temp\BitLockerKeys_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt" >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo. >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo         if ^(-not ^(Test-Path -Path "C:\Temp"^) ^) { >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo             Write-Host "Creando directorio C:\Temp..." -ForegroundColor Cyan >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo             New-Item -ItemType Directory -Path "C:\Temp" -Force ^| Out-Null >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo         } >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo. >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo         Write-Host "Buscando volumenes con BitLocker activado..." -ForegroundColor Blue >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo         $volumes = Get-BitLockerVolume ^| Where-Object { $_.ProtectionStatus -eq "On" } >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo. >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo         if ^($volumes^) { >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo             $results = @^(^) >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo             foreach ^($vol in $volumes^) { >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo                 $protectors = Get-BitLockerVolume -MountPoint $vol.MountPoint ^| Select-Object -ExpandProperty KeyProtector ^| Where-Object { $_.KeyProtectorType -eq "RecoveryPassword" } >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo. >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo                 foreach ^($prot in $protectors^) { >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo                     $results += "[$($prot.KeyProtectorId)] $($prot.RecoveryPassword)" >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo                 } >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo             } >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo. >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo             if ^($results^) { >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo                 $results ^| Out-File -FilePath $OutputFile -Encoding UTF8 >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo                 Write-Host "Claves encontradas y guardadas en: $OutputFile" -ForegroundColor Green >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo                 Get-Content $OutputFile >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo             } else { >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo                 Write-Warning "No se encontraron protectores de clave de recuperacion de tipo \"RecoveryPassword\" para los volumenes BitLocker activos." >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo             } >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo         } else { >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo             Write-Warning "No se encontraron volumenes con BitLocker activado en este equipo." >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo         } >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo     } else { >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo         Write-Error "El cmdlet \"Get-BitLockerVolume\" no esta disponible. Asegurese de que el modulo BitLocker esta instalado y de ejecutar como Administrador." >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo     } >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo } catch { >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo     Write-Host "Ocurrio un error inesperado durante la ejecucion del script BitLocker. Detalles:" -ForegroundColor Red >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo $_.Exception ^| Format-List -Force >> "%TEMP%\BitlockerKeysRecovery.ps1"
echo } >> "%TEMP%\BitlockerKeysRecovery.ps1"

:: Ejecutar el script de PowerShell temporal
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%TEMP%\BitlockerKeysRecovery.ps1"

if %errorlevel% neq 0 (
    echo.
    echo Ocurrio un error al ejecutar el script de PowerShell integrado.
    echo Asegurese de ejecutar el script como Administrador.
    echo.
)

:: Limpiar el archivo temporal
del "%TEMP%\BitlockerKeysRecovery.ps1" 1>nul 2>nul

echo %PRESS_ANY_KEY%
pause >nul
goto UTILITIES_MENU

:KYS_ACTIVATOR
cls
echo Iniciando el Activador (Massgrave)...
echo.

:: Crear un archivo temporal de PowerShell para el activador
echo irm https://get.activated.win ^| iex > "%TEMP%\MassgraveActivator.ps1"

:: Ejecutar el script de PowerShell temporal
start "" powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%TEMP%\MassgraveActivator.ps1"
pause
:: Limpiar el archivo temporal
del "%TEMP%\MassgraveActivator.ps1" 1>nul 2>nul

echo.
echo Finalizado la ejecucion del Activador (Massgrave).
echo %PRESS_ANY_KEY%
goto INFO_LICENSE_MENU

:UNATTENDED_INSTALLER_CTT
cls
echo Ejecutando Instalador de programas desatendido (CTT)...
echo.
start "" powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "iwr -useb https://christitus.com/win | iex"
echo %PRESS_ANY_KEY%
pause >nul
goto UTILITIES_MENU

:OPEN_NINITE
cls
echo Abriendo el sitio web de Ninite...
echo.
start "" "https://ninite.com/"
echo %PRESS_ANY_KEY%
pause >nul
goto UTILITIES_MENU

:SHOW_WINVER
cls
echo Mostrando Version de Windows...
echo.
"%windir%\System32\winver.exe"
echo %PRESS_ANY_KEY%
pause >nul
goto INFO_LICENSE_MENU

:OPEN_DXDIAG
cls
echo Abriendo Diagnostico de DirectX (dxdiag)...
echo.
start "" "%windir%\System32\dxdiag.exe"
echo %PRESS_ANY_KEY%
pause >nul
goto INFO_LICENSE_MENU

:OPEN_MSINFO32
cls
echo Abriendo Informacion del Sistema (msinfo32)...
echo.
start "" "%windir%\System32\msinfo32.exe"
echo %PRESS_ANY_KEY%
pause >nul
goto INFO_LICENSE_MENU

:GENERATE_BATTERY_REPORT
cls
echo Generando Reporte de Bateria...
echo.
powercfg /batteryreport /output "%USERPROFILE%\battery-report.html"
if %errorlevel% equ 0 (
    echo.
    echo Reporte de bateria generado en: %USERPROFILE%\battery-report.html
    echo Abriendo el reporte automaticamente...
    start "" "%USERPROFILE%\battery-report.html"
) else (
    echo.
    echo Error: No se pudo generar el reporte de bateria.
    echo Asegurese de ejecutar el script como Administrador.
)
echo.
echo %PRESS_ANY_KEY%
pause >nul
goto INFO_LICENSE_MENU

:SHOW_LICENSE_EXPIRATION
cls
echo Mostrando Caducidad de Licencia de Windows...
echo.
cscript "%windir%\System32\slmgr.vbs" /xpr
echo %PRESS_ANY_KEY%
pause >nul
goto INFO_LICENSE_MENU

:SHOW_LICENSE_INFO
cls
echo Mostrando Informacion Detallada de Licencia de Windows...
echo.
cscript "%windir%\System32\slmgr.vbs" /dli
echo %PRESS_ANY_KEY%
pause >nul
goto INFO_LICENSE_MENU

:OPEN_OSK
cls
echo Abriendo Teclado en Pantalla (OSK)...
echo.
start "" "%windir%\System32\osk.exe"
echo %PRESS_ANY_KEY%
pause >nul
goto UTILITIES_MENU

:START_PSR
cls
echo Iniciando Grabador de Pasos (PSR)...
echo.
start "" "%windir%\System32\psr.exe"
echo %PRESS_ANY_KEY%
pause >nul
goto UTILITIES_MENU

:START_CLEANMGR
cls
echo Iniciando Limpieza de Disco (cleanmgr)...
echo.
start "" "%windir%\System32\cleanmgr.exe"
echo %PRESS_ANY_KEY%
pause >nul
goto UTILITIES_MENU

:OPEN_C_DRIVE
cls
echo Abriendo Explorador en Unidad C:\...
echo.
start "" "%SystemDrive%\"
echo %PRESS_ANY_KEY%
pause >nul
goto UTILITIES_MENU

:OPTIMIZE_PERFORMANCE
cls
echo Ejecutando script de Optimizacion de Rendimiento (PowerShell)...
echo.
:: Crear un archivo temporal de PowerShell para la optimizacion
echo # Limpiar archivos temporales > "%TEMP%\OptimizePerformance.ps1"
echo $TempFolder = "$env:Temp" >> "%TEMP%\OptimizePerformance.ps1"
echo $TempInternetFiles = "$env:LocalAppData\Microsoft\Windows\INetCache" >> "%TEMP%\OptimizePerformance.ps1"
echo $TempWindowsFiles = "$env:SystemRoot\Temp" >> "%TEMP%\OptimizePerformance.ps1"
echo. >> "%TEMP%\OptimizePerformance.ps1"
echo Write-Host "Limpiando archivos temporales..." -ForegroundColor Green >> "%TEMP%\OptimizePerformance.ps1"
echo Remove-Item -Path "$TempFolder\*" -Recurse -Force -ErrorAction SilentlyContinue >> "%TEMP%\OptimizePerformance.ps1"
echo Remove-Item -Path "$TempInternetFiles\*" -Recurse -Force -ErrorAction SilentlyContinue >> "%TEMP%\OptimizePerformance.ps1"
echo Remove-Item -Path "$TempWindowsFiles\*" -Recurse -Force -ErrorAction SilentlyContinue >> "%TEMP%\OptimizePerformance.ps1"
echo. >> "%TEMP%\OptimizePerformance.ps1"
echo # Desfragmentar disco (solo si no es SSD) >> "%TEMP%\OptimizePerformance.ps1"
echo Write-Host "Determinando tipo de unidad..." -ForegroundColor Blue >> "%TEMP%\OptimizePerformance.ps1"
echo $DriveType = ^(Get-PhysicalDisk ^| Where-Object { $_.BusType -eq "SATA" -or $_.BusType -eq "SCSI" -and $_.Size -gt 0 } ^| Select-Object -First 1^).MediaType >> "%TEMP%\OptimizePerformance.ps1"
echo if ($DriveType -eq "HDD") { >> "%TEMP%\OptimizePerformance.ps1"
echo     Write-Host "Desfragmentando la unidad C: (HDD detectado)..." -ForegroundColor Yellow >> "%TEMP%\OptimizePerformance.ps1"
echo     Start-Process -FilePath "%windir%\System32\defrag.exe" -ArgumentList "C: /O" -Wait >> "%TEMP%\OptimizePerformance.ps1"
echo } elseif ($DriveType -eq "SSD") { >> "%TEMP%\OptimizePerformance.ps1"
echo     Write-Host "La unidad C: es un SSD, omitiendo desfragmentacion." -ForegroundColor Cyan >> "%TEMP%\OptimizePerformance.ps1"
echo } else { >> "%TEMP%\OptimizePerformance.ps1"
echo     Write-Host "Tipo de unidad no detectado o no es HDD/SSD claro. Omitiendo desfragmentacion." -ForegroundColor DarkYellow >> "%TEMP%\OptimizePerformance.ps1"
echo } >> "%TEMP%\OptimizePerformance.ps1"
echo. >> "%TEMP%\OptimizePerformance.ps1"
echo # Liberar memoria >> "%TEMP%\OptimizePerformance.ps1"
echo Write-Host "Liberando memoria..." -ForegroundColor Green >> "%TEMP%\OptimizePerformance.ps1"
echo [System.GC]::Collect^(^) >> "%TEMP%\OptimizePerformance.ps1"
echo [System.GC]::WaitForPendingFinalizers^(^) >> "%TEMP%\OptimizePerformance.ps1"
echo [System.GC]::Collect^(^) >> "%TEMP%\OptimizePerformance.ps1"
echo. >> "%TEMP%\OptimizePerformance.ps1"
echo # Verificar y reparar archivos del sistema desde cmd >> "%TEMP%\OptimizePerformance.ps1"
echo Write-Host "Verificando y reparando archivos del sistema (SFC /SCANNOW)..." -ForegroundColor Blue >> "%TEMP%\OptimizePerformance.ps1"
echo Start-Process -FilePath "%windir%\System32\cmd.exe" -ArgumentList "/c sfc /scannow" -Wait >> "%TEMP%\OptimizePerformance.ps1"
echo. >> "%TEMP%\OptimizePerformance.ps1"
echo # Optimizar la memoria virtual (tamaño automático, o un rango específico si prefieres) >> "%TEMP%\OptimizePerformance.ps1"
echo Write-Host "Optimizando la memoria virtual (se recomienda Auto-Managed por Windows)..." -ForegroundColor Green >> "%TEMP%\OptimizePerformance.ps1"
echo try { >> "%TEMP%\OptimizePerformance.ps1"
echo     $ComputerSystem = Get-WmiObject Win32_ComputerSystem >> "%TEMP%\OptimizePerformance.ps1"
echo     if ($ComputerSystem.AutomaticManagedPagefile) { >> "%TEMP%\OptimizePerformance.ps1"
echo         Write-Host "La memoria virtual ya esta administrada automaticamente por Windows." -ForegroundColor Cyan >> "%TEMP%\OptimizePerformance.ps1"
echo     } else { >> "%TEMP%\OptimizePerformance.ps1"
echo         Write-Host "Configurando la memoria virtual para ser administrada automaticamente..." -ForegroundColor Yellow >> "%TEMP%\OptimizePerformance.ps1"
echo         $ComputerSystem.AutomaticManagedPagefile = $true >> "%TEMP%\OptimizePerformance.ps1"
echo         $ComputerSystem.Put^(^) ^| Out-Null >> "%TEMP%\OptimizePerformance.ps1"
echo         Write-Host "Memoria virtual configurada para gestion automatica." -ForegroundColor Green >> "%TEMP%\OptimizePerformance.ps1"
echo     } >> "%TEMP%\OptimizePerformance.ps1"
echo } catch { >> "%TEMP%\OptimizePerformance.ps1"
echo     Write-Warning "No se pudo modificar la configuracion de la memoria virtual. Error: $($_.Exception.Message)" >> "%TEMP%\OptimizePerformance.ps1"
echo } >> "%TEMP%\OptimizePerformance.ps1"
echo. >> "%TEMP%\OptimizePerformance.ps1"
echo # Habilitar la opción de inicio rápido >> "%TEMP%\OptimizePerformance.ps1"
echo Write-Host "Habilitando el inicio rapido..." -ForegroundColor Blue >> "%TEMP%\OptimizePerformance.ps1"
echo Start-Process -FilePath "%windir%\System32\powercfg.exe" -ArgumentList "-h on" -Wait >> "%TEMP%\OptimizePerformance.ps1"
echo. >> "%TEMP%\OptimizePerformance.ps1"
echo Write-Host "¡Optimacion del rendimiento completa!" -ForegroundColor Magenta >> "%TEMP%\OptimizePerformance.ps1"
echo Read-Host -Prompt "Creado por su Creador, presiona Enter para salir" >> "%TEMP%\OptimizePerformance.ps1"


powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%TEMP%\OptimizePerformance.ps1"

if %errorlevel% neq 0 (
    echo.
    echo Ocurrio un error al ejecutar el script de Optimizacion de Rendimiento.
    echo Asegurese de ejecutar el script como Administrador.
    echo.
)
:: Limpiar el archivo temporal
del "%TEMP%\OptimizePerformance.ps1" 1>nul 2>nul

echo %PRESS_ANY_KEY%
goto OPTIMIZATION_MENU

:DEBLOAT_SYSTEM
cls
echo Ejecutando script para Eliminar Bloatware (debloat)...
echo.
start "" powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "irm https://git.io/debloat | iex"

echo.
echo Finalizado el intento de ejecucion del Eliminador de Bloatware (debloat).
echo %PRESS_ANY_KEY%
pause >nul
goto OPTIMIZATION_MENU

:INVALID_CHOICE_SUBMENU
cls
echo %OPTION_INVALID%
echo %PRESS_ANY_KEY%
pause >nul
if "%choice_menu%"=="BOOT_RECOVERY_MENU" goto BOOT_RECOVERY_MENU
if "%choice_menu%"=="SYSTEM_ADMIN_MENU" goto SYSTEM_ADMIN_MENU
if "%choice_menu%"=="UTILITIES_MENU" goto UTILITIES_MENU
if "%choice_menu%"=="INFO_LICENSE_MENU" goto INFO_LICENSE_MENU
if "%choice_menu%"=="OPTIMIZATION_MENU" goto OPTIMIZATION_MENU
goto MAIN_MENU

:INVALID_CHOICE
cls
echo %OPTION_INVALID%
echo %PRESS_ANY_KEY%
pause >nul
goto MAIN_MENU

:OPEN_GITHUB_PROFILE
cls
echo Abriendo perfil de GitHub del creador...
echo.
start "" "https://github.com/ANONIMO432HZ"
echo Perfil de GitHub abierto en el navegador.
echo.
echo %PRESS_ANY_KEY%
pause >nul
goto MAIN_MENU

:END_SCRIPT
cls
echo Saliendo del script. !Adios!
timeout /t 2 /nobreak >nul
exit