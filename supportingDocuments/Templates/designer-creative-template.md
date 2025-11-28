# Designer & Creative Job Template for eBidPortal

**Template Name:** Designer & Creative Job Template
**Version:** 1.0
**Category Type:** jobs
**Created:** November 21, 2025
**Industry Standards:** Based on creative industry standards, design methodologies, digital media production, branding guidelines, and creative professional best practices for graphic designers, UI/UX designers, creative directors, and digital media professionals.

## Template JSON Structure

```json
{
  "name": "Designer & Creative Job Template",
  "description": "Industry-standard template for designer and creative job postings. Includes comprehensive fields covering design expertise, creative skills, software proficiency, portfolio requirements, and digital media standards specific to graphic designers, UI/UX designers, creative directors, and digital media professionals.",
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
            "placeholder": "e.g., Graphic Designer, UI/UX Designer, Creative Director",
            "helpText": "Enter the specific creative/design position title"
          }
        },
        {
          "name": "company_name",
          "label": "Company Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:100"],
          "ui_config": {
            "placeholder": "Enter design agency, creative studio, or marketing company name",
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
            "placeholder": "e.g., Mumbai Creative District, Bangalore Tech Hub or specific studio address",
            "helpText": "Location of the studio/office"
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
              {"value": "studio_based", "label": "Studio Based"},
              {"value": "hybrid", "label": "Hybrid (Office + Remote)"},
              {"value": "remote", "label": "Fully Remote"},
              {"value": "client_sites", "label": "Client Site Visits"}
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
              {"value": "lead", "label": "Lead/Principal (10+ years)"}
            ],
            "helpText": "Required design/creative experience level"
          }
        },
        {
          "name": "design_specialization",
          "label": "Design Specialization",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "graphic_design", "label": "Graphic Design"},
              {"value": "ui_ux_design", "label": "UI/UX Design"},
              {"value": "web_design", "label": "Web Design"},
              {"value": "brand_identity", "label": "Brand Identity & Logo Design"},
              {"value": "packaging_design", "label": "Packaging Design"},
              {"value": "advertising_design", "label": "Advertising & Marketing Design"},
              {"value": "motion_graphics", "label": "Motion Graphics & Animation"},
              {"value": "illustrator", "label": "Illustration & Digital Art"},
              {"value": "photoshop_artist", "label": "Photo Manipulation & Editing"},
              {"value": "creative_direction", "label": "Creative Direction"},
              {"value": "art_direction", "label": "Art Direction"},
              {"value": "multimedia_design", "label": "Multimedia Design"}
            ],
            "helpText": "Primary area of design specialization"
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
              {"value": "design_diploma", "label": "Design Diploma/Certificate"},
              {"value": "bachelor_fine_arts", "label": "Bachelor of Fine Arts"},
              {"value": "bachelor_design", "label": "Bachelor of Design"},
              {"value": "bfa_communication", "label": "BFA Communication Design"},
              {"value": "masters_design", "label": "Master of Design/Fine Arts"},
              {"value": "mfa_digital_media", "label": "MFA Digital Media"},
              {"value": "graphic_design_course", "label": "Professional Graphic Design Course"},
              {"value": "self_taught", "label": "Self-Taught with Portfolio"}
            ],
            "helpText": "Minimum education qualification required"
          }
        },
        {
          "name": "design_certifications",
          "label": "Design Certifications",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "adobe_certified", "label": "Adobe Certified Expert"},
              {"value": "google_ux", "label": "Google UX Design Certificate"},
              {"value": "interaction_design", "label": "Interaction Design Foundation"},
              {"value": "principle_design", "label": "Principle for Mac Certification"},
              {"value": "sketch_certified", "label": "Sketch Certified"},
              {"value": "figma_certified", "label": "Figma Professional Certification"},
              {"value": "invision_certified", "label": "InVision Certified"},
              {"value": "typography_certified", "label": "Typography Certification"},
              {"value": "color_theory", "label": "Color Theory Certification"},
              {"value": "brand_strategy", "label": "Brand Strategy Certification"}
            ],
            "helpText": "Preferred design and software certifications"
          }
        },
        {
          "name": "design_software",
          "label": "Design Software Proficiency",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "adobe_photoshop", "label": "Adobe Photoshop"},
              {"value": "adobe_illustrator", "label": "Adobe Illustrator"},
              {"value": "adobe_indesign", "label": "Adobe InDesign"},
              {"value": "adobe_xd", "label": "Adobe XD"},
              {"value": "adobe_after_effects", "label": "Adobe After Effects"},
              {"value": "adobe_premiere", "label": "Adobe Premiere Pro"},
              {"value": "figma", "label": "Figma"},
              {"value": "sketch", "label": "Sketch"},
              {"value": "invision", "label": "InVision Studio"},
              {"value": "principle", "label": "Principle"},
              {"value": "framer", "label": "Framer"},
              {"value": "zeplin", "label": "Zeplin"},
              {"value": "blender", "label": "Blender 3D"},
              {"value": "cinema_4d", "label": "Cinema 4D"},
              {"value": "maya", "label": "Autodesk Maya"}
            ],
            "helpText": "Required design software proficiency"
          }
        },
        {
          "name": "creative_skills",
          "label": "Creative Skills",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "visual_communication", "label": "Visual Communication"},
              {"value": "typography", "label": "Typography & Layout"},
              {"value": "color_theory", "label": "Color Theory & Psychology"},
              {"value": "brand_identity", "label": "Brand Identity Development"},
              {"value": "user_experience", "label": "User Experience Design"},
              {"value": "user_interface", "label": "User Interface Design"},
              {"value": "responsive_design", "label": "Responsive Design"},
              {"value": "mobile_design", "label": "Mobile App Design"},
              {"value": "web_design", "label": "Web Design"},
              {"value": "print_design", "label": "Print Design"},
              {"value": "packaging_design", "label": "Packaging Design"},
              {"value": "motion_graphics", "label": "Motion Graphics"},
              {"value": "3d_modeling", "label": "3D Modeling & Rendering"},
              {"value": "illustration", "label": "Digital Illustration"},
              {"value": "photo_editing", "label": "Photo Editing & Manipulation"}
            ],
            "helpText": "Required creative and design skills"
          }
        },
        {
          "name": "experience_years",
          "label": "Design Experience (Years)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:50"],
          "ui_config": {
            "placeholder": "e.g., 3",
            "helpText": "Minimum years of design/creative experience required"
          }
        },
        {
          "name": "portfolio_requirement",
          "label": "Portfolio Requirements",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "online_portfolio", "label": "Online Portfolio Website"},
              {"value": "behance_profile", "label": "Behance Profile"},
              {"value": "dribbble_profile", "label": "Dribbble Profile"},
              {"value": "personal_website", "label": "Personal Website"},
              {"value": "case_studies", "label": "Detailed Case Studies"},
              {"value": "live_projects", "label": "Live Project Links"},
              {"value": "brand_identity_work", "label": "Brand Identity Work"},
              {"value": "ui_ux_projects", "label": "UI/UX Project Samples"},
              {"value": "print_design_samples", "label": "Print Design Samples"},
              {"value": "motion_work", "label": "Motion Graphics Work"}
            ],
            "helpText": "Required portfolio elements and presentation"
          }
        },
        {
          "name": "industry_experience",
          "label": "Industry Experience",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "advertising", "label": "Advertising & Marketing"},
              {"value": "technology", "label": "Technology & Software"},
              {"value": "ecommerce", "label": "E-commerce & Retail"},
              {"value": "media_entertainment", "label": "Media & Entertainment"},
              {"value": "publishing", "label": "Publishing & Print Media"},
              {"value": "corporate_branding", "label": "Corporate Branding"},
              {"value": "startups", "label": "Startups & Entrepreneurship"},
              {"value": "non_profit", "label": "Non-Profit Organizations"},
              {"value": "education", "label": "Education Sector"},
              {"value": "healthcare", "label": "Healthcare & Wellness"}
            ],
            "helpText": "Preferred industry experience"
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
              {"value": "concept_development", "label": "Concept Development & Ideation"},
              {"value": "visual_design", "label": "Visual Design & Creation"},
              {"value": "brand_guidelines", "label": "Brand Guidelines Development"},
              {"value": "ui_ux_design", "label": "UI/UX Design & Prototyping"},
              {"value": "responsive_design", "label": "Responsive Web Design"},
              {"value": "mobile_design", "label": "Mobile App Design"},
              {"value": "print_design", "label": "Print Design & Layout"},
              {"value": "packaging_design", "label": "Packaging Design"},
              {"value": "motion_graphics", "label": "Motion Graphics & Animation"},
              {"value": "client_presentations", "label": "Client Presentations"},
              {"value": "design_systems", "label": "Design System Creation"},
              {"value": "user_research", "label": "User Research & Testing"},
              {"value": "design_collaboration", "label": "Cross-functional Collaboration"},
              {"value": "design_reviews", "label": "Design Reviews & Feedback"}
            ],
            "helpText": "Primary responsibilities for this creative position"
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
            "placeholder": "e.g., 25000",
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
            "placeholder": "e.g., 60000",
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
              {"value": "project_incentive", "label": "Project Completion Incentive"},
              {"value": "creative_allowance", "label": "Creative Tools Allowance"},
              {"value": "software_subscription", "label": "Software Subscription Support"},
              {"value": "conference_budget", "label": "Conference/Workshop Budget"},
              {"value": "portfolio_development", "label": "Portfolio Development Support"},
              {"value": "overtime_pay", "label": "Overtime Pay"},
              {"value": "freelance_opportunities", "label": "Freelance Project Opportunities"}
            ],
            "helpText": "Additional compensation and creative perks"
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
              {"value": "flexible_hours", "label": "Flexible Working Hours"},
              {"value": "creative_workspace", "label": "Creative Workspace"},
              {"value": "design_software", "label": "Latest Design Software"},
              {"value": "skill_development", "label": "Skill Development Programs"},
              {"value": "gym_membership", "label": "Gym/Fitness Membership"},
              {"value": "team_outings", "label": "Team Outings & Events"},
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
      "title": "Company & Creative Environment",
      "order": 4,
      "description": "Information about the company and creative work environment",
      "is_collapsible": true,
      "fields": [
        {
          "name": "company_type",
          "label": "Company Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "design_agency", "label": "Design Agency"},
              {"value": "creative_studio", "label": "Creative Studio"},
              {"value": "advertising_agency", "label": "Advertising Agency"},
              {"value": "digital_agency", "label": "Digital Marketing Agency"},
              {"value": "tech_startup", "label": "Technology Startup"},
              {"value": "corporate_design", "label": "Corporate Design Department"},
              {"value": "media_company", "label": "Media & Entertainment Company"},
              {"value": "publishing_house", "label": "Publishing House"},
              {"value": "ecommerce_brand", "label": "E-commerce Brand"},
              {"value": "non_profit", "label": "Non-Profit Organization"}
            ],
            "helpText": "Type of creative company"
          }
        },
        {
          "name": "company_size",
          "label": "Company Size",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "boutique", "label": "Boutique Studio (1-10 employees)"},
              {"value": "small", "label": "Small Agency (11-50 employees)"},
              {"value": "medium", "label": "Medium Agency (51-200 employees)"},
              {"value": "large", "label": "Large Agency (200+ employees)"}
            ],
            "helpText": "Size of the creative company"
          }
        },
        {
          "name": "client_portfolio",
          "label": "Client Portfolio",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "startups", "label": "Startups & Entrepreneurs"},
              {"value": "corporate_clients", "label": "Corporate Clients"},
              {"value": "ecommerce_brands", "label": "E-commerce Brands"},
              {"value": "tech_companies", "label": "Technology Companies"},
              {"value": "media_entertainment", "label": "Media & Entertainment"},
              {"value": "fashion_brands", "label": "Fashion & Lifestyle Brands"},
              {"value": "healthcare", "label": "Healthcare Organizations"},
              {"value": "education", "label": "Education Sector"},
              {"value": "government", "label": "Government & Public Sector"},
              {"value": "international_clients", "label": "International Clients"}
            ],
            "helpText": "Types of clients served"
          }
        },
        {
          "name": "creative_process",
          "label": "Creative Process",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "agile_design", "label": "Agile Design Process"},
              {"value": "design_sprints", "label": "Design Sprints"},
              {"value": "user_centered", "label": "User-Centered Design"},
              {"value": "iterative_design", "label": "Iterative Design Process"},
              {"value": "collaborative_design", "label": "Collaborative Design Approach"},
              {"value": "research_driven", "label": "Research-Driven Design"},
              {"value": "data_informed", "label": "Data-Informed Design"},
              {"value": "rapid_prototyping", "label": "Rapid Prototyping"},
              {"value": "design_systems", "label": "Design Systems Approach"},
              {"value": "accessibility_focus", "label": "Accessibility-Focused Design"}
            ],
            "helpText": "Creative methodologies and processes used"
          }
        },
        {
          "name": "work_culture",
          "label": "Work Culture",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "creative_freedom", "label": "Creative Freedom & Autonomy"},
              {"value": "collaborative_environment", "label": "Collaborative Environment"},
              {"value": "learning_culture", "label": "Continuous Learning Culture"},
              {"value": "diverse_team", "label": "Diverse & Inclusive Team"},
              {"value": "flexible_schedule", "label": "Flexible Work Schedule"},
              {"value": "remote_work", "label": "Remote Work Options"},
              {"value": "portfolio_showcase", "label": "Portfolio Showcase Opportunities"},
              {"value": "creative_challenges", "label": "Creative Challenges & Competitions"},
              {"value": "mentorship_program", "label": "Mentorship Programs"},
              {"value": "work_life_balance", "label": "Work-Life Balance Focus"}
            ],
            "helpText": "Creative work culture and environment"
          }
        },
        {
          "name": "tools_equipment",
          "label": "Tools & Equipment",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "latest_software", "label": "Latest Design Software"},
              {"value": "high_end_computers", "label": "High-End Computers"},
              {"value": "graphic_tablets", "label": "Graphic Tablets"},
              {"value": "large_monitors", "label": "Large Monitors"},
              {"value": "design_books", "label": "Design Books & Resources"},
              {"value": "online_subscriptions", "label": "Online Learning Subscriptions"},
              {"value": "camera_equipment", "label": "Photography Equipment"},
              {"value": "3d_printer", "label": "3D Printer"},
              {"value": "scanning_equipment", "label": "Scanning Equipment"},
              {"value": "presentation_tools", "label": "Presentation Tools"}
            ],
            "helpText": "Creative tools and equipment provided"
          }
        },
        {
          "name": "company_description",
          "label": "Company Description",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Brief description of the company, its creative philosophy, notable projects, and work environment",
            "helpText": "Overview of the creative company and its operations"
          }
        },
        {
          "name": "team_size",
          "label": "Creative Team Size",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "small", "label": "Small Team (2-5 designers)"},
              {"value": "medium", "label": "Medium Team (6-20 designers)"},
              {"value": "large", "label": "Large Team (21-50 designers)"},
              {"value": "department", "label": "Full Creative Department (50+ designers)"}
            ],
            "helpText": "Size of the creative/design team"
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
              {"value": "portfolio", "label": "Design Portfolio"},
              {"value": "cover_letter", "label": "Cover Letter"},
              {"value": "behance_link", "label": "Behance Profile Link"},
              {"value": "dribbble_link", "label": "Dribbble Profile Link"},
              {"value": "personal_website", "label": "Personal Website/Portfolio"},
              {"value": "educational_certificates", "label": "Educational Certificates"},
              {"value": "design_certificates", "label": "Design Software Certificates"},
              {"value": "experience_letters", "label": "Experience Letters"},
              {"value": "aadhar_card", "label": "Aadhar Card"},
              {"value": "pan_card", "label": "PAN Card"}
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
              {"value": "portfolio_review", "label": "Portfolio Review"},
              {"value": "design_challenge", "label": "Design Challenge/Test"},
              {"value": "creative_interview", "label": "Creative Interview"},
              {"value": "technical_interview", "label": "Technical Skills Interview"},
              {"value": "cultural_fit", "label": "Cultural Fit Interview"},
              {"value": "multiple_rounds", "label": "Multiple Interview Rounds"},
              {"value": "presentation", "label": "Portfolio Presentation"},
              {"value": "group_interview", "label": "Group Interview"}
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
            "placeholder": "hr@designstudio.com",
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