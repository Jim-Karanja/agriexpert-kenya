;; =====================================================
;; AgriExpert Kenya - Demo Script with Sample Data
;; =====================================================

;; Load the main knowledge base and interface
(load "agri_expert.clp")

;; Demo farmer data for testing
(deffacts demo-farmer-data
   ;; Farmer 1: High altitude maize farmer with pest problems
   (farmer 
      (name "John Mwangi") 
      (county "Kiambu") 
      (sub-county "Limuru") 
      (farm-size 2.0) 
      (years-farming 10) 
      (contact "0712345678"))
   
   (farm-conditions 
      (farmer-name "John Mwangi") 
      (soil-type loam) 
      (rainfall-pattern medium) 
      (altitude 1900) 
      (water-source well) 
      (slope gentle))
   
   (crop-info 
      (farmer-name "John Mwangi") 
      (crop-type maize) 
      (growth-stage vegetative) 
      (planting-season long-rains) 
      (area-planted 1.5))
   
   (problem 
      (farmer-name "John Mwangi") 
      (problem-type pest) 
      (severity high) 
      (symptoms "holes in leaves and young plants dying") 
      (affected-area 30.0))
   
   ;; Farmer 2: Low altitude bean farmer with water stress
   (farmer 
      (name "Mary Wanjiku") 
      (county "Machakos") 
      (sub-county "Kangundo") 
      (farm-size 1.5) 
      (years-farming 15) 
      (contact "0723456789"))
   
   (farm-conditions 
      (farmer-name "Mary Wanjiku") 
      (soil-type sandy) 
      (rainfall-pattern low) 
      (altitude 1100) 
      (water-source rainwater) 
      (slope steep))
   
   (crop-info 
      (farmer-name "Mary Wanjiku") 
      (crop-type beans) 
      (growth-stage flowering) 
      (planting-season short-rains) 
      (area-planted 1.0))
   
   (problem 
      (farmer-name "Mary Wanjiku") 
      (problem-type water-stress) 
      (severity critical) 
      (symptoms "wilting leaves and stunted growth") 
      (affected-area 80.0))
   
   ;; Farmer 3: Medium altitude maize farmer ready for harvest
   (farmer 
      (name "Peter Kamau") 
      (county "Nyeri") 
      (sub-county "Tetu") 
      (farm-size 3.0) 
      (years-farming 20) 
      (contact "0734567890"))
   
   (farm-conditions 
      (farmer-name "Peter Kamau") 
      (soil-type volcanic) 
      (rainfall-pattern high) 
      (altitude 1600) 
      (water-source river) 
      (slope flat))
   
   (crop-info 
      (farmer-name "Peter Kamau") 
      (crop-type maize) 
      (growth-stage harvesting) 
      (planting-season long-rains) 
      (area-planted 2.5)))

;; Demo rules to show system capabilities
(defrule demo-introduction
   (not (demo-started))
   =>
   (printout t "========================================" crlf)
   (printout t "AgriExpert Kenya - DEMO VERSION" crlf)
   (printout t "========================================" crlf crlf)
   (printout t "This demo shows how the system works with sample farmer data." crlf)
   (printout t "We have three demo farmers:" crlf crlf)
   (printout t "1. John Mwangi (Kiambu) - High altitude maize with pest problems" crlf)
   (printout t "2. Mary Wanjiku (Machakos) - Low altitude beans with water stress" crlf)
   (printout t "3. Peter Kamau (Nyeri) - Medium altitude maize ready for harvest" crlf crlf)
   (printout t "The system will generate recommendations for each farmer..." crlf)
   (printout t "========================================" crlf crlf)
   (assert (demo-started)))

;; Enhanced recommendation display for demo
(defrule display-demo-recommendations
   ?rec <- (recommendation 
      (farmer-name ?name) 
      (category ?cat) 
      (priority ?priority) 
      (action ?action)
      (timing ?timing)
      (resources-needed ?resources)
      (expected-outcome ?outcome))
   (not (displayed ?name ?cat))
   =>
   (printout t "+++++++++++++++++++++++++++++++++++++++" crlf)
   (printout t "RECOMMENDATION FOR: " ?name crlf)
   (printout t "+++++++++++++++++++++++++++++++++++++++" crlf)
   (printout t "Category: " ?cat crlf)
   (printout t "Priority: " ?priority crlf)
   (printout t "Action: " ?action crlf)
   (printout t "Timing: " ?timing crlf)
   (printout t "Resources Needed: " ?resources crlf)
   (printout t "Expected Outcome: " ?outcome crlf)
   (printout t "+++++++++++++++++++++++++++++++++++++++" crlf crlf)
   (assert (displayed ?name ?cat)))

;; Demo completion message
(defrule demo-completion
   (demo-started)
   (displayed "John Mwangi" ?)
   (displayed "Mary Wanjiku" ?)
   (displayed "Peter Kamau" ?)
   (not (demo-completed))
   =>
   (printout t "========================================" crlf)
   (printout t "DEMO COMPLETED" crlf)
   (printout t "========================================" crlf)
   (printout t "The AgriExpert Kenya system has successfully:" crlf crlf)
   (printout t "✓ Analyzed farmer profiles and farm conditions" crlf)
   (printout t "✓ Identified appropriate crop varieties based on altitude" crlf)
   (printout t "✓ Provided soil management recommendations" crlf)
   (printout t "✓ Suggested pest and disease control measures" crlf)
   (printout t "✓ Recommended fertilization strategies" crlf)
   (printout t "✓ Offered water management solutions" crlf)
   (printout t "✓ Provided harvesting and post-harvest guidance" crlf crlf)
   (printout t "Key System Features:" crlf)
   (printout t "• Location-specific recommendations (altitude-based)" crlf)
   (printout t "• Problem-specific solutions (pest, disease, water stress)" crlf)
   (printout t "• Priority-based action items (urgent, high, medium, low)" crlf)
   (printout t "• Resource and timing guidance" crlf)
   (printout t "• Expected outcome predictions" crlf crlf)
   (printout t "To use the interactive version, run:" crlf)
   (printout t "(load \"interface.clp\")" crlf)
   (printout t "(reset)" crlf)
   (printout t "(run)" crlf crlf)
   (assert (demo-completed)))

;; Additional knowledge for specific Kenyan conditions
;; Note: Additional templates would be defined in future versions
;; For now, we'll focus on the core functionality

;; Run the demo
(printout t "Loading AgriExpert Kenya Demo..." crlf)
(printout t "Type (run) to start the demonstration." crlf)
