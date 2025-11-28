# Sales & Marketing Jobs Template

**File:** `sales-marketing-template.md`
**Purpose:** Industry-level template for Sales & Marketing job postings in eBidPortal marketplace
**Created:** November 21, 2025
**Last Updated:** November 21, 2025
**Category:** Jobs - Sales & Marketing
**Subcategories:** Sales Executive, Marketing Manager, Business Development, Digital Marketing, Content Marketing

---

## 📋 Sales & Marketing Jobs Template Overview

This template provides a comprehensive, industry-standard structure for Sales & Marketing job postings in the eBidPortal marketplace. It covers sales roles, marketing positions, business development, and promotional activities with professional specifications, performance metrics, and industry compliance standards.

### Key Features
- **Sales Performance**: Revenue targets, conversion metrics, and sales methodologies
- **Marketing Expertise**: Digital marketing, content creation, and campaign management
- **Business Development**: Lead generation, relationship building, and market expansion
- **Performance Metrics**: KPI tracking, ROI measurement, and success metrics
- **Industry Knowledge**: Market trends, competitive analysis, and customer insights
- **Communication Skills**: Presentation abilities, negotiation skills, and stakeholder management
- **Technology Proficiency**: CRM systems, marketing automation, and analytics tools

### Template Structure
- **5 Main Sections**: Job Information, Requirements & Qualifications, Compensation & Benefits, Company Information, Application Process
- **50+ Fields**: Comprehensive coverage of sales and marketing job requirements
- **Validation Rules**: Industry-standard qualification checks and performance metrics
- **UI Configuration**: User-friendly forms with sales/marketing-specific guidance

---

## 🔧 Template JSON Structure

```json
{
  "name": "Sales & Marketing Jobs Template",
  "description": "Comprehensive template for sales and marketing job postings including sales executives, marketing managers, business development roles, and promotional positions with industry-standard specifications and performance metrics",
  "category_type": "jobs_sales_marketing",
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
            "placeholder": "e.g., Senior Sales Executive, Digital Marketing Manager",
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
              {"value": "sales_executive", "label": "Sales Executive"},
              {"value": "marketing_manager", "label": "Marketing Manager"},
              {"value": "business_development", "label": "Business Development"},
              {"value": "digital_marketing", "label": "Digital Marketing"},
              {"value": "content_marketing", "label": "Content Marketing"},
              {"value": "brand_management", "label": "Brand Management"},
              {"value": "market_research", "label": "Market Research"},
              {"value": "public_relations", "label": "Public Relations"},
              {"value": "advertising", "label": "Advertising"},
              {"value": "product_marketing", "label": "Product Marketing"}
            ],
            "helpText": "Primary category for this sales/marketing role"
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
              {"value": "commission_based", "label": "Commission Based"},
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
            "placeholder": "Detailed description of job responsibilities, targets, and objectives",
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
            "placeholder": "e.g., Sales, Marketing, Business Development",
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
        },
        {
          "name": "team_size",
          "label": "Team Size",
          "type": "select",
          "required": false,
          "ui_config": {
            "placeholder": "Size of team you'll be working with",
            "options": [
              {"value": "individual", "label": "Individual Contributor"},
              {"value": "small_team", "label": "Small Team (2-5 people)"},
              {"value": "medium_team", "label": "Medium Team (6-15 people)"},
              {"value": "large_team", "label": "Large Team (16+ people)"},
              {"value": "department_head", "label": "Department Head"}
            ],
            "helpText": "Size of the team you'll be managing or working with"
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
              {"value": "mba", "label": "MBA"},
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
              {"value": "sales_techniques", "label": "Sales Techniques & Methodologies"},
              {"value": "negotiation", "label": "Negotiation Skills"},
              {"value": "presentation", "label": "Presentation Skills"},
              {"value": "communication", "label": "Excellent Communication"},
              {"value": "relationship_building", "label": "Relationship Building"},
              {"value": "market_research", "label": "Market Research"},
              {"value": "competitive_analysis", "label": "Competitive Analysis"},
              {"value": "digital_marketing", "label": "Digital Marketing"},
              {"value": "social_media", "label": "Social Media Marketing"},
              {"value": "content_creation", "label": "Content Creation"},
              {"value": "seo_sem", "label": "SEO/SEM"},
              {"value": "analytics", "label": "Marketing Analytics"},
              {"value": "crm_tools", "label": "CRM Tools Proficiency"},
              {"value": "lead_generation", "label": "Lead Generation"},
              {"value": "campaign_management", "label": "Campaign Management"}
            ],
            "helpText": "Select all required skills for this position"
          }
        },
        {
          "name": "industry_experience",
          "label": "Industry Experience",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Specific industries or sectors experience preferred",
            "helpText": "Preferred industry experience or sector knowledge"
          }
        },
        {
          "name": "certifications",
          "label": "Preferred Certifications",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "CSP, Google Ads, HubSpot, Salesforce certifications, etc.",
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
          "name": "travel_requirements",
          "label": "Travel Requirements",
          "type": "select",
          "required": false,
          "ui_config": {
            "placeholder": "Expected travel frequency",
            "options": [
              {"value": "no_travel", "label": "No Travel Required"},
              {"value": "minimal", "label": "Minimal Travel (<25%)"},
              {"value": "moderate", "label": "Moderate Travel (25-50%)"},
              {"value": "extensive", "label": "Extensive Travel (50-75%)"},
              {"value": "frequent", "label": "Frequent Travel (75%+)"}
            ],
            "helpText": "Expected travel requirements for client meetings and events"
          }
        },
        {
          "name": "performance_targets",
          "label": "Performance Targets",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Revenue targets, lead generation goals, campaign KPIs, etc.",
            "helpText": "Key performance indicators and targets for the role"
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
          "name": "base_salary_min",
          "label": "Minimum Base Salary",
          "type": "number",
          "required": true,
          "validation": ["required", "min:20000", "max:500000"],
          "ui_config": {
            "prefix": "$",
            "step": 1000,
            "helpText": "Minimum annual base salary in USD"
          }
        },
        {
          "name": "base_salary_max",
          "label": "Maximum Base Salary",
          "type": "number",
          "required": true,
          "validation": ["required", "min:30000", "max:1000000"],
          "ui_config": {
            "prefix": "$",
            "step": 1000,
            "helpText": "Maximum annual base salary in USD"
          }
        },
        {
          "name": "commission_structure",
          "label": "Commission Structure",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Commission rates, accelerators, uncapped potential, etc.",
            "helpText": "Details of commission structure and earning potential"
          }
        },
        {
          "name": "bonus_structure",
          "label": "Bonus Structure",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Performance bonuses, quarterly incentives, etc.",
            "helpText": "Bonus and incentive compensation details"
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
              {"value": "transportation_allowance", "label": "Transportation Allowance"},
              {"value": "company_car", "label": "Company Car"},
              {"value": "phone_allowance", "label": "Phone Allowance"},
              {"value": "conference_budget", "label": "Conference/Training Budget"}
            ],
            "helpText": "Select all benefits offered with this position"
          }
        },
        {
          "name": "total_compensation_range",
          "label": "Total Compensation Range",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "$80,000 - $150,000 (including commissions)",
            "helpText": "Total potential compensation including base, commission, and bonuses"
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
          "name": "sales_territory",
          "label": "Sales Territory/Coverage",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Geographic territory, client types, market segments",
            "helpText": "Territory or market coverage for sales roles"
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
        },
        {
          "name": "marketing_budget",
          "label": "Marketing Budget",
          "type": "select",
          "required": false,
          "ui_config": {
            "placeholder": "Annual marketing budget range",
            "options": [
              {"value": "under_50k", "label": "Under $50K"},
              {"value": "50k_250k", "label": "$50K - $250K"},
              {"value": "250k_1m", "label": "$250K - $1M"},
              {"value": "1m_5m", "label": "$1M - $5M"},
              {"value": "over_5m", "label": "Over $5M"}
            ],
            "helpText": "Approximate annual marketing budget for reference"
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
              {"value": "linkedin", "label": "Apply via LinkedIn"},
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
              {"value": "case_studies", "label": "Case Studies/Success Stories"},
              {"value": "social_media_profiles", "label": "Social Media Profiles"},
              {"value": "writing_samples", "label": "Writing Samples"}
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
          "name": "assessment_process",
          "label": "Assessment Process",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Describe the interview process, assessments, or evaluations",
            "helpText": "Details about the hiring process and assessments"
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
1. **Clear Performance Expectations**: Define specific targets, KPIs, and success metrics
2. **Competitive Compensation**: Include commission structures and total compensation ranges
3. **Realistic Requirements**: Set appropriate experience levels and skill requirements
4. **Territory Definition**: Clearly outline sales territories and market coverage
5. **Assessment Process**: Describe the interview and evaluation process

### For Job Seekers
1. **Target Assessment**: Evaluate if your experience matches the requirements
2. **Compensation Analysis**: Understand base salary plus commission potential
3. **Territory Research**: Research the geographic area and market potential
4. **Portfolio Preparation**: Prepare relevant case studies and success stories
5. **Skill Alignment**: Ensure your skills match the required competencies

### Industry Standards Covered
- **Sales Methodologies**: Consultative selling, solution selling, relationship building
- **Marketing Metrics**: ROI measurement, conversion tracking, campaign analytics
- **Digital Proficiency**: Social media, SEO/SEM, content marketing expertise
- **CRM Systems**: Salesforce, HubSpot, Pipedrive proficiency
- **Performance Standards**: Industry-standard KPIs and success metrics
- **Ethical Sales**: Compliance with sales regulations and ethical standards

### API Integration

This template integrates with the eBidPortal dynamic schema system:

```javascript
// Assign template to jobs category
POST /api/v1/templates/{template_id}/assign-category
{
  "category_id": "jobs-sales-marketing-category-id",
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
| `min:N` | Minimum numeric value | `["min:20000"]` |
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