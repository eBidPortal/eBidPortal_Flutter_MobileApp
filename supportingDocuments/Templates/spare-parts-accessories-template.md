# Professional Spare Parts & Accessories Template for eBidPortal

**Template Name:** Spare Parts & Accessories Template
**Version:** 1.0
**Category Type:** spare_parts_accessories
**Created:** November 20, 2025
**Industry Standards:** Based on automotive, electronics, industrial, and manufacturing industry standards, OEM specifications, and parts cataloging systems

## Template JSON Structure

```json
{
  "name": "Spare Parts & Accessories Template",
  "description": "Industry-level template for spare parts and accessories across automotive, electronics, industrial, and consumer goods sectors. Includes detailed specifications, compatibility matrices, quality certifications, and professional cataloging standards.",
  "category_type": "spare_parts_accessories",
  "is_active": true,
  "sections": [
    {
      "title": "Product Information",
      "order": 1,
      "description": "Basic product identification and classification details",
      "is_collapsible": false,
      "fields": [
        {
          "name": "listing_title",
          "label": "Listing Title",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:10", "max_length:100"],
          "ui_config": {
            "placeholder": "e.g., Genuine Toyota Camry 2018-2022 Brake Pads Set - OEM Quality",
            "helpText": "Create a descriptive title including brand, model compatibility, and key specifications"
          }
        },
        {
          "name": "industry_category",
          "label": "Industry Category",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "automotive", "label": "Automotive & Transportation"},
              {"value": "electronics", "label": "Electronics & Electrical"},
              {"value": "industrial", "label": "Industrial & Machinery"},
              {"value": "home_appliances", "label": "Home Appliances"},
              {"value": "construction", "label": "Construction Equipment"},
              {"value": "agricultural", "label": "Agricultural Machinery"},
              {"value": "medical", "label": "Medical Equipment"},
              {"value": "aerospace", "label": "Aerospace & Aviation"},
              {"value": "marine", "label": "Marine & Nautical"},
              {"value": "consumer_goods", "label": "Consumer Goods"},
              {"value": "other", "label": "Other"}
            ],
            "placeholder": "Select industry category"
          }
        },
        {
          "name": "part_category",
          "label": "Part Category",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "engine_parts", "label": "Engine & Powertrain Parts"},
              {"value": "electrical_components", "label": "Electrical & Electronic Components"},
              {"value": "body_parts", "label": "Body & Exterior Parts"},
              {"value": "interior_parts", "label": "Interior & Trim Parts"},
              {"value": "suspension_parts", "label": "Suspension & Steering Parts"},
              {"value": "brake_parts", "label": "Brake System Parts"},
              {"value": "transmission_parts", "label": "Transmission & Drivetrain Parts"},
              {"value": "cooling_parts", "label": "Cooling System Parts"},
              {"value": "fuel_parts", "label": "Fuel System Parts"},
              {"value": "filters", "label": "Filters & Maintenance Parts"},
              {"value": "belts_chains", "label": "Belts, Chains & Hoses"},
              {"value": "bearings_seals", "label": "Bearings, Seals & Gaskets"},
              {"value": "fasteners", "label": "Fasteners & Hardware"},
              {"value": "tools_equipment", "label": "Tools & Equipment"},
              {"value": "consumables", "label": "Consumables & Supplies"},
              {"value": "accessories", "label": "Accessories & Modifications"}
            ],
            "placeholder": "Select specific part category"
          }
        },
        {
          "name": "part_type",
          "label": "Specific Part Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "oem_parts", "label": "OEM (Original Equipment Manufacturer)"},
              {"value": "aftermarket", "label": "Aftermarket Parts"},
              {"value": "refurbished", "label": "Refurbished/Reconditioned"},
              {"value": "used", "label": "Used Parts"},
              {"value": "universal", "label": "Universal Fit Parts"},
              {"value": "custom", "label": "Custom/Manufactured Parts"},
              {"value": "replacement", "label": "Replacement Parts"},
              {"value": "upgrade", "label": "Performance Upgrade Parts"},
              {"value": "repair_kit", "label": "Repair/Service Kits"},
              {"value": "bulk_pack", "label": "Bulk Packaging"}
            ],
            "placeholder": "Select part type and quality"
          }
        },
        {
          "name": "condition",
          "label": "Part Condition",
          "type": "radio",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "new", "label": "Brand New"},
              {"value": "new_open_box", "label": "New - Open Box"},
              {"value": "refurbished", "label": "Refurbished"},
              {"value": "used_good", "label": "Used - Good Condition"},
              {"value": "used_fair", "label": "Used - Fair Condition"},
              {"value": "remanufactured", "label": "Remanufactured"},
              {"value": "as_removed", "label": "As Removed from Service"}
            ]
          }
        },
        {
          "name": "price",
          "label": "Price (INR)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:10", "max:10000000"],
          "ui_config": {
            "step": 10,
            "prefix": "₹",
            "suffix": "INR",
            "helpText": "Enter the selling price per unit in Indian Rupees"
          }
        },
        {
          "name": "unit_type",
          "label": "Unit Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "piece", "label": "Per Piece"},
              {"value": "set", "label": "Per Set"},
              {"value": "kit", "label": "Per Kit"},
              {"value": "pair", "label": "Per Pair"},
              {"value": "pack", "label": "Per Pack"},
              {"value": "meter", "label": "Per Meter"},
              {"value": "liter", "label": "Per Liter"},
              {"value": "kilogram", "label": "Per Kilogram"}
            ]
          }
        },
        {
          "name": "minimum_order_quantity",
          "label": "Minimum Order Quantity",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:10000"],
          "ui_config": {
            "suffix": "units",
            "helpText": "Minimum quantity required for purchase"
          }
        },
        {
          "name": "available_quantity",
          "label": "Available Quantity",
          "type": "number",
          "required": true,
          "validation": ["required", "min:1", "max:100000"],
          "ui_config": {
            "suffix": "units",
            "helpText": "Current stock available for immediate delivery"
          }
        }
      ]
    },
    {
      "title": "Technical Specifications",
      "order": 2,
      "description": "Detailed technical specifications and part identification",
      "is_collapsible": false,
      "fields": [
        {
          "name": "part_number",
          "label": "Part Number/OEM Number",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3", "max_length:50"],
          "ui_config": {
            "placeholder": "e.g., 04465-42010, BP123456, OEM-789-XYZ",
            "helpText": "Original part number or manufacturer's catalog number"
          }
        },
        {
          "name": "manufacturer",
          "label": "Manufacturer/Brand",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:50"],
          "ui_config": {
            "placeholder": "e.g., Bosch, Denso, Continental, Genuine Parts",
            "helpText": "Manufacturer or brand name"
          }
        },
        {
          "name": "material_composition",
          "label": "Material Composition",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "steel", "label": "Steel"},
              {"value": "aluminum", "label": "Aluminum"},
              {"value": "cast_iron", "label": "Cast Iron"},
              {"value": "brass", "label": "Brass"},
              {"value": "copper", "label": "Copper"},
              {"value": "plastic", "label": "Plastic/Polymer"},
              {"value": "rubber", "label": "Rubber"},
              {"value": "ceramic", "label": "Ceramic"},
              {"value": "composite", "label": "Composite Materials"},
              {"value": "carbon_fiber", "label": "Carbon Fiber"},
              {"value": "other", "label": "Other"}
            ],
            "helpText": "Primary material used in construction"
          }
        },
        {
          "name": "dimensions_length",
          "label": "Length (mm)",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:10000"],
          "ui_config": {
            "suffix": "mm"
          }
        },
        {
          "name": "dimensions_width",
          "label": "Width (mm)",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:10000"],
          "ui_config": {
            "suffix": "mm"
          }
        },
        {
          "name": "dimensions_height",
          "label": "Height (mm)",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:10000"],
          "ui_config": {
            "suffix": "mm"
          }
        },
        {
          "name": "weight",
          "label": "Weight (kg)",
          "type": "number",
          "required": false,
          "validation": ["min:0.001", "max:1000"],
          "ui_config": {
            "step": 0.01,
            "suffix": "kg",
            "helpText": "Weight per unit"
          }
        },
        {
          "name": "thread_size",
          "label": "Thread Size/Pitch",
          "type": "text",
          "required": false,
          "validation": ["max_length:20"],
          "ui_config": {
            "placeholder": "e.g., M10x1.5, 1/2-20 UNF",
            "helpText": "Thread specifications for fasteners"
          }
        },
        {
          "name": "voltage_rating",
          "label": "Voltage Rating (V)",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:1000000"],
          "ui_config": {
            "suffix": "V",
            "helpText": "Electrical voltage rating"
          }
        },
        {
          "name": "current_rating",
          "label": "Current Rating (A)",
          "type": "number",
          "required": false,
          "validation": ["min:0.001", "max:10000"],
          "ui_config": {
            "suffix": "A",
            "helpText": "Electrical current rating"
          }
        },
        {
          "name": "power_rating",
          "label": "Power Rating (W)",
          "type": "number",
          "required": false,
          "validation": ["min:0.1", "max:100000"],
          "ui_config": {
            "suffix": "W",
            "helpText": "Power rating for electrical components"
          }
        },
        {
          "name": "operating_temperature",
          "label": "Operating Temperature Range (°C)",
          "type": "text",
          "required": false,
          "validation": ["max_length:20"],
          "ui_config": {
            "placeholder": "e.g., -40°C to +120°C",
            "helpText": "Temperature range for safe operation"
          }
        },
        {
          "name": "pressure_rating",
          "label": "Pressure Rating (bar/psi)",
          "type": "text",
          "required": false,
          "validation": ["max_length:20"],
          "ui_config": {
            "placeholder": "e.g., 10 bar / 145 psi",
            "helpText": "Pressure rating for hydraulic/pneumatic parts"
          }
        }
      ]
    },
    {
      "title": "Compatibility & Applications",
      "order": 3,
      "description": "Equipment and vehicle compatibility information",
      "is_collapsible": false,
      "fields": [
        {
          "name": "compatible_brands",
          "label": "Compatible Brands",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:3", "max_length:500"],
          "ui_config": {
            "placeholder": "e.g., Toyota, Honda, Nissan, Mitsubishi",
            "rows": 2,
            "helpText": "List all compatible equipment brands"
          }
        },
        {
          "name": "compatible_models",
          "label": "Compatible Models",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:3", "max_length:1000"],
          "ui_config": {
            "placeholder": "e.g., Camry (2018-2022), Corolla (2019-2023), Civic (2020-2024)",
            "rows": 3,
            "helpText": "List compatible models with year ranges"
          }
        },
        {
          "name": "engine_types",
          "label": "Compatible Engine Types",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "petrol", "label": "Petrol/Gasoline"},
              {"value": "diesel", "label": "Diesel"},
              {"value": "electric", "label": "Electric"},
              {"value": "hybrid", "label": "Hybrid"},
              {"value": "cng", "label": "CNG"},
              {"value": "lpg", "label": "LPG"},
              {"value": "hydrogen", "label": "Hydrogen"}
            ],
            "helpText": "Select compatible engine/fuel types"
          }
        },
        {
          "name": "transmission_types",
          "label": "Compatible Transmission Types",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "manual", "label": "Manual"},
              {"value": "automatic", "label": "Automatic"},
              {"value": "cvt", "label": "CVT"},
              {"value": "dct", "label": "Dual Clutch"},
              {"value": "amt", "label": "Automated Manual"}
            ]
          }
        },
        {
          "name": "vehicle_types",
          "label": "Compatible Vehicle Types",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "sedan", "label": "Sedan"},
              {"value": "suv", "label": "SUV"},
              {"value": "hatchback", "label": "Hatchback"},
              {"value": "truck", "label": "Truck/Pickup"},
              {"value": "van", "label": "Van/MPV"},
              {"value": "motorcycle", "label": "Motorcycle"},
              {"value": "scooter", "label": "Scooter"},
              {"value": "commercial", "label": "Commercial Vehicle"},
              {"value": "construction", "label": "Construction Equipment"},
              {"value": "industrial", "label": "Industrial Machinery"}
            ]
          }
        },
        {
          "name": "application_notes",
          "label": "Application Notes",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Any special installation notes, modifications required, or usage restrictions...",
            "rows": 3
          }
        }
      ]
    },
    {
      "title": "Quality & Certification",
      "order": 4,
      "description": "Quality standards, certifications, and compliance information",
      "is_collapsible": false,
      "fields": [
        {
          "name": "quality_standard",
          "label": "Quality Standard",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "oem", "label": "OEM Quality"},
              {"value": "iso_9001", "label": "ISO 9001 Certified"},
              {"value": "iso_14001", "label": "ISO 14001 Certified"},
              {"value": "ts_16949", "label": "TS 16949 Certified"},
              {"value": "as_9100", "label": "AS 9100 Certified"},
              {"value": "mil_spec", "label": "Military Specification"},
              {"value": "aerospace_standard", "label": "Aerospace Standard"},
              {"value": "medical_grade", "label": "Medical Grade"},
              {"value": "food_grade", "label": "Food Grade"},
              {"value": "industrial_grade", "label": "Industrial Grade"},
              {"value": "commercial_grade", "label": "Commercial Grade"}
            ]
          }
        },
        {
          "name": "certifications",
          "label": "Certifications & Approvals",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "dot_approved", "label": "DOT Approved"},
              {"value": "e_mark", "label": "E-Mark Certified"},
              {"value": "fmvss", "label": "FMVSS Compliant"},
              {"value": "rohs", "label": "RoHS Compliant"},
              {"value": "reach", "label": "REACH Compliant"},
              {"value": "ul_listed", "label": "UL Listed"},
              {"value": "ce_marked", "label": "CE Marked"},
              {"value": "fcc_certified", "label": "FCC Certified"},
              {"value": "bis_certified", "label": "BIS Certified"},
              {"value": "ara_ai", "label": "ARA-AI Approved"},
              {"value": "iso_certified", "label": "ISO Certified"},
              {"value": "other", "label": "Other Certifications"}
            ],
            "helpText": "Select all applicable certifications"
          }
        },
        {
          "name": "warranty_period",
          "label": "Warranty Period",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "no_warranty", "label": "No Warranty"},
              {"value": "30_days", "label": "30 Days"},
              {"value": "90_days", "label": "90 Days"},
              {"value": "6_months", "label": "6 Months"},
              {"value": "1_year", "label": "1 Year"},
              {"value": "2_years", "label": "2 Years"},
              {"value": "3_years", "label": "3 Years"},
              {"value": "5_years", "label": "5 Years"},
              {"value": "lifetime", "label": "Lifetime Warranty"}
            ]
          }
        },
        {
          "name": "warranty_terms",
          "label": "Warranty Terms & Conditions",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Specify warranty coverage, exclusions, and claim process...",
            "rows": 2
          }
        },
        {
          "name": "testing_standards",
          "label": "Testing Standards Met",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "e.g., ASTM D1234, SAE J123, MIL-STD-123...",
            "rows": 2,
            "helpText": "Industry testing standards and specifications met"
          }
        }
      ]
    },
    {
      "title": "Packaging & Shipping",
      "order": 5,
      "description": "Packaging specifications and shipping information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "packaging_type",
          "label": "Packaging Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "original_oem", "label": "Original OEM Packaging"},
              {"value": "manufacturer_box", "label": "Manufacturer Box"},
              {"value": "bulk_packaging", "label": "Bulk/Industrial Packaging"},
              {"value": "retail_packaging", "label": "Retail Packaging"},
              {"value": "protective_packaging", "label": "Protective/Special Packaging"},
              {"value": "no_packaging", "label": "No Additional Packaging"}
            ]
          }
        },
        {
          "name": "package_weight",
          "label": "Package Weight (kg)",
          "type": "number",
          "required": false,
          "validation": ["min:0.01", "max:1000"],
          "ui_config": {
            "step": 0.01,
            "suffix": "kg",
            "helpText": "Total weight including packaging"
          }
        },
        {
          "name": "package_dimensions",
          "label": "Package Dimensions (LxWxH cm)",
          "type": "text",
          "required": false,
          "validation": ["max_length:30"],
          "ui_config": {
            "placeholder": "e.g., 30x20x15 cm",
            "helpText": "Package dimensions for shipping calculations"
          }
        },
        {
          "name": "shipping_restrictions",
          "label": "Shipping Restrictions",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "hazardous", "label": "Hazardous Material"},
              {"value": "fragile", "label": "Fragile - Handle with Care"},
              {"value": "oversized", "label": "Oversized Package"},
              {"value": "heavy_weight", "label": "Heavy Weight (>30kg)"},
              {"value": "temperature_sensitive", "label": "Temperature Sensitive"},
              {"value": "air_only", "label": "Air Freight Only"},
              {"value": "ground_only", "label": "Ground Shipping Only"},
              {"value": "no_international", "label": "Domestic Shipping Only"}
            ]
          }
        },
        {
          "name": "handling_instructions",
          "label": "Special Handling Instructions",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "Any special handling, storage, or transportation requirements...",
            "rows": 2
          }
        }
      ]
    },
    {
      "title": "Business & Pricing",
      "order": 6,
      "description": "Business terms, pricing tiers, and commercial information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "ownership_type",
          "label": "Seller Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "authorized_dealer", "label": "Authorized Dealer/Distributor"},
              {"value": "manufacturer", "label": "Original Manufacturer"},
              {"value": "wholesaler", "label": "Wholesaler"},
              {"value": "retailer", "label": "Retailer"},
              {"value": "importer", "label": "Importer"},
              {"value": "recycler", "label": "Parts Recycler"},
              {"value": "independent", "label": "Independent Seller"}
            ]
          }
        },
        {
          "name": "bulk_pricing",
          "label": "Bulk Pricing Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "defaultValue": false,
            "helpText": "Check if volume discounts are available"
          }
        },
        {
          "name": "bulk_pricing_tiers",
          "label": "Bulk Pricing Tiers",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "e.g., 10-49 units: ₹X each, 50-99 units: ₹Y each, 100+ units: ₹Z each",
            "rows": 3,
            "helpText": "Specify quantity-based pricing tiers"
          }
        },
        {
          "name": "return_policy",
          "label": "Return Policy",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "no_returns", "label": "No Returns"},
              {"value": "7_days", "label": "7 Days Return"},
              {"value": "15_days", "label": "15 Days Return"},
              {"value": "30_days", "label": "30 Days Return"},
              {"value": "60_days", "label": "60 Days Return"},
              {"value": "exchange_only", "label": "Exchange Only"},
              {"value": "defective_only", "label": "Defective Items Only"}
            ]
          }
        },
        {
          "name": "lead_time",
          "label": "Lead Time for Orders",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "immediate", "label": "Immediate/Ready Stock"},
              {"value": "1_day", "label": "1 Business Day"},
              {"value": "2_3_days", "label": "2-3 Business Days"},
              {"value": "1_week", "label": "1 Week"},
              {"value": "2_weeks", "label": "2 Weeks"},
              {"value": "4_weeks", "label": "4 Weeks"},
              {"value": "custom", "label": "Custom Lead Time"}
            ]
          }
        },
        {
          "name": "custom_lead_time",
          "label": "Custom Lead Time Details",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "e.g., 6-8 weeks for special orders",
            "helpText": "Specify custom lead time if applicable"
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
          "name": "contact_name",
          "label": "Contact Person Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:50"],
          "ui_config": {
            "placeholder": "Full name of contact person"
          }
        },
        {
          "name": "contact_number",
          "label": "Contact Number",
          "type": "phone",
          "required": true,
          "validation": ["required", "phone"],
          "ui_config": {
            "placeholder": "+91-9876543210"
          }
        },
        {
          "name": "email",
          "label": "Email Address",
          "type": "email",
          "required": false,
          "validation": ["email"],
          "ui_config": {
            "placeholder": "contact@company.com"
          }
        },
        {
          "name": "company_name",
          "label": "Company Name",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "Company or business name"
          }
        },
        {
          "name": "location",
          "label": "Location",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3", "max_length:100"],
          "ui_config": {
            "placeholder": "City, State - e.g., Mumbai, Maharashtra"
          }
        },
        {
          "name": "detailed_description",
          "label": "Detailed Description",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:50", "max_length:2000"],
          "ui_config": {
            "placeholder": "Provide detailed information about the part, its specifications, compatibility, and any additional features...",
            "rows": 6,
            "helpText": "Include technical details, installation notes, and unique selling points"
          }
        },
        {
          "name": "product_images",
          "label": "Product Images",
          "type": "file",
          "required": true,
          "validation": ["required", "fileType:image", "fileSize:5000000"],
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "maxFiles": 10,
            "helpText": "Upload high-quality images from multiple angles (max 10 images, 5MB each)"
          }
        },
        {
          "name": "technical_documents",
          "label": "Technical Documents",
          "type": "file",
          "required": false,
          "validation": ["fileType:pdf,doc,docx,xlsx", "fileSize:10000000"],
          "ui_config": {
            "accept": ".pdf,.doc,.docx,.xlsx",
            "multiple": true,
            "maxFiles": 5,
            "helpText": "Upload manuals, specifications, compatibility charts, certifications (max 5 files, 10MB each)"
          }
        },
        {
          "name": "installation_guide",
          "label": "Installation Guide Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "defaultValue": false,
            "helpText": "Check if installation instructions are provided"
          }
        }
      ]
    }
  ]
}
```

## Template Features

### **🏭 Industry-Level Coverage:**
- **11 Industry Categories:** Automotive, Electronics, Industrial, Home Appliances, Construction, Agricultural, Medical, Aerospace, Marine, Consumer Goods
- **16 Part Categories:** Engine parts, electrical components, body parts, suspension, brakes, transmission, cooling, fuel systems, filters, belts, bearings, fasteners, tools, consumables, accessories
- **10 Part Types:** OEM, aftermarket, refurbished, used, universal, custom, replacement, upgrade, repair kits, bulk packaging

### **📊 Professional Specifications:**
- **Part Identification:** OEM numbers, manufacturer details, material composition
- **Technical Specs:** Dimensions, weight, thread sizes, electrical ratings, temperature/pressure ranges
- **Quality Standards:** ISO certifications, military specs, aerospace standards, medical/food grade
- **Certifications:** DOT, E-Mark, FMVSS, RoHS, REACH, UL, CE, FCC, BIS approvals

### **🔧 Compatibility Matrix:**
- **Brand Compatibility:** Multi-brand support with detailed listings
- **Model Compatibility:** Year ranges and specific model compatibility
- **Technical Compatibility:** Engine types, transmission types, vehicle categories
- **Application Notes:** Special installation requirements and usage restrictions

### **📦 Commercial Features:**
- **Bulk Pricing:** Quantity-based discount tiers
- **Minimum Orders:** MOQ specifications for wholesale buyers
- **Lead Times:** Realistic delivery timeframes
- **Return Policies:** Flexible return and exchange options
- **Packaging Standards:** Industry-appropriate packaging specifications

### **⚖️ Quality Assurance:**
- **Warranty Coverage:** Comprehensive warranty periods and terms
- **Testing Standards:** Industry-specific testing and validation standards
- **Quality Grades:** OEM, ISO, military, aerospace, medical grade classifications
- **Certifications:** Multi-industry compliance and approval standards

### **🚛 Logistics & Shipping:**
- **Packaging Types:** OEM, bulk, retail, protective packaging options
- **Shipping Restrictions:** Hazardous materials, fragile items, oversized packages
- **Weight & Dimensions:** Accurate shipping calculation parameters
- **Special Handling:** Temperature control, air freight requirements

## API Integration Points

### **Car Management APIs Used:**
```javascript
// Get available parts brands
GET /api/v1/cars/brands?category=spare_parts

// Get models for compatibility checking
GET /api/v1/cars/brands/{brandId}/models

// Get variants for specific applications
GET /api/v1/cars/models/{modelId}/variants
```

### **Schema Template APIs:**
```javascript
// Create the spare parts template
POST /api/v1/schema-templates

// Assign template to spare parts category
POST /api/v1/templates/{id}/assign-category

// Get dynamic form for category
GET /api/v1/catalog/categories/{id}/schema
```

## Implementation Notes

### **Field Validation Rules:**
- **Required Fields:** Title, industry category, part category, part type, condition, price, unit type, available quantity, part number, manufacturer, compatible brands/models, quality standard
- **Technical Validation:** Realistic ranges for dimensions, weights, electrical ratings
- **Compatibility Validation:** Required brand and model compatibility information
- **Commercial Validation:** Bulk pricing and MOQ logic validation

### **Frontend Integration:**
- **Category-Based Logic:** Different fields shown based on industry and part category
- **Compatibility Builder:** Dynamic compatibility matrix builder
- **Bulk Pricing Calculator:** Automatic discount calculations
- **Technical Specification Validator:** Real-time validation of technical parameters

### **Business Logic:**
- **Compatibility Matching:** Advanced search and filtering by compatibility
- **Bulk Order Processing:** Automated quantity-based pricing
- **Quality Assurance:** Certification and warranty tracking
- **Supply Chain Integration:** Lead time and availability management

## Usage Examples

### **Automotive Brake Pads Listing:**
- Industry: "Automotive & Transportation"
- Part Category: "Brake System Parts"
- Part Type: "OEM (Original Equipment Manufacturer)"
- Part Number: "04465-42010"
- Compatible Brands: "Toyota, Lexus"
- Quality Standard: "ISO 9001 Certified"

### **Industrial Bearing Listing:**
- Industry: "Industrial & Machinery"
- Part Category: "Bearings, Seals & Gaskets"
- Part Type: "Replacement Parts"
- Material: "Steel"
- Quality Standard: "ISO 14001 Certified"
- Certifications: "BIS Certified"

### **Electronic Component Listing:**
- Industry: "Electronics & Electrical"
- Part Category: "Electrical & Electronic Components"
- Part Type: "Aftermarket Parts"
- Voltage Rating: "12V"
- Current Rating: "5A"
- Certifications: "RoHS Compliant, CE Marked"

This template provides a comprehensive, industry-level framework for spare parts and accessories listings with professional cataloging standards, detailed technical specifications, and commercial features required for B2B and wholesale transactions.</content>
<parameter name="filePath">/Volumes/ManishData/ManishPersonal/eBidPortal_2/eBidPortal_Apis/Docs/Templates/spare-parts-accessories-template.md