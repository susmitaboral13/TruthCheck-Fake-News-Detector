@echo off
REM Fake News Detector - Quick Start Script for Windows

echo ==================================
echo 🚀 Fake News Detector Setup
echo ==================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Python is not installed. Please install Python 3.8 or higher.
    pause
    exit /b 1
)

echo ✅ Python found
python --version
echo.

REM Check if required files exist
echo Checking for required files...
set "missing=0"

if exist "app.py" (
    echo   ✅ app.py
) else (
    echo   ❌ app.py ^(missing^)
    set "missing=1"
)

if exist "requirements.txt" (
    echo   ✅ requirements.txt
) else (
    echo   ❌ requirements.txt ^(missing^)
    set "missing=1"
)

if exist "finalized_model.pkl" (
    echo   ✅ finalized_model.pkl
) else (
    echo   ❌ finalized_model.pkl ^(missing^)
    set "missing=1"
)

if %missing% EQU 1 (
    echo.
    echo ❌ Missing required files. Please ensure all files are in the directory.
    pause
    exit /b 1
)

if not exist "tfidf_vectorizer.pkl" (
    echo   ⚠️  tfidf_vectorizer.pkl ^(optional but recommended^)
    echo      Run the updated notebook cell to create this file
)

echo.

REM Create virtual environment if it doesn't exist
if not exist "venv" (
    echo 📦 Creating virtual environment...
    python -m venv venv
    echo ✅ Virtual environment created
) else (
    echo ✅ Virtual environment already exists
)

echo.

REM Activate virtual environment
echo 🔧 Activating virtual environment...
call venv\Scripts\activate.bat

echo.

REM Install dependencies
echo 📚 Installing dependencies...
pip install -q -r requirements.txt

if %ERRORLEVEL% EQU 0 (
    echo ✅ Dependencies installed successfully
) else (
    echo ❌ Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo ==================================
echo ✨ Setup Complete!
echo ==================================
echo.
echo Starting the Flask server...
echo The API will be available at: http://localhost:5000
echo.
echo To test the API, open another terminal and run:
echo   python test_api.py
echo.
echo To view the frontend, open index.html in your browser
echo.
echo Press Ctrl+C to stop the server
echo.
echo ==================================
echo.

REM Start the Flask app
python app.py

pause