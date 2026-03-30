@echo off
REM Student Practical Evaluation System - Setup Script for Windows

echo.
echo ==================================================
echo   Student Practical Evaluation System Setup
echo ==================================================
echo.

REM Check Node.js installation
echo ✓ Checking Node.js installation...
node --version >nul 2>&1
if errorlevel 1 (
    echo ✗ Node.js is not installed!
    echo.
    echo Please download and install Node.js from: https://nodejs.org/
    pause
    exit /b
)
for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
echo   Found: %NODE_VERSION%

REM Check MySQL installation
echo ✓ Checking MySQL installation...
mysql --version >nul 2>&1
if errorlevel 1 (
    echo ✗ MySQL is not installed or not in PATH!
    echo.
    echo Please install MySQL Server from: https://dev.mysql.com/downloads/mysql/
    echo Make sure to add MySQL to your system PATH
    pause
    exit /b
)
for /f "tokens=*" %%i in ('mysql --version') do set MYSQL_VERSION=%%i
echo   Found: %MYSQL_VERSION%

echo.
echo ==================================================
echo Step 1: Installing Backend Dependencies
echo ==================================================
cd backend
echo ✓ Running npm install...
call npm install

if errorlevel 1 (
    echo ✗ Failed to install dependencies!
    pause
    exit /b
)

echo.
echo ==================================================
echo Step 2: Database Setup
echo ==================================================
echo.
echo Please enter your MySQL credentials:
set /p DB_USER="MySQL Username (default: root): "
if "%DB_USER%"=="" set DB_USER=root

set /p DB_PASSWORD="MySQL Password (press Enter if no password): "

echo.
echo ✓ Creating database...

if "%DB_PASSWORD%"=="" (
    mysql -u %DB_USER% < db-schema.sql
) else (
    mysql -u %DB_USER% -p%DB_PASSWORD% < db-schema.sql
)

if errorlevel 1 (
    echo ✗ Database creation failed!
    echo.
    echo Please check your MySQL credentials and try again.
    pause
    exit /b
)

echo ✓ Database created successfully!

echo.
echo ==================================================
echo Step 3: Updating .env file
echo ==================================================
echo.
echo Updating .env with your credentials...

(
    echo DB_HOST=localhost
    echo DB_USER=%DB_USER%
    echo DB_PASSWORD=%DB_PASSWORD%
    echo DB_NAME=student_practical_evaluation
    echo PORT=5000
    echo NODE_ENV=development
) > .env

echo ✓ .env file created!

echo.
echo ==================================================
echo Setup Complete!
echo ==================================================
echo.
echo Your Student Practical Evaluation System is ready!
echo.
echo To start the application:
echo.
echo 1. Start Backend Server (keep this window open):
echo    cd backend
echo    npm start
echo.
echo 2. Open Frontend in Browser:
echo    Open: frontend/login.html
echo    or use: python -m http.server 8000
echo.
echo 3. Login Credentials:
echo    Admin: admin / admin
echo    Teacher: sharma@school.com / 1234
echo    Student: CS001 / student123
echo.
echo For more details, see QUICK_START.md and README.md
echo.
pause
