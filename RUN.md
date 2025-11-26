# How to Run the Fake News Detector

## Quick Start

### Option 1: Run Backend Only (API Server)

1. **Navigate to the Backend directory:**
   ```powershell
   cd Backend
   ```

2. **Install dependencies (if not already installed):**
   ```powershell
   pip install -r requirement.txt
   ```

3. **Run the Flask server:**
   ```powershell
   python app.py
   ```

   The server will start on **http://localhost:5001**

4. **Test the API:**
   - Open your browser and go to: `http://localhost:5001/`
   - You should see a JSON response confirming the server is running

### Option 2: Run with Frontend (Full Application)

1. **Start the Backend Server** (follow Option 1 steps above)

2. **Open the Frontend:**
   - Open `Frontend/index.html` in your web browser
   - Or use a local server:
     ```powershell
     cd Frontend
     python -m http.server 8000
     ```
     Then open: `http://localhost:8000`

3. **Use the Application:**
   - Enter a news title and content in the form
   - Click "Analyze Article" to check if it's fake or real

## API Endpoints

Once the backend is running, you can use these endpoints:

- **Health Check:** `GET http://localhost:5001/`
- **Predict:** `POST http://localhost:5001/api/predict`
  ```json
  {
    "title": "Your news title",
    "text": "Your news content"
  }
  ```
- **Batch Predict:** `POST http://localhost:5001/api/batch-predict`
- **Model Info:** `GET http://localhost:5001/api/model-info`

## Troubleshooting

### Model Not Loading
If you see `"model_loaded": false`, the model files may be corrupted. You need to:
1. Run the Jupyter notebook in `Machine learning/Fake News Detection.ipynb`
2. Copy the generated `.pkl` files to the `Backend` directory

### Port Already in Use
If port 5001 is already in use, you can:
- Change the port in `Backend/app.py` (line 210)
- Update `Frontend/index.html` API_URL to match

### Dependencies Missing
Install all required packages:
```powershell
pip install flask flask-cors pandas numpy scikit-learn scipy joblib threadpoolctl
```

## Current Status

✅ **Server is running on port 5001**
⚠️ **Model files need to be regenerated** (currently showing as not loaded)

