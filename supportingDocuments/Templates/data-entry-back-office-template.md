# Data Entry & Back Office Jobs Template

**File:** `data-entry-back-office-template.md`
**Purpose:** Industry-level template for Data Entry & Back Office job postings in eBidPortal marketplace
**Created:** November 21, 2025
**Last Updated:** November 21, 2025
**Category:** Jobs - Data Entry & Back Office
**Subcategories:** Data Entry, Administrative Assistant, Back Office Operations, Document Processing

---

## 📋 Data Entry & Back Office Jobs Template Overview

This template provides a comprehensive, industry-standard structure for Data Entry & Back Office job postings in the eBidPortal marketplace. It covers administrative roles, data processing positions, back office operations, and document management jobs with professional specifications, skill requirements, and compliance standards.

### Key Features
- **Administrative Excellence**: Comprehensive administrative and clerical specifications
- **Data Processing Standards**: Industry-standard data entry and processing requirements
- **Compliance & Accuracy**: Quality control and accuracy metrics
- **Technology Proficiency**: Software skills and tool requirements
- **Performance Metrics**: Productivity and quality benchmarks
- **Work Environment**: Office setup and remote work capabilities
- **Career Progression**: Growth opportunities and training programs

### Template Structure
- **5 Main Sections**: Job Information, Requirements & Qualifications, Compensation & Benefits, Company Information, Application Process
- **50+ Fields**: Comprehensive coverage of administrative job requirements
- **Validation Rules**: Industry-standard qualification checks and compliance
- **UI Configuration**: User-friendly forms with job-specific guidance

---

## 🔧 Template JSON Structure

```json
{
  "name": "Data Entry & Back Office Jobs Template",
  "description": "Comprehensive template for data entry and back office job postings including administrative roles, data processing positions, and clerical operations with industry-standard specifications and compliance requirements",
  "category_type": "jobs_data_entry_back_office",
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
            "placeholder": "e.g., Senior Data Entry Operator, Administrative Assistant",
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
              {"value": "data_entry", "label": "Data Entry"},
              {"value": "administrative_assistant", "label": "Administrative Assistant"},
              {"value": "back_office_operations", "label": "Back Office Operations"},
              {"value": "document_processing", "label": "Document Processing"},
              {"value": "clerical_support", "label": "Clerical Support"},
              {"value": "office_administration", "label": "Office Administration"}
            ],
            "helpText": "Primary category for this administrative role"
          }
        },
        {
          "name": "company_name",
          "label": "Company Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:100"],
          "ui_config": {
            "placeholder": "Company or organization name",
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
            "placeholder": "City, State/Province, Country or 'Remote'",
            "helpText": "Primary work location or 'Remote' for work-from-home positions"
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
            "placeholder": "Detailed description of job responsibilities, daily tasks, and objectives",
            "helpText": "Comprehensive overview of the role, responsibilities, and expectations"
          }
        },
        {
          "name": "department",
          "label": "Department/Division",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "e.g., Operations, Administration, Finance",
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
            "placeholder": "Supervisor or manager title",
            "helpText": "Position title of the direct supervisor"
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
              {"value": "entry_level", "label": "Entry Level (0-2 years)"},
              {"value": "intermediate", "label": "Intermediate (2-5 years)"},
              {"value": "experienced", "label": "Experienced (5-8 years)"},
              {"value": "senior", "label": "Senior (8+ years)"},
              {"value": "expert", "label": "Expert (10+ years)"}
            ],
            "helpText": "Required years of relevant experience"
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
              {"value": "associate_degree", "label": "Associate Degree"},
              {"value": "bachelor_degree", "label": "Bachelor's Degree"},
              {"value": "master_degree", "label": "Master's Degree"},
              {"value": "phd", "label": "PhD"},
              {"value": "certification", "label": "Professional Certification"},
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
              {"value": "ms_office", "label": "Microsoft Office Suite"},
              {"value": "google_workspace", "label": "Google Workspace"},
              {"value": "data_entry", "label": "Data Entry (10-key)"},
              {"value": "typing_speed", "label": "Fast Typing Speed (40+ WPM)"},
              {"value": "attention_to_detail", "label": "Attention to Detail"},
              {"value": "organization", "label": "Organizational Skills"},
              {"value": "time_management", "label": "Time Management"},
              {"value": "communication", "label": "Written Communication"},
              {"value": "multitasking", "label": "Multitasking Ability"},
              {"value": "problem_solving", "label": "Problem Solving"},
              {"value": "customer_service", "label": "Customer Service Orientation"},
              {"value": "confidentiality", "label": "Maintaining Confidentiality"}
            ],
            "helpText": "Select all required skills for this position"
          }
        },
        {
          "name": "software_proficiency",
          "label": "Software Proficiency",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "List specific software tools and proficiency levels required",
            "helpText": "Specific software applications and required skill levels"
          }
        },
        {
          "name": "certifications",
          "label": "Preferred Certifications",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "MOS, IC3, administrative certifications, etc.",
            "helpText": "Professional certifications that would be advantageous"
          }
        },
        {
          "name": "language_requirements",
          "label": "Language Requirements",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "English (Fluent), Spanish (Conversational), etc.",
            "helpText": "Required languages and proficiency levels"
          }
        },
        {
          "name": "physical_requirements",
          "label": "Physical Requirements",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Sedentary work, prolonged sitting, etc.",
            "helpText": "Physical demands and work environment requirements"
          }
        },
        {
          "name": "work_schedule",
          "label": "Work Schedule",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "placeholder": "Select work schedule type",
            "options": [
              {"value": "standard_9_5", "label": "Standard 9-5 Business Hours"},
              {"value": "flexible_hours", "label": "Flexible Hours"},
              {"value": "shift_work", "label": "Shift Work"},
              {"value": "rotating_shifts", "label": "Rotating Shifts"},
              {"value": "weekends_required", "label": "Weekends Required"},
              {"value": "on_call", "label": "On-Call Availability"}
            ],
            "helpText": "Work schedule and availability requirements"
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
          "validation": ["required", "min:10000", "max:500000"],
          "ui_config": {
            "prefix": "$",
            "step": 1000,
            "helpText": "Minimum annual salary in USD"
          }
        },
        {
          "name": "salary_range_max",
          "label": "Maximum Salary",
          "type": "number",
          "required": true,
          "validation": ["required", "min:15000", "max:1000000"],
          "ui_config": {
            "prefix": "$",
            "step": 1000,
            "helpText": "Maximum annual salary in USD"
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
          "name": "salary_type",
          "label": "Salary Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "annual", "label": "Annual Salary"},
              {"value": "monthly", "label": "Monthly Salary"},
              {"value": "hourly", "label": "Hourly Rate"},
              {"value": "daily", "label": "Daily Rate"},
              {"value": "commission", "label": "Commission-Based"},
              {"value": "performance_bonus", "label": "Performance Bonus"}
            ],
            "helpText": "How the salary is structured"
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
              {"value": "dental_insurance", "label": "Dental Insurance"},
              {"value": "vision_insurance", "label": "Vision Insurance"},
              {"value": "life_insurance", "label": "Life Insurance"},
              {"value": "paid_time_off", "label": "Paid Time Off"},
              {"value": "sick_leave", "label": "Sick Leave"},
              {"value": "retirement_plan", "label": "Retirement Plan"},
              {"value": "flexible_hours", "label": "Flexible Working Hours"},
              {"value": "remote_work", "label": "Remote Work Options"},
              {"value": "professional_development", "label": "Professional Development"},
              {"value": "gym_membership", "label": "Gym Membership"},
              {"value": "meal_allowance", "label": "Meal Allowance"},
              {"value": "transportation_allowance", "label": "Transportation Allowance"}
            ],
            "helpText": "Select all benefits offered with this position"
          }
        },
        {
          "name": "performance_incentives",
          "label": "Performance Incentives",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Bonuses, commissions, profit sharing, etc.",
            "helpText": "Additional compensation based on performance"
          }
        },
        {
          "name": "other_compensation",
          "label": "Other Compensation",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "Overtime pay, shift differentials, etc.",
            "helpText": "Additional forms of compensation"
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
              {"value": "startup", "label": "Startup (1-50 employees)"},
              {"value": "small", "label": "Small (51-200 employees)"},
              {"value": "medium", "label": "Medium (201-1000 employees)"},
              {"value": "large", "label": "Large (1000+ employees)"},
              {"value": "enterprise", "label": "Enterprise (5000+ employees)"}
            ],
            "helpText": "Approximate number of employees"
          }
        },
        {
          "name": "industry",
          "label": "Industry",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "e.g., Technology, Healthcare, Finance, Manufacturing",
            "helpText": "Primary industry or sector"
          }
        },
        {
          "name": "company_description",
          "label": "Company Description",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Brief overview of the company, mission, and culture",
            "helpText": "Company background and work environment"
          }
        },
        {
          "name": "work_environment",
          "label": "Work Environment",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Office setting, team size, work culture, etc.",
            "helpText": "Description of the work environment and team dynamics"
          }
        },
        {
          "name": "company_website",
          "label": "Company Website",
          "type": "url",
          "required": false,
          "validation": ["url"],
          "ui_config": {
            "placeholder": "https://www.company.com",
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
              {"value": "email", "label": "Email Resume"},
              {"value": "company_website", "label": "Company Website"},
              {"value": "recruiter", "label": "Contact Recruiter"},
              {"value": "walk_in", "label": "Walk-in Interview"}
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
            "placeholder": "hr@company.com",
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
              {"value": "cover_letter", "label": "Cover Letter"},
              {"value": "portfolio", "label": "Portfolio/Examples of Work"},
              {"value": "certificates", "label": "Educational Certificates"},
              {"value": "references", "label": "References"},
              {"value": "id_proof", "label": "ID Proof"},
              {"value": "background_check", "label": "Background Check Consent"}
            ],
            "helpText": "Documents required for application"
          }
        },
        {
          "name": "application_instructions",
          "label": "Application Instructions",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Specific instructions for applicants",
            "helpText": "Additional application requirements or instructions"
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
1. **Clear Job Specifications**: Provide detailed job descriptions with specific responsibilities
2. **Realistic Requirements**: Set appropriate experience and skill requirements
3. **Competitive Compensation**: Offer market-competitive salaries and benefits
4. **Transparent Process**: Clearly outline the application and interview process
5. **Compliance**: Include EEO statements and equal opportunity commitments

### For Job Seekers
1. **Skill Assessment**: Evaluate your skills against the requirements
2. **Experience Match**: Ensure your experience level aligns with the position
3. **Compensation Research**: Research typical salaries for similar roles
4. **Document Preparation**: Prepare all required documents in advance
5. **Application Follow-up**: Follow up on applications professionally

### Industry Standards Covered
- **Administrative Excellence**: Professional administrative standards
- **Data Accuracy**: Industry-standard accuracy requirements (99%+)
- **Technology Proficiency**: Modern office software competencies
- **Performance Metrics**: Productivity and quality benchmarks
- **Workplace Safety**: Ergonomic and safety considerations
- **Professional Development**: Career growth opportunities

### API Integration

This template integrates with the eBidPortal dynamic schema system:

```javascript
// Assign template to jobs category
POST /api/v1/templates/{template_id}/assign-category
{
  "category_id": "jobs-data-entry-back-office-category-id",
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
| `min:N` | Minimum numeric value | `["min:10000"]` |
| `max:N` | Maximum numeric value | `["max:500000"]` |
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