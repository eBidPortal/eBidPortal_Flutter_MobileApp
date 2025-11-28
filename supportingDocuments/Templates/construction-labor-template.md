# Construction & Labor Job Template for eBidPortal

**Template Name:** Construction & Labor Job Template
**Version:** 1.0
**Category Type:** jobs
**Created:** November 21, 2025
**Industry Standards:** Based on construction industry standards, labor regulations, safety certifications, building codes, OSHA guidelines, and construction professional best practices for skilled trades, laborers, project managers, and construction workers.

## Template JSON Structure

```json
{
  "name": "Construction & Labor Job Template",
  "description": "Industry-standard template for construction and labor job postings. Includes comprehensive fields covering construction expertise, safety certifications, labor skills, project management, and building industry requirements specific to construction workers, skilled trades, laborers, and project managers.",
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
            "placeholder": "e.g., Construction Worker, Mason, Electrician, Project Manager",
            "helpText": "Enter the specific construction/labor position title"
          }
        },
        {
          "name": "company_name",
          "label": "Company Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:100"],
          "ui_config": {
            "placeholder": "Enter construction company, contractor, or building firm name",
            "helpText": "Name of the construction company"
          }
        },
        {
          "name": "location",
          "label": "Work Location",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3"],
          "ui_config": {
            "placeholder": "e.g., Mumbai Construction Site, Bangalore Residential Project",
            "helpText": "Location of the construction site or office"
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
              {"value": "project_based", "label": "Project Based"},
              {"value": "temporary", "label": "Temporary"}
            ],
            "helpText": "Type of employment arrangement"
          }
        },
        {
          "name": "work_mode",
          "label": "Work Mode",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "onsite", "label": "On-Site Construction"},
              {"value": "office_based", "label": "Office Based"},
              {"value": "hybrid", "label": "Hybrid (Site + Office)"},
              {"value": "remote_planning", "label": "Remote Planning with Site Visits"}
            ],
            "helpText": "Primary work location arrangement"
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
              {"value": "entry", "label": "Entry Level (0-2 years)"},
              {"value": "junior", "label": "Junior (2-4 years)"},
              {"value": "mid", "label": "Mid-Level (4-7 years)"},
              {"value": "senior", "label": "Senior (7-10 years)"},
              {"value": "expert", "label": "Expert/Supervisor (10+ years)"}
            ],
            "helpText": "Required construction/labor experience level"
          }
        },
        {
          "name": "trade_specialization",
          "label": "Trade/Skill Specialization",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "general_labor", "label": "General Labor"},
              {"value": "mason_bricklayer", "label": "Mason/Bricklayer"},
              {"value": "carpenter", "label": "Carpenter"},
              {"value": "electrician", "label": "Electrician"},
              {"value": "plumber", "label": "Plumber"},
              {"value": "welder", "label": "Welder"},
              {"value": "painter", "label": "Painter"},
              {"value": "roofer", "label": "Roofer"},
              {"value": "steel_fixer", "label": "Steel Fixer"},
              {"value": "concrete_worker", "label": "Concrete Worker"},
              {"value": "excavator", "label": "Excavator/Operator"},
              {"value": "project_manager", "label": "Project Manager"},
              {"value": "site_supervisor", "label": "Site Supervisor"},
              {"value": "safety_officer", "label": "Safety Officer"},
              {"value": "quantity_surveyor", "label": "Quantity Surveyor"}
            ],
            "helpText": "Primary construction trade or skill specialization"
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
              {"value": "high_school", "label": "High School/SSC"},
              {"value": "diploma_construction", "label": "Construction Diploma"},
              {"value": "iti_certification", "label": "ITI Certification"},
              {"value": "bachelor_civil", "label": "Bachelor of Civil Engineering"},
              {"value": "bachelor_construction", "label": "Bachelor of Construction Management"},
              {"value": "masters_construction", "label": "Master of Construction Management"},
              {"value": "professional_certification", "label": "Professional Certification"}
            ],
            "helpText": "Minimum education qualification required"
          }
        },
        {
          "name": "trade_certifications",
          "label": "Trade Certifications",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "iti_electrician", "label": "ITI Electrician"},
              {"value": "iti_plumber", "label": "ITI Plumber"},
              {"value": "iti_welder", "label": "ITI Welder"},
              {"value": "iti_carpenter", "label": "ITI Carpenter"},
              {"value": "ncc_civil", "label": "NCC Civil Engineering"},
              {"value": "safety_officer_cert", "label": "Safety Officer Certification"},
              {"value": "scaffolding_cert", "label": "Scaffolding Certification"},
              {"value": "crane_operator", "label": "Crane Operator License"},
              {"value": "heavy_equipment", "label": "Heavy Equipment Operator"},
              {"value": "first_aid_cert", "label": "First Aid Certification"},
              {"value": "fire_safety_cert", "label": "Fire Safety Certification"},
              {"value": "quality_control", "label": "Quality Control Certification"},
              {"value": "pmp_certification", "label": "PMP Certification"},
              {"value": "civil_engineering", "label": "Civil Engineering License"}
            ],
            "helpText": "Preferred trade and safety certifications"
          }
        },
        {
          "name": "safety_training",
          "label": "Safety Training Requirements",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "osh_training", "label": "OSHA/OSH Training"},
              {"value": "height_work_safety", "label": "Height Work Safety"},
              {"value": "electrical_safety", "label": "Electrical Safety"},
              {"value": "chemical_handling", "label": "Chemical Handling Safety"},
              {"value": "fire_prevention", "label": "Fire Prevention & Control"},
              {"value": "emergency_response", "label": "Emergency Response Training"},
              {"value": "ppe_usage", "label": "PPE Usage & Maintenance"},
              {"value": "hazard_identification", "label": "Hazard Identification & Control"},
              {"value": "machine_safety", "label": "Machine & Equipment Safety"},
              {"value": "environmental_safety", "label": "Environmental Safety"},
              {"value": "traffic_management", "label": "Construction Site Traffic Management"},
              {"value": "waste_management", "label": "Construction Waste Management"}
            ],
            "helpText": "Required safety training and certifications"
          }
        },
        {
          "name": "experience_years",
          "label": "Construction Experience (Years)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:50"],
          "ui_config": {
            "placeholder": "e.g., 3",
            "helpText": "Minimum years of construction/labor experience required"
          }
        },
        {
          "name": "project_types",
          "label": "Project Type Experience",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "residential", "label": "Residential Construction"},
              {"value": "commercial", "label": "Commercial Buildings"},
              {"value": "industrial", "label": "Industrial Facilities"},
              {"value": "infrastructure", "label": "Infrastructure Projects"},
              {"value": "high_rise", "label": "High-Rise Buildings"},
              {"value": "bridges", "label": "Bridges & Flyovers"},
              {"value": "roads", "label": "Roads & Highways"},
              {"value": "tunnels", "label": "Tunnels & Underground"},
              {"value": "dams", "label": "Dams & Water Projects"},
              {"value": "renovation", "label": "Renovation & Remodeling"},
              {"value": "demolition", "label": "Demolition Work"},
              {"value": "green_building", "label": "Green Building Projects"}
            ],
            "helpText": "Preferred project types and experience"
          }
        },
        {
          "name": "equipment_proficiency",
          "label": "Equipment Proficiency",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "hand_tools", "label": "Hand Tools & Power Tools"},
              {"value": "heavy_machinery", "label": "Heavy Machinery Operation"},
              {"value": "cranes", "label": "Cranes & Lifting Equipment"},
              {"value": "excavators", "label": "Excavators & Loaders"},
              {"value": "concrete_mixers", "label": "Concrete Mixers & Pumps"},
              {"value": "welding_equipment", "label": "Welding Equipment"},
              {"value": "electrical_tools", "label": "Electrical Testing Tools"},
              {"value": "surveying_equipment", "label": "Surveying Equipment"},
              {"value": "safety_equipment", "label": "Safety Equipment Operation"},
              {"value": "measurement_tools", "label": "Precision Measurement Tools"}
            ],
            "helpText": "Required equipment and machinery proficiency"
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
              {"value": "heavy_lifting", "label": "Heavy Lifting (25+ kg)"},
              {"value": "standing_long", "label": "Prolonged Standing/Walking"},
              {"value": "climbing_ladders", "label": "Climbing Ladders/Scaffolding"},
              {"value": "working_heights", "label": "Working at Heights"},
              {"value": "outdoor_work", "label": "Outdoor Work in All Weather"},
              {"value": "dust_exposure", "label": "Dust & Debris Exposure"},
              {"value": "noise_exposure", "label": "High Noise Environment"},
              {"value": "chemical_exposure", "label": "Chemical Exposure"},
              {"value": "physical_stamina", "label": "High Physical Stamina"},
              {"value": "team_lifting", "label": "Team Lifting Operations"}
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
              {"value": "site_preparation", "label": "Site Preparation & Setup"},
              {"value": "material_handling", "label": "Material Handling & Storage"},
              {"value": "construction_work", "label": "Core Construction Work"},
              {"value": "equipment_operation", "label": "Equipment Operation"},
              {"value": "safety_compliance", "label": "Safety Compliance & PPE Usage"},
              {"value": "quality_control", "label": "Quality Control & Inspection"},
              {"value": "team_supervision", "label": "Team Supervision & Coordination"},
              {"value": "project_planning", "label": "Project Planning & Scheduling"},
              {"value": "client_coordination", "label": "Client & Stakeholder Coordination"},
              {"value": "documentation", "label": "Site Documentation & Reporting"},
              {"value": "maintenance_repairs", "label": "Maintenance & Repairs"},
              {"value": "cleanup_disposal", "label": "Site Cleanup & Waste Disposal"}
            ],
            "helpText": "Primary responsibilities for this construction position"
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
            "placeholder": "e.g., 15000",
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
            "placeholder": "e.g., 35000",
            "helpText": "Maximum monthly salary in INR (CTC)"
          }
        },
        {
          "name": "additional_compensation",
          "label": "Additional Compensation",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "overtime_pay", "label": "Overtime Pay (1.5x-2x rate)"},
              {"value": "weekend_allowance", "label": "Weekend Work Allowance"},
              {"value": "night_shift_allowance", "label": "Night Shift Allowance"},
              {"value": "hazard_pay", "label": "Hazard Pay"},
              {"value": "project_completion_bonus", "label": "Project Completion Bonus"},
              {"value": "performance_incentive", "label": "Performance Incentive"},
              {"value": "tool_allowance", "label": "Tool & Equipment Allowance"},
              {"value": "transport_allowance", "label": "Transport Allowance"},
              {"value": "meal_allowance", "label": "Meal Allowance"},
              {"value": "accommodation_allowance", "label": "Site Accommodation Allowance"}
            ],
            "helpText": "Additional compensation for construction work"
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
              {"value": "accident_insurance", "label": "Accident Insurance"},
              {"value": "provident_fund", "label": "Provident Fund"},
              {"value": "gratuity", "label": "Gratuity"},
              {"value": "paid_leave", "label": "Paid Leave (CL/SL)"},
              {"value": "sick_leave", "label": "Sick Leave"},
              {"value": "maternity_leave", "label": "Maternity Leave"},
              {"value": "paternity_leave", "label": "Paternity Leave"},
              {"value": "uniform_ppe", "label": "Uniform & PPE Provided"},
              {"value": "skill_development", "label": "Skill Development Programs"},
              {"value": "certification_support", "label": "Certification Support"},
              {"value": "career_advancement", "label": "Career Advancement Opportunities"}
            ],
            "helpText": "Benefits provided by the construction company"
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
      "title": "Construction Company Details",
      "order": 4,
      "description": "Information about the construction company and project details",
      "is_collapsible": true,
      "fields": [
        {
          "name": "company_type",
          "label": "Company Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "construction_contractor", "label": "Construction Contractor"},
              {"value": "civil_engineering_firm", "label": "Civil Engineering Firm"},
              {"value": "building_contractor", "label": "Building Contractor"},
              {"value": "infrastructure_developer", "label": "Infrastructure Developer"},
              {"value": "real_estate_developer", "label": "Real Estate Developer"},
              {"value": "government_contractor", "label": "Government Contractor"},
              {"value": "private_contractor", "label": "Private Contractor"},
              {"value": "international_contractor", "label": "International Contractor"}
            ],
            "helpText": "Type of construction company"
          }
        },
        {
          "name": "company_size",
          "label": "Company Size",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "small", "label": "Small (1-50 employees)"},
              {"value": "medium", "label": "Medium (51-200 employees)"},
              {"value": "large", "label": "Large (201-1000 employees)"},
              {"value": "enterprise", "label": "Enterprise (1000+ employees)"}
            ],
            "helpText": "Size of the construction company"
          }
        },
        {
          "name": "project_type",
          "label": "Current Project Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "residential_apartment", "label": "Residential Apartment Complex"},
              {"value": "commercial_building", "label": "Commercial Building"},
              {"value": "shopping_mall", "label": "Shopping Mall"},
              {"value": "hospital", "label": "Hospital/Medical Facility"},
              {"value": "school_university", "label": "School/University"},
              {"value": "industrial_plant", "label": "Industrial Plant"},
              {"value": "bridge_flyover", "label": "Bridge/Flyover"},
              {"value": "road_highway", "label": "Road/Highway"},
              {"value": "metro_rail", "label": "Metro/Rail Project"},
              {"value": "dam_reservoir", "label": "Dam/Reservoir"},
              {"value": "airport", "label": "Airport"},
              {"value": "renovation_project", "label": "Renovation Project"}
            ],
            "helpText": "Type of construction project"
          }
        },
        {
          "name": "project_duration",
          "label": "Project Duration",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "short_term", "label": "Short Term (1-6 months)"},
              {"value": "medium_term", "label": "Medium Term (6-18 months)"},
              {"value": "long_term", "label": "Long Term (18-36 months)"},
              {"value": "multi_year", "label": "Multi-Year Project (3+ years)"}
            ],
            "helpText": "Expected duration of the project"
          }
        },
        {
          "name": "work_environment",
          "label": "Work Environment",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "urban_construction", "label": "Urban Construction Site"},
              {"value": "rural_remote", "label": "Rural/Remote Location"},
              {"value": "industrial_zone", "label": "Industrial Zone"},
              {"value": "residential_area", "label": "Residential Area"},
              {"value": "high_rise_construction", "label": "High-Rise Construction"},
              {"value": "underground_work", "label": "Underground Work"},
              {"value": "waterfront_work", "label": "Waterfront/Marine Work"},
              {"value": "mountainous_terrain", "label": "Mountainous Terrain"},
              {"value": "extreme_weather", "label": "Extreme Weather Conditions"},
              {"value": "confined_spaces", "label": "Confined Spaces"}
            ],
            "helpText": "Construction site environment and conditions"
          }
        },
        {
          "name": "safety_standards",
          "label": "Safety Standards",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "osha_compliant", "label": "OSHA Compliant"},
              {"value": "iso_45001", "label": "ISO 45001 Certified"},
              {"value": "safety_audits", "label": "Regular Safety Audits"},
              {"value": "emergency_response", "label": "Emergency Response Team"},
              {"value": "safety_training", "label": "Mandatory Safety Training"},
              {"value": "ppe_mandatory", "label": "PPE Mandatory for All"},
              {"value": "safety_committee", "label": "Safety Committee"},
              {"value": "incident_reporting", "label": "Incident Reporting System"},
              {"value": "zero_accident_policy", "label": "Zero Accident Policy"},
              {"value": "safety_awards", "label": "Safety Performance Awards"}
            ],
            "helpText": "Safety standards and protocols followed"
          }
        },
        {
          "name": "equipment_provided",
          "label": "Equipment Provided",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "power_tools", "label": "Power Tools & Machinery"},
              {"value": "safety_equipment", "label": "Safety Equipment & PPE"},
              {"value": "measuring_tools", "label": "Measuring & Surveying Tools"},
              {"value": "transportation", "label": "Site Transportation"},
              {"value": "canteen_facilities", "label": "Canteen Facilities"},
              {"value": "rest_areas", "label": "Rest Areas & Break Rooms"},
              {"value": "first_aid_stations", "label": "First Aid Stations"},
              {"value": "drinking_water", "label": "Drinking Water Facilities"},
              {"value": "sanitation_facilities", "label": "Sanitation Facilities"},
              {"value": "changing_rooms", "label": "Changing Rooms & Lockers"}
            ],
            "helpText": "Equipment and facilities provided by the company"
          }
        },
        {
          "name": "company_description",
          "label": "Company Description",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Brief description of the construction company, completed projects, safety record, and work culture",
            "helpText": "Overview of the construction company"
          }
        },
        {
          "name": "project_value",
          "label": "Project Value Range",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "small", "label": "Small (₹1-10 crores)"},
              {"value": "medium", "label": "Medium (₹10-50 crores)"},
              {"value": "large", "label": "Large (₹50-200 crores)"},
              {"value": "mega", "label": "Mega Project (₹200 crores+)"}
            ],
            "helpText": "Value range of the construction project"
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
              {"value": "trade_certificates", "label": "Trade Certificates/ITIs"},
              {"value": "safety_certificates", "label": "Safety Training Certificates"},
              {"value": "experience_letters", "label": "Experience Letters"},
              {"value": "medical_fitness", "label": "Medical Fitness Certificate"},
              {"value": "police_clearance", "label": "Police Clearance Certificate"},
              {"value": "aadhar_card", "label": "Aadhar Card"},
              {"value": "pan_card", "label": "PAN Card"},
              {"value": "bank_details", "label": "Bank Account Details"},
              {"value": "passport_photos", "label": "Passport Size Photos"},
              {"value": "vaccination_records", "label": "Vaccination Records"}
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
              {"value": "practical_test", "label": "Practical/Skills Test"},
              {"value": "trade_test", "label": "Trade Proficiency Test"},
              {"value": "safety_demo", "label": "Safety Demonstration"},
              {"value": "panel_interview", "label": "Panel Interview"},
              {"value": "site_visit", "label": "Site Visit Interview"},
              {"value": "group_interview", "label": "Group Interview"},
              {"value": "multiple_rounds", "label": "Multiple Interview Rounds"}
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
            "placeholder": "hr@constructioncompany.com",
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