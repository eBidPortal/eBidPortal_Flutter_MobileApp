# Professional Vehicle Insurance & Financing Template for eBidPortal

**Template Name:** Vehicle Insurance & Financing Template
**Version:** 1.0
**Category Type:** vehicle_insurance_financing
**Created:** November 20, 2025
**Industry Standards:** Based on insurance industry standards (IRDAI guidelines), banking regulations (RBI), automotive financing standards, and financial services compliance requirements

## Template JSON Structure

```json
{
  "name": "Vehicle Insurance & Financing Template",
  "description": "Industry-level template for vehicle insurance and financing services including auto insurance, comprehensive coverage, vehicle loans, leasing options, and financial products. Includes detailed coverage specifications, financing terms, regulatory compliance, and professional service cataloging standards.",
  "category_type": "vehicle_insurance_financing",
  "is_active": true,
  "sections": [
    {
      "title": "Service Information",
      "order": 1,
      "description": "Basic service identification and classification details",
      "is_collapsible": false,
      "fields": [
        {
          "name": "listing_title",
          "label": "Listing Title",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:10", "max_length:100"],
          "ui_config": {
            "placeholder": "e.g., Comprehensive Car Insurance with Zero Depreciation - All Major Brands Covered",
            "helpText": "Create a descriptive title including service type and key benefits"
          }
        },
        {
          "name": "service_type",
          "label": "Service Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "auto_insurance", "label": "Auto Insurance"},
              {"value": "two_wheeler_insurance", "label": "Two-Wheeler Insurance"},
              {"value": "commercial_vehicle_insurance", "label": "Commercial Vehicle Insurance"},
              {"value": "vehicle_loan", "label": "Vehicle Loan"},
              {"value": "vehicle_lease", "label": "Vehicle Leasing"},
              {"value": "hire_purchase", "label": "Hire Purchase Financing"},
              {"value": "used_car_loan", "label": "Used Car Loan"},
              {"value": "insurance_brokerage", "label": "Insurance Brokerage Services"},
              {"value": "financial_advisory", "label": "Financial Advisory Services"},
              {"value": "insurance_claim_assistance", "label": "Insurance Claim Assistance"}
            ],
            "placeholder": "Select primary service type"
          }
        },
        {
          "name": "service_category",
          "label": "Service Category",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "insurance", "label": "Insurance Services"},
              {"value": "financing", "label": "Financing & Loans"},
              {"value": "leasing", "label": "Leasing Services"},
              {"value": "brokerage", "label": "Brokerage & Advisory"},
              {"value": "claims", "label": "Claims & Assistance"},
              {"value": "bundled_services", "label": "Bundled Insurance + Financing"}
            ],
            "placeholder": "Select service category"
          }
        },
        {
          "name": "vehicle_types_covered",
          "label": "Vehicle Types Covered",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "cars_sedans", "label": "Cars & Sedans"},
              {"value": "suvs", "label": "SUVs & Crossovers"},
              {"value": "luxury_vehicles", "label": "Luxury Vehicles"},
              {"value": "motorcycles", "label": "Motorcycles"},
              {"value": "scooters", "label": "Scooters"},
              {"value": "commercial_vehicles", "label": "Commercial Vehicles"},
              {"value": "construction_equipment", "label": "Construction Equipment"},
              {"value": "agricultural_machinery", "label": "Agricultural Machinery"},
              {"value": "electric_vehicles", "label": "Electric Vehicles"},
              {"value": "hybrid_vehicles", "label": "Hybrid Vehicles"}
            ],
            "helpText": "Select all applicable vehicle types"
          }
        },
        {
          "name": "service_provider_type",
          "label": "Service Provider Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "insurance_company", "label": "Insurance Company"},
              {"value": "bank", "label": "Bank/NBFC"},
              {"value": "financial_institution", "label": "Financial Institution"},
              {"value": "insurance_broker", "label": "Insurance Broker"},
              {"value": "financial_advisor", "label": "Financial Advisor"},
              {"value": "multi_service_provider", "label": "Multi-Service Provider"},
              {"value": "authorized_dealer", "label": "Authorized Dealer/Partner"}
            ]
          }
        },
        {
          "name": "geographic_coverage",
          "label": "Geographic Coverage",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "pan_india", "label": "Pan India"},
              {"value": "metro_cities", "label": "Metro Cities Only"},
              {"value": "major_cities", "label": "Major Cities"},
              {"value": "state_specific", "label": "State Specific"},
              {"value": "regional", "label": "Regional Coverage"},
              {"value": "international", "label": "International Coverage"}
            ],
            "helpText": "Select geographic service areas"
          }
        },
        {
          "name": "pricing_model",
          "label": "Pricing Model",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "fixed_premium", "label": "Fixed Premium"},
              {"value": "variable_premium", "label": "Variable Premium"},
              {"value": "emi_based", "label": "EMI Based"},
              {"value": "percentage_based", "label": "Percentage Based"},
              {"value": "custom_quotation", "label": "Custom Quotation"},
              {"value": "subscription_based", "label": "Subscription Based"}
            ]
          }
        }
      ]
    },
    {
      "title": "Insurance Coverage Details",
      "order": 2,
      "description": "Detailed insurance coverage specifications and terms",
      "is_collapsible": false,
      "fields": [
        {
          "name": "insurance_type",
          "label": "Insurance Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "comprehensive", "label": "Comprehensive Coverage"},
              {"value": "third_party", "label": "Third Party Liability"},
              {"value": "own_damage", "label": "Own Damage Only"},
              {"value": "zero_depreciation", "label": "Zero Depreciation"},
              {"value": "stand_alone_own_damage", "label": "Stand Alone Own Damage"}
            ],
            "helpText": "Type of insurance coverage offered"
          }
        },
        {
          "name": "coverage_components",
          "label": "Coverage Components",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "accident_damage", "label": "Accident Damage"},
              {"value": "theft_coverage", "label": "Theft Coverage"},
              {"value": "fire_damage", "label": "Fire Damage"},
              {"value": "natural_disasters", "label": "Natural Disasters"},
              {"value": "third_party_liability", "label": "Third Party Liability"},
              {"value": "personal_accident", "label": "Personal Accident Cover"},
              {"value": "legal_liability", "label": "Legal Liability"},
              {"value": "medical_expenses", "label": "Medical Expenses"},
              {"value": "towing_charges", "label": "Towing Charges"},
              {"value": "emergency_assistance", "label": "24/7 Emergency Assistance"},
              {"value": "rental_reimbursement", "label": "Rental Reimbursement"},
              {"value": "engine_protection", "label": "Engine Protection"},
              {"value": "tyre_burglary", "label": "Tyre & Burglary"},
              {"value": "key_replacement", "label": "Key Replacement"},
              {"value": "windscreen_damage", "label": "Windscreen Damage"},
              {"value": "accessories_coverage", "label": "Electrical/Non-Electrical Accessories"}
            ],
            "helpText": "Select all included coverage components"
          }
        },
        {
          "name": "sum_insured_range",
          "label": "Sum Insured Range",
          "type": "text",
          "required": false,
          "validation": ["max_length:50"],
          "ui_config": {
            "placeholder": "e.g., ₹1,00,000 - ₹50,00,000",
            "helpText": "Range of sum insured amounts available"
          }
        },
        {
          "name": "deductible_amount",
          "label": "Deductible Amount",
          "type": "number",
          "required": false,
          "validation": ["min:0", "max:100000"],
          "ui_config": {
            "suffix": "INR",
            "helpText": "Amount to be borne by policyholder per claim"
          }
        },
        {
          "name": "policy_tenure",
          "label": "Policy Tenure Options",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "1_year", "label": "1 Year"},
              {"value": "2_years", "label": "2 Years"},
              {"value": "3_years", "label": "3 Years"},
              {"value": "multi_year", "label": "Multi-Year Policies"}
            ]
          }
        },
        {
          "name": "add_ons_available",
          "label": "Add-on Covers Available",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "zero_depreciation", "label": "Zero Depreciation"},
              {"value": "roadside_assistance", "label": "Roadside Assistance"},
              {"value": "engine_protector", "label": "Engine Protector"},
              {"value": "tyre_secure", "label": "Tyre Secure"},
              {"value": "key_protect", "label": "Key Protect"},
              {"value": "personal_accident", "label": "Personal Accident Cover"},
              {"value": "medical_expenses", "label": "Medical Expenses"},
              {"value": "hospital_cash", "label": "Hospital Cash"},
              {"value": "ncb_protection", "label": "NCB Protection"},
              {"value": "voluntary_deductible", "label": "Voluntary Deductible"},
              {"value": "loss_of_personal_belongings", "label": "Loss of Personal Belongings"},
              {"value": "windscreen_protector", "label": "Windscreen Protector"}
            ],
            "helpText": "Optional add-on covers available"
          }
        },
        {
          "name": "exclusions",
          "label": "Standard Exclusions",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "List standard exclusions like normal wear & tear, mechanical breakdown, racing damage, etc...",
            "rows": 3,
            "helpText": "Common exclusions in the policy"
          }
        },
        {
          "name": "claim_settlement_ratio",
          "label": "Claim Settlement Ratio",
          "type": "text",
          "required": false,
          "validation": ["max_length:20"],
          "ui_config": {
            "placeholder": "e.g., 95% (Industry Average: 85-90%)",
            "helpText": "Historical claim settlement performance"
          }
        },
        {
          "name": "network_garages",
          "label": "Network Garages",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:10000"],
          "ui_config": {
            "suffix": "garages",
            "helpText": "Number of authorized repair garages in network"
          }
        }
      ]
    },
    {
      "title": "Financing & Loan Details",
      "order": 3,
      "description": "Detailed financing terms, loan specifications, and payment structures",
      "is_collapsible": false,
      "fields": [
        {
          "name": "loan_types",
          "label": "Loan Types Offered",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "new_vehicle_loan", "label": "New Vehicle Loan"},
              {"value": "used_vehicle_loan", "label": "Used Vehicle Loan"},
              {"value": "commercial_vehicle_loan", "label": "Commercial Vehicle Loan"},
              {"value": "two_wheeler_loan", "label": "Two-Wheeler Loan"},
              {"value": "vehicle_lease", "label": "Vehicle Lease"},
              {"value": "hire_purchase", "label": "Hire Purchase"},
              {"value": "top_up_loan", "label": "Top-up Loan"},
              {"value": "balance_transfer", "label": "Balance Transfer"}
            ],
            "helpText": "Types of financing options available"
          }
        },
        {
          "name": "loan_amount_range",
          "label": "Loan Amount Range",
          "type": "text",
          "required": false,
          "validation": ["max_length:50"],
          "ui_config": {
            "placeholder": "e.g., ₹1,00,000 - ₹1,00,00,000",
            "helpText": "Minimum and maximum loan amounts available"
          }
        },
        {
          "name": "interest_rate_range",
          "label": "Interest Rate Range",
          "type": "text",
          "required": false,
          "validation": ["max_length:30"],
          "ui_config": {
            "placeholder": "e.g., 7.5% - 15.5% p.a.",
            "helpText": "Interest rate range (per annum)"
          }
        },
        {
          "name": "loan_tenure_options",
          "label": "Loan Tenure Options",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "12_months", "label": "12 Months"},
              {"value": "24_months", "label": "24 Months"},
              {"value": "36_months", "label": "36 Months"},
              {"value": "48_months", "label": "48 Months"},
              {"value": "60_months", "label": "60 Months"},
              {"value": "72_months", "label": "72 Months"},
              {"value": "84_months", "label": "84 Months"}
            ],
            "helpText": "Available loan repayment periods"
          }
        },
        {
          "name": "down_payment_required",
          "label": "Down Payment Required",
          "type": "text",
          "required": false,
          "validation": ["max_length:30"],
          "ui_config": {
            "placeholder": "e.g., 10% - 30% of vehicle cost",
            "helpText": "Minimum down payment requirements"
          }
        },
        {
          "name": "emi_calculation",
          "label": "EMI Calculation Method",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "reducing_balance", "label": "Reducing Balance"},
              {"value": "flat_rate", "label": "Flat Rate"},
              {"value": "rule_of_78", "label": "Rule of 78"},
              {"value": "custom_calculation", "label": "Custom Calculation"}
            ]
          }
        },
        {
          "name": "processing_fees",
          "label": "Processing Fees",
          "type": "text",
          "required": false,
          "validation": ["max_length:50"],
          "ui_config": {
            "placeholder": "e.g., 0.5% - 2% of loan amount",
            "helpText": "Loan processing and documentation charges"
          }
        },
        {
          "name": "prepayment_charges",
          "label": "Prepayment Charges",
          "type": "text",
          "required": false,
          "validation": ["max_length:50"],
          "ui_config": {
            "placeholder": "e.g., 2% - 4% of outstanding amount",
            "helpText": "Charges for early loan repayment"
          }
        },
        {
          "name": "eligibility_criteria",
          "label": "Eligibility Criteria",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Age: 21-65 years, Income: ₹2,50,000 p.a., Credit Score: 650+, etc...",
            "rows": 3,
            "helpText": "Basic eligibility requirements for applicants"
          }
        },
        {
          "name": "documents_required",
          "label": "Documents Required",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "identity_proof", "label": "Identity Proof"},
              {"value": "address_proof", "label": "Address Proof"},
              {"value": "income_proof", "label": "Income Proof"},
              {"value": "bank_statements", "label": "Bank Statements"},
              {"value": "credit_report", "label": "Credit Report"},
              {"value": "vehicle_documents", "label": "Vehicle Documents"},
              {"value": "employment_proof", "label": "Employment Proof"},
              {"value": "property_documents", "label": "Property Documents"}
            ],
            "helpText": "Required documentation for loan application"
          }
        }
      ]
    },
    {
      "title": "Regulatory Compliance & Certifications",
      "order": 4,
      "description": "Regulatory compliance, certifications, and legal requirements",
      "is_collapsible": false,
      "fields": [
        {
          "name": "regulatory_approvals",
          "label": "Regulatory Approvals",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "irdai_licensed", "label": "IRDAI Licensed (Insurance)"},
              {"value": "rbi_licensed", "label": "RBI Licensed (Banking)"},
              {"value": "nbfc_registered", "label": "NBFC Registered"},
              {"value": "corporate_agent", "label": "Corporate Agent License"},
              {"value": "web_aggregator", "label": "Web Aggregator License"},
              {"value": "pos_license", "label": "POS License"}
            ],
            "helpText": "Regulatory licenses and approvals held"
          }
        },
        {
          "name": "insurance_company_partners",
          "label": "Insurance Company Partners",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "e.g., HDFC ERGO, ICICI Lombard, Bajaj Allianz, Reliance General...",
            "rows": 2,
            "helpText": "Partner insurance companies for policies"
          }
        },
        {
          "name": "compliance_certifications",
          "label": "Compliance Certifications",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "iso_9001", "label": "ISO 9001:2015"},
              {"value": "iso_27001", "label": "ISO 27001 (Information Security)"},
              {"value": "pci_dss", "label": "PCI DSS Compliant"},
              {"value": "aml_compliant", "label": "AML Compliant"},
              {"value": "kyc_compliant", "label": "KYC Compliant"},
              {"value": "data_protection", "label": "Data Protection Certified"},
              {"value": "fair_practices_code", "label": "Fair Practices Code Compliant"}
            ],
            "helpText": "Industry compliance certifications"
          }
        },
        {
          "name": "grievance_redressal",
          "label": "Grievance Redressal Mechanism",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "Insurance Ombudsman, Banking Ombudsman, Internal Escalation Process...",
            "rows": 2,
            "helpText": "Customer complaint resolution mechanisms"
          }
        },
        {
          "name": "data_privacy_compliance",
          "label": "Data Privacy Compliance",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "pdpai_compliant", "label": "PDPAI Compliant"},
              {"value": "gdpr_compliant", "label": "GDPR Compliant"},
              {"value": "data_localization", "label": "Data Localization Compliant"},
              {"value": "encryption_standards", "label": "Industry Encryption Standards"}
            ],
            "helpText": "Data protection and privacy compliance"
          }
        }
      ]
    },
    {
      "title": "Service Features & Benefits",
      "order": 5,
      "description": "Key service features, benefits, and value propositions",
      "is_collapsible": true,
      "fields": [
        {
          "name": "key_features",
          "label": "Key Features",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:50", "max_length:1000"],
          "ui_config": {
            "placeholder": "List the main features and benefits of your service...",
            "rows": 4,
            "helpText": "Highlight unique selling points and service advantages"
          }
        },
        {
          "name": "customer_support",
          "label": "Customer Support Features",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "24_7_hotline", "label": "24/7 Customer Hotline"},
              {"value": "online_portal", "label": "Online Customer Portal"},
              {"value": "mobile_app", "label": "Mobile App Support"},
              {"value": "email_support", "label": "Email Support"},
              {"value": "chat_support", "label": "Live Chat Support"},
              {"value": "whatsapp_support", "label": "WhatsApp Support"},
              {"value": "video_call_support", "label": "Video Call Support"},
              {"value": "field_executives", "label": "Field Executive Visits"},
              {"value": "emergency_assistance", "label": "Emergency Assistance"},
              {"value": "claim_hotline", "label": "Dedicated Claim Hotline"}
            ],
            "helpText": "Available customer support channels"
          }
        },
        {
          "name": "digital_services",
          "label": "Digital Services",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "online_quotation", "label": "Online Quotation"},
              {"value": "instant_policy", "label": "Instant Policy Issuance"},
              {"value": "digital_signature", "label": "Digital Signature"},
              {"value": "paperless_process", "label": "Paperless Process"},
              {"value": "auto_renewal", "label": "Auto Renewal"},
              {"value": "payment_reminders", "label": "Payment Reminders"},
              {"value": "policy_tracking", "label": "Policy Tracking"},
              {"value": "claim_tracking", "label": "Claim Tracking"},
              {"value": "document_upload", "label": "Document Upload Facility"},
              {"value": "video_kyc", "label": "Video KYC"}
            ],
            "helpText": "Digital and online service features"
          }
        },
        {
          "name": "value_added_services",
          "label": "Value Added Services",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "free_vehicle_inspection", "label": "Free Vehicle Inspection"},
              {"value": "pickup_delivery", "label": "Pickup & Delivery Service"},
              {"value": "concierge_service", "label": "Concierge Service"},
              {"value": "financial_planning", "label": "Financial Planning Advice"},
              {"value": "investment_options", "label": "Investment Options"},
              {"value": "loyalty_programs", "label": "Loyalty Programs"},
              {"value": "referral_benefits", "label": "Referral Benefits"},
              {"value": "renewal_discounts", "label": "Renewal Discounts"},
              {"value": "multi_policy_discounts", "label": "Multi-Policy Discounts"},
              {"value": "safe_driver_discounts", "label": "Safe Driver Discounts"}
            ],
            "helpText": "Additional services and benefits offered"
          }
        },
        {
          "name": "response_time_guarantee",
          "label": "Response Time Guarantee",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "same_day", "label": "Same Day Response"},
              {"value": "24_hours", "label": "Within 24 Hours"},
              {"value": "48_hours", "label": "Within 48 Hours"},
              {"value": "72_hours", "label": "Within 72 Hours"},
              {"value": "1_week", "label": "Within 1 Week"}
            ]
          }
        },
        {
          "name": "service_guarantees",
          "label": "Service Guarantees",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Any service level guarantees, claim settlement promises, etc...",
            "rows": 3
          }
        }
      ]
    },
    {
      "title": "Business Terms & Pricing",
      "order": 6,
      "description": "Business terms, pricing structures, and commercial information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "pricing_transparency",
          "label": "Pricing Transparency",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "fixed_pricing", "label": "Fixed Pricing"},
              {"value": "quotation_based", "label": "Quotation Based"},
              {"value": "market_linked", "label": "Market Linked Pricing"},
              {"value": "negotiable", "label": "Negotiable Pricing"}
            ]
          }
        },
        {
          "name": "commission_structure",
          "label": "Commission Structure",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "Commission rates for brokers, agents, or referral partners...",
            "rows": 2,
            "helpText": "Commission and incentive structure for partners"
          }
        },
        {
          "name": "minimum_business_volume",
          "label": "Minimum Business Volume",
          "type": "text",
          "required": false,
          "validation": ["max_length:50"],
          "ui_config": {
            "placeholder": "e.g., ₹10,00,000 annual premium or 50 policies",
            "helpText": "Minimum business requirements for partnerships"
          }
        },
        {
          "name": "payment_terms",
          "label": "Payment Terms",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "immediate_payment", "label": "Immediate Payment"},
              {"value": "credit_terms", "label": "Credit Terms Available"},
              {"value": "installment_payment", "label": "Installment Payment"},
              {"value": "advance_payment", "label": "Advance Payment Required"},
              {"value": "post_delivery", "label": "Payment Post Delivery"},
              {"value": "milestone_based", "label": "Milestone Based Payment"}
            ]
          }
        },
        {
          "name": "contract_terms",
          "label": "Contract Terms",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "annual_contract", "label": "Annual Contract"},
              {"value": "multi_year", "label": "Multi-Year Agreement"},
              {"value": "rolling_contract", "label": "Rolling Contract"},
              {"value": "project_based", "label": "Project Based"},
              {"value": "no_contract", "label": "No Long-term Contract"}
            ]
          }
        },
        {
          "name": "termination_clauses",
          "label": "Termination Clauses",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "Notice periods, termination fees, exit clauses...",
            "rows": 2
          }
        }
      ]
    },
    {
      "title": "Contact & Documentation",
      "order": 7,
      "description": "Contact details and supporting documentation",
      "is_collapsible": false,
      "fields": [
        {
          "name": "company_name",
          "label": "Company Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:100"],
          "ui_config": {
            "placeholder": "Full legal company name"
          }
        },
        {
          "name": "license_numbers",
          "label": "License Numbers",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:10", "max_length:300"],
          "ui_config": {
            "placeholder": "IRDAI License, RBI License, NBFC Registration numbers...",
            "rows": 2,
            "helpText": "Official license and registration numbers"
          }
        },
        {
          "name": "contact_person",
          "label": "Contact Person",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:50"],
          "ui_config": {
            "placeholder": "Full name of primary contact person"
          }
        },
        {
          "name": "contact_designation",
          "label": "Contact Designation",
          "type": "text",
          "required": false,
          "validation": ["max_length:50"],
          "ui_config": {
            "placeholder": "e.g., Branch Manager, Relationship Manager"
          }
        },
        {
          "name": "primary_phone",
          "label": "Primary Phone Number",
          "type": "phone",
          "required": true,
          "validation": ["required", "phone"],
          "ui_config": {
            "placeholder": "+91-9876543210"
          }
        },
        {
          "name": "secondary_phone",
          "label": "Secondary Phone Number",
          "type": "phone",
          "required": false,
          "validation": ["phone"],
          "ui_config": {
            "placeholder": "+91-9876543211"
          }
        },
        {
          "name": "email_address",
          "label": "Email Address",
          "type": "email",
          "required": true,
          "validation": ["required", "email"],
          "ui_config": {
            "placeholder": "contact@company.com"
          }
        },
        {
          "name": "website_url",
          "label": "Website URL",
          "type": "url",
          "required": false,
          "validation": ["url"],
          "ui_config": {
            "placeholder": "https://www.company.com"
          }
        },
        {
          "name": "office_address",
          "label": "Office Address",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:10", "max_length:300"],
          "ui_config": {
            "placeholder": "Complete office address with PIN code...",
            "rows": 3
          }
        },
        {
          "name": "service_locations",
          "label": "Service Locations",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "List branch offices, service centers, or operational locations...",
            "rows": 3
          }
        },
        {
          "name": "detailed_description",
          "label": "Detailed Service Description",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:100", "max_length:2000"],
          "ui_config": {
            "placeholder": "Provide comprehensive information about your services, coverage options, financing terms, and unique value propositions...",
            "rows": 6,
            "helpText": "Include service benefits, process details, and customer advantages"
          }
        },
        {
          "name": "service_images",
          "label": "Service Images",
          "type": "file",
          "required": true,
          "validation": ["required", "fileType:image", "fileSize:5000000"],
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "maxFiles": 10,
            "helpText": "Upload company logo, office photos, service certificates (max 10 images, 5MB each)"
          }
        },
        {
          "name": "certificates_documents",
          "label": "Certificates & Documents",
          "type": "file",
          "required": true,
          "validation": ["required", "fileType:pdf,doc,docx,jpg,jpeg,png", "fileSize:10000000"],
          "ui_config": {
            "accept": ".pdf,.doc,.docx,.jpg,.jpeg,.png",
            "multiple": true,
            "maxFiles": 15,
            "helpText": "Upload licenses, certifications, brochures, terms & conditions (max 15 files, 10MB each)"
          }
        },
        {
          "name": "terms_conditions",
          "label": "Terms & Conditions",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:50", "max_length:1000"],
          "ui_config": {
            "placeholder": "Key terms, conditions, exclusions, and important disclaimers...",
            "rows": 4,
            "helpText": "Essential terms and conditions for service usage"
          }
        }
      ]
    }
  ]
}
```

## Template Features

### **🏦 Industry-Level Coverage:**
- **10 Service Types:** Auto insurance, two-wheeler insurance, commercial vehicle insurance, vehicle loans, leasing, hire purchase, used car loans, brokerage, advisory, claims assistance
- **6 Service Categories:** Insurance, financing, leasing, brokerage, claims, bundled services
- **10 Vehicle Types:** Cars, SUVs, luxury vehicles, motorcycles, scooters, commercial vehicles, construction equipment, agricultural machinery, electric/hybrid vehicles

### **📋 Professional Insurance Specifications:**
- **5 Insurance Types:** Comprehensive, third party, own damage, zero depreciation, stand alone own damage
- **16 Coverage Components:** Accident damage, theft, fire, natural disasters, third party liability, personal accident, legal liability, medical expenses, towing, emergency assistance
- **12 Add-on Covers:** Zero depreciation, roadside assistance, engine protector, tyre secure, key protect, personal accident, medical expenses, hospital cash, NCB protection
- **Network Garages:** Authorized repair facility counts and claim settlement ratios

### **💰 Comprehensive Financing Details:**
- **8 Loan Types:** New vehicle, used vehicle, commercial vehicle, two-wheeler loans, leasing, hire purchase, top-up loans, balance transfers
- **Loan Specifications:** Amount ranges, interest rates, tenure options (12-84 months), down payment requirements
- **Payment Structures:** EMI calculation methods, processing fees, prepayment charges
- **Eligibility Criteria:** Age limits, income requirements, credit score minimums, document checklists

### **⚖️ Regulatory Compliance:**
- **6 Regulatory Approvals:** IRDAI licensed, RBI licensed, NBFC registered, corporate agent, web aggregator, POS licenses
- **7 Compliance Certifications:** ISO 9001, ISO 27001, PCI DSS, AML, KYC, data protection, fair practices code
- **Partner Insurance Companies:** HDFC ERGO, ICICI Lombard, Bajaj Allianz, Reliance General, etc.
- **Grievance Redressal:** Insurance Ombudsman, Banking Ombudsman, internal escalation processes

### **🎯 Service Excellence Features:**
- **10 Customer Support Channels:** 24/7 hotline, online portal, mobile app, email, chat, WhatsApp, video calls, field executives, emergency assistance
- **10 Digital Services:** Online quotation, instant policy, digital signature, paperless process, auto renewal, payment reminders, policy/claim tracking
- **10 Value Added Services:** Free inspection, pickup/delivery, concierge, financial planning, loyalty programs, referral benefits, multi-policy discounts

### **📊 Business & Commercial Terms:**
- **Pricing Models:** Fixed, quotation-based, market-linked, negotiable pricing
- **Commission Structures:** Partner incentives and referral programs
- **Payment Terms:** Immediate, credit terms, installments, advance payments, milestone-based
- **Contract Terms:** Annual, multi-year, rolling contracts, project-based agreements

## API Integration Points

### **Car Management APIs Used:**
```javascript
// Get vehicle data for insurance/financing compatibility
GET /api/v1/cars/brands

// Get models for specific coverage calculations
GET /api/v1/cars/brands/{brandId}/models

// Get variants for premium calculations
GET /api/v1/cars/models/{modelId}/variants
```

### **Schema Template APIs:**
```javascript
// Create the insurance/financing template
POST /api/v1/schema-templates

// Assign template to insurance/financing category
POST /api/v1/templates/{id}/assign-category

// Get dynamic form for category
GET /api/v1/catalog/categories/{id}/schema
```

## Implementation Notes

### **Field Validation Rules:**
- **Required Fields:** Service type, category, vehicle types covered, provider type, geographic coverage, pricing model, regulatory approvals, license numbers, company details, contact information
- **Insurance Validation:** Coverage components, sum insured ranges, policy tenure options
- **Financing Validation:** Loan amount ranges, interest rates, tenure options, eligibility criteria
- **Regulatory Validation:** License numbers, compliance certifications, partner information

### **Frontend Integration:**
- **Service-Based Logic:** Different fields shown based on insurance vs financing selection
- **Regulatory Compliance:** Dynamic validation based on selected approvals and licenses
- **Pricing Calculator:** Real-time premium and EMI calculations
- **Document Management:** License verification and certificate uploads

### **Business Logic:**
- **Compatibility Matching:** Vehicle type and coverage matching algorithms
- **Risk Assessment:** Credit scoring and insurance risk evaluation
- **Regulatory Compliance:** Automated license verification and compliance checking
- **Partner Management:** Insurance company and financial institution partnerships

## Usage Examples

### **Comprehensive Car Insurance Listing:**
- Service Type: "Auto Insurance"
- Service Category: "Insurance Services"
- Insurance Type: "Comprehensive Coverage"
- Coverage Components: Accident damage, theft, fire, third party liability
- Sum Insured Range: "₹1,00,000 - ₹50,00,000"
- Add-ons: Zero depreciation, roadside assistance, engine protector
- Regulatory Approvals: "IRDAI Licensed"

### **Vehicle Loan Listing:**
- Service Type: "Vehicle Loan"
- Service Category: "Financing & Loans"
- Loan Types: New vehicle loan, used vehicle loan
- Loan Amount Range: "₹1,00,000 - ₹1,00,00,000"
- Interest Rate Range: "7.5% - 15.5% p.a."
- Tenure Options: 12, 24, 36, 48, 60 months
- Regulatory Approvals: "NBFC Registered"

### **Insurance Brokerage Listing:**
- Service Type: "Insurance Brokerage Services"
- Service Category: "Brokerage & Advisory"
- Insurance Company Partners: "HDFC ERGO, ICICI Lombard, Bajaj Allianz"
- Commission Structure: "5-15% based on policy type"
- Regulatory Approvals: "Corporate Agent License"
- Geographic Coverage: "Pan India"

This template provides a comprehensive, industry-level framework for vehicle insurance and financing services with professional regulatory compliance, detailed coverage specifications, and commercial features required for financial services marketplace listings.