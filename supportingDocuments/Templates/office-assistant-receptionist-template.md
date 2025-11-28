# Office Assistant & Receptionist Job Template for eBidPortal

**Template Name:** Office Assistant & Receptionist Job Template
**Version:** 1.0
**Category Type:** jobs
**Created:** November 21, 2025
**Industry Standards:** Based on administrative and office support industry standards, customer service guidelines, and workplace safety regulations

## Template JSON Structure

```json
{
  "name": "Office Assistant & Receptionist Job Template",
  "description": "Industry-standard template for administrative and reception support job postings. Includes comprehensive fields covering administrative skills, communication abilities, office software proficiency, and front-desk operations specific to office and administrative support roles.",
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
            "placeholder": "e.g., Office Assistant, Receptionist, Administrative Assistant",
            "helpText": "Enter the specific job title for this administrative position"
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
            "placeholder": "e.g., Mumbai, Maharashtra or specific office address",
            "helpText": "Office location and address"
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
              {"value": "internship", "label": "Internship"}
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
              {"value": "morning", "label": "Morning (9 AM - 5 PM)"},
              {"value": "afternoon", "label": "Afternoon (1 PM - 9 PM)"},
              {"value": "night", "label": "Night Shift"},
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
            "helpText": "Required experience level for this administrative position"
          }
        },
        {
          "name": "department",
          "label": "Department",
          "type": "text",
          "required": false,
          "validation": ["max_length:50"],
          "ui_config": {
            "placeholder": "e.g., Administration, Front Office, HR",
            "helpText": "Department where the position is located"
          }
        }
      ]
    },
    {
      "title": "Requirements & Qualifications",
      "order": 2,
      "description": "Education, skills, and professional requirements",
      "is_collapsible": false,
      "fields": [
        {
          "name": "education_level",
          "label": "Education Level",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "high_school", "label": "High School (10th)"},
              {"value": "intermediate", "label": "Intermediate (12th)"},
              {"value": "graduation", "label": "Graduation (Bachelor's)"},
              {"value": "post_graduation", "label": "Post Graduation (Master's)"},
              {"value": "diploma", "label": "Diploma/Certificate"}
            ],
            "helpText": "Minimum education qualification required"
          }
        },
        {
          "name": "computer_skills",
          "label": "Computer Skills",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "ms_office", "label": "MS Office (Word, Excel, PowerPoint)"},
              {"value": "google_workspace", "label": "Google Workspace"},
              {"value": "typing", "label": "Typing (30+ WPM)"},
              {"value": "email_management", "label": "Email Management"},
              {"value": "data_entry", "label": "Data Entry"},
              {"value": "basic_accounting", "label": "Basic Accounting Software"}
            ],
            "helpText": "Required computer and software skills"
          }
        },
        {
          "name": "communication_skills",
          "label": "Communication Skills",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "english", "label": "English Proficiency"},
              {"value": "hindi", "label": "Hindi Proficiency"},
              {"value": "regional_language", "label": "Regional Language"},
              {"value": "telephone_etiquette", "label": "Telephone Etiquette"},
              {"value": "customer_service", "label": "Customer Service Skills"},
              {"value": "written_communication", "label": "Written Communication"}
            ],
            "helpText": "Required communication and language skills"
          }
        },
        {
          "name": "experience_years",
          "label": "Administrative Experience (Years)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:50"],
          "ui_config": {
            "placeholder": "e.g., 2",
            "helpText": "Minimum years of administrative/office experience required"
          }
        },
        {
          "name": "certifications",
          "label": "Preferred Certifications",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "computer_course", "label": "Computer Course Certification"},
              {"value": "tally", "label": "Tally Accounting"},
              {"value": "stenography", "label": "Stenography"},
              {"value": "secretarial_practice", "label": "Secretarial Practice"},
              {"value": "customer_service", "label": "Customer Service Training"}
            ],
            "helpText": "Preferred certifications and training"
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
              {"value": "reception_duties", "label": "Front Desk/Reception Duties"},
              {"value": "phone_handling", "label": "Telephone Handling"},
              {"value": "visitor_management", "label": "Visitor Management"},
              {"value": "document_management", "label": "Document Filing & Management"},
              {"value": "data_entry", "label": "Data Entry & Processing"},
              {"value": "appointment_scheduling", "label": "Appointment Scheduling"},
              {"value": "correspondence", "label": "Office Correspondence"},
              {"value": "basic_accounting", "label": "Basic Accounting Tasks"}
            ],
            "helpText": "Primary responsibilities for this position"
          }
        },
        {
          "name": "work_environment",
          "label": "Work Environment Preferences",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "corporate_office", "label": "Corporate Office"},
              {"value": "hospital", "label": "Hospital/Clinic"},
              {"value": "educational", "label": "Educational Institution"},
              {"value": "retail", "label": "Retail/Showroom"},
              {"value": "government", "label": "Government Office"},
              {"value": "startup", "label": "Startup Environment"}
            ],
            "helpText": "Type of work environment"
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
              {"value": "performance_bonus", "label": "Performance Bonus"},
              {"value": "attendance_bonus", "label": "Attendance Bonus"},
              {"value": "yearly_increment", "label": "Annual Increment"},
              {"value": "overtime_pay", "label": "Overtime Pay"},
              {"value": "conveyance_allowance", "label": "Conveyance Allowance"}
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
              {"value": "paid_leave", "label": "Paid Leave (CL/SL)"},
              {"value": "provident_fund", "label": "Provident Fund"},
              {"value": "gratuity", "label": "Gratuity"},
              {"value": "maternity_leave", "label": "Maternity Leave"},
              {"value": "meal_allowance", "label": "Meal Allowance"},
              {"value": "uniform_allowance", "label": "Uniform Allowance"}
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
              {"value": "it_software", "label": "IT/Software"},
              {"value": "healthcare", "label": "Healthcare"},
              {"value": "education", "label": "Education"},
              {"value": "finance", "label": "Finance/Banking"},
              {"value": "retail", "label": "Retail"},
              {"value": "manufacturing", "label": "Manufacturing"},
              {"value": "consulting", "label": "Consulting"},
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
          "name": "team_size",
          "label": "Team Size",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "individual", "label": "Individual Contributor"},
              {"value": "small_team", "label": "Small Team (2-5 members)"},
              {"value": "medium_team", "label": "Medium Team (6-15 members)"},
              {"value": "large_team", "label": "Large Team (15+ members)"}
            ],
            "helpText": "Size of the team this position will work with"
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
              {"value": "experience_letters", "label": "Experience Letters"},
              {"value": "aadhar_card", "label": "Aadhar Card"},
              {"value": "pan_card", "label": "PAN Card"},
              {"value": "address_proof", "label": "Address Proof"},
              {"value": "photo", "label": "Recent Photograph"}
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
              {"value": "written_test", "label": "Written Test"},
              {"value": "phone_interview", "label": "Phone Interview"},
              {"value": "in_person_interview", "label": "In-Person Interview"},
              {"value": "multiple_rounds", "label": "Multiple Interview Rounds"},
              {"value": "typing_test", "label": "Typing/Skill Test"}
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

This template is designed for creating office assistant and receptionist job postings on the eBidPortal platform. The schema includes industry-specific fields for:

- **Administrative Skills**: MS Office proficiency, typing speed, data entry capabilities
- **Communication Abilities**: Language skills, telephone etiquette, customer service
- **Office Operations**: Reception duties, document management, appointment scheduling
- **Professional Development**: Certifications, training opportunities, career progression

## API Integration

To use this template with the eBidPortal API:

1. **Create Template**: POST the JSON schema to `/api/v1/schema-templates`
2. **Assign to Category**: Use `/api/v1/templates/{id}/assign-category` to link with job categories
3. **Generate Forms**: GET `/api/v1/catalog/categories/{id}/schema` returns the complete form structure

## Industry Standards

This template complies with:
- **Administrative Professional Standards** for office support roles
- **Customer Service Excellence** guidelines
- **Data Protection and Privacy** regulations for handling sensitive information
- **Workplace Safety Standards** for office environments

## Validation Rules

- Education level requirements with clear progression
- Computer skills validation for essential office software
- Communication proficiency in multiple languages
- Experience tracking with realistic ranges
- Comprehensive benefits and compensation structures