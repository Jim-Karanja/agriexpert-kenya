#!/bin/bash

# AgriExpert Kenya - Web GUI Startup Script
# Run this script to start the farmer-friendly web interface

echo "=========================================="
echo "🌾 AgriExpert Kenya - Web Interface"
echo "=========================================="
echo "Starting the farmer-friendly web interface..."
echo ""

# Check if CLIPS is available
if [ ! -f "/home/jim12hihand/Downloads/clips_core_source_642/core/clips" ]; then
    echo "❌ Error: CLIPS executable not found!"
    echo "Please ensure CLIPS is installed in the expected location."
    exit 1
fi

# Check if agri_expert.clp exists
if [ ! -f "agri_expert.clp" ]; then
    echo "❌ Error: agri_expert.clp not found!"
    echo "Please ensure the CLIPS knowledge base file is present."
    exit 1
fi

# Check Python and Flask
python3 -c "import flask" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "❌ Error: Flask not installed!"
    echo "Please install Flask: pip3 install flask"
    exit 1
fi

echo "✅ All dependencies found!"
echo ""
echo "🚀 Starting AgriExpert Kenya Web Server..."
echo ""
echo "📱 Access the system at:"
echo "   🏠 Local: http://localhost:5000"
echo "   🌐 Network: http://$(hostname -I | awk '{print $1}'):5000"
echo ""
echo "👨‍🌾 Farmers can now use the web interface!"
echo "📋 Features:"
echo "   • Easy-to-use forms"
echo "   • Personalized recommendations"
echo "   • Problem diagnosis"
echo "   • Printable reports"
echo ""
echo "Press Ctrl+C to stop the server"
echo "=========================================="

# Start the Flask application
python3 app.py
