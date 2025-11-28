# IT Engineer & Developer Job Template for eBidPortal

**Template Name:** IT Engineer & Developer Job Template
**Version:** 1.0
**Category Type:** jobs
**Created:** November 21, 2025
**Industry Standards:** Based on technology industry standards, software development best practices, IT certifications, cybersecurity protocols, and digital transformation requirements for software engineers, developers, and IT professionals.

## Template JSON Structure

```json
{
  "name": "IT Engineer & Developer Job Template",
  "description": "Industry-standard template for IT engineer and developer job postings. Includes comprehensive fields covering programming skills, software development expertise, IT infrastructure knowledge, cybersecurity certifications, and technology industry standards specific to software engineers, developers, system administrators, and IT professionals.",
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
            "placeholder": "e.g., Software Developer, System Administrator, DevOps Engineer",
            "helpText": "Enter the specific IT/technical position title"
          }
        },
        {
          "name": "company_name",
          "label": "Company Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:100"],
          "ui_config": {
            "placeholder": "Enter technology company, IT firm, or software development company name",
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
            "placeholder": "e.g., Bangalore Tech Park, Hyderabad or specific office address",
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
              {"value": "freelance", "label": "Freelance"},
              {"value": "remote", "label": "Remote Work"},
              {"value": "hybrid", "label": "Hybrid (Office + Remote)"}
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
              {"value": "onsite", "label": "On-site (Office-based)"},
              {"value": "remote", "label": "Fully Remote"},
              {"value": "hybrid", "label": "Hybrid (Flexible)"},
              {"value": "distributed", "label": "Distributed Team"}
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
              {"value": "lead", "label": "Lead/Principal (10+ years)"},
              {"value": "architect", "label": "Architect/Expert (12+ years)"}
            ],
            "helpText": "Required technical experience level"
          }
        },
        {
          "name": "specialization",
          "label": "Technical Specialization",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "software_development", "label": "Software Development"},
              {"value": "web_development", "label": "Web Development"},
              {"value": "mobile_development", "label": "Mobile App Development"},
              {"value": "system_administration", "label": "System Administration"},
              {"value": "devops", "label": "DevOps & Infrastructure"},
              {"value": "data_engineering", "label": "Data Engineering"},
              {"value": "cybersecurity", "label": "Cybersecurity"},
              {"value": "cloud_architecture", "label": "Cloud Architecture"},
              {"value": "ai_ml", "label": "AI/ML Engineering"},
              {"value": "qa_testing", "label": "QA & Testing"},
              {"value": "ui_ux", "label": "UI/UX Development"},
              {"value": "blockchain", "label": "Blockchain Development"}
            ],
            "helpText": "Primary technical specialization area"
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
              {"value": "bachelor_cs", "label": "Bachelor's in Computer Science/IT"},
              {"value": "bachelor_engineering", "label": "Bachelor's in Engineering"},
              {"value": "master_cs", "label": "Master's in Computer Science/IT"},
              {"value": "diploma_computer", "label": "Computer Science Diploma"},
              {"value": "bootcamp_certification", "label": "Coding Bootcamp Certification"},
              {"value": "self_taught", "label": "Self-Taught with Portfolio"}
            ],
            "helpText": "Minimum education qualification required"
          }
        },
        {
          "name": "technical_certifications",
          "label": "Technical Certifications",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "aws_certified", "label": "AWS Certified"},
              {"value": "azure_certified", "label": "Microsoft Azure Certified"},
              {"value": "gcp_certified", "label": "Google Cloud Certified"},
              {"value": "cisco_certified", "label": "Cisco Certified"},
              {"value": "redhat_certified", "label": "Red Hat Certified"},
              {"value": "microsoft_certified", "label": "Microsoft Certified"},
              {"value": "comptia_security", "label": "CompTIA Security+"},
              {"value": "cissp", "label": "CISSP Certified"},
              {"value": "pmp_certified", "label": "PMP Certified"},
              {"value": "scrum_master", "label": "Certified Scrum Master"},
              {"value": "itil_certified", "label": "ITIL Certified"}
            ],
            "helpText": "Preferred technical certifications"
          }
        },
        {
          "name": "programming_languages",
          "label": "Programming Languages",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "javascript", "label": "JavaScript/TypeScript"},
              {"value": "python", "label": "Python"},
              {"value": "java", "label": "Java"},
              {"value": "csharp", "label": "C#/.NET"},
              {"value": "cpp", "label": "C/C++"},
              {"value": "php", "label": "PHP"},
              {"value": "ruby", "label": "Ruby"},
              {"value": "go", "label": "Go"},
              {"value": "rust", "label": "Rust"},
              {"value": "swift", "label": "Swift"},
              {"value": "kotlin", "label": "Kotlin"},
              {"value": "scala", "label": "Scala"},
              {"value": "r", "label": "R"},
              {"value": "sql", "label": "SQL"}
            ],
            "helpText": "Required programming languages proficiency"
          }
        },
        {
          "name": "frameworks_technologies",
          "label": "Frameworks & Technologies",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "react", "label": "React.js"},
              {"value": "angular", "label": "Angular"},
              {"value": "vue", "label": "Vue.js"},
              {"value": "node_js", "label": "Node.js"},
              {"value": "django", "label": "Django"},
              {"value": "flask", "label": "Flask"},
              {"value": "spring_boot", "label": "Spring Boot"},
              {"value": "dotnet_core", "label": ".NET Core"},
              {"value": "laravel", "label": "Laravel"},
              {"value": "express", "label": "Express.js"},
              {"value": "docker", "label": "Docker"},
              {"value": "kubernetes", "label": "Kubernetes"},
              {"value": "jenkins", "label": "Jenkins"},
              {"value": "git", "label": "Git"},
              {"value": "linux", "label": "Linux/Unix"},
              {"value": "mongodb", "label": "MongoDB"},
              {"value": "postgresql", "label": "PostgreSQL"},
              {"value": "mysql", "label": "MySQL"},
              {"value": "redis", "label": "Redis"}
            ],
            "helpText": "Required frameworks and technologies"
          }
        },
        {
          "name": "experience_years",
          "label": "Technical Experience (Years)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:50"],
          "ui_config": {
            "placeholder": "e.g., 3",
            "helpText": "Minimum years of IT/software development experience required"
          }
        },
        {
          "name": "soft_skills",
          "label": "Soft Skills",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "problem_solving", "label": "Problem Solving"},
              {"value": "analytical_thinking", "label": "Analytical Thinking"},
              {"value": "communication", "label": "Communication Skills"},
              {"value": "team_collaboration", "label": "Team Collaboration"},
              {"value": "agile_methodology", "label": "Agile Methodology"},
              {"value": "project_management", "label": "Project Management"},
              {"value": "mentoring", "label": "Mentoring Skills"},
              {"value": "continuous_learning", "label": "Continuous Learning"},
              {"value": "client_interaction", "label": "Client Interaction"},
              {"value": "documentation", "label": "Technical Documentation"}
            ],
            "helpText": "Required soft skills and competencies"
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
              {"value": "software_development", "label": "Software Development & Coding"},
              {"value": "system_design", "label": "System Architecture & Design"},
              {"value": "code_review", "label": "Code Review & Quality Assurance"},
              {"value": "testing_debugging", "label": "Testing & Debugging"},
              {"value": "deployment_maintenance", "label": "Deployment & Maintenance"},
              {"value": "performance_optimization", "label": "Performance Optimization"},
              {"value": "security_implementation", "label": "Security Implementation"},
              {"value": "documentation", "label": "Technical Documentation"},
              {"value": "client_support", "label": "Client/Technical Support"},
              {"value": "team_leadership", "label": "Team Leadership/Mentoring"},
              {"value": "research_innovation", "label": "Research & Innovation"},
              {"value": "compliance_standards", "label": "Compliance & Standards"}
            ],
            "helpText": "Primary responsibilities for this IT position"
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
            "placeholder": "e.g., 50000",
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
            "placeholder": "e.g., 150000",
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
              {"value": "variable_pay", "label": "Variable Pay/Performance Bonus"},
              {"value": "stock_options", "label": "Stock Options/ESOPs"},
              {"value": "profit_sharing", "label": "Profit Sharing"},
              {"value": "project_bonus", "label": "Project Completion Bonus"},
              {"value": "certification_allowance", "label": "Certification Allowance"},
              {"value": "learning_allowance", "label": "Learning & Development Allowance"},
              {"value": "remote_work_allowance", "label": "Remote Work Allowance"},
              {"value": "equipment_allowance", "label": "Equipment Allowance"}
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
              {"value": "life_insurance", "label": "Life Insurance"},
              {"value": "accident_insurance", "label": "Accident Insurance"},
              {"value": "gym_membership", "label": "Gym/Fitness Membership"},
              {"value": "food_allowance", "label": "Food Allowance"},
              {"value": "transportation", "label": "Transportation Allowance"},
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
      "title": "Company & Work Culture",
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
              {"value": "product_startup", "label": "Product Startup"},
              {"value": "service_startup", "label": "Service Startup"},
              {"value": "mid_size_tech", "label": "Mid-size Tech Company"},
              {"value": "large_enterprise", "label": "Large Enterprise"},
              {"value": "consulting_firm", "label": "IT Consulting Firm"},
              {"value": "digital_agency", "label": "Digital Agency"},
              {"value": "fintech", "label": "FinTech Company"},
              {"value": "healthtech", "label": "HealthTech Company"},
              {"value": "edtech", "label": "EdTech Company"},
              {"value": "ecommerce", "label": "E-commerce Platform"}
            ],
            "helpText": "Type of technology company"
          }
        },
        {
          "name": "team_size",
          "label": "Team Size",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "startup", "label": "Startup (1-50 employees)"},
              {"value": "small", "label": "Small (51-200 employees)"},
              {"value": "medium", "label": "Medium (201-1000 employees)"},
              {"value": "large", "label": "Large (1000+ employees)"}
            ],
            "helpText": "Size of the engineering team"
          }
        },
        {
          "name": "development_methodology",
          "label": "Development Methodology",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "agile", "label": "Agile Development"},
              {"value": "scrum", "label": "Scrum Framework"},
              {"value": "kanban", "label": "Kanban Methodology"},
              {"value": "waterfall", "label": "Waterfall Methodology"},
              {"value": "devops", "label": "DevOps Practices"},
              {"value": "test_driven", "label": "Test-Driven Development"},
              {"value": "continuous_integration", "label": "Continuous Integration/Delivery"},
              {"value": "pair_programming", "label": "Pair Programming"}
            ],
            "helpText": "Development methodologies and practices used"
          }
        },
        {
          "name": "work_culture",
          "label": "Work Culture",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "collaborative", "label": "Collaborative Environment"},
              {"value": "innovative", "label": "Innovation-Driven"},
              {"value": "learning_culture", "label": "Learning Culture"},
              {"value": "work_life_balance", "label": "Work-Life Balance"},
              {"value": "open_communication", "label": "Open Communication"},
              {"value": "diversity_inclusion", "label": "Diversity & Inclusion"},
              {"value": "flexible_timing", "label": "Flexible Timing"},
              {"value": "remote_friendly", "label": "Remote-Friendly"},
              {"value": "flat_hierarchy", "label": "Flat Hierarchy"},
              {"value": "performance_driven", "label": "Performance-Driven"}
            ],
            "helpText": "Company work culture and values"
          }
        },
        {
          "name": "tech_stack",
          "label": "Technology Stack",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Brief description of the primary technology stack, tools, and platforms used",
            "helpText": "Overview of the technology ecosystem"
          }
        },
        {
          "name": "company_description",
          "label": "Company Description",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Brief description of the company, its mission, products/services, and work environment",
            "helpText": "Overview of the company and its operations"
          }
        },
        {
          "name": "growth_opportunities",
          "label": "Growth Opportunities",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "career_progression", "label": "Clear Career Progression"},
              {"value": "skill_development", "label": "Skill Development Programs"},
              {"value": "leadership_roles", "label": "Leadership Opportunities"},
              {"value": "international_exposure", "label": "International Exposure"},
              {"value": "cross_functional", "label": "Cross-Functional Projects"},
              {"value": "research_projects", "label": "Research & Innovation Projects"},
              {"value": "conference_speaking", "label": "Conference Speaking"},
              {"value": "publication_opportunities", "label": "Publication Opportunities"}
            ],
            "helpText": "Career growth and development opportunities"
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
              {"value": "portfolio", "label": "Portfolio/GitHub Profile"},
              {"value": "educational_certificates", "label": "Educational Certificates"},
              {"value": "technical_certificates", "label": "Technical Certifications"},
              {"value": "experience_letters", "label": "Experience Letters"},
              {"value": "project_samples", "label": "Project Samples/Code"},
              {"value": "recommendation_letters", "label": "Recommendation Letters"},
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
              {"value": "online_test", "label": "Online Coding Test"},
              {"value": "technical_interview", "label": "Technical Interview"},
              {"value": "system_design", "label": "System Design Interview"},
              {"value": "pair_programming", "label": "Pair Programming Session"},
              {"value": "multiple_rounds", "label": "Multiple Interview Rounds"},
              {"value": "take_home_project", "label": "Take-Home Project"},
              {"value": "onsite_interview", "label": "On-site Interview"},
              {"value": "panel_interview", "label": "Panel Interview"}
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