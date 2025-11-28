# Cook, Chef & Kitchen Staff Job Template for eBidPortal

**Template Name:** Cook, Chef & Kitchen Staff Job Template
**Version:** 1.0
**Category Type:** jobs
**Created:** November 21, 2025
**Industry Standards:** Based on hospitality industry standards, food safety regulations, culinary certifications, and kitchen operations best practices

## Template JSON Structure

```json
{
  "name": "Cook, Chef & Kitchen Staff Job Template",
  "description": "Industry-standard template for culinary and kitchen staff job postings. Includes comprehensive fields covering cooking expertise, food safety certifications, kitchen operations, and hospitality industry standards specific to chefs, cooks, and kitchen staff roles.",
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
            "placeholder": "e.g., Executive Chef, Line Cook, Kitchen Assistant",
            "helpText": "Enter the specific culinary position title"
          }
        },
        {
          "name": "company_name",
          "label": "Restaurant/Hotel Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:100"],
          "ui_config": {
            "placeholder": "Enter restaurant, hotel, or catering company name",
            "helpText": "Name of the establishment offering this position"
          }
        },
        {
          "name": "location",
          "label": "Work Location",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3"],
          "ui_config": {
            "placeholder": "e.g., Mumbai, Maharashtra or specific restaurant address",
            "helpText": "Location of the kitchen/restaurant"
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
              {"value": "freelance", "label": "Freelance/Event Catering"}
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
              {"value": "morning", "label": "Morning (Breakfast/Lunch)"},
              {"value": "afternoon", "label": "Afternoon (Lunch/Dinner)"},
              {"value": "evening", "label": "Evening (Dinner/Late Night)"},
              {"value": "night", "label": "Night Shift"},
              {"value": "rotating", "label": "Rotating Shifts"},
              {"value": "split", "label": "Split Shifts"}
            ],
            "helpText": "Primary shift timing for kitchen operations"
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
              {"value": "senior", "label": "Senior Chef (5+ years)"},
              {"value": "executive", "label": "Executive Chef (8+ years)"}
            ],
            "helpText": "Required culinary experience level"
          }
        },
        {
          "name": "cuisine_specialization",
          "label": "Cuisine Specialization",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "indian", "label": "Indian Cuisine"},
              {"value": "chinese", "label": "Chinese Cuisine"},
              {"value": "continental", "label": "Continental Cuisine"},
              {"value": "italian", "label": "Italian Cuisine"},
              {"value": "mexican", "label": "Mexican Cuisine"},
              {"value": "thai", "label": "Thai Cuisine"},
              {"value": "japanese", "label": "Japanese Cuisine"},
              {"value": "middle_eastern", "label": "Middle Eastern Cuisine"},
              {"value": "fusion", "label": "Fusion Cuisine"},
              {"value": "bakery", "label": "Bakery & Desserts"},
              {"value": "vegetarian", "label": "Vegetarian/Vegan Cuisine"}
            ],
            "helpText": "Cuisine types the candidate should specialize in"
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
              {"value": "graduation", "label": "Graduation (Bachelor's)"},
              {"value": "diploma_hotel_management", "label": "Hotel Management Diploma"},
              {"value": "culinary_diploma", "label": "Culinary Arts Diploma"},
              {"value": "catering_course", "label": "Catering & Food Service Course"}
            ],
            "helpText": "Minimum education qualification required"
          }
        },
        {
          "name": "culinary_certifications",
          "label": "Culinary Certifications",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "food_safety", "label": "Food Safety & Hygiene Certification"},
              {"value": "fssai", "label": "FSSAI Certification"},
              {"value": "haccp", "label": "HACCP Certification"},
              {"value": "culinary_diploma", "label": "Professional Culinary Diploma"},
              {"value": "pastry_chef", "label": "Pastry Chef Certification"},
              {"value": "sommelier", "label": "Sommelier Certification"},
              {"value": "bartending", "label": "Bartending Certification"},
              {"value": "nutrition", "label": "Nutrition & Diet Certification"}
            ],
            "helpText": "Preferred culinary and food safety certifications"
          }
        },
        {
          "name": "kitchen_skills",
          "label": "Kitchen Skills & Equipment",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "knife_skills", "label": "Professional Knife Skills"},
              {"value": "cooking_techniques", "label": "Basic Cooking Techniques"},
              {"value": "food_presentation", "label": "Food Presentation & Plating"},
              {"value": "inventory_management", "label": "Kitchen Inventory Management"},
              {"value": "portion_control", "label": "Portion Control"},
              {"value": "menu_planning", "label": "Menu Planning"},
              {"value": "cost_control", "label": "Food Cost Control"},
              {"value": "kitchen_safety", "label": "Kitchen Safety Protocols"},
              {"value": "equipment_operation", "label": "Commercial Kitchen Equipment"},
              {"value": "baking", "label": "Baking & Pastry Skills"}
            ],
            "helpText": "Required kitchen skills and competencies"
          }
        },
        {
          "name": "experience_years",
          "label": "Culinary Experience (Years)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:50"],
          "ui_config": {
            "placeholder": "e.g., 3",
            "helpText": "Minimum years of kitchen/culinary experience required"
          }
        },
        {
          "name": "languages",
          "label": "Language Proficiency",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "english", "label": "English"},
              {"value": "hindi", "label": "Hindi"},
              {"value": "regional", "label": "Regional Language"},
              {"value": "french", "label": "French (for fine dining)"},
              {"value": "german", "label": "German"},
              {"value": "japanese", "label": "Japanese"}
            ],
            "helpText": "Required language skills for kitchen communication"
          }
        },
        {
          "name": "physical_requirements",
          "label": "Physical Requirements",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "standing_long", "label": "Long hours of standing"},
              {"value": "lifting_heavy", "label": "Lifting heavy pots/pans"},
              {"value": "fast_paced", "label": "Working in fast-paced environment"},
              {"value": "heat_tolerance", "label": "Tolerance to kitchen heat"},
              {"value": "flexible_hours", "label": "Flexible working hours"},
              {"value": "weekend_work", "label": "Weekend work availability"}
            ],
            "helpText": "Physical demands of the kitchen environment"
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
              {"value": "food_preparation", "label": "Food Preparation & Cooking"},
              {"value": "menu_execution", "label": "Menu Execution"},
              {"value": "quality_control", "label": "Quality Control & Food Safety"},
              {"value": "kitchen_cleanliness", "label": "Kitchen Cleanliness & Hygiene"},
              {"value": "inventory_management", "label": "Inventory Management"},
              {"value": "staff_supervision", "label": "Kitchen Staff Supervision"},
              {"value": "cost_management", "label": "Food Cost Management"},
              {"value": "special_orders", "label": "Special Dietary Orders"},
              {"value": "catering_events", "label": "Catering & Event Cooking"}
            ],
            "helpText": "Primary responsibilities for this culinary position"
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
              {"value": "food_allowance", "label": "Food Allowance"},
              {"value": "uniform_allowance", "label": "Uniform Allowance"},
              {"value": "overtime_pay", "label": "Overtime Pay"},
              {"value": "performance_bonus", "label": "Performance Bonus"},
              {"value": "tips_gratuity", "label": "Tips & Gratuity"},
              {"value": "accommodation", "label": "Accommodation Provided"},
              {"value": "transportation", "label": "Transportation Allowance"}
            ],
            "helpText": "Additional compensation and perks"
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
              {"value": "meal_allowance", "label": "Free Meals"},
              {"value": "skill_development", "label": "Skill Development Programs"},
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
      "title": "Establishment Details",
      "order": 4,
      "description": "Information about the restaurant, hotel, or catering establishment",
      "is_collapsible": true,
      "fields": [
        {
          "name": "establishment_type",
          "label": "Establishment Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "fine_dining", "label": "Fine Dining Restaurant"},
              {"value": "casual_dining", "label": "Casual Dining Restaurant"},
              {"value": "fast_food", "label": "Fast Food Chain"},
              {"value": "cafe", "label": "Cafe/Bistro"},
              {"value": "hotel_restaurant", "label": "Hotel Restaurant"},
              {"value": "catering", "label": "Catering Company"},
              {"value": "banquet_hall", "label": "Banquet Hall"},
              {"value": "food_truck", "label": "Food Truck/Mobile Kitchen"},
              {"value": "bakery", "label": "Bakery"},
              {"value": "cloud_kitchen", "label": "Cloud Kitchen"}
            ],
            "helpText": "Type of food service establishment"
          }
        },
        {
          "name": "cuisine_type",
          "label": "Primary Cuisine Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "indian", "label": "Indian"},
              {"value": "chinese", "label": "Chinese"},
              {"value": "continental", "label": "Continental"},
              {"value": "italian", "label": "Italian"},
              {"value": "multi_cuisine", "label": "Multi-Cuisine"},
              {"value": "regional", "label": "Regional/Specialty"},
              {"value": "international", "label": "International"}
            ],
            "helpText": "Primary cuisine served at the establishment"
          }
        },
        {
          "name": "capacity",
          "label": "Seating Capacity",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "small", "label": "Small (1-50 seats)"},
              {"value": "medium", "label": "Medium (51-150 seats)"},
              {"value": "large", "label": "Large (151-300 seats)"},
              {"value": "extra_large", "label": "Extra Large (300+ seats)"},
              {"value": "takeaway_only", "label": "Takeaway/Delivery Only"}
            ],
            "helpText": "Seating capacity of the establishment"
          }
        },
        {
          "name": "establishment_description",
          "label": "Establishment Description",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Brief description of the restaurant/hotel, its ambiance, specialties, and work environment",
            "helpText": "Overview of the establishment and kitchen operations"
          }
        },
        {
          "name": "kitchen_facilities",
          "label": "Kitchen Facilities",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "commercial_equipment", "label": "Commercial Kitchen Equipment"},
              {"value": "modern_appliances", "label": "Modern Appliances"},
              {"value": "cold_storage", "label": "Cold Storage Facilities"},
              {"value": "food_processor", "label": "Food Processing Equipment"},
              {"value": "bakery_equipment", "label": "Bakery Equipment"},
              {"value": "dishwashing", "label": "Automated Dishwashing"},
              {"value": "waste_management", "label": "Waste Management System"}
            ],
            "helpText": "Available kitchen facilities and equipment"
          }
        },
        {
          "name": "team_size",
          "label": "Kitchen Team Size",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "small", "label": "Small Team (2-5 members)"},
              {"value": "medium", "label": "Medium Team (6-15 members)"},
              {"value": "large", "label": "Large Team (16-30 members)"},
              {"value": "extra_large", "label": "Large Brigade (30+ members)"}
            ],
            "helpText": "Size of the kitchen team"
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
              {"value": "food_safety_cert", "label": "Food Safety Certification"},
              {"value": "experience_letters", "label": "Experience Letters"},
              {"value": "police_verification", "label": "Police Verification Certificate"},
              {"value": "medical_certificate", "label": "Medical Fitness Certificate"},
              {"value": "aadhar_card", "label": "Aadhar Card"},
              {"value": "pan_card", "label": "PAN Card"},
              {"value": "photo", "label": "Recent Photograph"},
              {"value": "culinary_portfolio", "label": "Culinary Portfolio/Samples"}
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
              {"value": "practical_test", "label": "Practical Cooking Test"},
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
          "name": "contact_email",
          "label": "Contact Email",
          "type": "email",
          "required": true,
          "validation": ["required", "email"],
          "ui_config": {
            "placeholder": "hr@restaurant.com",
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