#!/bin/bash

# Fake News Detector - Quick Start Script
# This script sets up and starts your fake news detection system

echo "=================================="
echo "🚀 Fake News Detector Setup"
echo "=================================="
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null
then
    echo "❌ Python 3 is not installed. Please install Python 3.8 or higher."
    exit 1
fi

echo "✅ Python found: $(python3 --version)"
echo ""

# Check if required files exist
echo "Checking for required files..."
required_files=("app.py" "requirements.txt" "finalized_model.pkl")
missing_files=()

for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✅ $file"
    else
        echo "  ❌ $file (missing)"
        missing_files+=("$file")
    fi
done

if [ ${#missing_files[@]} -gt 0 ]; then
    echo ""
    echo "❌ Missing required files. Please ensure all files are in the directory."
    exit 1
fi

# Check for vectorizer file
if [ ! -f "tfidf_vectorizer.pkl" ]; then
    echo "  ⚠️  tfidf_vectorizer.pkl (optional but recommended)"
    echo "     Run the updated notebook cell to create this file for better performance"
fi

echo ""

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
    echo "✅ Virtual environment created"
else
    echo "✅ Virtual environment already exists"
fi

echo ""

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source venv/bin/activate

echo ""

# Install dependencies
echo "📚 Installing dependencies..."
pip install -q -r requirements.txt

if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully"
else
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo ""
echo "=================================="
echo "✨ Setup Complete!"
echo "=================================="
echo ""
echo "Starting the Flask server..."
echo "The API will be available at: http://localhost:5000"
echo ""
echo "To test the API, open another terminal and run:"
echo "  python test_api.py"
echo ""
echo "To view the frontend, open index.html in your browser"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""
echo "=================================="
echo ""

# Start the Flask app
python app.py