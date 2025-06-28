;; =====================================================
;; AgriExpert Kenya - Agricultural Expert System
;; Sustainable Agriculture Guidance for Smallholder Farmers
;; =====================================================

;; ===== FACT TEMPLATES =====

;; Farmer information template
(deftemplate farmer
   (slot name (type STRING))
   (slot county (type STRING))
   (slot sub-county (type STRING))
   (slot farm-size (type FLOAT))
   (slot years-farming (type INTEGER))
   (slot contact (type STRING)))

;; Farm conditions template
(deftemplate farm-conditions
   (slot farmer-name (type STRING))
   (slot soil-type (type SYMBOL) (allowed-values clay sandy loam volcanic red-earth))
   (slot rainfall-pattern (type SYMBOL) (allowed-values high medium low irregular))
   (slot altitude (type INTEGER))
   (slot water-source (type SYMBOL) (allowed-values river well rainwater irrigation none))
   (slot slope (type SYMBOL) (allowed-values flat gentle steep)))

;; Crop information template
(deftemplate crop-info
   (slot farmer-name (type STRING))
   (slot crop-type (type SYMBOL) (allowed-values maize beans cassava sweet-potato irish-potato vegetables coffee tea banana millet sorghum))
   (slot growth-stage (type SYMBOL) (allowed-values planting germination vegetative flowering fruiting harvesting))
   (slot planting-season (type SYMBOL) (allowed-values long-rains short-rains dry-season))
   (slot area-planted (type FLOAT)))

;; Problem identification template
(deftemplate problem
   (slot farmer-name (type STRING))
   (slot problem-type (type SYMBOL) (allowed-values pest disease nutrient-deficiency water-stress weather-damage soil-degradation low-yield))
   (slot severity (type SYMBOL) (allowed-values low medium high critical))
   (slot symptoms (type STRING))
   (slot affected-area (type NUMBER)))

;; Recommendation template
(deftemplate recommendation
   (slot farmer-name (type STRING))
   (slot category (type SYMBOL) (allowed-values crop-selection soil-management planting pest-control disease-control irrigation fertilization harvesting marketing))
   (slot priority (type SYMBOL) (allowed-values low medium high urgent))
   (slot action (type STRING))
   (slot timing (type STRING))
   (slot resources-needed (type STRING))
   (slot expected-outcome (type STRING)))

;; ===== KNOWLEDGE BASE - CROPS =====

;; Maize cultivation knowledge
(deftemplate maize-varieties
   (slot variety-name (type STRING))
   (slot maturity-days (type INTEGER))
   (slot altitude-range (type STRING))
   (slot rainfall-requirement (type STRING))
   (slot yield-potential (type STRING)))

;; Initialize maize varieties
(deffacts maize-knowledge
   (maize-varieties (variety-name "H614") (maturity-days 120) (altitude-range "0-1800m") (rainfall-requirement "500-1000mm") (yield-potential "25-35 bags/acre"))
   (maize-varieties (variety-name "H628") (maturity-days 135) (altitude-range "1200-2100m") (rainfall-requirement "750-1200mm") (yield-potential "30-40 bags/acre"))
   (maize-varieties (variety-name "DK8031") (maturity-days 125) (altitude-range "0-1600m") (rainfall-requirement "600-900mm") (yield-potential "28-38 bags/acre"))
   (maize-varieties (variety-name "Local varieties") (maturity-days 180) (altitude-range "500-2500m") (rainfall-requirement "400-800mm") (yield-potential "8-15 bags/acre")))

;; Bean varieties knowledge
(deftemplate bean-varieties
   (slot variety-name (type STRING))
   (slot maturity-days (type INTEGER))
   (slot altitude-range (type STRING))
   (slot disease-resistance (type STRING)))

(deffacts bean-knowledge
   (bean-varieties (variety-name "KAT B1") (maturity-days 90) (altitude-range "1200-1800m") (disease-resistance "Angular leaf spot, Anthracnose"))
   (bean-varieties (variety-name "Mwitemania") (maturity-days 90) (altitude-range "1400-2100m") (disease-resistance "Bean stem maggot, Halo blight"))
   (bean-varieties (variety-name "Rose coco") (maturity-days 120) (altitude-range "1000-1600m") (disease-resistance "Root rot")))

;; ===== SOIL MANAGEMENT RULES =====

;; Soil type recommendations
(defrule recommend-clay-soil-management
   (farm-conditions (farmer-name ?name) (soil-type clay))
   =>
   (assert (recommendation
      (farmer-name ?name)
      (category soil-management)
      (priority high)
      (action "Improve drainage by creating ridges and furrows. Add organic matter like compost or well-rotted manure to improve soil structure. Plant cover crops during off-season.")
      (timing "Before planting season")
      (resources-needed "Compost, manure, cover crop seeds, hand tools")
      (expected-outcome "Better drainage, improved soil structure, increased organic matter"))))

(defrule recommend-sandy-soil-management
   (farm-conditions (farmer-name ?name) (soil-type sandy))
   =>
   (assert (recommendation
      (farmer-name ?name)
      (category soil-management)
      (priority high)
      (action "Add organic matter frequently to improve water retention. Use mulching to reduce water evaporation. Apply fertilizers in small, frequent doses to prevent nutrient leaching.")
      (timing "Throughout growing season")
      (resources-needed "Organic matter, mulch materials, fertilizers")
      (expected-outcome "Improved water retention, better nutrient holding capacity"))))

(defrule recommend-loam-soil-management
   (farm-conditions (farmer-name ?name) (soil-type loam))
   =>
   (assert (recommendation
      (farmer-name ?name)
      (category soil-management)
      (priority medium)
      (action "Maintain soil fertility with balanced fertilization. Practice crop rotation. Add organic matter annually to maintain soil health.")
      (timing "Annually")
      (resources-needed "Balanced fertilizers, organic matter")
      (expected-outcome "Sustained soil fertility and productivity"))))

;; ===== CROP SELECTION RULES =====

;; Maize variety selection based on altitude
(defrule recommend-maize-variety-high-altitude
   (farm-conditions (farmer-name ?name) (altitude ?alt))
   (crop-info (farmer-name ?name) (crop-type maize))
   (test (> ?alt 1800))
   =>
   (assert (recommendation
      (farmer-name ?name)
      (category crop-selection)
      (priority high)
      (action "Plant H628 variety - suitable for high altitude areas above 1800m. This variety is cold tolerant and has good yield potential.")
      (timing "During long rains (March-June)")
      (resources-needed "H628 certified seeds, fertilizers")
      (expected-outcome "30-40 bags per acre under good management"))))

(defrule recommend-maize-variety-medium-altitude
   (farm-conditions (farmer-name ?name) (altitude ?alt))
   (crop-info (farmer-name ?name) (crop-type maize))
   (test (and (>= ?alt 1200) (<= ?alt 1800)))
   =>
   (assert (recommendation
      (farmer-name ?name)
      (category crop-selection)
      (priority high)
      (action "Consider H614 or H628 varieties. H628 for higher areas (above 1500m) and H614 for lower areas. Both perform well in medium altitude zones.")
      (timing "During optimal planting seasons")
      (resources-needed "Certified seeds, fertilizers, pesticides")
      (expected-outcome "25-40 bags per acre depending on variety and management"))))

(defrule recommend-maize-variety-low-altitude
   (farm-conditions (farmer-name ?name) (altitude ?alt))
   (crop-info (farmer-name ?name) (crop-type maize))
   (test (< ?alt 1200))
   =>
   (assert (recommendation
      (farmer-name ?name)
      (category crop-selection)
      (priority high)
      (action "Plant H614 or DK8031 varieties - well adapted to low altitude, warm areas. These varieties are drought tolerant and mature faster.")
      (timing "Plant with first rains")
      (resources-needed "Certified seeds, fertilizers suitable for warm areas")
      (expected-outcome "25-35 bags per acre with proper management"))))

;; ===== PLANTING RECOMMENDATIONS =====

;; Maize planting guidelines
(defrule recommend-maize-planting-spacing
   (crop-info (farmer-name ?name) (crop-type maize))
   =>
   (assert (recommendation
      (farmer-name ?name)
      (category planting)
      (priority high)
      (action "Plant maize at 75cm between rows and 25cm between plants (2 plants per hole). Use 2-3 seeds per hole and thin to 2 healthy plants. Plant depth should be 3-5cm.")
      (timing "At onset of reliable rains")
      (resources-needed "Measuring rope, planting stick, certified seeds")
      (expected-outcome "Optimal plant population of 53,000 plants per hectare for maximum yield"))))

;; Bean planting guidelines
(defrule recommend-bean-planting-spacing
   (crop-info (farmer-name ?name) (crop-type beans))
   =>
   (assert (recommendation
      (farmer-name ?name)
      (category planting)
      (priority high)
      (action "Plant beans at 40cm between rows and 10cm between plants. Use 1-2 seeds per hole at 2-3cm depth. Can be intercropped with maize.")
      (timing "Same time as maize or 2-3 weeks after maize")
      (resources-needed "Certified bean seeds, measuring rope")
      (expected-outcome "Good bean population and potential for intercropping benefits"))))

;; ===== FERTILIZATION RULES =====

;; General fertilizer recommendations for maize
(defrule recommend-maize-fertilization
   (crop-info (farmer-name ?name) (crop-type maize))
   (farm-conditions (farmer-name ?name) (soil-type ?soil))
   =>
   (assert (recommendation
      (farmer-name ?name)
      (category fertilization)
      (priority high)
      (action "Apply DAP fertilizer at planting (1 bag per acre). Top-dress with CAN at 3-4 weeks after germination (1 bag per acre). On poor soils, add well-decomposed manure before planting.")
      (timing "At planting and 3-4 weeks after germination")
      (resources-needed "1 bag DAP, 1 bag CAN, manure if available")
      (expected-outcome "Improved nutrient availability leading to better growth and higher yields"))))

;; ===== PEST AND DISEASE MANAGEMENT =====

;; Fall armyworm management (major maize pest in Kenya)
(defrule recommend-fall-armyworm-control
   (problem (farmer-name ?name) (problem-type pest) (symptoms ?symptoms))
   (crop-info (farmer-name ?name) (crop-type maize))
   (test (str-index "holes in leaves" ?symptoms))
   =>
   (assert (recommendation
      (farmer-name ?name)
      (category pest-control)
      (priority urgent)
      (action "Likely Fall Armyworm attack. Scout fields daily. Remove egg masses. Apply Bt-based pesticides or use predator-friendly chemicals. Practice push-pull technology with Desmodium and Napier grass.")
      (timing "Immediately upon detection")
      (resources-needed "Bt pesticides, knapsack sprayer, Desmodium seeds for future seasons")
      (expected-outcome "Reduced crop damage, controlled pest population"))))

;; Maize streak virus management
(defrule recommend-maize-streak-control
   (problem (farmer-name ?name) (problem-type disease) (symptoms ?symptoms))
   (crop-info (farmer-name ?name) (crop-type maize))
   (test (str-index "yellow streaks" ?symptoms))
   =>
   (assert (recommendation
      (farmer-name ?name)
      (category disease-control)
      (priority high)
      (action "Likely Maize Streak Virus spread by leafhoppers. Plant resistant varieties like H628. Control leafhopper vectors with appropriate insecticides. Remove and destroy infected plants.")
      (timing "Prevention during planting, immediate action if detected")
      (resources-needed "Resistant varieties, insecticides for vector control")
      (expected-outcome "Reduced virus incidence and crop loss"))))

;; ===== WATER MANAGEMENT =====

;; Drought stress management
(defrule recommend-drought-management
   (farm-conditions (farmer-name ?name) (rainfall-pattern low))
   (problem (farmer-name ?name) (problem-type water-stress))
   =>
   (assert (recommendation
      (farmer-name ?name)
      (category irrigation)
      (priority urgent)
      (action "Implement water conservation: mulching, terracing, water harvesting. Plant drought-tolerant varieties. Use drip irrigation if possible. Practice conservation agriculture.")
      (timing "Before and during dry periods")
      (resources-needed "Mulching materials, water storage containers, drought-tolerant seeds")
      (expected-outcome "Improved water use efficiency, reduced crop stress"))))

;; ===== HARVESTING AND POST-HARVEST =====

;; Maize harvesting recommendations
(defrule recommend-maize-harvesting
   (crop-info (farmer-name ?name) (crop-type maize) (growth-stage harvesting))
   =>
   (assert (recommendation
      (farmer-name ?name)
      (category harvesting)
      (priority high)
      (action "Harvest when moisture content is 20-25%. Dry to 13.5% moisture before storage. Use proper drying methods and clean storage facilities. Consider hermetic storage bags.")
      (timing "When husks are dry and grains are hard")
      (resources-needed "Moisture meter, drying platform, clean storage bags")
      (expected-outcome "Reduced post-harvest losses, better grain quality"))))

;; ===== INITIALIZATION RULES =====

;; Welcome and data collection
(defrule welcome-farmer
   (not (farmer (name ?)))
   =>
   (printout t "========================================" crlf)
   (printout t "Welcome to AgriExpert Kenya!" crlf)
   (printout t "Agricultural Guidance System" crlf)
   (printout t "========================================" crlf)
   (printout t "This system will help you with:" crlf)
   (printout t "- Crop selection and varieties" crlf)
   (printout t "- Soil management" crlf)
   (printout t "- Pest and disease control" crlf)
   (printout t "- Fertilization recommendations" crlf)
   (printout t "- Water management" crlf)
   (printout t "- Harvesting guidance" crlf crlf)
   (printout t "Let's start by collecting some basic information..." crlf))

;; ===== UTILITY FUNCTIONS =====

;; Function to display all recommendations for a farmer
(defrule display-recommendations
   ?rec <- (recommendation (farmer-name ?name) (category ?cat) (priority ?priority) (action ?action))
   =>
   (printout t "========================================" crlf)
   (printout t "RECOMMENDATION for " ?name crlf)
   (printout t "Category: " ?cat crlf)
   (printout t "Priority: " ?priority crlf)
   (printout t "Action: " ?action crlf)
   (printout t "========================================" crlf))

;; ===== SAMPLE DATA FOR TESTING =====

;; Uncomment the following for testing
;; (deffacts sample-farmer-data
;;    (farmer (name "John Mwangi") (county "Kiambu") (sub-county "Limuru") (farm-size 2.0) (years-farming 10) (contact "0712345678"))
;;    (farm-conditions (farmer-name "John Mwangi") (soil-type loam) (rainfall-pattern medium) (altitude 1900) (water-source well) (slope gentle))
;;    (crop-info (farmer-name "John Mwangi") (crop-type maize) (growth-stage planting) (planting-season long-rains) (area-planted 1.5)))

