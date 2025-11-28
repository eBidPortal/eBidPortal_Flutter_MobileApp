# Operator & Technician Job Template for eBidPortal

**Template Name:** Operator & Technician Job Template
**Version:** 1.0
**Category Type:** jobs
**Created:** November 21, 2025
**Industry Standards:** Based on industrial operations standards, technical certifications, safety protocols, and equipment maintenance best practices for operators and technicians across manufacturing, production, and technical service industries.

## Template JSON Structure

```json
{
  "name": "Operator & Technician Job Template",
  "description": "Industry-standard template for operator and technician job postings. Includes comprehensive fields covering technical skills, equipment operation, maintenance expertise, safety certifications, and industrial operations standards specific to machine operators, maintenance technicians, and technical service roles.",
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
            "placeholder": "e.g., Machine Operator, Maintenance Technician, Production Operator",
            "helpText": "Enter the specific technical position title"
          }
        },
        {
          "name": "company_name",
          "label": "Company Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:100"],
          "ui_config": {
            "placeholder": "Enter manufacturing company, factory, or technical service company name",
            "helpText": "Name of the company offering this position"
          }
        },
        {
          "name": "location",
          "label": "Work Location",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3"],
          "ui_config": {
            "placeholder": "e.g., Mumbai Industrial Area, Gujarat or specific factory address",
            "helpText": "Location of the facility/plant"
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
              {"value": "temporary", "label": "Temporary"},
              {"value": "shift_work", "label": "Shift Work"}
            ],
            "helpText": "Type of employment arrangement"
          }
        },
        {
          "name": "shift_timing",
          "label": "Shift Timing",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "day_shift", "label": "Day Shift (8 AM - 5 PM)"},
              {"value": "night_shift", "label": "Night Shift (8 PM - 5 AM)"},
              {"value": "rotating", "label": "Rotating Shifts"},
              {"value": "continuous", "label": "Continuous Operations (24/7)"},
              {"value": "flexible", "label": "Flexible Hours"}
            ],
            "helpText": "Primary shift timing for operations"
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
              {"value": "intermediate", "label": "Intermediate (1-3 years)"},
              {"value": "experienced", "label": "Experienced (3-5 years)"},
              {"value": "senior", "label": "Senior Technician (5+ years)"},
              {"value": "expert", "label": "Expert/Specialist (8+ years)"}
            ],
            "helpText": "Required technical experience level"
          }
        },
        {
          "name": "industry_sector",
          "label": "Industry Sector",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "manufacturing", "label": "Manufacturing"},
              {"value": "automotive", "label": "Automotive"},
              {"value": "chemicals", "label": "Chemicals & Pharmaceuticals"},
              {"value": "electronics", "label": "Electronics & Electrical"},
              {"value": "textiles", "label": "Textiles & Garments"},
              {"value": "food_processing", "label": "Food Processing"},
              {"value": "construction", "label": "Construction Equipment"},
              {"value": "power_energy", "label": "Power & Energy"},
              {"value": "mining", "label": "Mining & Heavy Equipment"},
              {"value": "other", "label": "Other Industrial"}
            ],
            "helpText": "Primary industry sector for this technical role"
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
              {"value": "high_school", "label": "High School (10th)"},
              {"value": "intermediate", "label": "Intermediate (12th)"},
              {"value": "diploma_technical", "label": "Technical Diploma (ITI)"},
              {"value": "graduation_engineering", "label": "Engineering Degree"},
              {"value": "vocational_training", "label": "Vocational Training"},
              {"value": "certified_course", "label": "Industry Certified Course"}
            ],
            "helpText": "Minimum education qualification required"
          }
        },
        {
          "name": "technical_certifications",
          "label": "Technical Certifications",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "iti_certification", "label": "ITI Certification"},
              {"value": "ncc_certification", "label": "NCC Certification"},
              {"value": "safety_training", "label": "Industrial Safety Training"},
              {"value": "equipment_specific", "label": "Equipment-Specific Certification"},
              {"value": "welding_certification", "label": "Welding Certification"},
              {"value": "electrical_license", "label": "Electrical License"},
              {"value": "mechanical_certification", "label": "Mechanical Certification"},
              {"value": "quality_control", "label": "Quality Control Certification"},
              {"value": "iso_standards", "label": "ISO Standards Training"}
            ],
            "helpText": "Preferred technical and safety certifications"
          }
        },
        {
          "name": "technical_skills",
          "label": "Technical Skills & Equipment",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "machine_operation", "label": "Machine Operation"},
              {"value": "equipment_maintenance", "label": "Equipment Maintenance"},
              {"value": "troubleshooting", "label": "Troubleshooting & Diagnostics"},
              {"value": "preventive_maintenance", "label": "Preventive Maintenance"},
              {"value": "electrical_work", "label": "Basic Electrical Work"},
              {"value": "mechanical_repairs", "label": "Mechanical Repairs"},
              {"value": "plc_programming", "label": "PLC Programming"},
              {"value": "automation_systems", "label": "Automation Systems"},
              {"value": "quality_control", "label": "Quality Control Procedures"},
              {"value": "safety_protocols", "label": "Safety Protocols"},
              {"value": "computer_skills", "label": "Basic Computer Skills"}
            ],
            "helpText": "Required technical skills and competencies"
          }
        },
        {
          "name": "experience_years",
          "label": "Technical Experience (Years)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:50"],
          "ui_config": {
            "placeholder": "e.g., 3",
            "helpText": "Minimum years of technical/operator experience required"
          }
        },
        {
          "name": "equipment_experience",
          "label": "Equipment Experience",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "cnc_machines", "label": "CNC Machines"},
              {"value": "injection_molding", "label": "Injection Molding Machines"},
              {"value": "conveyor_systems", "label": "Conveyor Systems"},
              {"value": "forklifts", "label": "Forklifts & Material Handling"},
              {"value": "welding_equipment", "label": "Welding Equipment"},
              {"value": "electrical_panels", "label": "Electrical Control Panels"},
              {"value": "hydraulic_systems", "label": "Hydraulic Systems"},
              {"value": "pneumatic_systems", "label": "Pneumatic Systems"},
              {"value": "robotic_systems", "label": "Robotic Systems"},
              {"value": "measurement_tools", "label": "Precision Measurement Tools"}
            ],
            "helpText": "Specific equipment operation experience required"
          }
        },
        {
          "name": "physical_requirements",
          "label": "Physical Requirements",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "standing_long", "label": "Long hours of standing/walking"},
              {"value": "lifting_heavy", "label": "Heavy lifting (up to 50kg)"},
              {"value": "working_heights", "label": "Working at heights"},
              {"value": "confined_spaces", "label": "Working in confined spaces"},
              {"value": "shift_work", "label": "Shift work availability"},
              {"value": "safety_gear", "label": "Wearing safety equipment"},
              {"value": "outdoor_work", "label": "Outdoor work conditions"}
            ],
            "helpText": "Physical demands of the technical role"
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
              {"value": "machine_operation", "label": "Machine Operation & Monitoring"},
              {"value": "maintenance_repairs", "label": "Maintenance & Repairs"},
              {"value": "quality_assurance", "label": "Quality Assurance & Control"},
              {"value": "safety_compliance", "label": "Safety Compliance"},
              {"value": "production_targets", "label": "Meeting Production Targets"},
              {"value": "documentation", "label": "Maintenance Documentation"},
              {"value": "troubleshooting", "label": "Equipment Troubleshooting"},
              {"value": "training_juniors", "label": "Training Junior Operators"},
              {"value": "inventory_management", "label": "Spare Parts Inventory"}
            ],
            "helpText": "Primary responsibilities for this technical position"
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
            "helpText": "Minimum monthly salary in INR"
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
            "helpText": "Maximum monthly salary in INR"
          }
        },
        {
          "name": "additional_compensation",
          "label": "Additional Compensation",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "shift_allowance", "label": "Shift Allowance"},
              {"value": "overtime_pay", "label": "Overtime Pay"},
              {"value": "performance_bonus", "label": "Performance Bonus"},
              {"value": "production_incentive", "label": "Production Incentive"},
              {"value": "safety_bonus", "label": "Safety Bonus"},
              {"value": "attendance_bonus", "label": "Attendance Bonus"},
              {"value": "transportation", "label": "Transportation Allowance"},
              {"value": "meal_allowance", "label": "Meal Allowance"}
            ],
            "helpText": "Additional compensation and incentives"
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
              {"value": "paid_leave", "label": "Paid Leave (CL/SL)"},
              {"value": "provident_fund", "label": "Provident Fund"},
              {"value": "gratuity", "label": "Gratuity"},
              {"value": "accident_insurance", "label": "Accident Insurance"},
              {"value": "skill_training", "label": "Skill Development Training"},
              {"value": "uniform_safety_gear", "label": "Uniform & Safety Gear"},
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
              {"value": "monthly", "label": "Monthly"},
              {"value": "biweekly", "label": "Bi-weekly"},
              {"value": "weekly", "label": "Weekly"}
            ],
            "helpText": "How often the employee gets paid"
          }
        }
      ]
    },
    {
      "title": "Facility & Operations Details",
      "order": 4,
      "description": "Information about the facility and operational environment",
      "is_collapsible": true,
      "fields": [
        {
          "name": "facility_type",
          "label": "Facility Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "manufacturing_plant", "label": "Manufacturing Plant"},
              {"value": "assembly_unit", "label": "Assembly Unit"},
              {"value": "processing_facility", "label": "Processing Facility"},
              {"value": "warehouse", "label": "Warehouse & Distribution"},
              {"value": "service_center", "label": "Service & Maintenance Center"},
              {"value": "construction_site", "label": "Construction Site"},
              {"value": "power_plant", "label": "Power Generation Plant"},
              {"value": "chemical_plant", "label": "Chemical Processing Plant"}
            ],
            "helpText": "Type of industrial facility"
          }
        },
        {
          "name": "production_scale",
          "label": "Production Scale",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "small_scale", "label": "Small Scale (Local)"},
              {"value": "medium_scale", "label": "Medium Scale (Regional)"},
              {"value": "large_scale", "label": "Large Scale (National)"},
              {"value": "industrial_scale", "label": "Industrial Scale (Export)"}
            ],
            "helpText": "Scale of production operations"
          }
        },
        {
          "name": "work_environment",
          "label": "Work Environment",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "climate_controlled", "label": "Climate Controlled"},
              {"value": "outdoor_exposure", "label": "Outdoor Exposure"},
              {"value": "dusty_environment", "label": "Dusty Environment"},
              {"value": "noisy_operations", "label": "Noisy Operations"},
              {"value": "chemical_exposure", "label": "Chemical Exposure"},
              {"value": "precision_work", "label": "Precision Work Required"},
              {"value": "team_based", "label": "Team-Based Operations"},
              {"value": "independent_work", "label": "Independent Work"}
            ],
            "helpText": "Working conditions and environment"
          }
        },
        {
          "name": "safety_measures",
          "label": "Safety Measures",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "safety_training", "label": "Mandatory Safety Training"},
              {"value": "ppe_provided", "label": "PPE Provided"},
              {"value": "emergency_protocols", "label": "Emergency Protocols"},
              {"value": "first_aid_facility", "label": "First Aid Facility"},
              {"value": "fire_safety", "label": "Fire Safety Equipment"},
              {"value": "hazard_communication", "label": "Hazard Communication"},
              {"value": "safety_audits", "label": "Regular Safety Audits"}
            ],
            "helpText": "Safety measures and protocols in place"
          }
        },
        {
          "name": "facility_description",
          "label": "Facility Description",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Brief description of the facility, operations, equipment, and work environment",
            "helpText": "Overview of the industrial facility and operations"
          }
        },
        {
          "name": "team_size",
          "label": "Operations Team Size",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "small", "label": "Small Team (2-10 members)"},
              {"value": "medium", "label": "Medium Team (11-50 members)"},
              {"value": "large", "label": "Large Team (51-200 members)"},
              {"value": "extra_large", "label": "Large Operations (200+ members)"}
            ],
            "helpText": "Size of the operations/maintenance team"
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
              {"value": "technical_certificates", "label": "Technical Certificates (ITI/NCC)"},
              {"value": "experience_letters", "label": "Experience Letters"},
              {"value": "police_verification", "label": "Police Verification Certificate"},
              {"value": "medical_certificate", "label": "Medical Fitness Certificate"},
              {"value": "aadhar_card", "label": "Aadhar Card"},
              {"value": "pan_card", "label": "PAN Card"},
              {"value": "photo", "label": "Recent Photograph"},
              {"value": "skill_certificates", "label": "Skill Certification Documents"}
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
              {"value": "document_verification", "label": "Document Verification Only"},
              {"value": "written_test", "label": "Written/Skill Test"},
              {"value": "practical_test", "label": "Practical Equipment Test"},
              {"value": "technical_interview", "label": "Technical Interview"},
              {"value": "multiple_rounds", "label": "Multiple Interview Rounds"},
              {"value": "trial_shift", "label": "Trial Shift/Working Interview"}
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
          "name": "medical_checkup",
          "label": "Medical Checkup Required",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Whether pre-employment medical checkup is required"
          }
        },
        {
          "name": "contact_email",
          "label": "Contact Email",
          "type": "email",
          "required": true,
          "validation": ["required", "email"],
          "ui_config": {
            "placeholder": "hr@company.com",
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