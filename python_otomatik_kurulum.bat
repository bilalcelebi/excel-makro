@echo off
setlocal

:: Python yükleyicisinin indirileceði URL
set "PYTHON_URL=https://www.python.org/ftp/python/3.13.2/python-3.13.2-amd64.exe"

:: Geçici dizin tanýmlama
set "TEMP_DIR=%TEMP%\python_install"

:: Geçici dizini oluþtur
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"

:: Python yükleyicisini indir
echo Python indiriliyor...
powershell -Command "Invoke-WebRequest -Uri %PYTHON_URL% -OutFile %TEMP_DIR%\python_installer.exe"

:: Python'ý yükle
echo Python yükleniyor...
start /wait "" "%TEMP_DIR%\python_installer.exe" /quiet InstallAllUsers=0 PrependPath=1 Include_pip=1

:: pip ile kütüphaneleri yükle
echo Kütüphaneler yükleniyor...
pip install numpy pandas matplotlib

:: Geçici dosyalarý temizle
echo Geçici dosyalar temizleniyor...
rd /s /q "%TEMP_DIR%"

echo Ýþlem tamamlandý.
endlocal
