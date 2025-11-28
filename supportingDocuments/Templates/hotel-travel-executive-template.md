# Hotel & Travel Executive Job Template for eBidPortal

**Template Name:** Hotel & Travel Executive Job Template
**Version:** 1.0
**Category Type:** jobs
**Created:** November 21, 2025
**Industry Standards:** Based on hospitality industry standards, tourism certifications, customer service excellence, travel planning expertise, and hotel operations best practices for hotel managers, travel consultants, tour operators, and hospitality professionals.

## Template JSON Structure

```json
{
  "name": "Hotel & Travel Executive Job Template",
  "description": "Industry-standard template for hotel and travel executive job postings. Includes comprehensive fields covering hospitality expertise, travel planning skills, customer service excellence, tourism industry knowledge, and hotel operations standards specific to hotel managers, travel agents, tour operators, and hospitality service professionals.",
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
            "placeholder": "e.g., Hotel Manager, Travel Consultant, Tour Operator",
            "helpText": "Enter the specific hospitality/travel position title"
          }
        },
        {
          "name": "company_name",
          "label": "Company Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:100"],
          "ui_config": {
            "placeholder": "Enter hotel chain, travel agency, or tourism company name",
            "helpText": "Name of the hospitality/travel company offering this position"
          }
        },
        {
          "name": "location",
          "label": "Work Location",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3"],
          "ui_config": {
            "placeholder": "e.g., Mumbai Hotel District, Delhi or specific hotel/office address",
            "helpText": "Location of the hotel/office"
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
              {"value": "commission_based", "label": "Commission Based"},
              {"value": "seasonal", "label": "Seasonal/Temporary"}
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
              {"value": "evening_shift", "label": "Evening Shift (2 PM - 10 PM)"},
              {"value": "night_shift", "label": "Night Shift (10 PM - 6 AM)"},
              {"value": "rotating", "label": "Rotating Shifts"},
              {"value": "flexible", "label": "Flexible Hours"},
              {"value": "on_call", "label": "On-Call Availability"}
            ],
            "helpText": "Primary shift timing for hospitality operations"
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
              {"value": "intermediate", "label": "Intermediate (2-5 years)"},
              {"value": "experienced", "label": "Experienced (5-8 years)"},
              {"value": "senior", "label": "Senior Executive (8-12 years)"},
              {"value": "manager", "label": "Manager/Director (12+ years)"}
            ],
            "helpText": "Required hospitality/travel experience level"
          }
        },
        {
          "name": "specialization_area",
          "label": "Specialization Area",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "hotel_management", "label": "Hotel Management"},
              {"value": "travel_agency", "label": "Travel Agency Operations"},
              {"value": "tour_operations", "label": "Tour Operations"},
              {"value": "corporate_travel", "label": "Corporate Travel Management"},
              {"value": "luxury_travel", "label": "Luxury Travel & Concierge"},
              {"value": "adventure_tourism", "label": "Adventure Tourism"},
              {"value": "cruise_operations", "label": "Cruise Operations"},
              {"value": "event_management", "label": "Event & Wedding Planning"},
              {"value": "airline_services", "label": "Airline Ground Services"},
              {"value": "hospitality_services", "label": "General Hospitality Services"}
            ],
            "helpText": "Primary area of specialization in hospitality/travel"
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
              {"value": "graduation", "label": "Bachelor's Degree"},
              {"value": "hospitality_degree", "label": "Hospitality/Tourism Degree"},
              {"value": "business_degree", "label": "Business Administration Degree"},
              {"value": "masters_hospitality", "label": "Master's in Hospitality Management"},
              {"value": "diploma_hospitality", "label": "Hospitality Diploma/Certificate"}
            ],
            "helpText": "Minimum education qualification required"
          }
        },
        {
          "name": "hospitality_certifications",
          "label": "Hospitality & Travel Certifications",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "iata_certified", "label": "IATA Certified"},
              {"value": "ufta_certified", "label": "UFTA Certified"},
              {"value": "ahla_certified", "label": "AHLA Certified"},
              {"value": "chaa_certified", "label": "CHAA Certified"},
              {"value": "travel_agent_cert", "label": "Certified Travel Agent"},
              {"value": "tour_manager_cert", "label": "Certified Tour Manager"},
              {"value": "sommelier_cert", "label": "Sommelier Certification"},
              {"value": "spa_therapy_cert", "label": "Spa Therapy Certification"},
              {"value": "event_planning_cert", "label": "Event Planning Certification"},
              {"value": "customer_service_cert", "label": "Customer Service Excellence"}
            ],
            "helpText": "Preferred hospitality and travel certifications"
          }
        },
        {
          "name": "core_competencies",
          "label": "Core Competencies",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "customer_service", "label": "Exceptional Customer Service"},
              {"value": "communication_skills", "label": "Communication Skills"},
              {"value": "problem_solving", "label": "Problem Solving"},
              {"value": "sales_marketing", "label": "Sales & Marketing"},
              {"value": "negotiation", "label": "Negotiation Skills"},
              {"value": "multitasking", "label": "Multitasking Ability"},
              {"value": "cultural_awareness", "label": "Cultural Awareness"},
              {"value": "crisis_management", "label": "Crisis Management"},
              {"value": "time_management", "label": "Time Management"},
              {"value": "leadership", "label": "Leadership Skills"}
            ],
            "helpText": "Required core competencies for hospitality role"
          }
        },
        {
          "name": "technical_skills",
          "label": "Technical Skills",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "reservation_systems", "label": "Hotel Reservation Systems"},
              {"value": "gds_systems", "label": "Global Distribution Systems (GDS)"},
              {"value": "pms_systems", "label": "Property Management Systems"},
              {"value": "travel_booking", "label": "Online Travel Booking Platforms"},
              {"value": "crm_software", "label": "CRM Software"},
              {"value": "accounting_software", "label": "Hospitality Accounting Software"},
              {"value": "ms_office", "label": "MS Office Suite"},
              {"value": "social_media", "label": "Social Media Management"},
              {"value": "foreign_languages", "label": "Foreign Language Proficiency"},
              {"value": "presentation_skills", "label": "Presentation Skills"}
            ],
            "helpText": "Required technical and software skills"
          }
        },
        {
          "name": "experience_years",
          "label": "Hospitality/Travel Experience (Years)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:50"],
          "ui_config": {
            "placeholder": "e.g., 3",
            "helpText": "Minimum years of hospitality/travel industry experience required"
          }
        },
        {
          "name": "languages",
          "label": "Language Proficiency",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "english", "label": "English (Fluent)"},
              {"value": "hindi", "label": "Hindi"},
              {"value": "regional", "label": "Regional Language"},
              {"value": "french", "label": "French"},
              {"value": "german", "label": "German"},
              {"value": "japanese", "label": "Japanese"},
              {"value": "chinese", "label": "Chinese (Mandarin)"},
              {"value": "arabic", "label": "Arabic"},
              {"value": "spanish", "label": "Spanish"},
              {"value": "italian", "label": "Italian"}
            ],
            "helpText": "Required language skills for international clientele"
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
              {"value": "customer_service", "label": "Customer Service & Guest Relations"},
              {"value": "reservation_management", "label": "Reservation & Booking Management"},
              {"value": "travel_planning", "label": "Travel Itinerary Planning"},
              {"value": "sales_target", "label": "Achieving Sales Targets"},
              {"value": "vendor_coordination", "label": "Vendor & Supplier Coordination"},
              {"value": "complaint_resolution", "label": "Complaint Resolution"},
              {"value": "team_supervision", "label": "Team Supervision & Training"},
              {"value": "revenue_management", "label": "Revenue Management"},
              {"value": "marketing_promotion", "label": "Marketing & Promotion"},
              {"value": "quality_assurance", "label": "Quality Assurance & Standards"}
            ],
            "helpText": "Primary responsibilities for this hospitality position"
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
            "placeholder": "e.g., 20000",
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
            "placeholder": "e.g., 50000",
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
              {"value": "commission", "label": "Sales Commission"},
              {"value": "performance_bonus", "label": "Performance Bonus"},
              {"value": "incentive_trips", "label": "Incentive Trips"},
              {"value": "service_charges", "label": "Service Charges"},
              {"value": "overtime_pay", "label": "Overtime Pay"},
              {"value": "meal_allowance", "label": "Meal Allowance"},
              {"value": "uniform_allowance", "label": "Uniform Allowance"},
              {"value": "travel_allowance", "label": "Travel Allowance"},
              {"value": "mobile_allowance", "label": "Mobile/Phone Allowance"}
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
              {"value": "accommodation", "label": "Staff Accommodation"},
              {"value": "meal_privileges", "label": "Free Meals"},
              {"value": "travel_discounts", "label": "Travel Discounts"},
              {"value": "hotel_stays", "label": "Complimentary Hotel Stays"},
              {"value": "training_programs", "label": "Training & Development"},
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
      "title": "Company & Operations Details",
      "order": 4,
      "description": "Information about the company and operational environment",
      "is_collapsible": true,
      "fields": [
        {
          "name": "company_type",
          "label": "Company Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "hotel_chain", "label": "Hotel Chain/Brand"},
              {"value": "boutique_hotel", "label": "Boutique Hotel"},
              {"value": "resort_spa", "label": "Resort & Spa"},
              {"value": "travel_agency", "label": "Travel Agency"},
              {"value": "tour_operator", "label": "Tour Operator"},
              {"value": "corporate_travel", "label": "Corporate Travel Company"},
              {"value": "airline_services", "label": "Airline Services"},
              {"value": "event_management", "label": "Event Management Company"},
              {"value": "cruise_company", "label": "Cruise Company"},
              {"value": "hospitality_consulting", "label": "Hospitality Consulting"}
            ],
            "helpText": "Type of hospitality/travel company"
          }
        },
        {
          "name": "service_area",
          "label": "Service Area/Geographic Focus",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "domestic_india", "label": "Domestic (India)"},
              {"value": "international", "label": "International"},
              {"value": "asia_pacific", "label": "Asia Pacific"},
              {"value": "middle_east", "label": "Middle East"},
              {"value": "europe", "label": "Europe"},
              {"value": "americas", "label": "Americas"},
              {"value": "africa", "label": "Africa"},
              {"value": "luxury_segment", "label": "Luxury Segment"},
              {"value": "business_travel", "label": "Business Travel"},
              {"value": "leisure_tourism", "label": "Leisure Tourism"}
            ],
            "helpText": "Geographic or market focus of operations"
          }
        },
        {
          "name": "star_rating",
          "label": "Hotel Star Rating (if applicable)",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "budget", "label": "Budget (1-2 stars)"},
              {"value": "mid_range", "label": "Mid-range (3 stars)"},
              {"value": "business", "label": "Business Hotel (4 stars)"},
              {"value": "luxury", "label": "Luxury (5 stars)"},
              {"value": "ultra_luxury", "label": "Ultra Luxury (5+ stars)"}
            ],
            "helpText": "Hotel star rating category"
          }
        },
        {
          "name": "peak_season",
          "label": "Peak Season Period",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "december_february", "label": "December-February (Winter)"},
              {"value": "march_may", "label": "March-May (Spring)"},
              {"value": "june_august", "label": "June-August (Summer)"},
              {"value": "september_november", "label": "September-November (Autumn)"},
              {"value": "festival_season", "label": "Festival Season"},
              {"value": "holiday_season", "label": "Holiday Season"},
              {"value": "year_round", "label": "Year-round Operations"}
            ],
            "helpText": "Peak operational seasons"
          }
        },
        {
          "name": "work_environment",
          "label": "Work Environment",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "front_office", "label": "Front Office Operations"},
              {"value": "back_office", "label": "Back Office Support"},
              {"value": "field_work", "label": "Field Work/Travel"},
              {"value": "customer_facing", "label": "Customer-Facing Role"},
              {"value": "team_environment", "label": "Team Environment"},
              {"value": "fast_paced", "label": "Fast-Paced Environment"},
              {"value": "multicultural", "label": "Multicultural Environment"},
              {"value": "luxury_service", "label": "Luxury Service Standards"}
            ],
            "helpText": "Working conditions and environment"
          }
        },
        {
          "name": "company_description",
          "label": "Company Description",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Brief description of the hotel chain, travel agency, services offered, and work culture",
            "helpText": "Overview of the company and its operations"
          }
        },
        {
          "name": "team_size",
          "label": "Team Size",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "small", "label": "Small Team (2-10 members)"},
              {"value": "medium", "label": "Medium Team (11-50 members)"},
              {"value": "large", "label": "Large Team (51-200 members)"},
              {"value": "extra_large", "label": "Large Organization (200+ members)"}
            ],
            "helpText": "Size of the hospitality/travel team"
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
              {"value": "cover_letter", "label": "Cover Letter"},
              {"value": "educational_certificates", "label": "Educational Certificates"},
              {"value": "hospitality_certificates", "label": "Hospitality Certifications"},
              {"value": "experience_letters", "label": "Experience Letters"},
              {"value": "police_verification", "label": "Police Verification Certificate"},
              {"value": "medical_certificate", "label": "Medical Fitness Certificate"},
              {"value": "aadhar_card", "label": "Aadhar Card"},
              {"value": "pan_card", "label": "PAN Card"},
              {"value": "photo", "label": "Recent Photograph"},
              {"value": "language_certificates", "label": "Language Proficiency Certificates"}
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
              {"value": "group_interview", "label": "Group Interview"},
              {"value": "role_play", "label": "Role-Play/Customer Service Test"},
              {"value": "multiple_rounds", "label": "Multiple Interview Rounds"},
              {"value": "panel_interview", "label": "Panel Interview"},
              {"value": "final_presentation", "label": "Final Presentation"}
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
          "name": "reference_check",
          "label": "Reference Check Required",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Whether employment references will be checked"
          }
        },
        {
          "name": "contact_email",
          "label": "Contact Email",
          "type": "email",
          "required": true,
          "validation": ["required", "email"],
          "ui_config": {
            "placeholder": "hr@hotel.com",
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