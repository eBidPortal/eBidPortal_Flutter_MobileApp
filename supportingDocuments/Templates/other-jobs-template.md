# Other Jobs Template for eBidPortal

**Template Name:** Other Jobs Template
**Version:** 1.0
**Category Type:** jobs
**Created:** November 21, 2025
**Industry Standards:** Based on general employment standards, professional development guidelines, workplace safety regulations, and best practices for diverse job categories including administrative, retail, entertainment, creative services, and specialized professional roles.

## Template JSON Structure

```json
{
  "name": "Other Jobs Template",
  "description": "Industry-standard template for miscellaneous job postings. Includes comprehensive fields covering diverse professional roles, administrative positions, retail services, entertainment industry, creative services, and specialized professional requirements for positions that don't fit standard categories.",
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
            "placeholder": "e.g., Event Coordinator, Retail Associate, Personal Assistant",
            "helpText": "Enter the specific job position title"
          }
        },
        {
          "name": "company_name",
          "label": "Company/Organization Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:100"],
          "ui_config": {
            "placeholder": "Enter company, organization, or business name",
            "helpText": "Name of the company or organization"
          }
        },
        {
          "name": "location",
          "label": "Work Location",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3"],
          "ui_config": {
            "placeholder": "e.g., Mumbai Office, Bangalore Store, Delhi Event Venue",
            "helpText": "Location of the workplace"
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
              {"value": "freelance", "label": "Freelance"},
              {"value": "temporary", "label": "Temporary"},
              {"value": "internship", "label": "Internship"},
              {"value": "commission_based", "label": "Commission Based"}
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
              {"value": "retail_store", "label": "Retail Store"},
              {"value": "event_venue", "label": "Event Venue"},
              {"value": "remote", "label": "Remote Work"},
              {"value": "hybrid", "label": "Hybrid (Office + Remote)"},
              {"value": "field_work", "label": "Field Work"},
              {"value": "on_site_client", "label": "On-Site at Client Location"}
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
              {"value": "expert", "label": "Expert/Lead (10+ years)"},
              {"value": "no_experience", "label": "No Experience Required"}
            ],
            "helpText": "Required experience level"
          }
        },
        {
          "name": "job_category",
          "label": "Job Category",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "administrative", "label": "Administrative & Clerical"},
              {"value": "retail_sales", "label": "Retail & Sales"},
              {"value": "customer_service", "label": "Customer Service"},
              {"value": "event_management", "label": "Event Management"},
              {"value": "personal_assistant", "label": "Personal Assistant"},
              {"value": "content_creation", "label": "Content Creation"},
              {"value": "social_media", "label": "Social Media Management"},
              {"value": "photography", "label": "Photography & Videography"},
              {"value": "entertainment", "label": "Entertainment & Hospitality"},
              {"value": "fitness_wellness", "label": "Fitness & Wellness"},
              {"value": "tutoring_education", "label": "Tutoring & Education"},
              {"value": "consulting", "label": "Consulting & Advisory"},
              {"value": "research", "label": "Research & Analysis"},
              {"value": "specialized_services", "label": "Specialized Services"},
              {"value": "other_professional", "label": "Other Professional Services"}
            ],
            "helpText": "Primary job category or industry focus"
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
              {"value": "intermediate", "label": "Intermediate/HSC"},
              {"value": "graduation", "label": "Graduation/Bachelor's Degree"},
              {"value": "post_graduation", "label": "Post Graduation/Master's Degree"},
              {"value": "professional_degree", "label": "Professional Degree"},
              {"value": "diploma_certificate", "label": "Diploma/Certificate Course"},
              {"value": "phd_research", "label": "PhD/Research Degree"}
            ],
            "helpText": "Minimum education qualification required"
          }
        },
        {
          "name": "certifications",
          "label": "Professional Certifications",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "computer_skills", "label": "Basic Computer Skills"},
              {"value": "ms_office", "label": "MS Office Proficiency"},
              {"value": "communication_cert", "label": "Communication Skills Certificate"},
              {"value": "customer_service_cert", "label": "Customer Service Certification"},
              {"value": "event_management_cert", "label": "Event Management Certification"},
              {"value": "social_media_cert", "label": "Social Media Marketing Certificate"},
              {"value": "photography_cert", "label": "Photography Certification"},
              {"value": "fitness_cert", "label": "Fitness Instructor Certification"},
              {"value": "first_aid_cert", "label": "First Aid Certification"},
              {"value": "food_safety_cert", "label": "Food Safety Certification"},
              {"value": "driving_license", "label": "Valid Driving License"},
              {"value": "industry_specific", "label": "Industry-Specific Certification"}
            ],
            "helpText": "Preferred professional certifications"
          }
        },
        {
          "name": "key_skills",
          "label": "Key Skills Required",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "communication", "label": "Communication Skills"},
              {"value": "interpersonal", "label": "Interpersonal Skills"},
              {"value": "problem_solving", "label": "Problem Solving"},
              {"value": "time_management", "label": "Time Management"},
              {"value": "organization", "label": "Organization Skills"},
              {"value": "customer_service", "label": "Customer Service"},
              {"value": "team_work", "label": "Team Work"},
              {"value": "leadership", "label": "Leadership Skills"},
              {"value": "creativity", "label": "Creativity & Innovation"},
              {"value": "attention_detail", "label": "Attention to Detail"},
              {"value": "adaptability", "label": "Adaptability"},
              {"value": "computer_literacy", "label": "Computer Literacy"},
              {"value": "multitasking", "label": "Multitasking Ability"},
              {"value": "stress_management", "label": "Stress Management"},
              {"value": "decision_making", "label": "Decision Making"}
            ],
            "helpText": "Required skills for the position"
          }
        },
        {
          "name": "experience_years",
          "label": "Experience (Years)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:30"],
          "ui_config": {
            "placeholder": "e.g., 2",
            "helpText": "Minimum years of relevant experience required"
          }
        },
        {
          "name": "industry_experience",
          "label": "Industry Experience",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "retail_sales", "label": "Retail & Sales"},
              {"value": "hospitality", "label": "Hospitality & Tourism"},
              {"value": "events_entertainment", "label": "Events & Entertainment"},
              {"value": "education_training", "label": "Education & Training"},
              {"value": "fitness_sports", "label": "Fitness & Sports"},
              {"value": "media_content", "label": "Media & Content Creation"},
              {"value": "consulting_advisory", "label": "Consulting & Advisory"},
              {"value": "non_profit_ngo", "label": "Non-Profit & NGO"},
              {"value": "startups", "label": "Startups & Entrepreneurship"},
              {"value": "corporate_office", "label": "Corporate Office Environment"},
              {"value": "field_sales", "label": "Field Sales & Marketing"},
              {"value": "customer_support", "label": "Customer Support & Service"}
            ],
            "helpText": "Preferred industry experience"
          }
        },
        {
          "name": "language_proficiency",
          "label": "Language Proficiency",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "english", "label": "English"},
              {"value": "hindi", "label": "Hindi"},
              {"value": "regional_language", "label": "Regional Language"},
              {"value": "additional_languages", "label": "Additional Languages"},
              {"value": "business_communication", "label": "Business Communication"},
              {"value": "presentation_skills", "label": "Presentation Skills"}
            ],
            "helpText": "Required language and communication skills"
          }
        },
        {
          "name": "special_requirements",
          "label": "Special Requirements",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "flexible_hours", "label": "Flexible Working Hours"},
              {"value": "weekend_work", "label": "Weekend Work Availability"},
              {"value": "travel_willingness", "label": "Travel Willingness"},
              {"value": "driving_license", "label": "Valid Driving License"},
              {"value": "own_vehicle", "label": "Own Vehicle"},
              {"value": "smartphone_required", "label": "Smartphone Required"},
              {"value": "computer_access", "label": "Computer/Internet Access"},
              {"value": "portfolio_work", "label": "Portfolio/Work Samples Required"},
              {"value": "background_check", "label": "Background Check Required"},
              {"value": "medical_fitness", "label": "Medical Fitness Required"}
            ],
            "helpText": "Special requirements for the position"
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
              {"value": "customer_interaction", "label": "Customer Interaction & Service"},
              {"value": "administrative_tasks", "label": "Administrative & Clerical Tasks"},
              {"value": "sales_marketing", "label": "Sales & Marketing Activities"},
              {"value": "event_coordination", "label": "Event Planning & Coordination"},
              {"value": "content_creation", "label": "Content Creation & Management"},
              {"value": "social_media", "label": "Social Media Management"},
              {"value": "data_entry", "label": "Data Entry & Record Keeping"},
              {"value": "research_analysis", "label": "Research & Analysis"},
              {"value": "coordination", "label": "Coordination & Liaison"},
              {"value": "training_mentoring", "label": "Training & Mentoring"},
              {"value": "quality_assurance", "label": "Quality Assurance & Control"},
              {"value": "reporting", "label": "Reporting & Documentation"},
              {"value": "client_relationship", "label": "Client Relationship Management"},
              {"value": "project_assistance", "label": "Project Assistance & Support"}
            ],
            "helpText": "Primary responsibilities for this position"
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
              {"value": "performance_bonus", "label": "Performance Bonus"},
              {"value": "commission_earnings", "label": "Commission Earnings"},
              {"value": "incentives", "label": "Incentives & Rewards"},
              {"value": "overtime_pay", "label": "Overtime Pay"},
              {"value": "travel_allowance", "label": "Travel Allowance"},
              {"value": "meal_allowance", "label": "Meal Allowance"},
              {"value": "conveyance_allowance", "label": "Conveyance Allowance"},
              {"value": "mobile_allowance", "label": "Mobile/Phone Allowance"},
              {"value": "professional_development", "label": "Professional Development Allowance"},
              {"value": "health_allowance", "label": "Health & Wellness Allowance"}
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
              {"value": "provident_fund", "label": "Provident Fund"},
              {"value": "gratuity", "label": "Gratuity"},
              {"value": "paid_leave", "label": "Paid Leave (CL/SL)"},
              {"value": "sick_leave", "label": "Sick Leave"},
              {"value": "casual_leave", "label": "Casual Leave"},
              {"value": "maternity_leave", "label": "Maternity Leave"},
              {"value": "paternity_leave", "label": "Paternity Leave"},
              {"value": "flexible_hours", "label": "Flexible Working Hours"},
              {"value": "work_from_home", "label": "Work from Home Options"},
              {"value": "skill_development", "label": "Skill Development Programs"},
              {"value": "career_growth", "label": "Career Growth Opportunities"},
              {"value": "employee_discounts", "label": "Employee Discounts"},
              {"value": "gym_membership", "label": "Gym/Fitness Membership"}
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
      "title": "Company & Work Environment",
      "order": 4,
      "description": "Information about the company and work environment",
      "is_collapsible": true,
      "fields": [
        {
          "name": "company_type",
          "label": "Company Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "startup", "label": "Startup Company"},
              {"value": "small_business", "label": "Small Business"},
              {"value": "medium_enterprise", "label": "Medium Enterprise"},
              {"value": "large_corporation", "label": "Large Corporation"},
              {"value": "multinational", "label": "Multinational Company"},
              {"value": "retail_chain", "label": "Retail Chain/Store"},
              {"value": "event_company", "label": "Event Management Company"},
              {"value": "consulting_firm", "label": "Consulting Firm"},
              {"value": "education_institute", "label": "Education Institute"},
              {"value": "fitness_center", "label": "Fitness Center/Gym"},
              {"value": "media_agency", "label": "Media & Advertising Agency"},
              {"value": "non_profit", "label": "Non-Profit Organization"},
              {"value": "government_agency", "label": "Government Agency"},
              {"value": "hospitality_business", "label": "Hospitality Business"},
              {"value": "other_organization", "label": "Other Type of Organization"}
            ],
            "helpText": "Type of company or organization"
          }
        },
        {
          "name": "company_size",
          "label": "Company Size",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "micro", "label": "Micro (1-10 employees)"},
              {"value": "small", "label": "Small (11-50 employees)"},
              {"value": "medium", "label": "Medium (51-200 employees)"},
              {"value": "large", "label": "Large (201-1000 employees)"},
              {"value": "enterprise", "label": "Enterprise (1000+ employees)"}
            ],
            "helpText": "Size of the company"
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
              {"value": "large_team", "label": "Large Team (16-50 members)"},
              {"value": "department", "label": "Department (50+ members)"}
            ],
            "helpText": "Size of the team you'll be working with"
          }
        },
        {
          "name": "work_culture",
          "label": "Work Culture",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "innovative", "label": "Innovative & Creative Environment"},
              {"value": "fast_paced", "label": "Fast-Paced & Dynamic"},
              {"value": "collaborative", "label": "Collaborative Team Culture"},
              {"value": "professional", "label": "Professional & Formal"},
              {"value": "casual", "label": "Casual & Friendly"},
              {"value": "learning_focused", "label": "Learning & Development Focused"},
              {"value": "customer_centric", "label": "Customer-Centric Approach"},
              {"value": "quality_driven", "label": "Quality-Driven Organization"},
              {"value": "inclusive_diverse", "label": "Inclusive & Diverse Workplace"},
              {"value": "work_life_balance", "label": "Work-Life Balance Focus"},
              {"value": "flexible_environment", "label": "Flexible Work Environment"},
              {"value": "achievement_oriented", "label": "Achievement & Results Oriented"}
            ],
            "helpText": "Work culture and environment characteristics"
          }
        },
        {
          "name": "tools_software",
          "label": "Tools & Software",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "ms_office", "label": "Microsoft Office Suite"},
              {"value": "google_workspace", "label": "Google Workspace"},
              {"value": "crm_software", "label": "CRM Software"},
              {"value": "project_management", "label": "Project Management Tools"},
              {"value": "communication_tools", "label": "Communication Tools"},
              {"value": "design_software", "label": "Design Software"},
              {"value": "accounting_software", "label": "Accounting Software"},
              {"value": "social_media_tools", "label": "Social Media Management Tools"},
              {"value": "analytics_tools", "label": "Analytics & Reporting Tools"},
              {"value": "industry_specific", "label": "Industry-Specific Software"},
              {"value": "company_provided", "label": "Company Provided Equipment"},
              {"value": "bring_your_own", "label": "Bring Your Own Device"}
            ],
            "helpText": "Tools and software used in the role"
          }
        },
        {
          "name": "growth_opportunities",
          "label": "Growth Opportunities",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "skill_development", "label": "Skill Development Programs"},
              {"value": "certification_support", "label": "Certification Support"},
              {"value": "mentorship_program", "label": "Mentorship Programs"},
              {"value": "leadership_training", "label": "Leadership Training"},
              {"value": "cross_training", "label": "Cross-Training Opportunities"},
              {"value": "career_progression", "label": "Clear Career Progression Path"},
              {"value": "performance_reviews", "label": "Regular Performance Reviews"},
              {"value": "promotion_opportunities", "label": "Promotion Opportunities"},
              {"value": "salary_increments", "label": "Salary Increment Opportunities"},
              {"value": "international_exposure", "label": "International Exposure"},
              {"value": "conference_attendance", "label": "Conference & Workshop Attendance"},
              {"value": "higher_education", "label": "Higher Education Support"}
            ],
            "helpText": "Career growth and development opportunities"
          }
        },
        {
          "name": "company_description",
          "label": "Company Description",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Brief description of the company, its mission, values, and work environment",
            "helpText": "Overview of the company and its operations"
          }
        },
        {
          "name": "work_schedule",
          "label": "Work Schedule",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "standard_9_5", "label": "Standard 9-5 Hours"},
              {"value": "flexible_hours", "label": "Flexible Hours"},
              {"value": "shift_work", "label": "Shift Work"},
              {"value": "part_time_flexible", "label": "Part-Time Flexible"},
              {"value": "weekend_work", "label": "Weekend Work Required"},
              {"value": "rotating_schedule", "label": "Rotating Schedule"},
              {"value": "on_call_duty", "label": "On-Call Duty"},
              {"value": "project_based", "label": "Project-Based Schedule"}
            ],
            "helpText": "Typical work schedule and hours"
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
              {"value": "experience_letters", "label": "Experience Letters"},
              {"value": "certification_copies", "label": "Certification Copies"},
              {"value": "portfolio_samples", "label": "Portfolio/Work Samples"},
              {"value": "aadhar_card", "label": "Aadhar Card"},
              {"value": "pan_card", "label": "PAN Card"},
              {"value": "passport_photos", "label": "Passport Size Photos"},
              {"value": "address_proof", "label": "Address Proof"},
              {"value": "bank_details", "label": "Bank Account Details"},
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
              {"value": "phone_screening", "label": "Phone Screening"},
              {"value": "video_interview", "label": "Video Interview"},
              {"value": "in_person_interview", "label": "In-Person Interview"},
              {"value": "panel_interview", "label": "Panel Interview"},
              {"value": "group_interview", "label": "Group Interview"},
              {"value": "case_study", "label": "Case Study/Presentation"},
              {"value": "practical_test", "label": "Practical Test/Demonstration"},
              {"value": "multiple_rounds", "label": "Multiple Interview Rounds"},
              {"value": "assessment_test", "label": "Assessment/Test"},
              {"value": "reference_check", "label": "Reference Check"}
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
          "name": "assessment_required",
          "label": "Skills Assessment Required",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Whether skills assessment or test is required"
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