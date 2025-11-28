# Healthcare & Nursing Job Template for eBidPortal

**Template Name:** Healthcare & Nursing Job Template
**Version:** 1.0
**Category Type:** jobs
**Created:** November 21, 2025
**Industry Standards:** Based on healthcare industry standards, nursing regulations, medical certifications, patient care protocols, hospital administration guidelines, and healthcare professional best practices for nurses, medical staff, healthcare administrators, and allied health professionals.

## Template JSON Structure

```json
{
  "name": "Healthcare & Nursing Job Template",
  "description": "Industry-standard template for healthcare and nursing job postings. Includes comprehensive fields covering medical certifications, nursing qualifications, clinical experience, patient care standards, and healthcare facility requirements specific to nurses, medical staff, healthcare administrators, and allied health professionals.",
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
            "placeholder": "e.g., Staff Nurse, ICU Nurse, Nursing Supervisor",
            "helpText": "Enter the specific healthcare/nursing position title"
          }
        },
        {
          "name": "facility_name",
          "label": "Healthcare Facility Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:100"],
          "ui_config": {
            "placeholder": "Enter hospital, clinic, or healthcare center name",
            "helpText": "Name of the healthcare facility"
          }
        },
        {
          "name": "location",
          "label": "Work Location",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3"],
          "ui_config": {
            "placeholder": "e.g., Mumbai Central Hospital, Bangalore Medical Center",
            "helpText": "Location of the healthcare facility"
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
              {"value": "shift_work", "label": "Shift Work"},
              {"value": "casual", "label": "Casual/Relief"}
            ],
            "helpText": "Type of employment arrangement"
          }
        },
        {
          "name": "shift_type",
          "label": "Shift Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "day_shift", "label": "Day Shift (8 AM - 4 PM)"},
              {"value": "night_shift", "label": "Night Shift (8 PM - 8 AM)"},
              {"value": "rotating_shifts", "label": "Rotating Shifts"},
              {"value": "weekend_shifts", "label": "Weekend Shifts Only"},
              {"value": "on_call", "label": "On-Call Duty"}
            ],
            "helpText": "Primary shift schedule"
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
              {"value": "entry", "label": "Entry Level (Fresh Graduate)"},
              {"value": "junior", "label": "Junior (1-3 years)"},
              {"value": "mid", "label": "Mid-Level (3-7 years)"},
              {"value": "senior", "label": "Senior (7-10 years)"},
              {"value": "expert", "label": "Expert/Supervisor (10+ years)"}
            ],
            "helpText": "Required healthcare/nursing experience level"
          }
        },
        {
          "name": "specialization",
          "label": "Nursing/Medical Specialization",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "general_nursing", "label": "General Nursing"},
              {"value": "icu_nursing", "label": "ICU/Critical Care Nursing"},
              {"value": "emergency_nursing", "label": "Emergency & Trauma Nursing"},
              {"value": "pediatric_nursing", "label": "Pediatric Nursing"},
              {"value": "maternity_nursing", "label": "Maternity & Neonatal Nursing"},
              {"value": "surgical_nursing", "label": "Surgical Nursing"},
              {"value": "medical_surgical", "label": "Medical-Surgical Nursing"},
              {"value": "psychiatric_nursing", "label": "Psychiatric Nursing"},
              {"value": "geriatric_nursing", "label": "Geriatric Nursing"},
              {"value": "community_nursing", "label": "Community Health Nursing"},
              {"value": "oncology_nursing", "label": "Oncology Nursing"},
              {"value": "cardiac_nursing", "label": "Cardiac Care Nursing"},
              {"value": "dialysis_nursing", "label": "Dialysis Nursing"},
              {"value": "ot_nursing", "label": "Operation Theatre Nursing"},
              {"value": "nursing_supervisor", "label": "Nursing Supervisor/Manager"},
              {"value": "ward_incharge", "label": "Ward In-charge"}
            ],
            "helpText": "Primary area of nursing/medical specialization"
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
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "gnm", "label": "GNM (General Nursing & Midwifery)"},
              {"value": "bsc_nursing", "label": "BSc Nursing"},
              {"value": "post_basic_bsc", "label": "Post Basic BSc Nursing"},
              {"value": "msc_nursing", "label": "MSc Nursing"},
              {"value": "mbbs", "label": "MBBS"},
              {"value": "md_ms", "label": "MD/MS"},
              {"value": "paramedical_diploma", "label": "Paramedical Diploma"},
              {"value": "pharmacy_degree", "label": "Pharmacy Degree"},
              {"value": "biomedical_degree", "label": "Biomedical Engineering Degree"},
              {"value": "healthcare_management", "label": "Healthcare Management Degree"}
            ],
            "helpText": "Minimum education qualification required"
          }
        },
        {
          "name": "nursing_council_registration",
          "label": "Nursing Council Registration",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "indian_nursing_council", "label": "Indian Nursing Council (INC)"},
              {"value": "state_nursing_council", "label": "State Nursing Council"},
              {"value": "both_inc_state", "label": "Both INC & State Council"},
              {"value": "international_registration", "label": "International Nursing Registration"},
              {"value": "pending_registration", "label": "Registration Pending"}
            ],
            "helpText": "Nursing council registration status"
          }
        },
        {
          "name": "medical_certifications",
          "label": "Medical Certifications",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "bls_certification", "label": "Basic Life Support (BLS)"},
              {"value": "acls_certification", "label": "Advanced Cardiac Life Support (ACLS)"},
              {"value": "pals_certification", "label": "Pediatric Advanced Life Support (PALS)"},
              {"value": "nals_certification", "label": "Neonatal Advanced Life Support (NALS)"},
              {"value": "infection_control", "label": "Infection Control Certification"},
              {"value": "fire_safety", "label": "Fire Safety Certification"},
              {"value": "phlebotomy_cert", "label": "Phlebotomy Certification"},
              {"value": "iv_therapy_cert", "label": "IV Therapy Certification"},
              {"value": "wound_care_cert", "label": "Wound Care Certification"},
              {"value": "palliative_care_cert", "label": "Palliative Care Certification"},
              {"value": "mental_health_cert", "label": "Mental Health Nursing Certification"},
              {"value": "diabetes_management", "label": "Diabetes Management Certification"},
              {"value": "cardiac_care_cert", "label": "Cardiac Care Certification"},
              {"value": "emergency_response", "label": "Emergency Response Certification"}
            ],
            "helpText": "Preferred medical and nursing certifications"
          }
        },
        {
          "name": "clinical_skills",
          "label": "Clinical Skills",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "patient_assessment", "label": "Patient Assessment & Monitoring"},
              {"value": "vital_signs_monitoring", "label": "Vital Signs Monitoring"},
              {"value": "medication_administration", "label": "Medication Administration"},
              {"value": "iv_cannulation", "label": "IV Cannulation & Management"},
              {"value": "wound_dressing", "label": "Wound Dressing & Care"},
              {"value": "catheter_management", "label": "Catheter Management"},
              {"value": "oxygen_therapy", "label": "Oxygen Therapy Administration"},
              {"value": "emergency_response", "label": "Emergency Response"},
              {"value": "patient_education", "label": "Patient & Family Education"},
              {"value": "infection_control", "label": "Infection Control Practices"},
              {"value": "documentation", "label": "Medical Documentation"},
              {"value": "pain_management", "label": "Pain Assessment & Management"},
              {"value": "end_of_life_care", "label": "End-of-Life Care"},
              {"value": "cultural_competence", "label": "Cultural Competence in Care"},
              {"value": "team_collaboration", "label": "Interdisciplinary Team Collaboration"}
            ],
            "helpText": "Required clinical nursing skills"
          }
        },
        {
          "name": "experience_years",
          "label": "Clinical Experience (Years)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:50"],
          "ui_config": {
            "placeholder": "e.g., 3",
            "helpText": "Minimum years of clinical/healthcare experience required"
          }
        },
        {
          "name": "specialized_experience",
          "label": "Specialized Experience",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "icu_experience", "label": "ICU/Critical Care Experience"},
              {"value": "emergency_department", "label": "Emergency Department Experience"},
              {"value": "operation_theatre", "label": "Operation Theatre Experience"},
              {"value": "pediatric_ward", "label": "Pediatric Ward Experience"},
              {"value": "maternity_ward", "label": "Maternity Ward Experience"},
              {"value": "psychiatric_unit", "label": "Psychiatric Unit Experience"},
              {"value": "geriatric_care", "label": "Geriatric Care Experience"},
              {"value": "home_healthcare", "label": "Home Healthcare Experience"},
              {"value": "community_health", "label": "Community Health Experience"},
              {"value": "telemedicine", "label": "Telemedicine Experience"},
              {"value": "healthcare_management", "label": "Healthcare Management Experience"},
              {"value": "quality_assurance", "label": "Quality Assurance Experience"}
            ],
            "helpText": "Preferred specialized clinical experience"
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
              {"value": "medical_terminology", "label": "Medical Terminology"},
              {"value": "patient_communication", "label": "Patient Communication Skills"}
            ],
            "helpText": "Required language and communication skills"
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
              {"value": "patient_care", "label": "Direct Patient Care"},
              {"value": "vital_monitoring", "label": "Vital Signs Monitoring"},
              {"value": "medication_admin", "label": "Medication Administration"},
              {"value": "wound_care", "label": "Wound Care & Dressing"},
              {"value": "patient_assessment", "label": "Patient Assessment"},
              {"value": "documentation", "label": "Medical Documentation"},
              {"value": "family_communication", "label": "Family Communication"},
              {"value": "shift_reporting", "label": "Shift Reporting"},
              {"value": "equipment_handling", "label": "Medical Equipment Handling"},
              {"value": "emergency_response", "label": "Emergency Response"},
              {"value": "infection_control", "label": "Infection Control"},
              {"value": "patient_education", "label": "Patient Education"},
              {"value": "team_supervision", "label": "Team Supervision"},
              {"value": "quality_assurance", "label": "Quality Assurance"}
            ],
            "helpText": "Primary responsibilities for this healthcare position"
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
          "name": "shift_allowance",
          "label": "Shift Allowance",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "night_shift_allowance", "label": "Night Shift Allowance"},
              {"value": "weekend_allowance", "label": "Weekend Shift Allowance"},
              {"value": "on_call_allowance", "label": "On-Call Duty Allowance"},
              {"value": "overtime_pay", "label": "Overtime Pay"},
              {"value": "hazard_pay", "label": "Hazard Pay"}
            ],
            "helpText": "Additional shift-based compensation"
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
              {"value": "retention_bonus", "label": "Retention Bonus"},
              {"value": "qualification_allowance", "label": "Qualification Allowance"},
              {"value": "uniform_allowance", "label": "Uniform Allowance"},
              {"value": "meal_allowance", "label": "Meal Allowance"},
              {"value": "transport_allowance", "label": "Transport Allowance"},
              {"value": "professional_development", "label": "Professional Development Allowance"}
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
              {"value": "maternity_leave", "label": "Maternity Leave"},
              {"value": "paternity_leave", "label": "Paternity Leave"},
              {"value": "sick_leave", "label": "Sick Leave"},
              {"value": "hospital_stay", "label": "Staff Hospital Stay Facility"},
              {"value": "vaccination", "label": "Free Vaccination"},
              {"value": "counseling_support", "label": "Counseling Support"},
              {"value": "skill_development", "label": "Skill Development Programs"},
              {"value": "career_advancement", "label": "Career Advancement Opportunities"}
            ],
            "helpText": "Benefits provided by the healthcare facility"
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
      "title": "Healthcare Facility Details",
      "order": 4,
      "description": "Information about the healthcare facility and work environment",
      "is_collapsible": true,
      "fields": [
        {
          "name": "facility_type",
          "label": "Facility Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "multi_specialty_hospital", "label": "Multi-Specialty Hospital"},
              {"value": "super_specialty_hospital", "label": "Super-Specialty Hospital"},
              {"value": "general_hospital", "label": "General Hospital"},
              {"value": "maternity_hospital", "label": "Maternity Hospital"},
              {"value": "pediatric_hospital", "label": "Pediatric Hospital"},
              {"value": "psychiatric_hospital", "label": "Psychiatric Hospital"},
              {"value": "rehabilitation_center", "label": "Rehabilitation Center"},
              {"value": "nursing_home", "label": "Nursing Home"},
              {"value": "clinic", "label": "Clinic/Diagnostic Center"},
              {"value": "home_healthcare", "label": "Home Healthcare Service"},
              {"value": "telemedicine_center", "label": "Telemedicine Center"}
            ],
            "helpText": "Type of healthcare facility"
          }
        },
        {
          "name": "facility_size",
          "label": "Facility Size",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "small", "label": "Small (1-50 beds)"},
              {"value": "medium", "label": "Medium (51-200 beds)"},
              {"value": "large", "label": "Large (201-500 beds)"},
              {"value": "super_large", "label": "Super Large (500+ beds)"}
            ],
            "helpText": "Size of the healthcare facility"
          }
        },
        {
          "name": "specialties_available",
          "label": "Specialties Available",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "cardiology", "label": "Cardiology"},
              {"value": "neurology", "label": "Neurology"},
              {"value": "orthopedics", "label": "Orthopedics"},
              {"value": "oncology", "label": "Oncology"},
              {"value": "pediatrics", "label": "Pediatrics"},
              {"value": "gynecology", "label": "Gynecology & Obstetrics"},
              {"value": "emergency_medicine", "label": "Emergency Medicine"},
              {"value": "intensive_care", "label": "Intensive Care"},
              {"value": "surgery", "label": "General Surgery"},
              {"value": "psychiatry", "label": "Psychiatry"},
              {"value": "dermatology", "label": "Dermatology"},
              {"value": "radiology", "label": "Radiology"},
              {"value": "pathology", "label": "Pathology"},
              {"value": "physiotherapy", "label": "Physiotherapy"}
            ],
            "helpText": "Medical specialties available at the facility"
          }
        },
        {
          "name": "facility_accreditation",
          "label": "Facility Accreditation",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "nabh_accredited", "label": "NABH Accredited"},
              {"value": "nabh_entry_level", "label": "NABH Entry Level"},
              {"value": "nabh_full", "label": "NABH Full Accreditation"},
              {"value": "jci_accredited", "label": "JCI Accredited"},
              {"value": "iso_certified", "label": "ISO Certified"},
              {"value": "green_hospital", "label": "Green Hospital Certification"},
              {"value": "baby_friendly", "label": "Baby Friendly Hospital"},
              {"value": "stroke_ready", "label": "Stroke Ready Hospital"},
              {"value": "tb_free", "label": "TB Free Hospital"}
            ],
            "helpText": "Quality accreditations and certifications"
          }
        },
        {
          "name": "work_environment",
          "label": "Work Environment",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "modern_facility", "label": "Modern Medical Equipment"},
              {"value": "clean_environment", "label": "Clean & Hygienic Environment"},
              {"value": "patient_centric", "label": "Patient-Centric Approach"},
              {"value": "team_collaboration", "label": "Strong Team Collaboration"},
              {"value": "continuous_learning", "label": "Continuous Learning Culture"},
              {"value": "research_opportunities", "label": "Research Opportunities"},
              {"value": "technology_driven", "label": "Technology-Driven Care"},
              {"value": "compassionate_care", "label": "Compassionate Care Focus"},
              {"value": "quality_focused", "label": "Quality-Focused Environment"},
              {"value": "ethical_practices", "label": "Ethical Medical Practices"}
            ],
            "helpText": "Healthcare work environment characteristics"
          }
        },
        {
          "name": "staff_facilities",
          "label": "Staff Facilities",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "staff_quarters", "label": "Staff Quarters/Accommodation"},
              {"value": "cafeteria", "label": "Staff Cafeteria"},
              {"value": "rest_rooms", "label": "Rest Rooms & Break Areas"},
              {"value": "parking", "label": "Staff Parking"},
              {"value": "gym_facility", "label": "Gym/Fitness Facility"},
              {"value": "library", "label": "Medical Library"},
              {"value": "training_center", "label": "Training & Development Center"},
              {"value": "counseling_services", "label": "Counseling Services"},
              {"value": "childcare_facility", "label": "Childcare Facility"},
              {"value": "transport_service", "label": "Transport Service"}
            ],
            "helpText": "Facilities available for staff"
          }
        },
        {
          "name": "facility_description",
          "label": "Facility Description",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Brief description of the healthcare facility, its mission, patient care philosophy, and notable achievements",
            "helpText": "Overview of the healthcare facility"
          }
        },
        {
          "name": "nursing_staff_ratio",
          "label": "Nursing Staff Ratio",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "1_1", "label": "1:1 (Critical Care)"},
              {"value": "1_2", "label": "1:2 (High Dependency)"},
              {"value": "1_4", "label": "1:4 (General Ward)"},
              {"value": "1_6", "label": "1:6 (General Ward)"},
              {"value": "1_8", "label": "1:8 (General Ward)"}
            ],
            "helpText": "Patient to nurse ratio in the facility"
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
              {"value": "nursing_registration", "label": "Nursing Council Registration"},
              {"value": "experience_certificates", "label": "Experience Certificates"},
              {"value": "medical_certificates", "label": "Medical Certifications"},
              {"value": "police_clearance", "label": "Police Clearance Certificate"},
              {"value": "health_certificate", "label": "Health/Medical Fitness Certificate"},
              {"value": "aadhar_card", "label": "Aadhar Card"},
              {"value": "pan_card", "label": "PAN Card"},
              {"value": "passport_photos", "label": "Passport Size Photos"},
              {"value": "vaccination_records", "label": "Vaccination Records"},
              {"value": "reference_letters", "label": "Reference Letters"}
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
              {"value": "written_test", "label": "Written Test"},
              {"value": "practical_test", "label": "Practical/Skills Test"},
              {"value": "panel_interview", "label": "Panel Interview"},
              {"value": "hr_interview", "label": "HR Interview"},
              {"value": "clinical_interview", "label": "Clinical Interview"},
              {"value": "multiple_rounds", "label": "Multiple Interview Rounds"},
              {"value": "group_discussion", "label": "Group Discussion"},
              {"value": "case_study", "label": "Case Study Discussion"}
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
          "name": "medical_fitness_test",
          "label": "Medical Fitness Test Required",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Whether medical fitness examination is required"
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
            "placeholder": "hr@hospital.com",
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