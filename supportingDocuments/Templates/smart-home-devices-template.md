# Smart Home Devices Template

```json
{
  "name": "Smart Home Devices Template",
  "description": "Industry-level template for smart home devices, IoT gadgets, and connected appliances with comprehensive specifications and validation rules.",
  "category_type": "smart_home_devices",
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
            "placeholder": "Enter product title (e.g., Google Nest Hub Max Smart Display)",
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
            "placeholder": "Enter brand name (e.g., Google, Amazon, Apple)",
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
            "placeholder": "Enter model number (e.g., GA00516-US)",
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
              "Smart Speaker",
              "Smart Display",
              "Smart TV",
              "Smart Bulb",
              "Smart Switch",
              "Smart Plug",
              "Smart Thermostat",
              "Smart Lock",
              "Smart Doorbell",
              "Smart Camera",
              "Smart Sensor",
              "Smart Hub",
              "Smart Appliance",
              "Smart Lighting",
              "Smart Security",
              "Smart Entertainment",
              "Smart Kitchen",
              "Smart Health",
              "Smart Garden",
              "Other"
            ]
          },
          "ui_config": {
            "placeholder": "Select product type",
            "help_text": "Primary category of the smart home device"
          }
        },
        {
          "name": "compatibility",
          "label": "Smart Platform Compatibility",
          "type": "checkbox",
          "required": true,
          "validation": {
            "options": [
              "Amazon Alexa",
              "Google Assistant",
              "Apple HomeKit",
              "Samsung SmartThings",
              "Apple Siri",
              "Microsoft Cortana",
              "IFTTT",
              "Zigbee",
              "Z-Wave",
              "Wi-Fi",
              "Bluetooth",
              "Thread",
              "Matter",
              "Home Assistant",
              "OpenHAB",
              "Standalone"
            ]
          },
          "ui_config": {
            "help_text": "Select all compatible smart home platforms and protocols"
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
            "help_text": "Include key features, connectivity options, smart capabilities, and use cases"
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
          "name": "connectivity",
          "label": "Connectivity Options",
          "type": "checkbox",
          "required": true,
          "validation": {
            "options": [
              "Wi-Fi 2.4GHz",
              "Wi-Fi 5GHz",
              "Wi-Fi 6",
              "Wi-Fi 6E",
              "Bluetooth 4.0",
              "Bluetooth 4.2",
              "Bluetooth 5.0",
              "Bluetooth 5.1",
              "Bluetooth 5.2",
              "Zigbee",
              "Z-Wave",
              "Thread",
              "Matter",
              "Ethernet",
              "USB",
              "Micro USB",
              "USB-C",
              "NFC",
              "IR Blaster",
              "Cellular",
              "GPS"
            ]
          },
          "ui_config": {
            "help_text": "Select all supported connectivity options"
          }
        },
        {
          "name": "power_source",
          "label": "Power Source",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "AC Power Adapter",
              "USB Power",
              "Battery Powered",
              "Rechargeable Battery",
              "Solar Powered",
              "Hardwired",
              "PoE (Power over Ethernet)",
              "CR123A Battery",
              "AA Battery",
              "AAA Battery",
              "Lithium-ion Battery",
              "Alkaline Battery"
            ]
          },
          "ui_config": {
            "help_text": "Primary power source for the device"
          }
        },
        {
          "name": "battery_life",
          "label": "Battery Life",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+\\s*(hour|day|week|month)s?$",
            "max_length": 30
          },
          "ui_config": {
            "placeholder": "e.g., 6 months, 2 weeks",
            "help_text": "Expected battery life under normal usage"
          }
        },
        {
          "name": "operating_system",
          "label": "Operating System/App",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Android",
              "iOS",
              "Web App",
              "Alexa App",
              "Google Home App",
              "Apple Home App",
              "Samsung SmartThings App",
              "Dedicated App",
              "No App Required",
              "Web Interface",
              "API Only"
            ]
          },
          "ui_config": {
            "help_text": "Required operating system or companion app"
          }
        },
        {
          "name": "display_specs",
          "label": "Display Specifications",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "e.g., 7-inch LCD, 1024x600 resolution",
            "help_text": "Display size, type, and resolution if applicable"
          }
        },
        {
          "name": "camera_specs",
          "label": "Camera Specifications",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "e.g., 1080p HD, Night Vision, 130° Field of View",
            "help_text": "Camera resolution, features, and capabilities"
          }
        },
        {
          "name": "audio_specs",
          "label": "Audio Specifications",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "e.g., 2-way speakers, Dolby Audio, Far-field mics",
            "help_text": "Speaker configuration, audio features, and microphone capabilities"
          }
        },
        {
          "name": "sensors",
          "label": "Sensors & Detectors",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Motion Sensor",
              "Temperature Sensor",
              "Humidity Sensor",
              "Light Sensor",
              "Sound Sensor",
              "Proximity Sensor",
              "Accelerometer",
              "Gyroscope",
              "Magnetometer",
              "Barometer",
              "Air Quality Sensor",
              "Smoke Detector",
              "Carbon Monoxide Detector",
              "Water Leak Sensor",
              "Door/Window Sensor",
              "Glass Break Sensor",
              "Vibration Sensor",
              "Occupancy Sensor"
            ]
          },
          "ui_config": {
            "help_text": "Select all built-in sensors and detectors"
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
            "placeholder": "e.g., 123 x 123 x 123 mm",
            "help_text": "Physical dimensions of the device"
          }
        },
        {
          "name": "weight",
          "label": "Weight",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.01,
            "max": 50
          },
          "ui_config": {
            "placeholder": "Enter weight in kg",
            "help_text": "Weight of the device in kilograms"
          }
        },
        {
          "name": "operating_temperature",
          "label": "Operating Temperature Range",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^-?\\d+\\s*to\\s*\\d+\\s*°C$",
            "max_length": 30
          },
          "ui_config": {
            "placeholder": "e.g., 0 to 40°C",
            "help_text": "Temperature range for safe operation"
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
            "help_text": "Include processor type, memory, storage, or other relevant specs"
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
              "Limited Warranty",
              "Lifetime Warranty"
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
            "placeholder": "e.g., 1 year, 2 years",
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
          "name": "software_updates",
          "label": "Software Updates Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if device receives regular software/firmware updates"
          }
        },
        {
          "name": "cloud_service",
          "label": "Cloud Service Required",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if device requires cloud service subscription"
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
          "name": "subscription_required",
          "label": "Subscription Service Required",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if ongoing subscription is required for full functionality"
          }
        },
        {
          "name": "subscription_cost",
          "label": "Monthly Subscription Cost (INR)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 10000
          },
          "ui_config": {
            "placeholder": "Enter monthly subscription cost",
            "help_text": "Cost of required subscription service per month"
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
              "Tech Specialist",
              "Smart Home Store",
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
          "name": "technical_support",
          "label": "Technical Support Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if seller provides technical support for setup and troubleshooting"
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
              "Registered Post",
              "Local Pickup Only",
              "Third-party Logistics",
              "Same Day Delivery"
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
            "placeholder": "e.g., 2-3 business days, Same day",
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
          "name": "smart_features",
          "label": "Smart Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Voice Control",
              "Mobile App Control",
              "Smart Scheduling",
              "Automation Rules",
              "Scene Control",
              "Remote Access",
              "Geofencing",
              "Smart Notifications",
              "Energy Monitoring",
              "Usage Analytics",
              "Predictive Maintenance",
              "OTA Updates",
              "Cloud Backup",
              "Local Processing",
              "Edge Computing",
              "AI Assistant",
              "Machine Learning",
              "Smart Recommendations",
              "Multi-User Support",
              "Guest Access",
              "Integration APIs",
              "IFTTT Support",
              "Smart Home Hubs",
              "Mesh Networking",
              "Thread Protocol",
              "Matter Protocol"
            ]
          },
          "ui_config": {
            "help_text": "Select all smart and connected features"
          }
        },
        {
          "name": "security_features",
          "label": "Security Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "End-to-End Encryption",
              "Two-Factor Authentication",
              "Secure Boot",
              "Data Encryption",
              "Privacy Mode",
              "Local Storage Option",
              "No Cloud Required",
              "Secure API",
              "Certificate-Based Auth",
              "Biometric Security",
              "PIN Protection",
              "Remote Lock",
              "Intrusion Detection",
              "Tamper Detection",
              "Secure Firmware",
              "Vulnerability Scanning"
            ]
          },
          "ui_config": {
            "help_text": "Select all security and privacy features"
          }
        },
        {
          "name": "included_accessories",
          "label": "Included Accessories",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Power Adapter",
              "USB Cable",
              "Ethernet Cable",
              "Mounting Kit",
              "Wall Mount",
              "Screws",
              "User Manual",
              "Quick Start Guide",
              "Warranty Card",
              "Registration Card",
              "Remote Control",
              "Batteries",
              "Extension Cable",
              "Protective Case",
              "Cleaning Kit"
            ]
          },
          "ui_config": {
            "help_text": "Select all items included with the product"
          }
        },
        {
          "name": "certifications",
          "label": "Certifications & Standards",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "FCC Certified",
              "CE Marked",
              "RoHS Compliant",
              "Energy Star",
              "UL Certified",
              "Wi-Fi Alliance",
              "Zigbee Certified",
              "Z-Wave Certified",
              "Matter Certified",
              "Thread Certified",
              "Works with Google",
              "Works with Alexa",
              "Apple HomeKit",
              "Samsung SmartThings",
              "ISO 27001",
              "GDPR Compliant"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable certifications and standards"
          }
        },
        {
          "name": "setup_complexity",
          "label": "Setup Complexity",
          "type": "radio",
          "required": false,
          "validation": {
            "options": [
              "Plug & Play",
              "Simple Setup (5-15 mins)",
              "Moderate Setup (15-30 mins)",
              "Complex Setup (30+ mins)",
              "Professional Installation Required"
            ]
          },
          "ui_config": {
            "help_text": "Estimated time and complexity for initial setup"
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
            "placeholder": "Describe recommended usage scenarios and integration possibilities",
            "help_text": "Best suited for specific rooms, automation scenarios, or user types"
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
              "Radiation Safe"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable safety certifications"
          }
        },
        {
          "name": "privacy_compliance",
          "label": "Privacy & Data Compliance",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "GDPR Compliant",
              "CCPA Compliant",
              "Data Localization",
              "No Data Collection",
              "Local Processing Only",
              "User Data Control",
              "Transparent Data Usage",
              "Regular Audits",
              "Privacy by Design",
              "Data Encryption",
              "Secure Deletion",
              "User Consent Required"
            ]
          },
          "ui_config": {
            "help_text": "Privacy and data protection compliance features"
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
              "Recyclable Materials",
              "Sustainable Packaging",
              "Carbon Footprint Certified",
              "Green Manufacturing",
              "Low Power Consumption",
              "Battery Recyclable",
              "E-Waste Compliant"
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
            "help_text": "Check if product contains batteries or other hazardous materials"
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
            "help_text": "Information about proper disposal or recycling of device components"
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
              "Warranty Registration Done",
              "EMI Compliant"
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
            "help_text": "Electrical safety, data privacy, usage guidelines"
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
            "help_text": "Upload high-quality images from multiple angles, including setup and interface (max 15 images, 5MB each)"
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
            "help_text": "Upload product demonstration or setup video (optional, max 100MB)"
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
            "help_text": "Upload warranty cards, certifications, test reports, or other relevant documents"
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
            "help_text": "Link to product review, setup guide, or demonstration on YouTube"
          }
        },
        {
          "name": "app_screenshots",
          "label": "App Screenshots",
          "type": "file",
          "required": false,
          "validation": {
            "file_types": ["image/jpeg", "image/png", "image/webp"],
            "max_files": 5,
            "max_file_size": 5242880
          },
          "ui_config": {
            "help_text": "Upload screenshots of the companion app interface (optional, max 5 images)"
          }
        },
        {
          "name": "setup_diagram",
          "label": "Setup Diagram",
          "type": "file",
          "required": false,
          "validation": {
            "file_types": ["application/pdf", "image/jpeg", "image/png"],
            "max_files": 1,
            "max_file_size": 5242880
          },
          "ui_config": {
            "help_text": "Upload setup diagram or installation guide"
          }
        }
      ]
    }
  ]
}
```