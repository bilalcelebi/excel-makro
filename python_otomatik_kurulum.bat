@echo off
setlocal

:: Python y�kleyicisinin indirilece�i URL
set "PYTHON_URL=https://www.python.org/ftp/python/3.13.2/python-3.13.2-amd64.exe"

:: Ge�ici dizin tan�mlama
set "TEMP_DIR=%TEMP%\python_install"

:: Ge�ici dizini olu�tur
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"

:: Python y�kleyicisini indir
echo Python indiriliyor...
powershell -Command "Invoke-WebRequest -Uri %PYTHON_URL% -OutFile %TEMP_DIR%\python_installer.exe"

:: Python'� y�kle
echo Python y�kleniyor...
start /wait "" "%TEMP_DIR%\python_installer.exe" /quiet InstallAllUsers=0 PrependPath=1 Include_pip=1

:: pip ile k�t�phaneleri y�kle
echo K�t�phaneler y�kleniyor...
pip install numpy pandas matplotlib

:: Ge�ici dosyalar� temizle
echo Ge�ici dosyalar temizleniyor...
rd /s /q "%TEMP_DIR%"

echo ��lem tamamland�.
endlocal
