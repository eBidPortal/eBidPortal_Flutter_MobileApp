# Security & Housekeeping Job Template for eBidPortal

**Template Name:** Security & Housekeeping Job Template
**Version:** 1.0
**Category Type:** jobs
**Created:** November 21, 2025
**Industry Standards:** Based on security industry standards, housekeeping protocols, facility management guidelines, safety regulations, and professional service best practices for security personnel, housekeepers, facility staff, and maintenance workers.

## Template JSON Structure

```json
{
  "name": "Security & Housekeeping Job Template",
  "description": "Industry-standard template for security and housekeeping job postings. Includes comprehensive fields covering security protocols, cleaning standards, facility maintenance, safety procedures, and service industry requirements specific to security guards, housekeepers, facility managers, and maintenance staff.",
  "category_type": "jobs",
  "is_active": true,
  "sections": [
    {
      "title": "Job Information",
      "order": 1,
      "description": "Basic job details and position overview",
      "is_collapsible": false,
      "fields": [
        {
          "name": "job_title",
          "label": "Job Title",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3", "max_length:100"],
          "ui_config": {
            "placeholder": "e.g., Security Guard, Housekeeper, Facility Manager",
            "helpText": "Enter the specific security/housekeeping position title"
          }
        },
        {
          "name": "facility_name",
          "label": "Facility/Company Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:100"],
          "ui_config": {
            "placeholder": "Enter facility, company, or property management name",
            "helpText": "Name of the facility or company"
          }
        },
        {
          "name": "location",
          "label": "Work Location",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3"],
          "ui_config": {
            "placeholder": "e.g., Mumbai Office Complex, Bangalore Residential Society",
            "helpText": "Location of the facility"
          }
        },
        {
          "name": "job_type",
          "label": "Employment Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "full_time", "label": "Full Time"},
              {"value": "part_time", "label": "Part Time"},
              {"value": "contract", "label": "Contract"},
              {"value": "shift_work", "label": "Shift Work"},
              {"value": "casual", "label": "Casual/Relief"}
            ],
            "helpText": "Type of employment arrangement"
          }
        },
        {
          "name": "shift_type",
          "label": "Shift Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "day_shift", "label": "Day Shift (8 AM - 4 PM)"},
              {"value": "night_shift", "label": "Night Shift (8 PM - 8 AM)"},
              {"value": "rotating_shifts", "label": "Rotating Shifts"},
              {"value": "weekend_shifts", "label": "Weekend Shifts Only"},
              {"value": "split_shifts", "label": "Split Shifts"}
            ],
            "helpText": "Primary shift schedule"
          }
        },
        {
          "name": "experience_level",
          "label": "Experience Level",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "entry", "label": "Entry Level (0-1 years)"},
              {"value": "junior", "label": "Junior (1-3 years)"},
              {"value": "mid", "label": "Mid-Level (3-5 years)"},
              {"value": "senior", "label": "Senior (5-8 years)"},
              {"value": "supervisor", "label": "Supervisor/Manager (8+ years)"}
            ],
            "helpText": "Required security/housekeeping experience level"
          }
        },
        {
          "name": "service_specialization",
          "label": "Service Specialization",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "security_guard", "label": "Security Guard"},
              {"value": "housekeeper", "label": "Housekeeper/Cleaner"},
              {"value": "facility_maintenance", "label": "Facility Maintenance"},
              {"value": "security_supervisor", "label": "Security Supervisor"},
              {"value": "housekeeping_supervisor", "label": "Housekeeping Supervisor"},
              {"value": "facility_manager", "label": "Facility Manager"},
              {"value": "maintenance_technician", "label": "Maintenance Technician"},
              {"value": "pest_control", "label": "Pest Control Technician"},
              {"value": "landscaping", "label": "Landscaping & Gardening"},
              {"value": "pool_maintenance", "label": "Pool Maintenance"},
              {"value": "waste_management", "label": "Waste Management"},
              {"value": "reception_security", "label": "Reception/Security Desk"}
            ],
            "helpText": "Primary service specialization"
          }
        }
      ]
    },
    {
      "title": "Requirements & Qualifications",
      "order": 2,
      "description": "Education, certifications, and professional requirements",
      "is_collapsible": false,
      "fields": [
        {
          "name": "education_level",
          "label": "Education Level",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "no_formal_education", "label": "No Formal Education Required"},
              {"value": "primary_school", "label": "Primary School"},
              {"value": "high_school", "label": "High School/SSC"},
              {"value": "intermediate", "label": "Intermediate/HSC"},
              {"value": "diploma_hotel", "label": "Hotel Management Diploma"},
              {"value": "diploma_facility", "label": "Facility Management Diploma"},
              {"value": "bachelor_hospitality", "label": "Bachelor of Hospitality Management"},
              {"value": "bachelor_facility", "label": "Bachelor of Facility Management"}
            ],
            "helpText": "Minimum education qualification required"
          }
        },
        {
          "name": "certifications",
          "label": "Professional Certifications",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "security_guard_license", "label": "Security Guard License"},
              {"value": "armed_security_license", "label": "Armed Security License"},
              {"value": "first_aid_cert", "label": "First Aid Certification"},
              {"value": "cpr_cert", "label": "CPR Certification"},
              {"value": "fire_safety_cert", "label": "Fire Safety Certification"},
              {"value": "housekeeping_cert", "label": "Professional Housekeeping Certification"},
              {"value": "pest_control_cert", "label": "Pest Control Certification"},
              {"value": "pool_technician_cert", "label": "Pool Technician Certification"},
              {"value": "electrical_safety", "label": "Electrical Safety Certification"},
              {"value": "plumbing_cert", "label": "Basic Plumbing Certification"},
              {"value": "hvac_cert", "label": "HVAC Maintenance Certification"},
              {"value": "food_safety_cert", "label": "Food Safety Certification"}
            ],
            "helpText": "Preferred professional certifications"
          }
        },
        {
          "name": "skills_required",
          "label": "Required Skills",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "communication_skills", "label": "Communication Skills"},
              {"value": "customer_service", "label": "Customer Service Orientation"},
              {"value": "attention_to_detail", "label": "Attention to Detail"},
              {"value": "physical_stamina", "label": "Physical Stamina"},
              {"value": "basic_computer", "label": "Basic Computer Skills"},
              {"value": "emergency_response", "label": "Emergency Response"},
              {"value": "conflict_resolution", "label": "Conflict Resolution"},
              {"value": "time_management", "label": "Time Management"},
              {"value": "team_work", "label": "Team Work"},
              {"value": "problem_solving", "label": "Problem Solving"},
              {"value": "report_writing", "label": "Report Writing"},
              {"value": "equipment_operation", "label": "Equipment Operation"}
            ],
            "helpText": "Required skills for the position"
          }
        },
        {
          "name": "experience_years",
          "label": "Experience (Years)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:30"],
          "ui_config": {
            "placeholder": "e.g., 2",
            "helpText": "Minimum years of security/housekeeping experience required"
          }
        },
        {
          "name": "facility_types",
          "label": "Facility Type Experience",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "residential_complex", "label": "Residential Complex"},
              {"value": "commercial_building", "label": "Commercial Building"},
              {"value": "shopping_mall", "label": "Shopping Mall"},
              {"value": "hotel_resort", "label": "Hotel/Resort"},
              {"value": "hospital_clinic", "label": "Hospital/Clinic"},
              {"value": "school_university", "label": "School/University"},
              {"value": "office_building", "label": "Office Building"},
              {"value": "industrial_facility", "label": "Industrial Facility"},
              {"value": "government_building", "label": "Government Building"},
              {"value": "retail_store", "label": "Retail Store"},
              {"value": "restaurant_cafe", "label": "Restaurant/Cafe"},
              {"value": "sports_facility", "label": "Sports Facility"}
            ],
            "helpText": "Preferred facility types and experience"
          }
        },
        {
          "name": "language_proficiency",
          "label": "Language Proficiency",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "english", "label": "English"},
              {"value": "hindi", "label": "Hindi"},
              {"value": "regional_language", "label": "Regional Language"},
              {"value": "basic_writing", "label": "Basic Writing Skills"},
              {"value": "report_writing", "label": "Report Writing"}
            ],
            "helpText": "Required language and communication skills"
          }
        },
        {
          "name": "physical_requirements",
          "label": "Physical Requirements",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "standing_walking", "label": "Prolonged Standing/Walking"},
              {"value": "lifting_carrying", "label": "Lifting/Carrying (up to 25kg)"},
              {"value": "bending_stooping", "label": "Bending/Stooping"},
              {"value": "climbing_ladders", "label": "Climbing Ladders"},
              {"value": "working_heights", "label": "Working at Heights"},
              {"value": "outdoor_work", "label": "Outdoor Work"},
              {"value": "night_shifts", "label": "Night Shift Work"},
              {"value": "weekend_work", "label": "Weekend Work"},
              {"value": "emergency_response", "label": "Emergency Response Availability"},
              {"value": "uniform_required", "label": "Uniform Required"}
            ],
            "helpText": "Physical demands and working conditions"
          }
        },
        {
          "name": "responsibilities",
          "label": "Key Responsibilities",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "security_patrol", "label": "Security Patrol & Surveillance"},
              {"value": "access_control", "label": "Access Control & Monitoring"},
              {"value": "emergency_response", "label": "Emergency Response"},
              {"value": "cleaning_maintenance", "label": "Cleaning & Maintenance"},
              {"value": "waste_management", "label": "Waste Collection & Disposal"},
              {"value": "equipment_maintenance", "label": "Equipment Maintenance"},
              {"value": "customer_service", "label": "Customer Service"},
              {"value": "report_writing", "label": "Incident Reporting"},
              {"value": "inventory_management", "label": "Inventory Management"},
              {"value": "supervision", "label": "Team Supervision"},
              {"value": "safety_compliance", "label": "Safety Compliance"},
              {"value": "facility_inspection", "label": "Facility Inspection"}
            ],
            "helpText": "Primary responsibilities for this position"
          }
        }
      ]
    },
    {
      "title": "Compensation & Benefits",
      "order": 3,
      "description": "Salary, incentives, and benefits package",
      "is_collapsible": false,
      "fields": [
        {
          "name": "salary_range_min",
          "label": "Minimum Salary (Monthly)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:8000"],
          "ui_config": {
            "placeholder": "e.g., 12000",
            "helpText": "Minimum monthly salary in INR (CTC)"
          }
        },
        {
          "name": "salary_range_max",
          "label": "Maximum Salary (Monthly)",
          "type": "number",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "placeholder": "e.g., 25000",
            "helpText": "Maximum monthly salary in INR (CTC)"
          }
        },
        {
          "name": "shift_allowance",
          "label": "Shift Allowances",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "night_shift_allowance", "label": "Night Shift Allowance"},
              {"value": "weekend_allowance", "label": "Weekend Shift Allowance"},
              {"value": "overtime_pay", "label": "Overtime Pay"},
              {"value": "holiday_pay", "label": "Holiday Pay"},
              {"value": "shift_differential", "label": "Shift Differential Pay"}
            ],
            "helpText": "Additional shift-based compensation"
          }
        },
        {
          "name": "additional_compensation",
          "label": "Additional Compensation",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "performance_bonus", "label": "Performance Bonus"},
              {"value": "attendance_bonus", "label": "Attendance Bonus"},
              {"value": "uniform_allowance", "label": "Uniform Allowance"},
              {"value": "meal_allowance", "label": "Meal Allowance"},
              {"value": "transport_allowance", "label": "Transport Allowance"},
              {"value": "phone_allowance", "label": "Phone Allowance"},
              {"value": "medical_allowance", "label": "Medical Allowance"}
            ],
            "helpText": "Additional compensation and allowances"
          }
        },
        {
          "name": "benefits",
          "label": "Benefits Package",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "health_insurance", "label": "Health Insurance"},
              {"value": "provident_fund", "label": "Provident Fund"},
              {"value": "gratuity", "label": "Gratuity"},
              {"value": "paid_leave", "label": "Paid Leave (CL/SL)"},
              {"value": "sick_leave", "label": "Sick Leave"},
              {"value": "casual_leave", "label": "Casual Leave"},
              {"value": "maternity_leave", "label": "Maternity Leave"},
              {"value": "paternity_leave", "label": "Paternity Leave"},
              {"value": "uniform_provided", "label": "Uniform Provided"},
              {"value": "training_provided", "label": "Training Provided"},
              {"value": "career_advancement", "label": "Career Advancement Opportunities"}
            ],
            "helpText": "Benefits provided by the employer"
          }
        },
        {
          "name": "payment_frequency",
          "label": "Payment Frequency",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "weekly", "label": "Weekly"},
              {"value": "biweekly", "label": "Bi-weekly"},
              {"value": "monthly", "label": "Monthly"}
            ],
            "helpText": "How often the employee gets paid"
          }
        }
      ]
    },
    {
      "title": "Facility & Service Details",
      "order": 4,
      "description": "Information about the facility and service requirements",
      "is_collapsible": true,
      "fields": [
        {
          "name": "facility_type",
          "label": "Facility Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "residential_society", "label": "Residential Society"},
              {"value": "apartment_complex", "label": "Apartment Complex"},
              {"value": "commercial_complex", "label": "Commercial Complex"},
              {"value": "shopping_mall", "label": "Shopping Mall"},
              {"value": "hotel_resort", "label": "Hotel/Resort"},
              {"value": "hospital_clinic", "label": "Hospital/Clinic"},
              {"value": "school_college", "label": "School/College"},
              {"value": "office_building", "label": "Office Building"},
              {"value": "industrial_park", "label": "Industrial Park"},
              {"value": "government_office", "label": "Government Office"},
              {"value": "retail_store", "label": "Retail Store"},
              {"value": "restaurant", "label": "Restaurant/Cafe"}
            ],
            "helpText": "Type of facility requiring services"
          }
        },
        {
          "name": "facility_size",
          "label": "Facility Size",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "small", "label": "Small (1-10 units/rooms)"},
              {"value": "medium", "label": "Medium (11-50 units/rooms)"},
              {"value": "large", "label": "Large (51-200 units/rooms)"},
              {"value": "extra_large", "label": "Extra Large (200+ units/rooms)"}
            ],
            "helpText": "Size of the facility"
          }
        },
        {
          "name": "service_areas",
          "label": "Service Areas",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "common_areas", "label": "Common Areas"},
              {"value": "lobbies_reception", "label": "Lobbies & Reception"},
              {"value": "corridors", "label": "Corridors & Hallways"},
              {"value": "elevators", "label": "Elevators & Stairwells"},
              {"value": "parking_areas", "label": "Parking Areas"},
              {"value": "gardens_landscaping", "label": "Gardens & Landscaping"},
              {"value": "swimming_pool", "label": "Swimming Pool"},
              {"value": "gym_fitness", "label": "Gym & Fitness Center"},
              {"value": "restaurants", "label": "Restaurants & Cafes"},
              {"value": "offices", "label": "Office Spaces"},
              {"value": "residential_units", "label": "Residential Units"},
              {"value": "waste_disposal", "label": "Waste Disposal Areas"}
            ],
            "helpText": "Areas requiring security/housekeeping services"
          }
        },
        {
          "name": "security_requirements",
          "label": "Security Requirements",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "access_control", "label": "Access Control System"},
              {"value": "cctv_monitoring", "label": "CCTV Monitoring"},
              {"value": "patrol_services", "label": "Regular Patrol Services"},
              {"value": "emergency_response", "label": "Emergency Response"},
              {"value": "fire_safety", "label": "Fire Safety Monitoring"},
              {"value": "visitor_management", "label": "Visitor Management"},
              {"value": "vehicle_screening", "label": "Vehicle Screening"},
              {"value": "crowd_control", "label": "Crowd Control"},
              {"value": "key_management", "label": "Key & Lock Management"},
              {"value": "incident_reporting", "label": "Incident Reporting"},
              {"value": "alarm_systems", "label": "Alarm System Monitoring"},
              {"value": "vip_protection", "label": "VIP Protection Services"}
            ],
            "helpText": "Security requirements and protocols"
          }
        },
        {
          "name": "cleaning_standards",
          "label": "Cleaning Standards",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "daily_cleaning", "label": "Daily Cleaning Schedule"},
              {"value": "deep_cleaning", "label": "Deep Cleaning Services"},
              {"value": "eco_friendly", "label": "Eco-Friendly Products"},
              {"value": "sanitization", "label": "Sanitization Protocols"},
              {"value": "pest_control", "label": "Pest Control Services"},
              {"value": "waste_segregation", "label": "Waste Segregation"},
              {"value": "linen_laundry", "label": "Linen & Laundry Services"},
              {"value": "carpet_cleaning", "label": "Carpet Cleaning"},
              {"value": "window_cleaning", "label": "Window Cleaning"},
              {"value": "floor_maintenance", "label": "Floor Maintenance"},
              {"value": "restroom_cleaning", "label": "Restroom Cleaning"},
              {"value": "kitchen_cleaning", "label": "Kitchen Cleaning"}
            ],
            "helpText": "Cleaning and maintenance standards"
          }
        },
        {
          "name": "equipment_provided",
          "label": "Equipment & Supplies Provided",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "cleaning_supplies", "label": "Cleaning Supplies & Chemicals"},
              {"value": "uniforms", "label": "Uniforms & Protective Gear"},
              {"value": "security_equipment", "label": "Security Equipment"},
              {"value": "communication_devices", "label": "Communication Devices"},
              {"value": "vehicles", "label": "Service Vehicles"},
              {"value": "maintenance_tools", "label": "Maintenance Tools"},
              {"value": "first_aid_kits", "label": "First Aid Kits"},
              {"value": "safety_equipment", "label": "Safety Equipment"},
              {"value": "identification_cards", "label": "ID Cards & Badges"},
              {"value": "lockers_storage", "label": "Lockers & Storage"}
            ],
            "helpText": "Equipment and supplies provided by the employer"
          }
        },
        {
          "name": "work_environment",
          "label": "Work Environment",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "climate_controlled", "label": "Climate Controlled Environment"},
              {"value": "outdoor_exposure", "label": "Outdoor Work Exposure"},
              {"value": "24_7_operation", "label": "24/7 Facility Operation"},
              {"value": "high_traffic_areas", "label": "High Traffic Areas"},
              {"value": "confined_spaces", "label": "Confined Spaces"},
              {"value": "chemical_exposure", "label": "Chemical Exposure"},
              {"value": "dust_exposure", "label": "Dust & Debris Exposure"},
              {"value": "noise_exposure", "label": "Noise Exposure"},
              {"value": "public_interaction", "label": "High Public Interaction"},
              {"value": "team_environment", "label": "Team Work Environment"}
            ],
            "helpText": "Work environment characteristics"
          }
        },
        {
          "name": "facility_description",
          "label": "Facility Description",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Brief description of the facility, service requirements, and work environment",
            "helpText": "Overview of the facility and service expectations"
          }
        },
        {
          "name": "service_frequency",
          "label": "Service Frequency",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "24_7", "label": "24/7 Services"},
              {"value": "round_the_clock", "label": "Round the Clock"},
              {"value": "day_shifts_only", "label": "Day Shifts Only"},
              {"value": "night_shifts_only", "label": "Night Shifts Only"},
              {"value": "rotating_schedule", "label": "Rotating Schedule"},
              {"value": "on_call_basis", "label": "On-Call Basis"}
            ],
            "helpText": "Frequency and schedule of services required"
          }
        }
      ]
    },
    {
      "title": "Application Process",
      "order": 5,
      "description": "How to apply and required documentation",
      "is_collapsible": false,
      "fields": [
        {
          "name": "application_deadline",
          "label": "Application Deadline",
          "type": "date",
          "required": false,
          "ui_config": {
            "helpText": "Last date to submit applications"
          }
        },
        {
          "name": "required_documents",
          "label": "Required Documents",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "resume_cv", "label": "Resume/CV"},
              {"value": "educational_certificates", "label": "Educational Certificates"},
              {"value": "police_clearance", "label": "Police Clearance Certificate"},
              {"value": "medical_fitness", "label": "Medical Fitness Certificate"},
              {"value": "aadhar_card", "label": "Aadhar Card"},
              {"value": "pan_card", "label": "PAN Card"},
              {"value": "passport_photos", "label": "Passport Size Photos"},
              {"value": "bank_details", "label": "Bank Account Details"},
              {"value": "vaccination_records", "label": "Vaccination Records"},
              {"value": "experience_letters", "label": "Experience Letters"},
              {"value": "certification_copies", "label": "Certification Copies"},
              {"value": "address_proof", "label": "Address Proof"}
            ],
            "helpText": "Documents required for application"
          }
        },
        {
          "name": "interview_process",
          "label": "Interview Process",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "written_test", "label": "Written Test"},
              {"value": "practical_demo", "label": "Practical Demonstration"},
              {"value": "background_check", "label": "Background Verification"},
              {"value": "panel_interview", "label": "Panel Interview"},
              {"value": "facility_tour", "label": "Facility Tour"},
              {"value": "group_interview", "label": "Group Interview"},
              {"value": "multiple_rounds", "label": "Multiple Interview Rounds"},
              {"value": "reference_check", "label": "Reference Check"}
            ],
            "helpText": "Type of interview process"
          }
        },
        {
          "name": "background_check",
          "label": "Background Check Required",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Whether background verification is required"
          }
        },
        {
          "name": "medical_fitness_test",
          "label": "Medical Fitness Test Required",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Whether medical fitness examination is required"
          }
        },
        {
          "name": "probation_period",
          "label": "Probation Period",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "none", "label": "No Probation"},
              {"value": "1_month", "label": "1 Month"},
              {"value": "3_months", "label": "3 Months"},
              {"value": "6_months", "label": "6 Months"}
            ],
            "helpText": "Probation period for new hires"
          }
        },
        {
          "name": "contact_email",
          "label": "Contact Email",
          "type": "email",
          "required": true,
          "validation": ["required", "email"],
          "ui_config": {
            "placeholder": "hr@facility.com",
            "helpText": "Email address for job inquiries"
          }
        },
        {
          "name": "contact_phone",
          "label": "Contact Phone",
          "type": "phone",
          "required": false,
          "validation": ["phone"],
          "ui_config": {
            "placeholder": "+91-9876543210",
            "helpText": "Phone number for job inquiries"
          }
        }
      ]
    }
  ]
}
```