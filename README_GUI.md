# 🌾 AgriExpert Kenya - Web-Based Agricultural Expert System

**Empowering Kenyan farmers with intelligent agricultural guidance through a user-friendly web interface**

AgriExpert Kenya transforms complex agricultural expertise into an accessible web application that provides personalized farming recommendations to smallholder farmers across Kenya.

## 🚀 Quick Start

### Option 1: Use the Farmer-Friendly Web Interface (Recommended)
```bash
# Start the web interface
./start_gui.sh

# Then open your browser to:
# http://localhost:5000
```

### Option 2: Command Line (For Developers)
```bash
# Load and run the CLIPS expert system
/path/to/clips -f agri_expert.clp
CLIPS> (run)
```

## 🌐 Web Interface Features

### For Farmers
- **🖱️ Easy-to-use forms** - No technical knowledge required
- **📱 Mobile-friendly design** - Works on phones and tablets
- **🌍 Clear interface** - Simple, farmer-friendly language
- **📊 Visual recommendations** - Color-coded priority system
- **🖨️ Printable reports** - Take recommendations to the field
- **🆓 Completely free** - No charges or subscriptions

### For Agricultural Officers
- **📈 Comprehensive analysis** - Multiple recommendation categories
- **🎯 Priority-based guidance** - Urgent, high, medium, low priorities
- **📋 Detailed problem diagnosis** - Pest, disease, and nutrient issues
- **🌱 Crop-specific advice** - Tailored to specific varieties and conditions

## 🖥️ System Architecture

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Web Browser   │◄──►│  Flask Web App   │◄──►│  CLIPS Engine   │
│  (Farmer UI)    │    │  (Python)        │    │ (Expert System) │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                              │
                              ▼
                        ┌──────────────┐
                        │ Knowledge    │
                        │ Base (.clp)  │
                        └──────────────┘
```

## 📋 What AgriExpert Provides

### 🌱 Crop Selection
- **Variety recommendations** based on altitude (H614, H628, DK8031)
- **Climate matching** for optimal yields
- **Local adaptation** for Kenyan conditions

### 🌍 Soil Management
- **Clay soil**: Drainage improvements, organic matter
- **Sandy soil**: Water retention, nutrient management
- **Loam soil**: Fertility maintenance, crop rotation

### 🐛 Pest & Disease Control
- **Fall Armyworm**: Early detection and Bt-based treatment
- **Maize Streak Virus**: Vector control and resistant varieties
- **Integrated Pest Management**: Eco-friendly approaches

### 🧪 Fertilization Guidance
- **DAP application**: Timing and quantities
- **CAN top-dressing**: Growth stage recommendations
- **Organic amendments**: Manure and compost guidance

### 💧 Water Management
- **Drought stress**: Conservation techniques
- **Irrigation planning**: Efficient water use
- **Rainwater harvesting**: Storage and utilization

## 🏃‍♂️ Getting Started

### Prerequisites
- **CLIPS Expert System** (included in downloads)
- **Python 3.6+** with Flask
- **Web browser** (Chrome, Firefox, Safari, etc.)

### Installation

1. **Clone or download** this repository
2. **Install Python dependencies**:
   ```bash
   pip3 install flask
   ```
3. **Start the web interface**:
   ```bash
   ./start_gui.sh
   ```
4. **Open your browser** to `http://localhost:5000`

### Usage

1. **Fill out the consultation form**:
   - Farmer information (name, location, experience)
   - Farm conditions (soil, altitude, water source)
   - Crop details (type, growth stage, area)
   - Problems (optional - pests, diseases, etc.)

2. **Submit for analysis**:
   - CLIPS expert system processes your data
   - Generates personalized recommendations

3. **Review recommendations**:
   - Priority-coded advice (urgent → low)
   - Actionable guidance for each issue
   - Print or save for reference

## 🎯 Example Consultation

**Farmer**: John Mwangi, Limuru (1900m altitude)
**Conditions**: Loam soil, medium rainfall, well water
**Crop**: Maize, planting stage

**Generated Recommendations**:
- 🌱 **Crop Selection**: Plant H628 variety (high altitude)
- 🌍 **Soil Management**: Balanced fertilization, crop rotation
- 📏 **Planting Guide**: 75cm×25cm spacing, 2 plants/hole
- 🧪 **Fertilization**: 1 bag DAP + 1 bag CAN timing

## 🗂️ Files Structure

```
agriexpert-kenya/
├── 🌐 Web Interface
│   ├── app.py              # Flask web application
│   ├── start_gui.sh        # Easy startup script
│   └── templates/          # HTML templates
│       ├── base.html       # Base layout
│       ├── index.html      # Home page
│       ├── consultation.html # Form page
│       ├── results.html    # Recommendations
│       └── about.html      # About page
├── 🧠 Expert System
│   ├── agri_expert.clp     # Main knowledge base
│   ├── interface.clp       # User interface rules
│   └── demo.clp           # Demo scenarios
├── 📄 Documentation
│   ├── README.md          # Original documentation
│   └── requirements.txt   # Python dependencies
└── 🔧 Utils
    └── clips/             # CLIPS executable (in downloads)
```

## 📊 Supported Crops & Conditions

### Crops Covered
- **Cereals**: Maize, Millet, Sorghum
- **Legumes**: Beans (various varieties)
- **Tubers**: Cassava, Sweet Potato, Irish Potato
- **Cash Crops**: Coffee, Tea
- **Horticulture**: Vegetables, Banana
- **And more**: Expanding knowledge base

### Conditions Analyzed
- **Altitude**: 0-2500m above sea level
- **Soil Types**: Clay, Sandy, Loam, Volcanic, Red Earth
- **Rainfall**: High, Medium, Low, Irregular patterns
- **Water Sources**: River, Well, Rainwater, Irrigation, None
- **Slopes**: Flat, Gentle, Steep terrain

## 🚨 Problem Diagnosis

### Pest Management
- **Fall Armyworm**: Holes in leaves → Bt pesticides, scouting
- **Aphids**: Curled leaves → Natural predators, neem oil
- **Cutworms**: Cut seedlings → Collar protection, baits

### Disease Control
- **Maize Streak Virus**: Yellow streaks → Resistant varieties
- **Bacterial Wilt**: Wilting plants → Crop rotation, sanitation
- **Fungal Issues**: Spots/molds → Fungicides, air circulation

### Nutrient Issues
- **Nitrogen Deficiency**: Yellow leaves → Urea/CAN application
- **Phosphorus Lack**: Purple leaves → DAP fertilizer
- **Potassium Shortage**: Brown edges → Muriate of potash

## 🌟 Benefits for Farmers

### Immediate Value
- ✅ **Free consultation** - No fees or subscriptions
- ✅ **24/7 availability** - Access anytime, anywhere
- ✅ **Instant results** - Recommendations in minutes
- ✅ **Printable format** - Take advice to the field

### Long-term Impact
- 📈 **Increased yields** - Better farming practices
- 💰 **Cost savings** - Efficient resource use
- 🌱 **Sustainable farming** - Environmental protection
- 📚 **Knowledge building** - Learn as you farm

## 🔧 Technical Details

### Technology Stack
- **Backend**: Flask (Python)
- **Expert System**: CLIPS 6.4.2
- **Frontend**: Bootstrap 5, HTML5, JavaScript
- **Database**: Session-based (no persistent storage)

### System Requirements
- **Server**: Linux/Windows/macOS with Python 3.6+
- **Memory**: 512MB RAM minimum
- **Storage**: 100MB disk space
- **Network**: Optional (for web access)

### Security & Privacy
- **No data storage** - Consultations are session-based
- **Local processing** - Data doesn't leave your server
- **Open source** - Transparent and auditable
- **No tracking** - Privacy-first design

## 📞 Support & Contact

### Getting Help
- 📖 **Documentation**: Check README files
- 🐛 **Issues**: Report on GitHub/email
- 💬 **Community**: Agricultural forums
- 📧 **Direct Contact**: agriexpert@example.com

### Training & Support
- 👨‍🌾 **Farmer training**: Available on request
- 👩‍💼 **Extension officer workshops**: System deployment
- 🏫 **Institutional support**: Universities and NGOs
- 🌍 **International adaptation**: Other countries

## 🤝 Contributing

### How to Contribute
1. **Knowledge**: Add crop varieties, regional data
2. **Translation**: Localize to Swahili/other languages
3. **Testing**: Try with real farmer scenarios
4. **Development**: Improve web interface, add features
5. **Documentation**: Update guides and tutorials

### Development Setup
```bash
# Clone the repository
git clone [repository-url]

# Install dependencies
pip3 install -r requirements.txt

# Run in development mode
python3 app.py
```

## 🔮 Future Roadmap

### Phase 2: Enhanced Features
- 📱 **Mobile app** (Android/iOS)
- 🗣️ **Voice interface** in local languages
- 📷 **Image recognition** for pest/disease ID
- 🌦️ **Weather integration** for timing advice

### Phase 3: Community Features
- 👥 **Farmer networks** and knowledge sharing
- 📊 **Analytics dashboard** for agricultural officers
- 🏪 **Market integration** for price information
- 💳 **Financial tools** for credit and insurance

### Phase 4: AI Enhancement
- 🤖 **Machine learning** for yield prediction
- 🛰️ **Satellite data** for crop monitoring
- 📈 **Predictive analytics** for pest outbreaks
- 🎯 **Precision agriculture** recommendations

## 📜 License & Attribution

This project is developed to support smallholder farmers in Kenya and is available under an open-source license. When using or adapting this system:

- ✅ **Attribution required** - Credit the original developers
- ✅ **Educational use** - Freely available for learning
- ✅ **Commercial adaptation** - Contact for licensing
- ✅ **Improvements welcome** - Contribute back to community

## 🙏 Acknowledgments

Special thanks to:
- **Kenyan farmers** who provided real-world insights
- **Agricultural extension officers** for expertise validation
- **KALRO** (Kenya Agricultural Research Organization)
- **Universities** supporting agricultural research
- **CLIPS community** for the expert system platform
- **Open source contributors** worldwide

---

*AgriExpert Kenya - Making agricultural expertise accessible to every farmer*

**🌾 Grow smarter, farm better, live prosperously 🌾**
