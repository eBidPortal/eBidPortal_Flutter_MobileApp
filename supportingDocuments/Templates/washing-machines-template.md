# Washing Machines Template

```json
{
  "name": "Washing Machines Template",
  "description": "Industry-level template for washing machines, dryers, and laundry equipment with comprehensive specifications and validation rules.",
  "category_type": "washing_machines",
  "is_active": true,
  "sections": [
    {
      "title": "Basic Information",
      "order": 1,
      "description": "Essential product identification and categorization details",
      "is_collapsible": false,
      "fields": [
        {
          "name": "product_title",
          "label": "Product Title",
          "type": "text",
          "required": true,
          "validation": {
            "min_length": 10,
            "max_length": 200,
            "pattern": "^[a-zA-Z0-9\\s\\-\\_\\(\\)\\[\\]\\+\\&\\,\\.]+$"
          },
          "ui_config": {
            "placeholder": "Enter product title (e.g., LG 7kg Front Load Washing Machine)",
            "help_text": "Provide a clear, descriptive title including brand and capacity"
          }
        },
        {
          "name": "brand",
          "label": "Brand",
          "type": "text",
          "required": true,
          "validation": {
            "min_length": 2,
            "max_length": 100,
            "pattern": "^[a-zA-Z0-9\\s\\-\\_\\&\\.]+$"
          },
          "ui_config": {
            "placeholder": "Enter brand name (e.g., LG, Samsung, Whirlpool)",
            "help_text": "Official brand name as recognized in the market"
          }
        },
        {
          "name": "model_number",
          "label": "Model Number",
          "type": "text",
          "required": true,
          "validation": {
            "min_length": 3,
            "max_length": 50,
            "pattern": "^[a-zA-Z0-9\\-\\_\\.]+$"
          },
          "ui_config": {
            "placeholder": "Enter model number (e.g., FHM1207BDL)",
            "help_text": "Manufacturer's model or part number"
          }
        },
        {
          "name": "product_type",
          "label": "Product Type",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "Front Load Washing Machine",
              "Top Load Washing Machine",
              "Semi-Automatic Washing Machine",
              "Fully Automatic Washing Machine",
              "Washer Dryer Combo",
              "Dryer Only",
              "Commercial Washing Machine",
              "Portable Washing Machine",
              "Stackable Washer Dryer",
              "Compact Washing Machine",
              "Other"
            ]
          },
          "ui_config": {
            "placeholder": "Select product type",
            "help_text": "Primary category of the washing machine"
          }
        },
        {
          "name": "capacity",
          "label": "Washing Capacity",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "3 kg",
              "4 kg",
              "5 kg",
              "6 kg",
              "6.5 kg",
              "7 kg",
              "7.5 kg",
              "8 kg",
              "8.5 kg",
              "9 kg",
              "9.5 kg",
              "10 kg",
              "10.5 kg",
              "11 kg",
              "12 kg",
              "Above 12 kg"
            ]
          },
          "ui_config": {
            "help_text": "Rated washing capacity in kilograms"
          }
        },
        {
          "name": "product_description",
          "label": "Product Description",
          "type": "textarea",
          "required": true,
          "validation": {
            "min_length": 50,
            "max_length": 2000
          },
          "ui_config": {
            "placeholder": "Provide detailed product description including features and specifications",
            "help_text": "Include key features, wash programs, energy efficiency, and use cases"
          }
        }
      ]
    },
    {
      "title": "Technical Specifications",
      "order": 2,
      "description": "Detailed technical specifications based on product type",
      "is_collapsible": true,
      "fields": [
        {
          "name": "energy_rating",
          "label": "Energy Rating",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "5 Star",
              "4 Star",
              "3 Star",
              "2 Star",
              "1 Star",
              "Not Rated",
              "Energy Efficient",
              "Inverter Motor",
              "Direct Drive Motor"
            ]
          },
          "ui_config": {
            "help_text": "BEE energy rating or efficiency classification"
          }
        },
        {
          "name": "wash_programs",
          "label": "Wash Programs",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Cotton",
              "Synthetic",
              "Delicate",
              "Wool",
              "Silk",
              "Quick Wash",
              "Heavy Duty",
              "Baby Care",
              "Sportswear",
              "Shirts",
              "Jeans",
              "Bedding",
              "Towels",
              "Rinse & Spin",
              "Spin Only",
              "Soak",
              "Pre-wash",
              "Steam Wash",
              "Allergy Care",
              "Anti-Bacterial",
              "Eco Wash",
              "Custom Program"
            ]
          },
          "ui_config": {
            "help_text": "Select all available wash programs"
          }
        },
        {
          "name": "motor_type",
          "label": "Motor Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Universal Motor",
              "Induction Motor",
              "Direct Drive Motor",
              "Inverter Motor",
              "BLDC Motor",
              "DD Motor",
              "Conventional Motor"
            ]
          },
          "ui_config": {
            "help_text": "Type of motor used in the washing machine"
          }
        },
        {
          "name": "max_spin_speed",
          "label": "Maximum Spin Speed",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "600 RPM",
              "700 RPM",
              "800 RPM",
              "900 RPM",
              "1000 RPM",
              "1100 RPM",
              "1200 RPM",
              "1300 RPM",
              "1400 RPM",
              "1500 RPM",
              "1600 RPM",
              "Above 1600 RPM"
            ]
          },
          "ui_config": {
            "help_text": "Maximum spin speed for water extraction"
          }
        },
        {
          "name": "power_consumption",
          "label": "Power Consumption",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*(W|KW)$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 1200W, 1.2KW",
            "help_text": "Rated power consumption in watts or kilowatts"
          }
        },
        {
          "name": "water_consumption",
          "label": "Water Consumption per Wash",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*L$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 45L, 50-60L",
            "help_text": "Average water consumption per wash cycle"
          }
        },
        {
          "name": "operating_voltage",
          "label": "Operating Voltage",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+\\s*V$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 220V, 230V",
            "help_text": "Operating voltage requirement"
          }
        },
        {
          "name": "noise_level_wash",
          "label": "Noise Level (Wash)",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*dB$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 55 dB",
            "help_text": "Noise level during wash cycle"
          }
        },
        {
          "name": "noise_level_spin",
          "label": "Noise Level (Spin)",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*dB$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 75 dB",
            "help_text": "Noise level during spin cycle"
          }
        },
        {
          "name": "dimensions",
          "label": "Dimensions (W x H x D)",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*x\\s*\\d+(\\.\\d+)?\\s*x\\s*\\d+(\\.\\d+)?\\s*(mm|cm|inches?|in)$",
            "max_length": 50
          },
          "ui_config": {
            "placeholder": "e.g., 600 x 850 x 550 mm",
            "help_text": "Dimensions of the washing machine (Width x Height x Depth)"
          }
        },
        {
          "name": "weight",
          "label": "Weight",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 200
          },
          "ui_config": {
            "placeholder": "Enter weight in kg",
            "help_text": "Weight of the washing machine in kilograms"
          }
        },
        {
          "name": "drum_material",
          "label": "Drum Material",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Stainless Steel",
              "Plastic",
              "Porcelain Enamel",
              "Corrosion Resistant Steel",
              "Diamond Drum",
              "Other"
            ]
          },
          "ui_config": {
            "help_text": "Material used for the inner drum"
          }
        },
        {
          "name": "additional_specs",
          "label": "Additional Specifications",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 1000
          },
          "ui_config": {
            "placeholder": "Enter any additional technical specifications",
            "help_text": "Include detergent dispenser type, control panel features, or other relevant specs"
          }
        }
      ]
    },
    {
      "title": "Condition & Warranty",
      "order": 3,
      "description": "Product condition assessment and warranty information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "condition",
          "label": "Condition",
          "type": "radio",
          "required": true,
          "validation": {
            "options": [
              "New",
              "Sealed",
              "Open Box",
              "Used - Like New",
              "Used - Good",
              "Used - Fair",
              "For Parts",
              "Refurbished"
            ]
          },
          "ui_config": {
            "help_text": "Current physical and functional condition of the product"
          }
        },
        {
          "name": "warranty_status",
          "label": "Warranty Status",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "Under Warranty",
              "Expired Warranty",
              "No Warranty",
              "Extended Warranty Available",
              "Manufacturer Warranty",
              "On-site Service Warranty",
              "Carry-in Warranty"
            ]
          },
          "ui_config": {
            "help_text": "Current warranty coverage status"
          }
        },
        {
          "name": "warranty_period",
          "label": "Warranty Period",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+\\s+(year|month|day|week)s?$",
            "max_length": 50
          },
          "ui_config": {
            "placeholder": "e.g., 2 years, 10 years",
            "help_text": "Duration of warranty coverage"
          }
        },
        {
          "name": "packaging_condition",
          "label": "Packaging Condition",
          "type": "radio",
          "required": false,
          "validation": {
            "options": [
              "Original Packaging",
              "Sealed Packaging",
              "Generic Packaging",
              "No Packaging",
              "Damaged Packaging"
            ]
          },
          "ui_config": {
            "help_text": "Condition of the original or replacement packaging"
          }
        },
        {
          "name": "defects_issues",
          "label": "Known Defects or Issues",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "Describe any known defects, scratches, or functional issues",
            "help_text": "Be transparent about any imperfections or malfunctions"
          }
        },
        {
          "name": "installation_required",
          "label": "Installation Required",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if professional installation is required"
          }
        },
        {
          "name": "installation_included",
          "label": "Installation Included",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if installation service is included in the price"
          }
        }
      ]
    },
    {
      "title": "Pricing & Availability",
      "order": 4,
      "description": "Pricing information and stock availability",
      "is_collapsible": true,
      "fields": [
        {
          "name": "price",
          "label": "Price (INR)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 1,
            "max": 1000000
          },
          "ui_config": {
            "placeholder": "Enter price in Indian Rupees",
            "help_text": "Current selling price including any applicable taxes"
          }
        },
        {
          "name": "original_price",
          "label": "Original Price (INR)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 1000000
          },
          "ui_config": {
            "placeholder": "Enter original MRP if different",
            "help_text": "Manufacturer's suggested retail price"
          }
        },
        {
          "name": "quantity_available",
          "label": "Quantity Available",
          "type": "number",
          "required": true,
          "validation": {
            "min": 1,
            "max": 10000
          },
          "ui_config": {
            "placeholder": "Enter available stock quantity",
            "help_text": "Number of units currently available for sale"
          }
        },
        {
          "name": "price_negotiable",
          "label": "Price Negotiable",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if willing to negotiate on the listed price"
          }
        },
        {
          "name": "bulk_discount_available",
          "label": "Bulk Discount Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if discounts available for bulk purchases"
          }
        },
        {
          "name": "minimum_order_quantity",
          "label": "Minimum Order Quantity",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter MOQ if applicable",
            "help_text": "Minimum quantity required for purchase"
          }
        }
      ]
    },
    {
      "title": "Seller Information",
      "order": 5,
      "description": "Seller details and contact information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "seller_type",
          "label": "Seller Type",
          "type": "radio",
          "required": true,
          "validation": {
            "options": [
              "Individual",
              "Business/Reseller",
              "Manufacturer",
              "Authorized Dealer",
              "Online Retailer",
              "Appliance Specialist",
              "Home Appliance Store",
              "Installation Service Provider",
              "Other"
            ]
          },
          "ui_config": {
            "help_text": "Type of seller offering this product"
          }
        },
        {
          "name": "seller_location",
          "label": "Seller Location",
          "type": "text",
          "required": true,
          "validation": {
            "min_length": 3,
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "Enter city and state (e.g., Mumbai, Maharashtra)",
            "help_text": "Location where the seller is based"
          }
        },
        {
          "name": "business_name",
          "label": "Business Name",
          "type": "text",
          "required": false,
          "validation": {
            "min_length": 2,
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "Enter business or store name",
            "help_text": "Required for business sellers"
          }
        },
        {
          "name": "contact_number",
          "label": "Contact Number",
          "type": "phone",
          "required": true,
          "validation": {
            "pattern": "^(\\+91|0)?[6-9]\\d{9}$"
          },
          "ui_config": {
            "placeholder": "Enter 10-digit mobile number",
            "help_text": "Primary contact number for inquiries"
          }
        },
        {
          "name": "preferred_contact_method",
          "label": "Preferred Contact Method",
          "type": "radio",
          "required": false,
          "validation": {
            "options": [
              "Phone Call",
              "WhatsApp",
              "SMS",
              "Email",
              "Platform Messages"
            ]
          },
          "ui_config": {
            "help_text": "Preferred way to contact the seller"
          }
        },
        {
          "name": "installation_service_available",
          "label": "Installation Service Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if seller provides installation services"
          }
        },
        {
          "name": "after_sales_support",
          "label": "After Sales Support",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if seller provides after-sales support and service"
          }
        }
      ]
    },
    {
      "title": "Shipping & Delivery",
      "order": 6,
      "description": "Shipping options and delivery information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "shipping_available",
          "label": "Shipping Available",
          "type": "boolean",
          "required": true,
          "ui_config": {
            "help_text": "Check if willing to ship the product"
          }
        },
        {
          "name": "shipping_cost",
          "label": "Shipping Cost (INR)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 50000
          },
          "ui_config": {
            "placeholder": "Enter shipping cost or 0 for free shipping",
            "help_text": "Cost of shipping within India"
          }
        },
        {
          "name": "free_shipping",
          "label": "Free Shipping",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if shipping is free"
          }
        },
        {
          "name": "shipping_method",
          "label": "Shipping Method",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Standard Delivery",
              "Express Delivery",
              "Courier Service",
              "White Goods Delivery",
              "Heavy Item Delivery",
              "Local Pickup Only",
              "Third-party Logistics",
              "Installation Included"
            ]
          },
          "ui_config": {
            "help_text": "Available shipping methods"
          }
        },
        {
          "name": "delivery_time",
          "label": "Estimated Delivery Time",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "e.g., 2-3 business days, 7-10 days",
            "help_text": "Expected time for delivery after purchase"
          }
        },
        {
          "name": "international_shipping",
          "label": "International Shipping",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if willing to ship internationally"
          }
        },
        {
          "name": "fragile_item",
          "label": "Fragile Item",
          "type": "boolean",
          "required": true,
          "ui_config": {
            "help_text": "Washing machines are typically considered fragile items"
          }
        },
        {
          "name": "return_policy",
          "label": "Return Policy",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "Describe return and exchange policy",
            "help_text": "Terms for returns, exchanges, and refunds"
          }
        }
      ]
    },
    {
      "title": "Additional Features",
      "order": 7,
      "description": "Special features and additional product capabilities",
      "is_collapsible": true,
      "fields": [
        {
          "name": "special_features",
          "label": "Special Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Wi-Fi Connectivity",
              "Smart App Control",
              "Voice Control (Alexa/Google)",
              "Smart Diagnosis",
              "Auto Detergent Dispensing",
              "Auto Water Level Adjustment",
              "Foam Control",
              "Child Lock",
              "Delay Start",
              "Time Remaining Display",
              "Smart Inverter Motor",
              "Direct Drive Motor",
              "6 Motion Technology",
              "Add Garments Function",
              "Anti-Bacterial Treatment",
              "Allergy Care",
              "Steam Function",
              "Wrinkle Care",
              "Pre-wash Function",
              "Drum Clean",
              "Smart Rinse",
              "Tub Clean",
              "Eco Bubble",
              "Turbo Wash",
              "Magic Filter",
              "Diamond Drum",
              "Stainless Steel Drum",
              "LED Display",
              "Touch Control Panel"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable special features"
          }
        },
        {
          "name": "included_accessories",
          "label": "Included Accessories",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "User Manual",
              "Warranty Card",
              "Water Inlet Hose",
              "Water Drain Hose",
              "Anti-Rat Cover",
              "Lint Filter",
              "Detergent Drawer",
              "Transportation Bolts",
              "Spanner",
              "Drain Hose Clip",
              "Inlet Hose Clip",
              "Power Cord",
              "Remote Control",
              "Lint Collector"
            ]
          },
          "ui_config": {
            "help_text": "Select all items included with the product"
          }
        },
        {
          "name": "smart_features",
          "label": "Smart Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Wi-Fi Enabled",
              "Mobile App Control",
              "Voice Assistant Integration",
              "Smart Scheduling",
              "Energy Monitoring",
              "Remote Diagnostics",
              "OTA Updates",
              "Smart Home Integration",
              "Geofencing",
              "Usage Analytics",
              "Maintenance Alerts",
              "Filter Replacement Alerts",
              "Energy Reports",
              "Wash Cycle Tracking",
              "Smart Recommendations"
            ]
          },
          "ui_config": {
            "help_text": "Select all smart and connected features"
          }
        },
        {
          "name": "certifications",
          "label": "Certifications & Standards",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "BEE 5 Star",
              "BEE 4 Star",
              "BEE 3 Star",
              "BIS Certified",
              "ISI Marked",
              "CE Marked",
              "RoHS Compliant",
              "Energy Star",
              "ISO Certified",
              "IEC Certified",
              "UL Certified"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable certifications and ratings"
          }
        },
        {
          "name": "usage_recommendations",
          "label": "Usage Recommendations",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 300
          },
          "ui_config": {
            "placeholder": "Describe recommended usage scenarios and household size",
            "help_text": "Best suited for family size, laundry frequency, etc."
          }
        }
      ]
    },
    {
      "title": "Compliance & Safety",
      "order": 8,
      "description": "Regulatory compliance and safety information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "safety_certifications",
          "label": "Safety Certifications",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "BIS Certified",
              "ISI Marked",
              "CE Marked",
              "UL Certified",
              "FCC Compliant",
              "RoHS Compliant",
              "WEEE Compliant",
              "IP Rated",
              "Fire Resistant",
              "Child Safe",
              "Anti-Electric Shock",
              "Overload Protection",
              "Short Circuit Protection",
              "Water Leakage Protection"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable safety certifications"
          }
        },
        {
          "name": "environmental_compliance",
          "label": "Environmental Compliance",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Energy Efficient",
              "Water Saving Technology",
              "Recyclable Materials",
              "Sustainable Packaging",
              "Carbon Footprint Certified",
              "Green Manufacturing",
              "Eco-Friendly Detergent Compatible"
            ]
          },
          "ui_config": {
            "help_text": "Environmental and sustainability certifications"
          }
        },
        {
          "name": "hazardous_materials",
          "label": "Contains Hazardous Materials",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if product contains any hazardous materials"
          }
        },
        {
          "name": "recycling_info",
          "label": "Recycling Information",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 300
          },
          "ui_config": {
            "placeholder": "Provide recycling or disposal information",
            "help_text": "Information about proper disposal or recycling of washing machine components"
          }
        },
        {
          "name": "legal_compliance",
          "label": "Legal Compliance",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Import Duty Paid",
              "GST Compliant",
              "Customs Cleared",
              "Original Purchase",
              "Authorized Import",
              "Dealer Invoice Available",
              "Warranty Registration Done"
            ]
          },
          "ui_config": {
            "help_text": "Legal and regulatory compliance information"
          }
        },
        {
          "name": "safety_instructions",
          "label": "Safety Instructions",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "Provide important safety instructions for installation and use",
            "help_text": "Installation requirements, electrical safety, water connection guidelines"
          }
        }
      ]
    },
    {
      "title": "Media & Documentation",
      "order": 9,
      "description": "Product images, videos, and documentation",
      "is_collapsible": true,
      "fields": [
        {
          "name": "product_images",
          "label": "Product Images",
          "type": "file",
          "required": true,
          "validation": {
            "file_types": ["image/jpeg", "image/png", "image/webp"],
            "max_files": 15,
            "max_file_size": 5242880
          },
          "ui_config": {
            "help_text": "Upload high-quality images from multiple angles, including control panel and drum (max 15 images, 5MB each)"
          }
        },
        {
          "name": "product_video",
          "label": "Product Video",
          "type": "file",
          "required": false,
          "validation": {
            "file_types": ["video/mp4", "video/avi", "video/mov"],
            "max_files": 1,
            "max_file_size": 104857600
          },
          "ui_config": {
            "help_text": "Upload product demonstration or installation video (optional, max 100MB)"
          }
        },
        {
          "name": "user_manual",
          "label": "User Manual/Documentation",
          "type": "file",
          "required": false,
          "validation": {
            "file_types": ["application/pdf", "text/plain", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document"],
            "max_files": 3,
            "max_file_size": 10485760
          },
          "ui_config": {
            "help_text": "Upload user manual, installation guide, or technical documentation"
          }
        },
        {
          "name": "additional_documents",
          "label": "Additional Documents",
          "type": "file",
          "required": false,
          "validation": {
            "file_types": ["application/pdf", "image/jpeg", "image/png"],
            "max_files": 5,
            "max_file_size": 5242880
          },
          "ui_config": {
            "help_text": "Upload warranty cards, energy rating certificates, test reports, or other relevant documents"
          }
        },
        {
          "name": "youtube_video_url",
          "label": "YouTube Video URL",
          "type": "url",
          "required": false,
          "validation": {
            "pattern": "^https?://(www\\.)?(youtube\\.com/watch\\?v=|youtu\\.be/)[a-zA-Z0-9_-]{11}"
          },
          "ui_config": {
            "placeholder": "https://www.youtube.com/watch?v=...",
            "help_text": "Link to product review, installation guide, or demonstration on YouTube"
          }
        },
        {
          "name": "energy_rating_certificate",
          "label": "Energy Rating Certificate",
          "type": "file",
          "required": false,
          "validation": {
            "file_types": ["application/pdf", "image/jpeg", "image/png"],
            "max_files": 1,
            "max_file_size": 5242880
          },
          "ui_config": {
            "help_text": "Upload BEE energy rating certificate or label"
          }
        },
        {
          "name": "installation_diagram",
          "label": "Installation Diagram",
          "type": "file",
          "required": false,
          "validation": {
            "file_types": ["application/pdf", "image/jpeg", "image/png"],
            "max_files": 1,
            "max_file_size": 5242880
          },
          "ui_config": {
            "help_text": "Upload installation diagram or schematic"
          }
        }
      ]
    }
  ]
}
```