# Other Electronics Template

```json
{
  "name": "Other Electronics Template",
  "description": "Industry-level template for miscellaneous electronic products including calculators, audio devices, personal care electronics, and other specialized electronic items with comprehensive specifications and validation rules.",
  "category_type": "other_electronics",
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
            "placeholder": "Enter product title (e.g., Scientific Calculator Casio FX-991EX)",
            "help_text": "Provide a clear, descriptive title including brand and model"
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
            "placeholder": "Enter brand name (e.g., Casio, Sony, Philips)",
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
            "placeholder": "Enter model number (e.g., FX-991EX, WH-1000XM4)",
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
              "Calculator",
              "Audio Device",
              "Personal Care Electronics",
              "Kitchen Appliance",
              "Office Electronics",
              "Digital Camera",
              "MP3/MP4 Player",
              "Portable DVD Player",
              "Electronic Dictionary",
              "Language Translator",
              "Weather Station",
              "Digital Photo Frame",
              "E-Reader Accessories",
              "Smartphone Accessories",
              "Cable/Adapter",
              "Power Supply",
              "Remote Control",
              "Electronic Toy/Game",
              "Measurement Device",
              "Other Electronics"
            ]
          },
          "ui_config": {
            "placeholder": "Select product type",
            "help_text": "Primary category of the electronic product"
          }
        },
        {
          "name": "subcategory",
          "label": "Subcategory",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Scientific Calculator",
              "Graphing Calculator",
              "Basic Calculator",
              "Financial Calculator",
              "Headphones",
              "Earphones",
              "Speakers",
              "Microphones",
              "Hair Dryer",
              "Hair Straightener",
              "Electric Shaver",
              "Massage Device",
              "Blender",
              "Mixer",
              "Coffee Maker",
              "Toaster",
              "Printer",
              "Scanner",
              "Label Maker",
              "Point-and-Shoot Camera",
              "Instant Camera",
              "Digital Voice Recorder",
              "MP3 Player",
              "MP4 Player",
              "Portable Media Player",
              "Electronic Notebook",
              "Smart Pen",
              "Weather Station",
              "Digital Thermometer",
              "Kitchen Scale",
              "Blood Pressure Monitor",
              "Fitness Tracker",
              "Smart Watch Accessories",
              "Cable Organizer",
              "USB Hub",
              "Power Bank Accessories",
              "Remote Control",
              "Universal Remote",
              "Electronic Learning Toy",
              "Educational Tablet",
              "Other"
            ]
          },
          "ui_config": {
            "placeholder": "Select subcategory if applicable",
            "help_text": "More specific product classification"
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
            "help_text": "Include key features, functionality, and use cases"
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
          "name": "power_source",
          "label": "Power Source",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "Battery",
              "Rechargeable Battery",
              "AC Power",
              "USB Power",
              "Solar Power",
              "Battery + AC Adapter",
              "Cordless",
              "Plug-in"
            ]
          },
          "ui_config": {
            "help_text": "Primary power source for the device"
          }
        },
        {
          "name": "battery_type",
          "label": "Battery Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "AA",
              "AAA",
              "9V",
              "CR2032",
              "CR123A",
              "Lithium-ion",
              "NiMH",
              "Alkaline",
              "Rechargeable",
              "Built-in Battery",
              "Solar Panel"
            ]
          },
          "ui_config": {
            "help_text": "Type of batteries required or included"
          }
        },
        {
          "name": "battery_life",
          "label": "Battery Life",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "e.g., Up to 20 hours, 500 hours continuous use",
            "help_text": "Expected battery life under normal usage"
          }
        },
        {
          "name": "connectivity",
          "label": "Connectivity Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Bluetooth",
              "Wi-Fi",
              "USB",
              "Micro USB",
              "USB-C",
              "3.5mm Audio Jack",
              "NFC",
              "Wireless Charging",
              "Infrared",
              "RF Remote",
              "SD Card Slot",
              "Memory Card Slot",
              "HDMI",
              "Ethernet"
            ]
          },
          "ui_config": {
            "help_text": "Select all connectivity features"
          }
        },
        {
          "name": "display_type",
          "label": "Display Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "LCD",
              "LED",
              "OLED",
              "TFT",
              "Monochrome",
              "Color",
              "Touch Screen",
              "E-Ink",
              "No Display",
              "Digital Display",
              "Analog Display"
            ]
          },
          "ui_config": {
            "help_text": "Type of display or screen"
          }
        },
        {
          "name": "display_size",
          "label": "Display Size",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*(inches?|cm|mm)$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 2.4 inches, 5 cm",
            "help_text": "Display size in inches or centimeters"
          }
        },
        {
          "name": "storage_capacity",
          "label": "Storage Capacity",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*(GB|MB|KB|TB)$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 8GB, 32MB",
            "help_text": "Internal storage capacity"
          }
        },
        {
          "name": "memory_type",
          "label": "Memory Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Flash Memory",
              "SD Card",
              "MicroSD",
              "Internal Memory",
              "Expandable Memory",
              "No Memory",
              "RAM",
              "ROM"
            ]
          },
          "ui_config": {
            "help_text": "Type of memory or storage"
          }
        },
        {
          "name": "processor",
          "label": "Processor/Chipset",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "e.g., ARM Cortex, Custom Chip",
            "help_text": "Processor or chipset specifications"
          }
        },
        {
          "name": "operating_system",
          "label": "Operating System",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Android",
              "iOS",
              "Windows",
              "Linux",
              "Proprietary OS",
              "No OS",
              "Firmware-based",
              "RTOS"
            ]
          },
          "ui_config": {
            "help_text": "Operating system or firmware"
          }
        },
        {
          "name": "dimensions",
          "label": "Dimensions (L x W x H)",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*x\\s*\\d+(\\.\\d+)?\\s*x\\s*\\d+(\\.\\d+)?\\s*(mm|cm|inches?|in)$",
            "max_length": 50
          },
          "ui_config": {
            "placeholder": "e.g., 150 x 80 x 15 mm",
            "help_text": "Physical dimensions in millimeters or inches"
          }
        },
        {
          "name": "weight",
          "label": "Weight",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.01,
            "max": 50000
          },
          "ui_config": {
            "placeholder": "Enter weight in grams",
            "help_text": "Weight in grams (for portability assessment)"
          }
        },
        {
          "name": "water_resistance",
          "label": "Water Resistance",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Waterproof",
              "Water Resistant (IPX4)",
              "Water Resistant (IPX5)",
              "Water Resistant (IPX6)",
              "Water Resistant (IPX7)",
              "Water Resistant (IPX8)",
              "Splash Proof",
              "Not Water Resistant"
            ]
          },
          "ui_config": {
            "help_text": "Water and moisture resistance rating"
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
            "help_text": "Include sensor types, special features, or other relevant specs"
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
              "Seller Warranty",
              "Limited Warranty"
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
            "placeholder": "e.g., 1 year, 12 months",
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
          "name": "testing_status",
          "label": "Testing Status",
          "type": "radio",
          "required": false,
          "validation": {
            "options": [
              "Tested and Working",
              "Not Tested",
              "Partially Working",
              "Needs Repair",
              "For Parts Only"
            ]
          },
          "ui_config": {
            "help_text": "Whether the device has been tested and is functional"
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
              "Electronics Store",
              "Wholesale Supplier",
              "Import/Export Company"
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
          "name": "electronics_expertise",
          "label": "Electronics Expertise",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if seller has electronics expertise for technical support"
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
              "Registered Post",
              "Local Pickup Only",
              "Third-party Logistics",
              "Speed Post",
              "Surface Mail"
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
            "placeholder": "e.g., 2-3 business days, 5-7 working days",
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
          "required": false,
          "ui_config": {
            "help_text": "Check if item requires special handling"
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
              "Wireless Connectivity",
              "Touch Screen",
              "Voice Control",
              "Smart Features",
              "Multi-language Support",
              "Expandable Memory",
              "Long Battery Life",
              "Fast Charging",
              "Water Resistant",
              "Dust Proof",
              "Shock Resistant",
              "Backlit Display",
              "Programmable Functions",
              "Data Transfer",
              "Cloud Sync",
              "App Integration",
              "Voice Recording",
              "Video Recording",
              "Photo Capture",
              "Calculator Functions",
              "Scientific Functions",
              "Graphing Capabilities",
              "Financial Calculations",
              "Measurement Tools",
              "Weather Monitoring",
              "Health Monitoring",
              "Fitness Tracking"
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
              "Quick Start Guide",
              "Batteries",
              "AC Adapter",
              "USB Cable",
              "Carrying Case",
              "Protective Cover",
              "Screen Protector",
              "Memory Card",
              "Headphones",
              "Earphones",
              "Remote Control",
              "Mounting Kit",
              "Cleaning Kit",
              "Software CD",
              "Warranty Card",
              "Registration Card"
            ]
          },
          "ui_config": {
            "help_text": "Select all items included with the product"
          }
        },
        {
          "name": "compatibility",
          "label": "Compatibility",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 300
          },
          "ui_config": {
            "placeholder": "List compatible devices, software, or systems",
            "help_text": "Devices, operating systems, or software this product works with"
          }
        },
        {
          "name": "certifications",
          "label": "Certifications & Standards",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "BIS Certified",
              "ISI Marked",
              "CE Marked",
              "FCC Certified",
              "RoHS Compliant",
              "IP Rated",
              "Energy Star",
              "UL Certified",
              "IEC Standards",
              "ISO Certified"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable certifications and standards"
          }
        },
        {
          "name": "usage_applications",
          "label": "Usage Applications",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Personal Use",
              "Professional Use",
              "Educational Use",
              "Business Use",
              "Industrial Use",
              "Medical Use",
              "Laboratory Use",
              "Field Work",
              "Home Use",
              "Office Use",
              "Travel Use",
              "Outdoor Use",
              "Gaming",
              "Photography",
              "Audio Recording",
              "Video Recording",
              "Measurement",
              "Monitoring",
              "Communication"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable usage scenarios"
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
              "Medical Grade",
              "Laboratory Grade"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable safety certifications"
          }
        },
        {
          "name": "hazardous_materials",
          "label": "Contains Hazardous Materials",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if product contains batteries or hazardous materials"
          }
        },
        {
          "name": "age_restriction",
          "label": "Age Restriction",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "No Restriction",
              "3+ Years",
              "6+ Years",
              "12+ Years",
              "15+ Years",
              "18+ Years",
              "Adult Use Only"
            ]
          },
          "ui_config": {
            "help_text": "Minimum age recommendation for safe use"
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
            "help_text": "Information about proper disposal or recycling"
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
              "Licensed Product",
              "Patent Compliant",
              "Trademark Compliant"
            ]
          },
          "ui_config": {
            "help_text": "Legal and regulatory compliance information"
          }
        },
        {
          "name": "warranty_terms",
          "label": "Warranty Terms & Conditions",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "Describe warranty terms, conditions, and exclusions",
            "help_text": "Detailed warranty coverage and limitations"
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
            "max_files": 10,
            "max_file_size": 5242880
          },
          "ui_config": {
            "help_text": "Upload high-quality images from multiple angles (max 10 images, 5MB each)"
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
            "help_text": "Upload product demonstration or unboxing video (optional, max 100MB)"
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
            "help_text": "Upload user manual, quick start guide, or technical documentation"
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
            "help_text": "Upload warranty cards, certificates, specifications, or other relevant documents"
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
            "help_text": "Link to product review or demonstration video on YouTube"
          }
        },
        {
          "name": "specifications_sheet",
          "label": "Technical Specifications Sheet",
          "type": "file",
          "required": false,
          "validation": {
            "file_types": ["application/pdf", "image/jpeg", "image/png"],
            "max_files": 1,
            "max_file_size": 10485760
          },
          "ui_config": {
            "help_text": "Upload detailed technical specifications or data sheet"
          }
        }
      ]
    }
  ]
}
```