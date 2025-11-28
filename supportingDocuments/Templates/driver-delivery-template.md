# Driver & Delivery Job Template for eBidPortal

**Template Name:** Driver & Delivery Job Template
**Version:** 1.0
**Category Type:** jobs
**Created:** November 21, 2025
**Industry Standards:** Based on transportation industry standards, driver licensing regulations, and logistics sector requirements

## Template JSON Structure

```json
{
  "name": "Driver & Delivery Job Template",
  "description": "Industry-standard template for driver and delivery service job postings. Includes comprehensive fields covering vehicle requirements, licensing, safety standards, delivery routes, and compensation structures specific to the transportation and logistics industry.",
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
            "placeholder": "e.g., Delivery Driver, Courier Driver, Truck Driver",
            "helpText": "Enter the specific job title for this driver position"
          }
        },
        {
          "name": "company_name",
          "label": "Company Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:100"],
          "ui_config": {
            "placeholder": "Enter company or organization name",
            "helpText": "Name of the company offering this driver position"
          }
        },
        {
          "name": "location",
          "label": "Work Location",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3"],
          "ui_config": {
            "placeholder": "e.g., Mumbai, Maharashtra or specific area",
            "helpText": "Primary work location and delivery area"
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
              {"value": "freelance", "label": "Freelance"}
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
              {"value": "morning", "label": "Morning (6 AM - 2 PM)"},
              {"value": "afternoon", "label": "Afternoon (2 PM - 10 PM)"},
              {"value": "night", "label": "Night (10 PM - 6 AM)"},
              {"value": "rotating", "label": "Rotating Shifts"},
              {"value": "flexible", "label": "Flexible Hours"}
            ],
            "helpText": "Primary shift timing for this position"
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
              {"value": "senior", "label": "Senior (5+ years)"}
            ],
            "helpText": "Required experience level for this driver position"
          }
        }
      ]
    },
    {
      "title": "Requirements & Qualifications",
      "order": 2,
      "description": "Licensing, vehicle operation, and professional requirements",
      "is_collapsible": false,
      "fields": [
        {
          "name": "license_type",
          "label": "Driving License Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "lmv", "label": "Light Motor Vehicle (LMV)"},
              {"value": "hmv", "label": "Heavy Motor Vehicle (HMV)"},
              {"value": "mcwg", "label": "Motorcycle with Gear"},
              {"value": "transport", "label": "Transport Vehicle"},
              {"value": "commercial", "label": "Commercial Vehicle"}
            ],
            "helpText": "Type of driving license required"
          }
        },
        {
          "name": "vehicle_type",
          "label": "Vehicle Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "motorcycle", "label": "Motorcycle/Scooter"},
              {"value": "car", "label": "Car/Sedan"},
              {"value": "van", "label": "Van/Mini Truck"},
              {"value": "truck", "label": "Truck/Lorry"},
              {"value": "tempo", "label": "Tempo/Auto Rickshaw"},
              {"value": "bicycle", "label": "Bicycle/Cycle Rickshaw"}
            ],
            "helpText": "Type of vehicle the driver will operate"
          }
        },
        {
          "name": "license_validity",
          "label": "License Validity (Years)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:1", "max:20"],
          "ui_config": {
            "placeholder": "e.g., 5",
            "helpText": "Minimum years the license should be valid"
          }
        },
        {
          "name": "experience_years",
          "label": "Driving Experience (Years)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:50"],
          "ui_config": {
            "placeholder": "e.g., 2",
            "helpText": "Minimum years of professional driving experience required"
          }
        },
        {
          "name": "route_knowledge",
          "label": "Route Knowledge Required",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "local", "label": "Local City Routes"},
              {"value": "intercity", "label": "Inter-city Routes"},
              {"value": "highway", "label": "Highway/Expressway"},
              {"value": "rural", "label": "Rural/Area Routes"},
              {"value": "international", "label": "International Routes"}
            ],
            "helpText": "Type of routes the driver should be familiar with"
          }
        },
        {
          "name": "safety_certifications",
          "label": "Safety Certifications",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "defensive_driving", "label": "Defensive Driving Course"},
              {"value": "first_aid", "label": "First Aid Certification"},
              {"value": "hazardous_materials", "label": "Hazardous Materials Handling"},
              {"value": "gps_navigation", "label": "GPS Navigation Proficiency"},
              {"value": "vehicle_maintenance", "label": "Basic Vehicle Maintenance"}
            ],
            "helpText": "Preferred safety and operational certifications"
          }
        },
        {
          "name": "physical_requirements",
          "label": "Physical Requirements",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Describe any physical requirements for the role (e.g., lifting capacity, stamina requirements)",
            "helpText": "Specify physical demands of the job"
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
            "placeholder": "e.g., 25000",
            "helpText": "Maximum monthly salary in INR"
          }
        },
        {
          "name": "incentives",
          "label": "Performance Incentives",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "delivery_bonus", "label": "Delivery Completion Bonus"},
              {"value": "fuel_allowance", "label": "Fuel Allowance"},
              {"value": "overtime_pay", "label": "Overtime Pay"},
              {"value": "performance_bonus", "label": "Performance Bonus"},
              {"value": "tips", "label": "Tips/Gratuity"}
            ],
            "helpText": "Available incentives and bonuses"
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
              {"value": "paid_leave", "label": "Paid Leave"},
              {"value": "uniform_allowance", "label": "Uniform Allowance"},
              {"value": "mobile_allowance", "label": "Mobile/Phone Allowance"},
              {"value": "meal_allowance", "label": "Meal Allowance"}
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
              {"value": "monthly", "label": "Monthly"},
              {"value": "daily", "label": "Daily"}
            ],
            "helpText": "How often the driver gets paid"
          }
        }
      ]
    },
    {
      "title": "Company Details",
      "order": 4,
      "description": "Information about the employing company",
      "is_collapsible": true,
      "fields": [
        {
          "name": "company_size",
          "label": "Company Size",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "startup", "label": "Startup (1-50 employees)"},
              {"value": "small", "label": "Small (51-200 employees)"},
              {"value": "medium", "label": "Medium (201-1000 employees)"},
              {"value": "large", "label": "Large (1000+ employees)"}
            ],
            "helpText": "Size of the employing company"
          }
        },
        {
          "name": "industry_type",
          "label": "Industry Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "ecommerce", "label": "E-commerce"},
              {"value": "food_delivery", "label": "Food Delivery"},
              {"value": "courier", "label": "Courier Services"},
              {"value": "logistics", "label": "Logistics & Transportation"},
              {"value": "retail", "label": "Retail & Supermarkets"},
              {"value": "pharmaceutical", "label": "Pharmaceutical"},
              {"value": "other", "label": "Other"}
            ],
            "helpText": "Industry sector of the company"
          }
        },
        {
          "name": "company_description",
          "label": "Company Description",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Brief description of the company, its services, and work culture",
            "helpText": "Overview of the company and its operations"
          }
        },
        {
          "name": "work_environment",
          "label": "Work Environment",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "outdoor", "label": "Outdoor/Field Work"},
              {"value": "warehouse", "label": "Warehouse/Distribution Center"},
              {"value": "office", "label": "Office-Based"},
              {"value": "mixed", "label": "Mixed Environment"}
            ],
            "helpText": "Primary work environment for drivers"
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
              {"value": "driving_license", "label": "Driving License Copy"},
              {"value": "aadhar_card", "label": "Aadhar Card"},
              {"value": "pan_card", "label": "PAN Card"},
              {"value": "address_proof", "label": "Address Proof"},
              {"value": "police_verification", "label": "Police Verification Certificate"},
              {"value": "medical_certificate", "label": "Medical Fitness Certificate"}
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
              {"value": "phone_interview", "label": "Phone Interview"},
              {"value": "in_person_interview", "label": "In-Person Interview"},
              {"value": "driving_test", "label": "Driving Test"},
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

## Usage Guide

This template is designed for creating driver and delivery job postings on the eBidPortal platform. The schema includes industry-specific fields for:

- **Vehicle and License Requirements**: Ensures candidates meet legal and operational standards
- **Safety and Certification Standards**: Promotes safe driving practices and professional qualifications
- **Compensation Structures**: Includes delivery bonuses, fuel allowances, and overtime pay
- **Route and Experience Requirements**: Matches drivers to appropriate delivery territories

## API Integration

To use this template with the eBidPortal API:

1. **Create Template**: POST the JSON schema to `/api/v1/schema-templates`
2. **Assign to Category**: Use `/api/v1/templates/{id}/assign-category` to link with job categories
3. **Generate Forms**: GET `/api/v1/catalog/categories/{id}/schema` returns the complete form structure

## Industry Standards

This template complies with:
- **Motor Vehicles Act, 1988** (India) licensing requirements
- **Road Transport Corporation** guidelines for commercial drivers
- **IS 14687:1999** standards for driver training and certification
- **International Labour Organization** standards for transport workers

## Validation Rules

- License validity minimum 1 year
- Salary minimum ₹8,000/month
- Experience tracking in years
- Comprehensive document verification requirements
- Safety certification preferences