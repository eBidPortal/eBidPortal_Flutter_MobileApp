# Cameras & Lenses Template

```json
{
  "name": "Cameras & Lenses Template",
  "description": "Industry-level template for cameras, lenses, and photography equipment with comprehensive specifications and validation rules.",
  "category_type": "cameras_lenses",
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
            "placeholder": "Enter product title (e.g., Canon EOS R5 Mirrorless Camera)",
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
            "placeholder": "Enter brand name (e.g., Canon, Nikon, Sony, Fujifilm)",
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
            "placeholder": "Enter model number (e.g., EOS-R5)",
            "help_text": "Manufacturer's model or part number"
          }
        },
        {
          "name": "device_type",
          "label": "Device Type",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "DSLR Camera",
              "Mirrorless Camera",
              "Point & Shoot Camera",
              "Instant Camera",
              "Action Camera",
              "360 Camera",
              "Camera Lens",
              "Camera Accessory",
              "Tripod",
              "Camera Bag",
              "Lighting Equipment",
              "Memory Card",
              "Camera Battery",
              "Filters",
              "Other"
            ]
          },
          "ui_config": {
            "placeholder": "Select device type",
            "help_text": "Primary category of the photography equipment"
          }
        },
        {
          "name": "mount_type",
          "label": "Lens Mount/Camera Mount",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Canon EF",
              "Canon EF-S",
              "Canon RF",
              "Nikon F",
              "Nikon Z",
              "Sony E",
              "Sony A",
              "Fujifilm X",
              "Micro Four Thirds",
              "Leica M",
              "Pentax K",
              "Olympus/Panasonic",
              "Universal",
              "Fixed Lens"
            ]
          },
          "ui_config": {
            "placeholder": "Select mount type",
            "help_text": "Lens mount or camera mount compatibility"
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
            "help_text": "Include key features, specifications, and use cases"
          }
        }
      ]
    },
    {
      "title": "Technical Specifications",
      "order": 2,
      "description": "Detailed technical specifications based on device type",
      "is_collapsible": true,
      "fields": [
        {
          "name": "sensor_type",
          "label": "Sensor Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Full Frame CMOS",
              "APS-C CMOS",
              "Micro Four Thirds",
              "1-inch CMOS",
              "1/2.3-inch CMOS",
              "Medium Format",
              "CCD",
              "No Sensor (Lens)"
            ]
          },
          "ui_config": {
            "help_text": "Image sensor type and size"
          }
        },
        {
          "name": "megapixels",
          "label": "Megapixels",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 100
          },
          "ui_config": {
            "placeholder": "Enter megapixel count (e.g., 45.7)",
            "help_text": "Effective megapixels of the camera sensor"
          }
        },
        {
          "name": "lens_focal_length",
          "label": "Focal Length",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?(-\\d+(\\.\\d+)?)?\\s*mm$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 24-70mm, 50mm",
            "help_text": "Lens focal length range or fixed focal length"
          }
        },
        {
          "name": "maximum_aperture",
          "label": "Maximum Aperture",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^f/\\d+(\\.\\d+)?(-f/\\d+(\\.\\d+)?)?$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., f/2.8, f/1.4-2.8",
            "help_text": "Maximum aperture range of the lens"
          }
        },
        {
          "name": "iso_range",
          "label": "ISO Range",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(-\\d+)?$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 100-51200, 50-102400",
            "help_text": "Native ISO sensitivity range"
          }
        },
        {
          "name": "shutter_speed",
          "label": "Shutter Speed Range",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 50
          },
          "ui_config": {
            "placeholder": "e.g., 1/8000 to 30 sec",
            "help_text": "Minimum and maximum shutter speeds"
          }
        },
        {
          "name": "video_resolution",
          "label": "Video Resolution",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "4K UHD (3840x2160)",
              "4K DCI (4096x2160)",
              "Full HD (1920x1080)",
              "HD (1280x720)",
              "No Video Capability"
            ]
          },
          "ui_config": {
            "help_text": "Maximum video recording resolution"
          }
        },
        {
          "name": "stabilization",
          "label": "Image Stabilization",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "In-Body Image Stabilization (IBIS)",
              "Lens-Based Stabilization",
              "No Stabilization",
              "Electronic Stabilization"
            ]
          },
          "ui_config": {
            "help_text": "Type of image stabilization system"
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
            "placeholder": "e.g., 138.4 x 97.5 x 88.1 mm",
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
          "name": "power_requirements",
          "label": "Power Requirements",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "e.g., LP-E6NH Battery, USB-C charging",
            "help_text": "Battery type and power specifications"
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
            "help_text": "Include autofocus points, burst rate, or other relevant specs"
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
              "Open Box",
              "Refurbished",
              "Used - Like New",
              "Used - Good",
              "Used - Fair",
              "For Parts"
            ]
          },
          "ui_config": {
            "help_text": "Current physical and functional condition of the equipment"
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
              "Manufacturer Warranty"
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
            "placeholder": "e.g., 2 years, 24 months",
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
          "name": "service_history",
          "label": "Service History",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "Describe any previous repairs or maintenance",
            "help_text": "Document any professional servicing or repairs"
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
              "Photography Studio",
              "Camera Shop"
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
          "name": "technical_expertise",
          "label": "Photography Expertise",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if seller has photography expertise for technical support"
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
              "White Glove Delivery"
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
            "placeholder": "e.g., 2-3 business days, 1 week",
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
            "help_text": "Check if item requires special handling (cameras, lenses)"
          }
        },
        {
          "name": "insurance_included",
          "label": "Shipping Insurance Included",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if shipping insurance is included"
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
              "Bluetooth",
              "GPS",
              "Weather Sealed",
              "Touch Screen",
              "Swivel Screen",
              "Electronic Viewfinder",
              "Optical Viewfinder",
              "4K Video",
              "Slow Motion Video",
              "Time Lapse",
              "HDR",
              "Multiple Card Slots",
              "Dust Reduction",
              "Eye Detection AF",
              "Face Detection",
              "USB Charging",
              "Battery Grip Compatible"
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
              "Camera Body Cap",
              "Lens Hood",
              "Lens Cap",
              "Memory Card",
              "Battery",
              "Charger",
              "Neck Strap",
              "Carrying Case",
              "User Manual",
              "Driver CD",
              "Lens Pouch",
              "UV Filter",
              "Cleaning Kit"
            ]
          },
          "ui_config": {
            "help_text": "Select all items included with the product"
          }
        },
        {
          "name": "software_included",
          "label": "Software Included",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 300
          },
          "ui_config": {
            "placeholder": "List any included software or applications",
            "help_text": "Software, editing tools, or mobile apps that come with the product"
          }
        },
        {
          "name": "certifications",
          "label": "Certifications & Standards",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "CE Certified",
              "FCC Certified",
              "RoHS Compliant",
              "IP Rated",
              "MIL-STD-810G",
              "ISO 9001",
              "UL Listed",
              "Energy Star"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable certifications and compliance standards"
          }
        },
        {
          "name": "compatibility",
          "label": "Compatibility",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Windows",
              "macOS",
              "Linux",
              "Android",
              "iOS",
              "Adobe Lightroom",
              "Adobe Photoshop",
              "Capture One",
              "DxO PhotoLab"
            ]
          },
          "ui_config": {
            "help_text": "Select compatible operating systems and software"
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
              "IP67 Rated",
              "Fire Resistant",
              "Child Safe"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable safety certifications"
          }
        },
        {
          "name": "electromagnetic_compatibility",
          "label": "Electromagnetic Compatibility (EMC)",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if device meets EMC standards"
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
              "BIS Compliant"
            ]
          },
          "ui_config": {
            "help_text": "Legal and regulatory compliance information"
          }
        },
        {
          "name": "import_status",
          "label": "Import Status",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Domestic Product",
              "Authorized Import",
              "Parallel Import",
              "Personal Import",
              "Unknown"
            ]
          },
          "ui_config": {
            "help_text": "Import and customs clearance status"
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
            "help_text": "Upload product demonstration video (optional, max 100MB)"
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
            "help_text": "Upload warranty cards, certificates, test reports, or other relevant documents"
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
          "name": "sample_photos",
          "label": "Sample Photos",
          "type": "file",
          "required": false,
          "validation": {
            "file_types": ["image/jpeg", "image/png", "image/webp"],
            "max_files": 5,
            "max_file_size": 5242880
          },
          "ui_config": {
            "help_text": "Upload sample photos taken with this camera/lens (optional, max 5 images)"
          }
        }
      ]
    }
  ]
}
```