# How to Open Your Fake News Detector Website

## Method 1: Open HTML File Directly (Easiest)

1. **Navigate to the Frontend folder:**
   ```
   D:\Fake-news-detector\Frontend
   ```

2. **Double-click on `index.html`** to open it in your default browser

   OR

3. **Right-click on `index.html`** → Select "Open with" → Choose your browser (Chrome, Firefox, Edge, etc.)

## Method 2: Using a Local Web Server (Recommended)

This method avoids potential CORS issues:

1. **Open a new PowerShell/Command Prompt window**

2. **Navigate to the Frontend folder:**
   ```powershell
   cd D:\Fake-news-detector\Frontend
   ```

3. **Start a local web server:**
   ```powershell
   python -m http.server 8000
   ```

4. **Open your browser and go to:**
   ```
   http://localhost:8000
   ```

## Method 3: Quick Access Script

I've created a script to open the website easily - just double-click:
- `Frontend/open_website.bat` (Windows)

## Important Notes:

1. **Backend Server Must Be Running:**
   - The Flask server must be running on `http://localhost:5001`
   - If it's not running, open a terminal and run:
     ```powershell
     cd D:\Fake-news-detector\Backend
     python app.py
     ```

2. **If you see CORS errors:**
   - Use Method 2 (local web server) instead of opening the file directly
   - Or check that the backend server is running and CORS is enabled

3. **If the website doesn't load:**
   - Check that both servers are running:
     - Backend: http://localhost:5001
     - Frontend: http://localhost:8000 (if using Method 2)
   - Check browser console for errors (F12)

## Troubleshooting:

- **"Failed to analyze article"** → Backend server is not running
- **Blank page** → Check browser console (F12) for errors
- **CORS errors** → Use Method 2 (local web server)

