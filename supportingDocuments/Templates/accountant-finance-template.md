# Accountant & Finance Job Template for eBidPortal

**Template Name:** Accountant & Finance Job Template
**Version:** 1.0
**Category Type:** jobs
**Created:** November 21, 2025
**Industry Standards:** Based on accounting and finance industry standards, regulatory compliance requirements, financial certifications, audit procedures, and corporate finance best practices for accountants, financial analysts, auditors, and finance professionals.

## Template JSON Structure

```json
{
  "name": "Accountant & Finance Job Template",
  "description": "Industry-standard template for accountant and finance job postings. Includes comprehensive fields covering financial expertise, accounting certifications, regulatory compliance, audit procedures, and corporate finance standards specific to accountants, financial analysts, auditors, tax professionals, and finance executives.",
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
            "placeholder": "e.g., Senior Accountant, Financial Analyst, Tax Consultant",
            "helpText": "Enter the specific finance/accounting position title"
          }
        },
        {
          "name": "company_name",
          "label": "Company Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:100"],
          "ui_config": {
            "placeholder": "Enter accounting firm, corporation, or financial services company name",
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
            "placeholder": "e.g., Mumbai Financial District, Delhi Corporate Area or specific office address",
            "helpText": "Location of the office/facility"
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
              {"value": "consultant", "label": "Consultant"},
              {"value": "internship", "label": "Internship"}
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
              {"value": "office_based", "label": "Office Based"},
              {"value": "hybrid", "label": "Hybrid (Office + Remote)"},
              {"value": "remote", "label": "Fully Remote"},
              {"value": "field_work", "label": "Field Work/Audit Assignments"}
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
              {"value": "intermediate", "label": "Intermediate (2-5 years)"},
              {"value": "experienced", "label": "Experienced (5-8 years)"},
              {"value": "senior", "label": "Senior (8-12 years)"},
              {"value": "executive", "label": "Executive/Director (12+ years)"}
            ],
            "helpText": "Required finance/accounting experience level"
          }
        },
        {
          "name": "specialization_area",
          "label": "Finance Specialization",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "accounting", "label": "General Accounting"},
              {"value": "auditing", "label": "Auditing & Assurance"},
              {"value": "taxation", "label": "Taxation & Compliance"},
              {"value": "financial_analysis", "label": "Financial Analysis"},
              {"value": "corporate_finance", "label": "Corporate Finance"},
              {"value": "cost_accounting", "label": "Cost & Management Accounting"},
              {"value": "forensic_accounting", "label": "Forensic Accounting"},
              {"value": "financial_planning", "label": "Financial Planning & Advisory"},
              {"value": "treasury_management", "label": "Treasury & Risk Management"},
              {"value": "financial_reporting", "label": "Financial Reporting & IFRS"}
            ],
            "helpText": "Primary area of finance/accounting specialization"
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
              {"value": "bcom", "label": "B.Com (Bachelor of Commerce)"},
              {"value": "mcom", "label": "M.Com (Master of Commerce)"},
              {"value": "bba", "label": "BBA (Finance/Accounting)"},
              {"value": "mba_finance", "label": "MBA (Finance)"},
              {"value": "ca_inter", "label": "CA Intermediate"},
              {"value": "ca_final", "label": "CA Final/Qualified"},
              {"value": "cs", "label": "CS (Company Secretary)"},
              {"value": "cfa", "label": "CFA (Chartered Financial Analyst)"},
              {"value": "acca", "label": "ACCA (Association of Chartered Certified Accountants)"},
              {"value": "cma", "label": "CMA (Certified Management Accountant)"}
            ],
            "helpText": "Minimum education qualification required"
          }
        },
        {
          "name": "professional_certifications",
          "label": "Professional Certifications",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "ca", "label": "Chartered Accountant (CA)"},
              {"value": "acca", "label": "ACCA Certification"},
              {"value": "cma", "label": "Certified Management Accountant (CMA)"},
              {"value": "cfa", "label": "Chartered Financial Analyst (CFA)"},
              {"value": "cs", "label": "Company Secretary (CS)"},
              {"value": "cisa", "label": "Certified Information Systems Auditor (CISA)"},
              {"value": "cpa", "label": "Certified Public Accountant (CPA)"},
              {"value": "frp", "label": "Fellow of ICSI (FRP)"},
              {"value": "fcs", "label": "Fellow of ICSI (FCS)"},
              {"value": "disaster_recovery", "label": "Certified Fraud Examiner (CFE)"},
              {"value": "ifrs_certified", "label": "IFRS Certified"},
              {"value": "gst_certified", "label": "GST Practitioner"}
            ],
            "helpText": "Preferred professional certifications"
          }
        },
        {
          "name": "technical_skills",
          "label": "Technical Skills & Software",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "tally", "label": "Tally ERP"},
              {"value": "sap_fico", "label": "SAP FICO"},
              {"value": "oracle_financials", "label": "Oracle Financials"},
              {"value": "quickbooks", "label": "QuickBooks"},
              {"value": "ms_excel_advanced", "label": "Advanced MS Excel"},
              {"value": "financial_modeling", "label": "Financial Modeling"},
              {"value": "vba_programming", "label": "VBA Programming"},
              {"value": "sql_database", "label": "SQL Database"},
              {"value": "power_bi", "label": "Power BI/Tableau"},
              {"value": "erp_systems", "label": "ERP Systems"},
              {"value": "tax_software", "label": "Tax Preparation Software"},
              {"value": "audit_software", "label": "Audit Software (ACL, IDEA)"}
            ],
            "helpText": "Required technical and software skills"
          }
        },
        {
          "name": "experience_years",
          "label": "Finance Experience (Years)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:50"],
          "ui_config": {
            "placeholder": "e.g., 3",
            "helpText": "Minimum years of finance/accounting experience required"
          }
        },
        {
          "name": "industry_experience",
          "label": "Industry Experience",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "manufacturing", "label": "Manufacturing"},
              {"value": "retail", "label": "Retail & E-commerce"},
              {"value": "banking", "label": "Banking & Financial Services"},
              {"value": "it_software", "label": "IT & Software"},
              {"value": "real_estate", "label": "Real Estate"},
              {"value": "healthcare", "label": "Healthcare"},
              {"value": "education", "label": "Education"},
              {"value": "ngo", "label": "NGO & Non-Profit"},
              {"value": "government", "label": "Government & PSU"},
              {"value": "consulting", "label": "Consulting Firms"}
            ],
            "helpText": "Preferred industry experience"
          }
        },
        {
          "name": "soft_skills",
          "label": "Professional Skills",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "analytical_thinking", "label": "Analytical Thinking"},
              {"value": "attention_to_detail", "label": "Attention to Detail"},
              {"value": "communication", "label": "Communication Skills"},
              {"value": "problem_solving", "label": "Problem Solving"},
              {"value": "time_management", "label": "Time Management"},
              {"value": "team_collaboration", "label": "Team Collaboration"},
              {"value": "leadership", "label": "Leadership Skills"},
              {"value": "client_interaction", "label": "Client Interaction"},
              {"value": "presentation", "label": "Presentation Skills"},
              {"value": "negotiation", "label": "Negotiation Skills"}
            ],
            "helpText": "Required professional and soft skills"
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
              {"value": "financial_reporting", "label": "Financial Reporting & Statements"},
              {"value": "bookkeeping", "label": "Bookkeeping & Accounting"},
              {"value": "tax_compliance", "label": "Tax Planning & Compliance"},
              {"value": "audit_assistance", "label": "Audit Assistance & Coordination"},
              {"value": "budgeting", "label": "Budgeting & Forecasting"},
              {"value": "cost_analysis", "label": "Cost Analysis & Control"},
              {"value": "financial_analysis", "label": "Financial Analysis & Insights"},
              {"value": "regulatory_compliance", "label": "Regulatory Compliance"},
              {"value": "internal_controls", "label": "Internal Controls & Risk Management"},
              {"value": "management_reporting", "label": "Management Reporting"},
              {"value": "payroll_management", "label": "Payroll Processing"},
              {"value": "vendor_payments", "label": "Vendor Payments & Reconciliation"}
            ],
            "helpText": "Primary responsibilities for this finance position"
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
          "validation": ["required", "min:15000"],
          "ui_config": {
            "placeholder": "e.g., 30000",
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
            "placeholder": "e.g., 80000",
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
              {"value": "performance_bonus", "label": "Performance Bonus"},
              {"value": "profit_sharing", "label": "Profit Sharing"},
              {"value": "conveyance_allowance", "label": "Conveyance Allowance"},
              {"value": "lta", "label": "Leave Travel Allowance (LTA)"},
              {"value": "meal_allowance", "label": "Meal Allowance"},
              {"value": "phone_allowance", "label": "Phone/Internet Allowance"},
              {"value": "certification_allowance", "label": "Certification Allowance"},
              {"value": "overtime_pay", "label": "Overtime Pay"}
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
              {"value": "paid_leave", "label": "Paid Leave (CL/SL)"},
              {"value": "provident_fund", "label": "Provident Fund"},
              {"value": "gratuity", "label": "Gratuity"},
              {"value": "life_insurance", "label": "Life Insurance"},
              {"value": "accident_insurance", "label": "Accident Insurance"},
              {"value": "gym_membership", "label": "Gym/Fitness Membership"},
              {"value": "skill_development", "label": "Skill Development Programs"},
              {"value": "conference_budget", "label": "Conference/Training Budget"},
              {"value": "flexible_hours", "label": "Flexible Working Hours"},
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
              {"value": "biweekly", "label": "Bi-weekly"}
            ],
            "helpText": "How often the employee gets paid"
          }
        }
      ]
    },
    {
      "title": "Company & Industry Details",
      "order": 4,
      "description": "Information about the company and industry focus",
      "is_collapsible": true,
      "fields": [
        {
          "name": "company_type",
          "label": "Company Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "accounting_firm", "label": "Accounting & Audit Firm"},
              {"value": "consulting_firm", "label": "Financial Consulting Firm"},
              {"value": "corporate_finance", "label": "Corporate Finance Department"},
              {"value": "banking_finance", "label": "Banking & Financial Services"},
              {"value": "manufacturing", "label": "Manufacturing Company"},
              {"value": "retail_ecommerce", "label": "Retail & E-commerce"},
              {"value": "it_software", "label": "IT & Software Company"},
              {"value": "real_estate", "label": "Real Estate Company"},
              {"value": "healthcare", "label": "Healthcare Organization"},
              {"value": "government_psu", "label": "Government/PSU Organization"}
            ],
            "helpText": "Type of organization"
          }
        },
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
              {"value": "large", "label": "Large (1000+ employees)"},
              {"value": "conglomerate", "label": "Business Conglomerate"}
            ],
            "helpText": "Size of the organization"
          }
        },
        {
          "name": "industry_focus",
          "label": "Industry Focus",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "manufacturing", "label": "Manufacturing & Industrial"},
              {"value": "technology", "label": "Technology & Software"},
              {"value": "finance_banking", "label": "Finance & Banking"},
              {"value": "retail", "label": "Retail & Consumer Goods"},
              {"value": "healthcare", "label": "Healthcare & Pharmaceuticals"},
              {"value": "real_estate", "label": "Real Estate & Construction"},
              {"value": "education", "label": "Education & Training"},
              {"value": "automotive", "label": "Automotive"},
              {"value": "telecom", "label": "Telecommunications"},
              {"value": "energy", "label": "Energy & Utilities"}
            ],
            "helpText": "Primary industry sectors served"
          }
        },
        {
          "name": "regulatory_compliance",
          "label": "Regulatory Compliance Focus",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "companies_act", "label": "Companies Act Compliance"},
              {"value": "income_tax", "label": "Income Tax Compliance"},
              {"value": "gst", "label": "GST Compliance"},
              {"value": "sebi", "label": "SEBI Regulations"},
              {"value": "rbi", "label": "RBI Guidelines"},
              {"value": "ifrs", "label": "IFRS Standards"},
              {"value": "ind_as", "label": "Ind AS Standards"},
              {"value": "fca", "label": "FCA Regulations"},
              {"value": "aml", "label": "Anti-Money Laundering"},
              {"value": "data_protection", "label": "Data Protection Laws"}
            ],
            "helpText": "Regulatory compliance areas of focus"
          }
        },
        {
          "name": "work_environment",
          "label": "Work Environment",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "corporate_office", "label": "Corporate Office Environment"},
              {"value": "client_sites", "label": "Client Site Visits"},
              {"value": "audit_assignments", "label": "Audit Field Assignments"},
              {"value": "team_based", "label": "Team-Based Projects"},
              {"value": "deadline_driven", "label": "Deadline-Driven Work"},
              {"value": "analytical_focus", "label": "Analytical & Detail-Oriented"},
              {"value": "client_interaction", "label": "Client Interaction"},
              {"value": "research_oriented", "label": "Research & Analysis"},
              {"value": "documentation_heavy", "label": "Documentation Intensive"},
              {"value": "technology_driven", "label": "Technology-Driven Environment"}
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
            "placeholder": "Brief description of the company, its services, client base, and work culture",
            "helpText": "Overview of the organization and its operations"
          }
        },
        {
          "name": "team_size",
          "label": "Finance Team Size",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "small", "label": "Small Team (2-5 members)"},
              {"value": "medium", "label": "Medium Team (6-20 members)"},
              {"value": "large", "label": "Large Team (21-50 members)"},
              {"value": "department", "label": "Full Department (50+ members)"}
            ],
            "helpText": "Size of the finance/accounting team"
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
              {"value": "professional_certificates", "label": "Professional Certificates (CA/CS/ACCA)"},
              {"value": "experience_letters", "label": "Experience Letters"},
              {"value": "salary_slips", "label": "Salary Slips (Last 3 months)"},
              {"value": "bank_statements", "label": "Bank Statements"},
              {"value": "aadhar_card", "label": "Aadhar Card"},
              {"value": "pan_card", "label": "PAN Card"},
              {"value": "passport", "label": "Passport (if applicable)"},
              {"value": "police_verification", "label": "Police Verification Certificate"}
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
              {"value": "written_test", "label": "Written Test/Assessment"},
              {"value": "technical_interview", "label": "Technical Interview"},
              {"value": "hr_interview", "label": "HR Interview"},
              {"value": "partner_interview", "label": "Partner/Director Interview"},
              {"value": "case_study", "label": "Case Study Presentation"},
              {"value": "multiple_rounds", "label": "Multiple Interview Rounds"},
              {"value": "group_discussion", "label": "Group Discussion"},
              {"value": "presentation", "label": "Technical Presentation"}
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
          "name": "probation_period",
          "label": "Probation Period",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "none", "label": "No Probation"},
              {"value": "3_months", "label": "3 Months"},
              {"value": "6_months", "label": "6 Months"},
              {"value": "12_months", "label": "12 Months"}
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