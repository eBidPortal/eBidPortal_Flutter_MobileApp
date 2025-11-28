# BPO & Telecaller Jobs Template

**File:** `bpo-telecaller-template.md`
**Purpose:** Industry-level template for BPO & Telecaller job postings in eBidPortal marketplace
**Created:** November 21, 2025
**Last Updated:** November 21, 2025
**Category:** Jobs - BPO & Telecaller
**Subcategories:** Telecalling, Customer Service, BPO Operations, Technical Support, Voice Process

---

## 📋 BPO & Telecaller Jobs Template Overview

This template provides a comprehensive, industry-standard structure for BPO & Telecaller job postings in the eBidPortal marketplace. It covers telecalling positions, customer service roles, BPO operations, and voice process jobs with professional specifications, performance metrics, and quality standards.

### Key Features
- **Voice Excellence**: Communication skills, accent training, and voice quality standards
- **Customer Service**: Problem resolution, empathy, and customer satisfaction metrics
- **BPO Operations**: Process adherence, quality standards, and operational efficiency
- **Performance Metrics**: KPI tracking, call quality scores, and productivity benchmarks
- **Shift Flexibility**: 24/7 operations, rotational shifts, and work-life balance
- **Technology Proficiency**: Call center software, CRM systems, and communication tools
- **Quality Assurance**: Call monitoring, feedback systems, and continuous improvement

### Template Structure
- **5 Main Sections**: Job Information, Requirements & Qualifications, Compensation & Benefits, Company Information, Application Process
- **50+ Fields**: Comprehensive coverage of BPO and telecalling job requirements
- **Validation Rules**: Industry-standard qualification checks and performance metrics
- **UI Configuration**: User-friendly forms with BPO/telecalling-specific guidance

---

## 🔧 Template JSON Structure

```json
{
  "name": "BPO & Telecaller Jobs Template",
  "description": "Comprehensive template for BPO and telecaller job postings including customer service, voice process, technical support, and call center operations with industry-standard specifications and performance metrics",
  "category_type": "jobs_bpo_telecaller",
  "is_active": true,
  "sections": [
    {
      "title": "Job Information",
      "order": 1,
      "description": "Basic job posting identification and classification",
      "is_collapsible": false,
      "fields": [
        {
          "name": "job_title",
          "label": "Job Title",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:5", "max_length:100"],
          "ui_config": {
            "placeholder": "e.g., Senior Telecaller, Customer Service Executive",
            "helpText": "Clear, specific job title including seniority level"
          }
        },
        {
          "name": "job_category",
          "label": "Job Category",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "placeholder": "Select primary job category",
            "options": [
              {"value": "telecaller", "label": "Telecaller"},
              {"value": "customer_service", "label": "Customer Service Executive"},
              {"value": "bpo_operations", "label": "BPO Operations"},
              {"value": "technical_support", "label": "Technical Support"},
              {"value": "voice_process", "label": "Voice Process"},
              {"value": "inbound_calls", "label": "Inbound Call Handling"},
              {"value": "outbound_calls", "label": "Outbound Call Handling"},
              {"value": "collections", "label": "Collections & Recovery"},
              {"value": "surveys", "label": "Survey & Research"},
              {"value": "appointment_setting", "label": "Appointment Setting"}
            ],
            "helpText": "Primary category for this BPO/telecalling role"
          }
        },
        {
          "name": "company_name",
          "label": "Company Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:100"],
          "ui_config": {
            "placeholder": "Company or BPO organization name",
            "helpText": "Full legal name of the employing organization"
          }
        },
        {
          "name": "location",
          "label": "Work Location",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3", "max_length:200"],
          "ui_config": {
            "placeholder": "City, State/Province, Country",
            "helpText": "Primary work location (usually office-based for BPO roles)"
          }
        },
        {
          "name": "employment_type",
          "label": "Employment Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "placeholder": "Select employment arrangement",
            "options": [
              {"value": "full_time", "label": "Full Time"},
              {"value": "part_time", "label": "Part Time"},
              {"value": "contract", "label": "Contract"},
              {"value": "temporary", "label": "Temporary"},
              {"value": "freelance", "label": "Freelance"},
              {"value": "internship", "label": "Internship"}
            ],
            "helpText": "Type of employment arrangement offered"
          }
        },
        {
          "name": "job_description",
          "label": "Job Description",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:100", "max_length:3000"],
          "ui_config": {
            "placeholder": "Detailed description of job responsibilities, call types, and objectives",
            "helpText": "Comprehensive overview of the role, responsibilities, and performance expectations"
          }
        },
        {
          "name": "department",
          "label": "Department/Division",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "e.g., Customer Care, Collections, Technical Support",
            "helpText": "Department or division where this position is located"
          }
        },
        {
          "name": "reporting_to",
          "label": "Reports To",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "Team Leader, Supervisor, or Manager title",
            "helpText": "Position title of the direct supervisor"
          }
        },
        {
          "name": "call_type",
          "label": "Call Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "placeholder": "Primary type of calls handled",
            "options": [
              {"value": "inbound_only", "label": "Inbound Calls Only"},
              {"value": "outbound_only", "label": "Outbound Calls Only"},
              {"value": "blended", "label": "Blended (Inbound & Outbound)"},
              {"value": "domestic", "label": "Domestic Calls"},
              {"value": "international", "label": "International Calls"}
            ],
            "helpText": "Type of calls this position will handle"
          }
        }
      ]
    },
    {
      "title": "Requirements & Qualifications",
      "order": 2,
      "description": "Skills, experience, and qualification requirements",
      "is_collapsible": false,
      "fields": [
        {
          "name": "experience_level",
          "label": "Experience Level",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "placeholder": "Select required experience level",
            "options": [
              {"value": "fresher", "label": "Fresher (0-6 months)"},
              {"value": "entry_level", "label": "Entry Level (6 months-2 years)"},
              {"value": "intermediate", "label": "Intermediate (2-5 years)"},
              {"value": "experienced", "label": "Experienced (5+ years)"}
            ],
            "helpText": "Required years of relevant BPO/call center experience"
          }
        },
        {
          "name": "education_requirements",
          "label": "Education Requirements",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "placeholder": "Select minimum education level",
            "options": [
              {"value": "high_school", "label": "High School Diploma"},
              {"value": "intermediate", "label": "Intermediate/+2"},
              {"value": "bachelor_degree", "label": "Bachelor's Degree"},
              {"value": "master_degree", "label": "Master's Degree"},
              {"value": "any_graduate", "label": "Any Graduate"},
              {"value": "no_formal_education", "label": "No Formal Education Required"}
            ],
            "helpText": "Minimum educational qualification required"
          }
        },
        {
          "name": "required_skills",
          "label": "Required Skills",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "multiple": true,
            "options": [
              {"value": "excellent_communication", "label": "Excellent Communication Skills"},
              {"value": "active_listening", "label": "Active Listening"},
              {"value": "empathy", "label": "Empathy & Patience"},
              {"value": "problem_solving", "label": "Problem Solving"},
              {"value": "conflict_resolution", "label": "Conflict Resolution"},
              {"value": "persuasion", "label": "Persuasion & Negotiation"},
              {"value": "multitasking", "label": "Multitasking Ability"},
              {"value": "stress_management", "label": "Stress Management"},
              {"value": "typing_speed", "label": "Fast Typing Speed (30+ WPM)"},
              {"value": "computer_skills", "label": "Basic Computer Skills"},
              {"value": "crm_software", "label": "CRM Software Proficiency"},
              {"value": "call_center_tools", "label": "Call Center Tools"},
              {"value": "english_proficiency", "label": "English Proficiency"},
              {"value": "accent_neutral", "label": "Accent Neutral English"},
              {"value": "product_knowledge", "label": "Product/Service Knowledge"}
            ],
            "helpText": "Select all required skills for this position"
          }
        },
        {
          "name": "language_requirements",
          "label": "Language Requirements",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "English (Fluent), Hindi (Native), etc.",
            "helpText": "Required languages and proficiency levels"
          }
        },
        {
          "name": "voice_quality",
          "label": "Voice Quality Requirements",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "Clear articulation, pleasant tone, professional demeanor",
            "helpText": "Specific voice and communication quality requirements"
          }
        },
        {
          "name": "certifications",
          "label": "Preferred Certifications",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Call center certifications, language proficiency certificates, etc.",
            "helpText": "Professional certifications that would be advantageous"
          }
        },
        {
          "name": "shift_requirements",
          "label": "Shift Requirements",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "placeholder": "Select shift type",
            "options": [
              {"value": "day_shift", "label": "Day Shift (9 AM - 6 PM)"},
              {"value": "evening_shift", "label": "Evening Shift (2 PM - 11 PM)"},
              {"value": "night_shift", "label": "Night Shift (11 PM - 8 AM)"},
              {"value": "rotational", "label": "Rotational Shifts"},
              {"value": "flexible", "label": "Flexible Shifts"},
              {"value": "us_shift", "label": "US Business Hours"},
              {"value": "uk_shift", "label": "UK Business Hours"}
            ],
            "helpText": "Work shift timing requirements"
          }
        },
        {
          "name": "performance_metrics",
          "label": "Key Performance Metrics",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Average call handling time, customer satisfaction scores, conversion rates, etc.",
            "helpText": "Key performance indicators and targets for the role"
          }
        },
        {
          "name": "training_provided",
          "label": "Training Provided",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Product training, communication skills, process training, etc.",
            "helpText": "Training programs and duration provided"
          }
        }
      ]
    },
    {
      "title": "Compensation & Benefits",
      "order": 3,
      "description": "Salary, benefits, and compensation details",
      "is_collapsible": false,
      "fields": [
        {
          "name": "salary_range_min",
          "label": "Minimum Salary",
          "type": "number",
          "required": true,
          "validation": ["required", "min:8000", "max:100000"],
          "ui_config": {
            "prefix": "$",
            "step": 500,
            "helpText": "Minimum monthly salary in USD"
          }
        },
        {
          "name": "salary_range_max",
          "label": "Maximum Salary",
          "type": "number",
          "required": true,
          "validation": ["required", "min:10000", "max:200000"],
          "ui_config": {
            "prefix": "$",
            "step": 500,
            "helpText": "Maximum monthly salary in USD"
          }
        },
        {
          "name": "salary_type",
          "label": "Salary Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "monthly", "label": "Monthly Salary"},
              {"value": "hourly", "label": "Hourly Rate"},
              {"value": "daily", "label": "Daily Rate"},
              {"value": "performance_based", "label": "Performance Based"}
            ],
            "helpText": "How the salary is structured"
          }
        },
        {
          "name": "incentives",
          "label": "Incentives & Bonuses",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Performance bonuses, attendance incentives, quality bonuses, etc.",
            "helpText": "Additional incentives and bonus structures"
          }
        },
        {
          "name": "salary_currency",
          "label": "Salary Currency",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "usd", "label": "USD ($)"},
              {"value": "eur", "label": "EUR (€)"},
              {"value": "gbp", "label": "GBP (£)"},
              {"value": "inr", "label": "INR (₹)"},
              {"value": "local", "label": "Local Currency"}
            ],
            "helpText": "Currency for salary figures"
          }
        },
        {
          "name": "benefits_offered",
          "label": "Benefits Offered",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "multiple": true,
            "options": [
              {"value": "health_insurance", "label": "Health Insurance"},
              {"value": "paid_time_off", "label": "Paid Time Off"},
              {"value": "sick_leave", "label": "Sick Leave"},
              {"value": "provident_fund", "label": "Provident Fund"},
              {"value": "gratuity", "label": "Gratuity"},
              {"value": "transportation", "label": "Transportation Allowance"},
              {"value": "meal_allowance", "label": "Meal Allowance"},
              {"value": "shift_allowance", "label": "Shift Allowance"},
              {"value": "overtime_pay", "label": "Overtime Pay"},
              {"value": "performance_bonus", "label": "Performance Bonus"},
              {"value": "flexible_hours", "label": "Flexible Working Hours"},
              {"value": "skill_development", "label": "Skill Development Programs"},
              {"value": "career_growth", "label": "Career Growth Opportunities"}
            ],
            "helpText": "Select all benefits offered with this position"
          }
        },
        {
          "name": "work_facilities",
          "label": "Work Facilities",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "AC environment, ergonomic chairs, headset provided, etc.",
            "helpText": "Facilities and equipment provided at workplace"
          }
        }
      ]
    },
    {
      "title": "Company Information",
      "order": 4,
      "description": "Company details and work environment",
      "is_collapsible": false,
      "fields": [
        {
          "name": "company_size",
          "label": "Company Size",
          "type": "select",
          "required": false,
          "ui_config": {
            "placeholder": "Select company size range",
            "options": [
              {"value": "small_bpo", "label": "Small BPO (50-200 seats)"},
              {"value": "medium_bpo", "label": "Medium BPO (200-1000 seats)"},
              {"value": "large_bpo", "label": "Large BPO (1000+ seats)"},
              {"value": "enterprise", "label": "Enterprise Level"}
            ],
            "helpText": "Approximate number of seats/employees"
          }
        },
        {
          "name": "industry",
          "label": "Industry Focus",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "e.g., Telecom, Banking, E-commerce, Healthcare",
            "helpText": "Primary industry or sector served"
          }
        },
        {
          "name": "company_description",
          "label": "Company Description",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Brief overview of the BPO company, services, and client portfolio",
            "helpText": "Company background and service offerings"
          }
        },
        {
          "name": "work_environment",
          "label": "Work Environment",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Call center setup, team structure, quality monitoring, etc.",
            "helpText": "Description of the work environment and operations"
          }
        },
        {
          "name": "client_types",
          "label": "Client Types",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "International clients, domestic clients, Fortune 500 companies, etc.",
            "helpText": "Types of clients and market segments served"
          }
        },
        {
          "name": "company_website",
          "label": "Company Website",
          "type": "url",
          "required": false,
          "validation": ["url"],
          "ui_config": {
            "placeholder": "https://www.bpo-company.com",
            "helpText": "Official company website URL"
          }
        },
        {
          "name": "company_logo",
          "label": "Company Logo",
          "type": "file",
          "required": false,
          "validation": ["fileType:jpeg,png,jpg", "fileSize:2097152"],
          "ui_config": {
            "accept": "image/*",
            "maxFiles": 1,
            "helpText": "Company logo image (max 2MB)"
          }
        },
        {
          "name": "quality_certifications",
          "label": "Quality Certifications",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "ISO 9001, COPC, Six Sigma, etc.",
            "helpText": "Quality certifications and standards achieved"
          }
        }
      ]
    },
    {
      "title": "Application Process",
      "order": 5,
      "description": "How to apply and application requirements",
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
          "name": "application_method",
          "label": "How to Apply",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "placeholder": "Select application method",
            "options": [
              {"value": "platform_apply", "label": "Apply through eBidPortal"},
              {"value": "walk_in", "label": "Walk-in Interview"},
              {"value": "online_test", "label": "Online Test & Interview"},
              {"value": "recruitment_agency", "label": "Through Recruitment Agency"},
              {"value": "company_website", "label": "Company Career Portal"},
              {"value": "email", "label": "Email Resume"}
            ],
            "helpText": "Preferred method for submitting applications"
          }
        },
        {
          "name": "contact_email",
          "label": "Contact Email",
          "type": "email",
          "required": false,
          "validation": ["email"],
          "ui_config": {
            "placeholder": "hr@bpo-company.com",
            "helpText": "Email address for application inquiries"
          }
        },
        {
          "name": "contact_phone",
          "label": "Contact Phone",
          "type": "phone",
          "required": false,
          "validation": ["phone"],
          "ui_config": {
            "placeholder": "+1-555-0123",
            "helpText": "Phone number for application inquiries"
          }
        },
        {
          "name": "required_documents",
          "label": "Required Documents",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "multiple": true,
            "options": [
              {"value": "resume_cv", "label": "Resume/CV"},
              {"value": "educational_certificates", "label": "Educational Certificates"},
              {"value": "id_proof", "label": "ID Proof"},
              {"value": "address_proof", "label": "Address Proof"},
              {"value": "experience_letters", "label": "Experience Letters"},
              {"value": "background_check", "label": "Background Check Consent"},
              {"value": "voice_sample", "label": "Voice Sample (for voice roles)"},
              {"value": "language_certificates", "label": "Language Proficiency Certificates"}
            ],
            "helpText": "Documents required for application"
          }
        },
        {
          "name": "selection_process",
          "label": "Selection Process",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Written test, voice audition, interview rounds, etc.",
            "helpText": "Details about the recruitment and selection process"
          }
        },
        {
          "name": "joining_process",
          "label": "Joining Process",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Document verification, training schedule, joining formalities",
            "helpText": "Process and requirements for joining the organization"
          }
        },
        {
          "name": "equal_opportunity_statement",
          "label": "Equal Opportunity Statement",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Company's commitment to diversity and equal opportunity",
            "helpText": "EEO statement and diversity commitment"
          }
        }
      ]
    }
  ]
}
```

---

## 📋 Template Usage Guide

### For Employers
1. **Clear Performance Metrics**: Define specific KPIs, call quality standards, and productivity targets
2. **Shift Transparency**: Clearly outline shift timings, rotational requirements, and weekend work
3. **Training Commitment**: Detail training programs, duration, and skill development opportunities
4. **Quality Standards**: Specify call monitoring, quality assurance processes, and feedback systems
5. **Work Facilities**: Describe workplace environment, equipment provided, and employee facilities

### For Job Seekers
1. **Voice Assessment**: Evaluate your communication skills and voice quality
2. **Shift Compatibility**: Assess if shift timings align with your availability and lifestyle
3. **Skill Evaluation**: Ensure you meet the required communication and technical skills
4. **Career Growth**: Research training programs and advancement opportunities
5. **Work Environment**: Understand the call center setup and team dynamics

### Industry Standards Covered
- **Voice Quality**: Professional communication, accent neutrality, clear articulation
- **Call Center Metrics**: AHT (Average Handling Time), FCR (First Call Resolution), CSAT
- **Quality Assurance**: Call monitoring, quality scoring, feedback systems
- **Shift Management**: 24/7 operations, rotational shifts, work-life balance
- **Technology Proficiency**: CRM systems, dialers, call recording software
- **Compliance Standards**: Data protection, privacy regulations, ethical practices

### API Integration

This template integrates with the eBidPortal dynamic schema system:

```javascript
// Assign template to jobs category
POST /api/v1/templates/{template_id}/assign-category
{
  "category_id": "jobs-bpo-telecaller-category-id",
  "is_default": true
}

// Retrieve form schema for job posting
GET /api/v1/catalog/categories/{category_id}/schema
```

---

## 🔍 Validation Rules Reference

| Rule | Description | Example |
|------|-------------|---------|
| `required` | Field must be filled | `["required"]` |
| `min_length:N` | Minimum character length | `["min_length:5"]` |
| `max_length:N` | Maximum character length | `["max_length:100"]` |
| `min:N` | Minimum numeric value | `["min:8000"]` |
| `max:N` | Maximum numeric value | `["max:100000"]` |
| `email` | Valid email format | `["email"]` |
| `phone` | Valid phone format | `["phone"]` |
| `url` | Valid URL format | `["url"]` |
| `fileType:ext1,ext2` | Allowed file extensions | `["fileType:jpeg,png,jpg"]` |
| `fileSize:N` | Maximum file size in bytes | `["fileSize:2097152"]` |

---

## 📞 Support & Documentation

For questions about this template or eBidPortal integration:
- **API Documentation**: `/Docs/eBidPortalApis.md`
- **Template Guidelines**: This document
- **Support**: Contact eBidPortal development team

**Remember this template for future use in eBidPortal marketplace job postings.**