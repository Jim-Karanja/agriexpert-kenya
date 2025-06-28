# AgriExpert Kenya - Agricultural Expert System

## Overview

AgriExpert Kenya is an expert system developed in CLIPS (C Language Integrated Production System) designed to provide sustainable agriculture guidance for smallholder farmers in Kenya. The system addresses the critical need for accessible, localized agricultural knowledge by providing personalized recommendations based on specific farm conditions, crop types, and identified problems.

## Problem Statement

Smallholder farmers in Kenya face significant challenges in achieving optimal crop yields and sustainable farming practices due to:
- Lack of access to timely, localized agricultural knowledge
- Limited reach of traditional extension services
- Inefficient resource utilization (water, fertilizer)
- Vulnerability to pests and diseases
- Soil degradation and low yields

## System Features

### Core Capabilities
- **Crop Selection**: Variety recommendations based on altitude, soil type, and climate
- **Soil Management**: Customized soil improvement strategies
- **Pest & Disease Control**: Identification and treatment recommendations
- **Fertilization**: Nutrient management and application guidance
- **Water Management**: Irrigation and conservation strategies
- **Harvesting**: Post-harvest handling and storage advice

### Knowledge Areas Covered
- **Crops**: Maize, beans, cassava, sweet potato, Irish potato, vegetables, coffee, tea, banana, millet, sorghum
- **Soil Types**: Clay, sandy, loam, volcanic, red earth
- **Altitude Zones**: Low (0-1200m), medium (1200-1800m), high (1800m+)
- **Rainfall Patterns**: High, medium, low, irregular
- **Common Problems**: Pests, diseases, nutrient deficiencies, water stress

## File Structure

```
agriexpert-kenya/
├── agri_expert.clp     # Main knowledge base and rules
├── interface.clp       # Interactive user interface
├── demo.clp           # Demo with sample farmer data
└── README.md          # This documentation file
```

## System Requirements

- CLIPS Expert System Shell (version 6.3 or later)
- Terminal/Command line access
- Basic understanding of CLIPS syntax (for customization)

## Installation and Setup

1. **Install CLIPS**:
   ```bash
   # On Ubuntu/Debian
   sudo apt-get install clips
   
   # On Arch Linux
   sudo pacman -S clips
   
   # Or download from: http://clipsrules.sourceforge.net/
   ```

2. **Clone/Download the project**:
   ```bash
   git clone https://github.com/Jim-Karanja/agriexpert-kenya.git
   cd agriexpert-kenya
   ```

3. **Install Python dependencies** (for GUI interface):
   ```bash
   pip3 install -r requirements.txt
   ```
   
   Or if you prefer using a virtual environment:
   ```bash
   python3 -m venv agriexpert-env
   source agriexpert-env/bin/activate  # On Windows: agriexpert-env\Scripts\activate
   pip install -r requirements.txt
   ```

## Usage Instructions

### Option 1: Web GUI Interface (Recommended for Farmers)
The most user-friendly way to use AgriExpert Kenya is through the web interface:

#### Installation
1. **Install Python dependencies**:
   ```bash
   pip3 install -r requirements.txt
   ```

2. **Update CLIPS path in app.py**:
   Edit `app.py` and update the `CLIPS_PATH` variable to point to your CLIPS installation:
   ```python
   CLIPS_PATH = '/usr/bin/clips'  # Or your CLIPS installation path
   ```

3. **Start the web server**:
   ```bash
   ./start_gui.sh
   ```
   
   Or manually:
   ```bash
   python3 app.py
   ```

4. **Access the web interface**:
   - Open your browser and go to: `http://localhost:5000`
   - For network access: `http://YOUR_IP_ADDRESS:5000`

#### Features
- **Farmer-friendly forms**: Easy data entry with dropdown menus
- **Step-by-step consultation**: Guided process for farmers
- **Visual recommendations**: Clear, actionable advice
- **Problem diagnosis**: Upload symptoms and get solutions
- **Printable reports**: Generate PDF recommendations
- **Multi-language support**: Swahili and English interfaces

### Option 2: CLIPS Server Mode
Run CLIPS as a server for integration with other applications:

#### Basic Server Setup
```bash
# Start CLIPS in batch mode
clips -f agri_expert.clp < consultation_commands.txt > results.txt
```

#### HTTP API Server
The Flask app (`app.py`) provides RESTful API endpoints:

```bash
# Start the server
python3 app.py

# API endpoint for consultations
POST http://localhost:5000/submit_consultation
Content-Type: application/json

{
  "farmer_data": {
    "name": "John Doe",
    "county": "Kiambu",
    "sub_county": "Limuru",
    "farm_size": 2,
    "years_farming": 5,
    "contact": "+254700000000"
  },
  "farm_conditions": {
    "soil_type": "loam",
    "rainfall_pattern": "high",
    "altitude": 1800,
    "water_source": "rain-fed",
    "slope": "gentle"
  },
  "crop_info": {
    "crop_type": "maize",
    "growth_stage": "flowering",
    "planting_season": "long-rains",
    "area_planted": 1.5
  },
  "problems": [
    {
      "problem_type": "pest",
      "symptoms": "holes in leaves",
      "severity": "high",
      "affected_area": 80
    }
  ]
}
```

### Option 3: Interactive CLIPS Mode
For technical users and development:

```bash
clips
CLIPS> (load "agri_expert.clp")
CLIPS> (load "interface.clp")
CLIPS> (reset)
CLIPS> (run)
```

The system will guide you through:
1. Farmer information collection
2. Farm conditions assessment
3. Crop information gathering
4. Problem identification
5. Recommendation generation

### Option 4: Demo Mode
To see the system in action with sample data:

```bash
clips
CLIPS> (load "demo.clp")
CLIPS> (run)
```

This will demonstrate the system with three sample farmers and show various types of recommendations.

### Option 5: Direct Knowledge Base Access
For developers or advanced users to examine rules and facts:

```bash
clips
CLIPS> (load "agri_expert.clp")
CLIPS> (facts)  # View all facts
CLIPS> (rules)  # View all rules
```

## Sample Farmers in Demo

1. **John Mwangi (Kiambu County)**
   - High altitude maize farmer (1900m)
   - Experiencing Fall Armyworm attack
   - Receives pest control and variety recommendations

2. **Mary Wanjiku (Machakos County)**
   - Low altitude bean farmer (1100m)
   - Facing water stress issues
   - Gets drought management strategies

3. **Peter Kamau (Nyeri County)**
   - Medium altitude maize farmer (1600m)
   - Ready for harvest
   - Receives harvesting and post-harvest guidance

## Key Rules and Logic

### Crop Variety Selection
- **High Altitude (>1800m)**: H628 maize variety (cold tolerant)
- **Medium Altitude (1200-1800m)**: H614 or H628 varieties
- **Low Altitude (<1200m)**: H614 or DK8031 varieties (drought tolerant)

### Soil Management
- **Clay Soil**: Drainage improvement, organic matter addition
- **Sandy Soil**: Water retention, frequent organic matter, careful fertilization
- **Loam Soil**: Balanced fertilization, crop rotation

### Pest Identification
- **Fall Armyworm**: Holes in leaves → Bt pesticides, push-pull technology
- **Maize Streak Virus**: Yellow streaks → Resistant varieties, vector control

### Problem Prioritization
- **Urgent**: Critical pests, diseases, water stress
- **High**: Variety selection, soil management, fertilization
- **Medium**: General soil maintenance
- **Low**: Long-term planning

## Customization and Extension

### Adding New Crops
```clips
;; Add to crop-info template allowed-values
(slot crop-type (type SYMBOL) (allowed-values ... new-crop))

;; Add specific rules for the new crop
(defrule recommend-new-crop-variety
   (crop-info (farmer-name ?name) (crop-type new-crop))
   (farm-conditions (farmer-name ?name) (altitude ?alt))
   =>
   (assert (recommendation ...)))
```

### Adding New Regions
```clips
;; Add region-specific knowledge
(deffacts regional-knowledge
   (regional-pest 
      (region "Western Kenya") 
      (pest "Striga weed") 
      (crops "Maize") 
      (season "Long rains")))
```

### Adding Market Information
```clips
;; Market price templates and facts
(deftemplate market-price
   (slot crop (type STRING))
   (slot market (type STRING))
   (slot price-per-90kg (type INTEGER))
   (slot date (type STRING)))
```

## Real-World Implementation Considerations

### Mobile Platform Integration
- USSD interface for feature phones
- Android/iOS app with CLIPS engine
- SMS-based recommendations
- Voice interface in local languages

### Data Requirements
- Soil testing results
- Weather data integration
- Market price feeds
- Extension officer inputs

### Scalability
- Cloud-based deployment
- Regional knowledge bases
- Multi-language support
- Performance optimization

## Future Enhancements

1. **Machine Learning Integration**
   - Yield prediction models
   - Disease image recognition
   - Weather pattern analysis

2. **IoT Integration**
   - Soil sensor data
   - Weather stations
   - Irrigation automation

3. **Community Features**
   - Farmer networks
   - Experience sharing
   - Success stories

4. **Economic Modules**
   - Cost-benefit analysis
   - Financial planning
   - Credit recommendations

## Contributing

To contribute to the AgriExpert Kenya project:

1. Fork the repository
2. Add new rules or templates
3. Test with appropriate farmer scenarios
4. Document your changes
5. Submit a pull request

### Rule Development Guidelines
- Use descriptive rule names
- Include comprehensive comments
- Test with edge cases
- Validate with agricultural experts

## License

This project is developed for educational and research purposes to support smallholder farmers in Kenya. Please ensure proper attribution when using or modifying the system.

---

**Note**: This expert system provides general agricultural guidance based on established farming practices. Always consult with local agricultural extension officers and conduct soil tests for site-specific recommendations.
