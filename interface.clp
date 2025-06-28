;; =====================================================
;; AgriExpert Kenya - Interactive Interface
;; =====================================================

;; ===== INTERACTIVE DATA COLLECTION RULES =====

;; Collect farmer basic information
(defrule collect-farmer-info
   (not (farmer (name ?)))
   =>
   (printout t "Please enter your information:" crlf)
   (printout t "Full Name: ")
   (bind ?name (read-line))
   (printout t "County: ")
   (bind ?county (read-line))
   (printout t "Sub-County: ")
   (bind ?sub-county (read-line))
   (printout t "Farm size in acres: ")
   (bind ?farm-size (read))
   (printout t "Years of farming experience: ")
   (bind ?years (read))
   (printout t "Contact (phone number): ")
   (bind ?contact (read-line))
   
   (assert (farmer 
      (name ?name)
      (county ?county)
      (sub-county ?sub-county)
      (farm-size ?farm-size)
      (years-farming ?years)
      (contact ?contact)))
   
   (printout t crlf "Thank you, " ?name "!" crlf))

;; Collect farm conditions
(defrule collect-farm-conditions
   (farmer (name ?name))
   (not (farm-conditions (farmer-name ?name)))
   =>
   (printout t crlf "=== FARM CONDITIONS ===" crlf)
   (printout t "What is your soil type?" crlf)
   (printout t "1. Clay soil" crlf)
   (printout t "2. Sandy soil" crlf)
   (printout t "3. Loam soil" crlf)
   (printout t "4. Volcanic soil" crlf)
   (printout t "5. Red earth" crlf)
   (printout t "Enter choice (1-5): ")
   (bind ?soil-choice (read))
   
   (switch ?soil-choice
      (case 1 then (bind ?soil-type clay))
      (case 2 then (bind ?soil-type sandy))
      (case 3 then (bind ?soil-type loam))
      (case 4 then (bind ?soil-type volcanic))
      (case 5 then (bind ?soil-type red-earth))
      (default (bind ?soil-type loam)))
   
   (printout t "What is your rainfall pattern?" crlf)
   (printout t "1. High rainfall (above 1200mm)" crlf)
   (printout t "2. Medium rainfall (600-1200mm)" crlf)
   (printout t "3. Low rainfall (below 600mm)" crlf)
   (printout t "4. Irregular rainfall" crlf)
   (printout t "Enter choice (1-4): ")
   (bind ?rain-choice (read))
   
   (switch ?rain-choice
      (case 1 then (bind ?rainfall high))
      (case 2 then (bind ?rainfall medium))
      (case 3 then (bind ?rainfall low))
      (case 4 then (bind ?rainfall irregular))
      (default (bind ?rainfall medium)))
   
   (printout t "What is your farm's altitude in meters? ")
   (bind ?altitude (read))
   
   (printout t "What is your main water source?" crlf)
   (printout t "1. River" crlf)
   (printout t "2. Well/Borehole" crlf)
   (printout t "3. Rainwater harvesting" crlf)
   (printout t "4. Irrigation system" crlf)
   (printout t "5. No reliable water source" crlf)
   (printout t "Enter choice (1-5): ")
   (bind ?water-choice (read))
   
   (switch ?water-choice
      (case 1 then (bind ?water-source river))
      (case 2 then (bind ?water-source well))
      (case 3 then (bind ?water-source rainwater))
      (case 4 then (bind ?water-source irrigation))
      (case 5 then (bind ?water-source none))
      (default (bind ?water-source rainwater)))
   
   (printout t "What is your farm's slope?" crlf)
   (printout t "1. Flat" crlf)
   (printout t "2. Gentle slope" crlf)
   (printout t "3. Steep slope" crlf)
   (printout t "Enter choice (1-3): ")
   (bind ?slope-choice (read))
   
   (switch ?slope-choice
      (case 1 then (bind ?slope flat))
      (case 2 then (bind ?slope gentle))
      (case 3 then (bind ?slope steep))
      (default (bind ?slope gentle)))
   
   (assert (farm-conditions
      (farmer-name ?name)
      (soil-type ?soil-type)
      (rainfall-pattern ?rainfall)
      (altitude ?altitude)
      (water-source ?water-source)
      (slope ?slope))))

;; Collect crop information
(defrule collect-crop-info
   (farmer (name ?name))
   (farm-conditions (farmer-name ?name))
   (not (crop-info (farmer-name ?name)))
   =>
   (printout t crlf "=== CROP INFORMATION ===" crlf)
   (printout t "What crop are you planning to grow or currently growing?" crlf)
   (printout t "1. Maize" crlf)
   (printout t "2. Beans" crlf)
   (printout t "3. Cassava" crlf)
   (printout t "4. Sweet potato" crlf)
   (printout t "5. Irish potato" crlf)
   (printout t "6. Vegetables" crlf)
   (printout t "7. Coffee" crlf)
   (printout t "8. Tea" crlf)
   (printout t "9. Banana" crlf)
   (printout t "10. Millet" crlf)
   (printout t "11. Sorghum" crlf)
   (printout t "Enter choice (1-11): ")
   (bind ?crop-choice (read))
   
   (switch ?crop-choice
      (case 1 then (bind ?crop-type maize))
      (case 2 then (bind ?crop-type beans))
      (case 3 then (bind ?crop-type cassava))
      (case 4 then (bind ?crop-type sweet-potato))
      (case 5 then (bind ?crop-type irish-potato))
      (case 6 then (bind ?crop-type vegetables))
      (case 7 then (bind ?crop-type coffee))
      (case 8 then (bind ?crop-type tea))
      (case 9 then (bind ?crop-type banana))
      (case 10 then (bind ?crop-type millet))
      (case 11 then (bind ?crop-type sorghum))
      (default (bind ?crop-type maize)))
   
   (printout t "What is the current growth stage?" crlf)
   (printout t "1. Planning to plant" crlf)
   (printout t "2. Germination (just planted)" crlf)
   (printout t "3. Vegetative growth" crlf)
   (printout t "4. Flowering" crlf)
   (printout t "5. Fruiting/Grain filling" crlf)
   (printout t "6. Ready for harvest" crlf)
   (printout t "Enter choice (1-6): ")
   (bind ?stage-choice (read))
   
   (switch ?stage-choice
      (case 1 then (bind ?growth-stage planting))
      (case 2 then (bind ?growth-stage germination))
      (case 3 then (bind ?growth-stage vegetative))
      (case 4 then (bind ?growth-stage flowering))
      (case 5 then (bind ?growth-stage fruiting))
      (case 6 then (bind ?growth-stage harvesting))
      (default (bind ?growth-stage planting)))
   
   (printout t "Which planting season are you considering?" crlf)
   (printout t "1. Long rains (March-July)" crlf)
   (printout t "2. Short rains (October-December)" crlf)
   (printout t "3. Dry season (with irrigation)" crlf)
   (printout t "Enter choice (1-3): ")
   (bind ?season-choice (read))
   
   (switch ?season-choice
      (case 1 then (bind ?planting-season long-rains))
      (case 2 then (bind ?planting-season short-rains))
      (case 3 then (bind ?planting-season dry-season))
      (default (bind ?planting-season long-rains)))
   
   (printout t "How many acres will you plant with this crop? ")
   (bind ?area (read))
   
   (assert (crop-info
      (farmer-name ?name)
      (crop-type ?crop-type)
      (growth-stage ?growth-stage)
      (planting-season ?planting-season)
      (area-planted ?area))))

;; Ask about problems
(defrule ask-about-problems
   (farmer (name ?name))
   (farm-conditions (farmer-name ?name))
   (crop-info (farmer-name ?name))
   (not (problems-collected ?name))
   =>
   (printout t crlf "=== PROBLEM IDENTIFICATION ===" crlf)
   (printout t "Are you experiencing any problems with your crops? (y/n): ")
   (bind ?has-problems (read))
   
   (if (or (eq ?has-problems y) (eq ?has-problems yes))
      then
      (printout t "What type of problem are you experiencing?" crlf)
      (printout t "1. Pest attack" crlf)
      (printout t "2. Plant disease" crlf)
      (printout t "3. Nutrient deficiency" crlf)
      (printout t "4. Water stress/drought" crlf)
      (printout t "5. Weather damage" crlf)
      (printout t "6. Soil degradation" crlf)
      (printout t "7. Low yields" crlf)
      (printout t "Enter choice (1-7): ")
      (bind ?problem-choice (read))
      
      (switch ?problem-choice
         (case 1 then (bind ?problem-type pest))
         (case 2 then (bind ?problem-type disease))
         (case 3 then (bind ?problem-type nutrient-deficiency))
         (case 4 then (bind ?problem-type water-stress))
         (case 5 then (bind ?problem-type weather-damage))
         (case 6 then (bind ?problem-type soil-degradation))
         (case 7 then (bind ?problem-type low-yield))
         (default (bind ?problem-type low-yield)))
      
      (printout t "How severe is the problem?" crlf)
      (printout t "1. Low severity" crlf)
      (printout t "2. Medium severity" crlf)
      (printout t "3. High severity" crlf)
      (printout t "4. Critical" crlf)
      (printout t "Enter choice (1-4): ")
      (bind ?severity-choice (read))
      
      (switch ?severity-choice
         (case 1 then (bind ?severity low))
         (case 2 then (bind ?severity medium))
         (case 3 then (bind ?severity high))
         (case 4 then (bind ?severity critical))
         (default (bind ?severity medium)))
      
      (printout t "Please describe the symptoms you observe: ")
      (bind ?symptoms (read-line))
      
      (printout t "What percentage of your crop is affected? ")
      (bind ?affected-area (read))
      
      (assert (problem
         (farmer-name ?name)
         (problem-type ?problem-type)
         (severity ?severity)
         (symptoms ?symptoms)
         (affected-area ?affected-area))))
   
   (assert (problems-collected ?name)))

;; Generate final recommendations summary
(defrule generate-recommendations-summary
   (farmer (name ?name))
   (problems-collected ?name)
   (not (recommendations-generated ?name))
   =>
   (printout t crlf crlf "========================================" crlf)
   (printout t "GENERATING RECOMMENDATIONS FOR " ?name crlf)
   (printout t "========================================" crlf crlf)
   (assert (recommendations-generated ?name))
   (run)) ; Run the inference engine to generate recommendations

;; Final message and next steps
(defrule show-next-steps
   (recommendations-generated ?name)
   (not (next-steps-shown ?name))
   =>
   (printout t crlf crlf "========================================" crlf)
   (printout t "NEXT STEPS" crlf)
   (printout t "========================================" crlf)
   (printout t "1. Review all recommendations carefully" crlf)
   (printout t "2. Prioritize urgent and high-priority actions" crlf)
   (printout t "3. Contact your local agricultural extension officer for additional support" crlf)
   (printout t "4. Keep records of actions taken and results" crlf)
   (printout t "5. Return to the system with updates on crop progress" crlf crlf)
   (printout t "Thank you for using AgriExpert Kenya!" crlf)
   (printout t "For technical support, contact: support@agriexpert.ke" crlf)
   (assert (next-steps-shown ?name)))

;; ===== UTILITY FUNCTIONS =====

;; Function to restart the consultation
(deffunction restart-consultation ()
   (reset)
   (load "agri_expert.clp")
   (load "interface.clp")
   (run))

;; Function to show farmer summary
(defrule show-farmer-summary
   (farmer (name ?name) (county ?county) (farm-size ?size))
   (farm-conditions (farmer-name ?name) (soil-type ?soil) (altitude ?alt))
   (crop-info (farmer-name ?name) (crop-type ?crop) (area-planted ?area))
   (not (summary-shown ?name))
   =>
   (printout t crlf "=== FARMER PROFILE SUMMARY ===" crlf)
   (printout t "Name: " ?name crlf)
   (printout t "Location: " ?county " County" crlf)
   (printout t "Farm Size: " ?size " acres" crlf)
   (printout t "Soil Type: " ?soil crlf)
   (printout t "Altitude: " ?alt " meters" crlf)
   (printout t "Main Crop: " ?crop " (" ?area " acres)" crlf)
   (printout t "==============================" crlf crlf)
   (assert (summary-shown ?name)))
