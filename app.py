#!/usr/bin/env python3
"""
AgriExpert Kenya - Web Interface
A user-friendly GUI for the agricultural expert system
"""

from flask import Flask, render_template, request, jsonify, session, redirect
import subprocess
import tempfile
import os
import json
from datetime import datetime

app = Flask(__name__)
app.secret_key = 'agriexpert_kenya_2025'

# Path to CLIPS executable
CLIPS_PATH = '/home/jim12hihand/Downloads/clips_core_source_642/core/clips'
CLIPS_FILE = '/home/jim12hihand/agriexpert-kenya/agri_expert.clp'

class AgriExpertEngine:
    def __init__(self):
        self.clips_path = CLIPS_PATH
        self.clips_file = CLIPS_FILE
    
    def run_clips_consultation(self, farmer_data, farm_conditions, crop_info, problems=None):
        """Run CLIPS consultation and return recommendations"""
        
        # Create CLIPS commands
        commands = [
            f'(load "{self.clips_file}")',
        ]
        
        # Add farmer data
        farmer_cmd = f'(assert (farmer (name "{farmer_data["name"]}") (county "{farmer_data["county"]}") (sub-county "{farmer_data["sub_county"]}") (farm-size {farmer_data["farm_size"]}) (years-farming {farmer_data["years_farming"]}) (contact "{farmer_data["contact"]}")))'
        commands.append(farmer_cmd)
        
        # Add farm conditions
        farm_cmd = f'(assert (farm-conditions (farmer-name "{farmer_data["name"]}") (soil-type {farm_conditions["soil_type"]}) (rainfall-pattern {farm_conditions["rainfall_pattern"]}) (altitude {farm_conditions["altitude"]}) (water-source {farm_conditions["water_source"]}) (slope {farm_conditions["slope"]})))'
        commands.append(farm_cmd)
        
        # Add crop info
        crop_cmd = f'(assert (crop-info (farmer-name "{farmer_data["name"]}") (crop-type {crop_info["crop_type"]}) (growth-stage {crop_info["growth_stage"]}) (planting-season {crop_info["planting_season"]}) (area-planted {crop_info["area_planted"]})))'
        commands.append(crop_cmd)
        
        # Add problems if any
        if problems:
            for problem in problems:
                problem_cmd = f'(assert (problem (farmer-name "{farmer_data["name"]}") (problem-type {problem["problem_type"]}) (symptoms "{problem["symptoms"]}") (severity {problem["severity"]}) (affected-area {problem["affected_area"]})))'
                commands.append(problem_cmd)
        
        # Run the system and get facts
        commands.extend(['(run)', '(facts)', '(exit)'])
        
        # Execute CLIPS
        try:
            input_text = '\n'.join(commands)
            result = subprocess.run(
                [self.clips_path],
                input=input_text,
                text=True,
                capture_output=True,
                timeout=30
            )
            
            return self.parse_clips_output(result.stdout)
            
        except subprocess.TimeoutExpired:
            return {"error": "CLIPS consultation timed out"}
        except Exception as e:
            return {"error": f"Error running CLIPS: {str(e)}"}
    
    def parse_clips_output(self, output):
        """Parse CLIPS output to extract recommendations"""
        recommendations = []
        lines = output.split('\n')
        
        current_recommendation = {}
        in_recommendation = False
        
        for line in lines:
            line = line.strip()
            
            if "RECOMMENDATION for" in line:
                if current_recommendation:
                    recommendations.append(current_recommendation)
                current_recommendation = {
                    'farmer_name': line.split('RECOMMENDATION for ')[1] if 'RECOMMENDATION for ' in line else ''
                }
                in_recommendation = True
            elif in_recommendation and line.startswith('Category:'):
                current_recommendation['category'] = line.replace('Category: ', '')
            elif in_recommendation and line.startswith('Priority:'):
                current_recommendation['priority'] = line.replace('Priority: ', '')
            elif in_recommendation and line.startswith('Action:'):
                current_recommendation['action'] = line.replace('Action: ', '')
            elif line == "========================================" and in_recommendation:
                if current_recommendation:
                    recommendations.append(current_recommendation)
                    current_recommendation = {}
                in_recommendation = False
        
        return {"recommendations": recommendations}

# Initialize the expert system engine
expert_engine = AgriExpertEngine()

@app.route('/')
def index():
    """Home page"""
    return render_template('index.html')

@app.route('/consultation')
def consultation():
    """Consultation form page"""
    return render_template('consultation.html')

@app.route('/submit_consultation', methods=['POST'])
def submit_consultation():
    """Process consultation form and return recommendations"""
    try:
        data = request.json
        
        # Extract data
        farmer_data = data.get('farmer_data', {})
        farm_conditions = data.get('farm_conditions', {})
        crop_info = data.get('crop_info', {})
        problems = data.get('problems', [])
        
        # Run CLIPS consultation
        result = expert_engine.run_clips_consultation(
            farmer_data, farm_conditions, crop_info, problems
        )
        
        # Store in session for results page
        session['consultation_result'] = result
        session['farmer_name'] = farmer_data.get('name', 'Unknown')
        
        return jsonify({"status": "success", "result": result})
        
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)})

@app.route('/results')
def results():
    """Display consultation results"""
    result = session.get('consultation_result', {})
    farmer_name = session.get('farmer_name', 'Unknown')
    
    if not result:
        return redirect('/')
    
    return render_template('results.html', 
                         recommendations=result.get('recommendations', []),
                         farmer_name=farmer_name)

@app.route('/about')
def about():
    """About page"""
    return render_template('about.html')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
