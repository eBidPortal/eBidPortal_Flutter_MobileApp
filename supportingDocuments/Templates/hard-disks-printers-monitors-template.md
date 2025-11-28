# Hard Disks, Printers & Monitors Template

```json
{
  "name": "Hard Disks, Printers & Monitors Template",
  "description": "Industry-level template for hard disks, SSDs, printers, scanners, and monitors with comprehensive specifications and validation rules.",
  "category_type": "hard_disks_printers_monitors",
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
            "placeholder": "Enter product title (e.g., Seagate 2TB Internal Hard Drive)",
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
            "placeholder": "Enter brand name (e.g., Seagate, Western Digital, HP, Dell)",
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
            "placeholder": "Enter model number (e.g., ST2000DM008)",
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
              "Internal Hard Disk Drive",
              "External Hard Disk Drive",
              "Solid State Drive (SSD)",
              "NVMe SSD",
              "SATA SSD",
              "Inkjet Printer",
              "Laser Printer",
              "All-in-One Printer",
              "Dot Matrix Printer",
              "3D Printer",
              "Scanner",
              "LED Monitor",
              "LCD Monitor",
              "OLED Monitor",
              "Gaming Monitor",
              "Touch Screen Monitor",
              "Other"
            ]
          },
          "ui_config": {
            "placeholder": "Select device type",
            "help_text": "Primary category of the hardware device"
          }
        },
        {
          "name": "interface_type",
          "label": "Interface/Connection Type",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "SATA III",
              "SATA II",
              "NVMe PCIe",
              "USB 3.2",
              "USB 3.1",
              "USB 3.0",
              "USB 2.0",
              "Thunderbolt 3",
              "Thunderbolt 4",
              "USB-C",
              "HDMI",
              "DisplayPort",
              "DVI",
              "VGA",
              "Ethernet",
              "Wi-Fi",
              "Bluetooth",
              "Serial",
              "Parallel"
            ]
          },
          "ui_config": {
            "placeholder": "Select primary interface",
            "help_text": "Main connection interface used by the device"
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
          "name": "storage_capacity",
          "label": "Storage Capacity",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*(GB|TB|MB|KB)$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 2TB, 500GB",
            "help_text": "Storage capacity for hard disks and SSDs"
          }
        },
        {
          "name": "storage_type",
          "label": "Storage Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "HDD",
              "SSD",
              "NVMe",
              "SATA",
              "M.2",
              "2.5 inch",
              "3.5 inch",
              "External Enclosure"
            ]
          },
          "ui_config": {
            "help_text": "Type of storage technology"
          }
        },
        {
          "name": "print_technology",
          "label": "Print Technology",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Inkjet",
              "Laser",
              "LED",
              "Dot Matrix",
              "Thermal",
              "3D Printing (FDM)",
              "3D Printing (SLA)",
              "3D Printing (SLS)"
            ]
          },
          "ui_config": {
            "help_text": "Printing technology for printers"
          }
        },
        {
          "name": "print_speed",
          "label": "Print Speed",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*ppm$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 20 ppm",
            "help_text": "Pages per minute for printers"
          }
        },
        {
          "name": "screen_size",
          "label": "Screen Size",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*(inch|inches|in|cm)$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 24 inch",
            "help_text": "Diagonal screen size for monitors"
          }
        },
        {
          "name": "resolution",
          "label": "Resolution",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "HD (1366x768)",
              "Full HD (1920x1080)",
              "Quad HD (2560x1440)",
              "4K UHD (3840x2160)",
              "5K (5120x2880)",
              "8K (7680x4320)",
              "1440p (2560x1440)",
              "1080p (1920x1080)",
              "720p (1280x720)",
              "SVGA (800x600)",
              "XGA (1024x768)",
              "SXGA (1280x1024)",
              "UXGA (1600x1200)"
            ]
          },
          "ui_config": {
            "help_text": "Display resolution for monitors"
          }
        },
        {
          "name": "data_transfer_rate",
          "label": "Data Transfer Rate",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*(MB/s|GB/s|MBps|Gbps)$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 5400 RPM, 500 MB/s",
            "help_text": "Transfer speed or spindle speed"
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
            "placeholder": "e.g., 100 x 60 x 25 mm",
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
            "placeholder": "e.g., 12V DC, 2A",
            "help_text": "Power input specifications and requirements"
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
            "help_text": "Include cache size, buffer, or other relevant specs"
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
            "help_text": "Current physical and functional condition of the device"
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
            "placeholder": "e.g., 3 years, 36 months",
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
          "name": "data_security",
          "label": "Data Security",
          "type": "radio",
          "required": false,
          "validation": {
            "options": [
              "Data Wiped/Secure Erased",
              "Data Intact",
              "Unknown Data Status",
              "Not Applicable"
            ]
          },
          "ui_config": {
            "help_text": "Data security status for storage devices"
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
              "IT Solutions Provider"
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
            "help_text": "Check if seller provides technical support for this product"
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
            "help_text": "Check if item requires special handling (monitors, printers)"
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
              "Hot Swappable",
              "RAID Compatible",
              "Encryption Support",
              "Color Printing",
              "Duplex Printing",
              "Wireless Printing",
              "Network Printing",
              "Cloud Printing",
              "NFC Support",
              "Touch Screen",
              "Adjustable Stand",
              "VESA Mount Compatible",
              "HDR Support",
              "Gaming Features",
              "Blue Light Filter",
              "Anti-Glare Coating",
              "USB Hub",
              "Card Reader",
              "Built-in Speakers"
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
              "USB Cable",
              "Power Adapter",
              "Mounting Hardware",
              "User Manual",
              "Driver CD",
              "Cleaning Kit",
              "Extra Cables",
              "Carrying Case",
              "Stand/Base",
              "Software License",
              "Warranty Card",
              "Quick Start Guide"
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
            "placeholder": "List any included software or drivers",
            "help_text": "Software, drivers, or applications that come with the product"
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
              "Energy Star",
              "TUV Certified",
              "ISO 9001",
              "UL Listed",
              "IP Rated",
              "MIL-STD-810G",
              "EPEAT Certified"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable certifications and compliance standards"
          }
        },
        {
          "name": "compatibility_os",
          "label": "Operating System Compatibility",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Windows 11",
              "Windows 10",
              "Windows 8/8.1",
              "Windows 7",
              "macOS",
              "Linux",
              "Chrome OS",
              "Universal"
            ]
          },
          "ui_config": {
            "help_text": "Select compatible operating systems"
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
          "name": "data_destruction_certified",
          "label": "Data Destruction Certified",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if data has been securely destroyed (for used storage devices)"
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
          "name": "specifications_sheet",
          "label": "Technical Specifications Sheet",
          "type": "file",
          "required": false,
          "validation": {
            "file_types": ["application/pdf"],
            "max_files": 1,
            "max_file_size": 10485760
          },
          "ui_config": {
            "help_text": "Upload detailed technical specifications sheet (PDF, max 10MB)"
          }
        }
      ]
    }
  ]
}
```