# Teacher & Tutor Job Template for eBidPortal

**Template Name:** Teacher & Tutor Job Template
**Version:** 1.0
**Category Type:** jobs
**Created:** November 21, 2025
**Industry Standards:** Based on National Education Policy 2020, NCTE standards, RTE Act requirements, and CBSE/ICSE/State Board curriculum frameworks

## Template JSON Structure

```json
{
  "name": "Teacher & Tutor Job Template",
  "description": "Industry-standard template for teaching and tutoring job postings. Includes comprehensive fields covering educational qualifications, teaching methodologies, subject expertise, student age groups, and educational standards specific to teaching and tutoring professions.",
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
            "placeholder": "e.g., Primary Teacher, Math Tutor, English Teacher",
            "helpText": "Enter the specific job title for this teaching position"
          }
        },
        {
          "name": "company_name",
          "label": "Institution Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:100"],
          "ui_config": {
            "placeholder": "Enter school, college, or tutoring center name",
            "helpText": "Name of the educational institution"
          }
        },
        {
          "name": "location",
          "label": "Work Location",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3"],
          "ui_config": {
            "placeholder": "e.g., Mumbai, Maharashtra or specific campus address",
            "helpText": "Location of the educational institution"
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
              {"value": "freelance", "label": "Freelance Tutor"},
              {"value": "visiting", "label": "Visiting Faculty"}
            ],
            "helpText": "Type of employment arrangement"
          }
        },
        {
          "name": "teaching_mode",
          "label": "Teaching Mode",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "offline", "label": "Offline/In-Person"},
              {"value": "online", "label": "Online/Virtual"},
              {"value": "hybrid", "label": "Hybrid (Both)"},
              {"value": "home_tuition", "label": "Home Tuition"}
            ],
            "helpText": "Primary mode of teaching delivery"
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
              {"value": "experienced", "label": "Experienced (5-10 years)"},
              {"value": "senior", "label": "Senior (10+ years)"}
            ],
            "helpText": "Required teaching experience level"
          }
        },
        {
          "name": "subject_specialization",
          "label": "Subject Specialization",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "mathematics", "label": "Mathematics"},
              {"value": "english", "label": "English"},
              {"value": "science", "label": "Science (Physics/Chemistry/Biology)"},
              {"value": "social_studies", "label": "Social Studies"},
              {"value": "hindi", "label": "Hindi"},
              {"value": "sanskrit", "label": "Sanskrit"},
              {"value": "computer_science", "label": "Computer Science"},
              {"value": "art_craft", "label": "Art & Craft"},
              {"value": "music", "label": "Music"},
              {"value": "physical_education", "label": "Physical Education"},
              {"value": "commerce", "label": "Commerce"},
              {"value": "economics", "label": "Economics"}
            ],
            "helpText": "Subjects the teacher specializes in"
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
          "name": "education_qualification",
          "label": "Education Qualification",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "bachelors", "label": "Bachelor's Degree"},
              {"value": "masters", "label": "Master's Degree"},
              {"value": "b_ed", "label": "B.Ed (Bachelor of Education)"},
              {"value": "m_ed", "label": "M.Ed (Master of Education)"},
              {"value": "phd", "label": "Ph.D"},
              {"value": "diploma", "label": "Teaching Diploma"},
              {"value": "ctet", "label": "CTET Qualified"},
              {"value": "tet", "label": "TET Qualified"}
            ],
            "helpText": "Minimum education qualification required"
          }
        },
        {
          "name": "teaching_certifications",
          "label": "Teaching Certifications",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "btcp", "label": "BTC/P (Basic Training Certificate)"},
              {"value": "ctet", "label": "CTET (Central Teacher Eligibility Test)"},
              {"value": "tet", "label": "TET (Teacher Eligibility Test)"},
              {"value": "ncf", "label": "NCF (National Curriculum Framework)"},
              {"value": "cce", "label": "CCE (Continuous Comprehensive Evaluation)"},
              {"value": "montessori", "label": "Montessori Training"},
              {"value": "special_education", "label": "Special Education Certification"},
              {"value": "computer_teaching", "label": "Computer Teaching Certification"}
            ],
            "helpText": "Preferred teaching certifications and qualifications"
          }
        },
        {
          "name": "grade_level",
          "label": "Grade/Level Specialization",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "pre_primary", "label": "Pre-Primary (Nursery/LKG/UKG)"},
              {"value": "primary", "label": "Primary (1st-5th Grade)"},
              {"value": "middle", "label": "Middle School (6th-8th Grade)"},
              {"value": "secondary", "label": "Secondary (9th-10th Grade)"},
              {"value": "senior_secondary", "label": "Senior Secondary (11th-12th Grade)"},
              {"value": "undergraduate", "label": "Undergraduate College"},
              {"value": "postgraduate", "label": "Postgraduate/Masters"},
              {"value": "competitive_exams", "label": "Competitive Exams (JEE/NEET)"}
            ],
            "helpText": "Grade levels the teacher can handle"
          }
        },
        {
          "name": "teaching_experience_years",
          "label": "Teaching Experience (Years)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:50"],
          "ui_config": {
            "placeholder": "e.g., 3",
            "helpText": "Minimum years of teaching experience required"
          }
        },
        {
          "name": "curriculum_familiarity",
          "label": "Curriculum Familiarity",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "cbse", "label": "CBSE"},
              {"value": "icse", "label": "ICSE"},
              {"value": "state_board", "label": "State Board"},
              {"value": "ib", "label": "International Baccalaureate (IB)"},
              {"value": "cambridge", "label": "Cambridge International"},
              {"value": "montessori", "label": "Montessori"},
              {"value": "waldorf", "label": "Waldorf/Steiner"},
              {"value": "playway", "label": "Playway Method"}
            ],
            "helpText": "Familiarity with different educational curricula"
          }
        },
        {
          "name": "teaching_methodology",
          "label": "Teaching Methodology",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "traditional", "label": "Traditional/Chalk & Board"},
              {"value": "interactive", "label": "Interactive Learning"},
              {"value": "activity_based", "label": "Activity-Based Learning"},
              {"value": "project_based", "label": "Project-Based Learning"},
              {"value": "experiential", "label": "Experiential Learning"},
              {"value": "blended", "label": "Blended Learning"},
              {"value": "montessori", "label": "Montessori Method"},
              {"value": "playway", "label": "Playway Method"}
            ],
            "helpText": "Teaching methodologies and approaches used"
          }
        },
        {
          "name": "special_skills",
          "label": "Special Skills & Competencies",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "classroom_management", "label": "Classroom Management"},
              {"value": "student_assessment", "label": "Student Assessment & Evaluation"},
              {"value": "lesson_planning", "label": "Lesson Planning"},
              {"value": "parent_communication", "label": "Parent-Teacher Communication"},
              {"value": "special_needs", "label": "Teaching Special Needs Students"},
              {"value": "multilingual", "label": "Multilingual Teaching"},
              {"value": "technology_integration", "label": "Technology Integration"},
              {"value": "counseling", "label": "Student Counseling"}
            ],
            "helpText": "Additional skills and competencies"
          }
        },
        {
          "name": "working_hours",
          "label": "Working Hours per Week",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:60"],
          "ui_config": {
            "placeholder": "e.g., 20",
            "helpText": "Expected working hours per week"
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
          "name": "payment_type",
          "label": "Payment Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "monthly_salary", "label": "Monthly Salary"},
              {"value": "hourly_rate", "label": "Hourly Rate"},
              {"value": "per_session", "label": "Per Session/Per Class"},
              {"value": "commission", "label": "Commission Based"},
              {"value": "stipend", "label": "Stipend"}
            ],
            "helpText": "How the teacher/tutor gets compensated"
          }
        },
        {
          "name": "hourly_rate_min",
          "label": "Minimum Hourly Rate (INR)",
          "type": "number",
          "required": false,
          "validation": ["min:100", "max:5000"],
          "ui_config": {
            "placeholder": "e.g., 300",
            "helpText": "Minimum hourly rate for tutoring sessions"
          }
        },
        {
          "name": "hourly_rate_max",
          "label": "Maximum Hourly Rate (INR)",
          "type": "number",
          "required": false,
          "ui_config": {
            "placeholder": "e.g., 800",
            "helpText": "Maximum hourly rate for tutoring sessions"
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
              {"value": "student_retention", "label": "Student Retention Bonus"},
              {"value": "result_improvement", "label": "Result Improvement Incentive"},
              {"value": "referral_bonus", "label": "Referral Bonus"},
              {"value": "annual_increment", "label": "Annual Increment"},
              {"value": "provident_fund", "label": "Provident Fund Contribution"}
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
              {"value": "paid_leave", "label": "Paid Leave"},
              {"value": "health_insurance", "label": "Health Insurance"},
              {"value": "professional_development", "label": "Professional Development Allowance"},
              {"value": "transport_allowance", "label": "Transport Allowance"},
              {"value": "meal_allowance", "label": "Meal Allowance"},
              {"value": "gratuity", "label": "Gratuity"},
              {"value": "maternity_leave", "label": "Maternity Leave"}
            ],
            "helpText": "Benefits provided by the institution"
          }
        }
      ]
    },
    {
      "title": "Institution Details",
      "order": 4,
      "description": "Information about the educational institution",
      "is_collapsible": true,
      "fields": [
        {
          "name": "institution_type",
          "label": "Institution Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "government_school", "label": "Government School"},
              {"value": "private_school", "label": "Private School"},
              {"value": "international_school", "label": "International School"},
              {"value": "tutoring_center", "label": "Tutoring/Coaching Center"},
              {"value": "college", "label": "College/University"},
              {"value": "preschool", "label": "Pre-school/Daycare"},
              {"value": "special_school", "label": "Special Education School"},
              {"value": "home_tuition", "label": "Home Tuition Service"}
            ],
            "helpText": "Type of educational institution"
          }
        },
        {
          "name": "student_demographics",
          "label": "Student Demographics",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "local_students", "label": "Local Students"},
              {"value": "international_students", "label": "International Students"},
              {"value": "special_needs", "label": "Special Needs Students"},
              {"value": "gifted_students", "label": "Gifted/Talented Students"},
              {"value": "mixed_ability", "label": "Mixed Ability Groups"},
              {"value": "competitive_exam_prep", "label": "Competitive Exam Preparation"}
            ],
            "helpText": "Type of students the institution serves"
          }
        },
        {
          "name": "institution_description",
          "label": "Institution Description",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Brief description of the institution, its philosophy, and teaching approach",
            "helpText": "Overview of the educational institution"
          }
        },
        {
          "name": "class_size",
          "label": "Average Class Size",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "individual", "label": "Individual (1-on-1)"},
              {"value": "small", "label": "Small (2-10 students)"},
              {"value": "medium", "label": "Medium (11-30 students)"},
              {"value": "large", "label": "Large (31+ students)"}
            ],
            "helpText": "Typical class size for teaching"
          }
        },
        {
          "name": "facilities_available",
          "label": "Facilities Available",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "smart_boards", "label": "Smart Boards/Projectors"},
              {"value": "computer_lab", "label": "Computer Lab"},
              {"value": "library", "label": "Library"},
              {"value": "laboratory", "label": "Science Laboratory"},
              {"value": "playground", "label": "Playground"},
              {"value": "audio_visual", "label": "Audio-Visual Equipment"},
              {"value": "online_platform", "label": "Online Learning Platform"}
            ],
            "helpText": "Educational facilities and resources available"
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
              {"value": "teaching_certificates", "label": "Teaching Certificates (B.Ed, TET, etc.)"},
              {"value": "experience_letters", "label": "Experience Letters"},
              {"value": "police_verification", "label": "Police Verification Certificate"},
              {"value": "aadhar_card", "label": "Aadhar Card"},
              {"value": "pan_card", "label": "PAN Card"},
              {"value": "photo", "label": "Recent Photograph"},
              {"value": "demo_lesson_plan", "label": "Demo Lesson Plan"}
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
              {"value": "demo_class", "label": "Demo Class/Teaching Session"},
              {"value": "phone_interview", "label": "Phone Interview"},
              {"value": "in_person_interview", "label": "In-Person Interview"},
              {"value": "multiple_rounds", "label": "Multiple Interview Rounds"}
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
            "placeholder": "hr@institution.com",
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

This template is designed for creating teacher and tutor job postings on the eBidPortal platform. The schema includes industry-specific fields for:

- **Educational Qualifications**: B.Ed, TET, CTET certifications and degree requirements
- **Subject Expertise**: Multiple subject specializations and grade level competencies
- **Teaching Methodologies**: Traditional, interactive, activity-based, and modern teaching approaches
- **Curriculum Standards**: CBSE, ICSE, IB, and other educational board familiarity
- **Student Demographics**: Age groups, special needs, and learning requirements

## API Integration

To use this template with the eBidPortal API:

1. **Create Template**: POST the JSON schema to `/api/v1/schema-templates`
2. **Assign to Category**: Use `/api/v1/templates/{id}/assign-category` to link with job categories
3. **Generate Forms**: GET `/api/v1/catalog/categories/{id}/schema` returns the complete form structure

## Industry Standards

This template complies with:
- **National Education Policy 2020** guidelines
- **NCTE (National Council for Teacher Education)** standards
- **RTE (Right to Education) Act** requirements
- **CBSE/ICSE/State Board** curriculum frameworks
- **Teacher Eligibility Test (TET/CTET)** standards

## Validation Rules

- Education qualification hierarchy with proper progression
- Teaching certification requirements for different levels
- Subject-grade level compatibility validation
- Experience requirements based on position level
- Curriculum-specific validation for different boards
- Safety and background check requirements for working with children