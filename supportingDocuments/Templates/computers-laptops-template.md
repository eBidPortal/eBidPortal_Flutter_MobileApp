# Computers & Laptops Template

```json
{
  "name": "Computers & Laptops",
  "description": "Comprehensive template for computers, laptops, tablets, desktops, monitors, and computer peripherals with professional specifications and industry standards.",
  "category_type": "electronics",
  "is_active": true,
  "sections": [
    {
      "title": "Basic Information",
      "order": 1,
      "description": "Essential product details and identification",
      "is_collapsible": false,
      "fields": [
        {
          "name": "product_title",
          "label": "Product Title",
          "type": "text",
          "required": true,
          "validation": {
            "min_length": 10,
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "e.g., Apple MacBook Pro 16\" M3 Max, 48GB RAM, 1TB SSD",
            "help_text": "Include brand, model, key specs, and form factor"
          }
        },
        {
          "name": "brand",
          "label": "Brand",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "Apple", "Dell", "HP", "Lenovo", "ASUS", "Acer", "Microsoft", "Samsung",
              "LG", "Sony", "MSI", "Razer", "Alienware", "Mac", "Chromebook", "Other"
            ]
          },
          "ui_config": {
            "allow_custom": true,
            "placeholder": "Select or enter brand"
          }
        },
        {
          "name": "model",
          "label": "Model Number",
          "type": "text",
          "required": true,
          "validation": {
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "e.g., MacBookPro16,1"
          }
        },
        {
          "name": "device_type",
          "label": "Device Type",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "Laptop", "Desktop", "Tablet", "2-in-1 Laptop", "All-in-One PC",
              "Gaming Laptop", "Ultrabook", "Chromebook", "MacBook", "iPad",
              "Monitor", "Keyboard", "Mouse", "Printer", "Router", "External Drive",
              "Graphics Card", "RAM Module", "SSD/HDD", "Power Supply", "Other"
            ]
          },
          "ui_config": {
            "placeholder": "Select device type"
          }
        },
        {
          "name": "product_type",
          "label": "Product Type",
          "type": "radio",
          "required": true,
          "validation": {
            "options": [
              "New (Sealed)", "New (Open Box)", "Refurbished", "Used", "Display Model"
            ]
          },
          "ui_config": {
            "layout": "horizontal"
          }
        }
      ]
    },
    {
      "title": "Technical Specifications",
      "order": 2,
      "description": "Detailed technical specifications and capabilities",
      "is_collapsible": true,
      "fields": [
        {
          "name": "processor",
          "label": "Processor",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Apple M3", "Apple M3 Pro", "Apple M3 Max", "Apple M2", "Apple M2 Pro", "Apple M2 Max",
              "Intel Core i9-13900K", "Intel Core i9-12900K", "Intel Core i7-13700K", "Intel Core i7-12700K",
              "Intel Core i5-13600K", "Intel Core i5-12600K", "Intel Core i3-13100", "Intel Core i3-12100",
              "AMD Ryzen 9 7950X", "AMD Ryzen 9 5900X", "AMD Ryzen 7 7700X", "AMD Ryzen 7 5700X",
              "AMD Ryzen 5 7600X", "AMD Ryzen 5 5600X", "Other"
            ]
          },
          "ui_config": {
            "allow_custom": true,
            "placeholder": "Select or enter processor model"
          }
        },
        {
          "name": "ram_capacity",
          "label": "RAM Capacity",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "4GB", "8GB", "16GB", "32GB", "64GB", "128GB", "256GB", "512GB", "1TB"
            ]
          },
          "ui_config": {
            "placeholder": "Select RAM capacity"
          }
        },
        {
          "name": "ram_type",
          "label": "RAM Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "DDR4", "DDR4 SODIMM", "DDR5", "DDR5 SODIMM", "LPDDR4X", "LPDDR5", "Unified Memory"
            ]
          },
          "ui_config": {
            "placeholder": "Select RAM type"
          }
        },
        {
          "name": "storage_capacity",
          "label": "Storage Capacity",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "128GB", "256GB", "512GB", "1TB", "2TB", "4TB", "8TB", "16TB", "32TB"
            ]
          },
          "ui_config": {
            "placeholder": "Select storage capacity"
          }
        },
        {
          "name": "storage_type",
          "label": "Storage Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "SSD", "NVMe SSD", "SATA SSD", "HDD", "Hybrid SSD", "eMMC", "Flash Storage"
            ]
          },
          "ui_config": {
            "placeholder": "Select storage type"
          }
        },
        {
          "name": "screen_size",
          "label": "Screen Size (inches)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 7,
            "max": 49
          },
          "ui_config": {
            "placeholder": "e.g., 16",
            "suffix": "inches",
            "step": 0.1
          }
        },
        {
          "name": "resolution",
          "label": "Display Resolution",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "1280x720 (HD)", "1366x768 (HD)", "1920x1080 (Full HD)", "1920x1200",
              "2560x1440 (QHD)", "2560x1600", "2880x1800", "3072x1920", "3456x2160",
              "3840x2160 (4K UHD)", "3840x2400", "4096x2160", "5120x2880 (5K)", "7680x4320 (8K)"
            ]
          },
          "ui_config": {
            "placeholder": "Select display resolution"
          }
        },
        {
          "name": "display_type",
          "label": "Display Technology",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "IPS LCD", "TN LCD", "VA LCD", "OLED", "AMOLED", "Mini LED", "Retina",
              "Liquid Retina", "Liquid Retina XDR", "Super Retina", "Touchscreen", "Other"
            ]
          },
          "ui_config": {
            "placeholder": "Select display technology"
          }
        },
        {
          "name": "graphics_card",
          "label": "Graphics Card",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Integrated Graphics", "Intel Iris Xe", "Intel UHD Graphics", "AMD Radeon",
              "NVIDIA GeForce RTX 4090", "NVIDIA GeForce RTX 4080", "NVIDIA GeForce RTX 4070",
              "NVIDIA GeForce RTX 4060", "NVIDIA GeForce RTX 4050", "NVIDIA GeForce RTX 3050",
              "NVIDIA GeForce GTX 1660", "AMD Radeon RX 7900 XTX", "AMD Radeon RX 7800 XT",
              "AMD Radeon RX 7700 XT", "AMD Radeon RX 7600", "Apple M3 GPU", "Apple M2 GPU", "Other"
            ]
          },
          "ui_config": {
            "allow_custom": true,
            "placeholder": "Select or enter graphics card"
          }
        },
        {
          "name": "battery_life",
          "label": "Battery Life (hours)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 24
          },
          "ui_config": {
            "placeholder": "e.g., 18",
            "suffix": "hours",
            "help_text": "Estimated battery life under normal usage"
          }
        }
      ]
    },
    {
      "title": "Hardware Configuration",
      "order": 3,
      "description": "Detailed hardware specifications and connectivity",
      "is_collapsible": true,
      "fields": [
        {
          "name": "operating_system",
          "label": "Operating System",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "macOS Sonoma", "macOS Ventura", "macOS Monterey", "Windows 11 Pro", "Windows 11 Home",
              "Windows 10 Pro", "Windows 10 Home", "Chrome OS", "Linux", "Ubuntu", "FreeDOS", "No OS"
            ]
          },
          "ui_config": {
            "allow_custom": true,
            "placeholder": "Select operating system"
          }
        },
        {
          "name": "ports_connectivity",
          "label": "Ports & Connectivity",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "USB-A", "USB-C", "Thunderbolt 3", "Thunderbolt 4", "HDMI", "DisplayPort",
              "VGA", "Ethernet", "Wi-Fi 6E", "Wi-Fi 6", "Wi-Fi 5", "Bluetooth 5.3",
              "Bluetooth 5.2", "Bluetooth 5.1", "3.5mm Audio Jack", "SD Card Reader",
              "MicroSD Card Reader", "Smart Card Reader", "Fingerprint Reader", "IR Camera"
            ]
          },
          "ui_config": {
            "multiple": true,
            "help_text": "Select all available ports and connectivity options"
          }
        },
        {
          "name": "webcam_resolution",
          "label": "Webcam Resolution",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "720p HD", "1080p Full HD", "4K UHD", "No Webcam"
            ]
          },
          "ui_config": {
            "placeholder": "Select webcam resolution"
          }
        },
        {
          "name": "audio_features",
          "label": "Audio Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Built-in Speakers", "Built-in Microphone", "Dolby Atmos", "DTS:X",
              "Stereo Speakers", "Noise Cancellation", "3.5mm Audio Jack", "Bluetooth Audio"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "keyboard_features",
          "label": "Keyboard Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Backlit Keyboard", "RGB Backlighting", "Numeric Keypad", "Function Row",
              "Touch Bar", "Touch ID", "Fingerprint Reader", "Mechanical Keys", "Membrane Keys"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "weight",
          "label": "Weight (lbs)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.5,
            "max": 50
          },
          "ui_config": {
            "placeholder": "e.g., 4.7",
            "suffix": "lbs",
            "step": 0.1
          }
        },
        {
          "name": "dimensions",
          "label": "Dimensions (inches)",
          "type": "object",
          "required": false,
          "validation": {
            "properties": {
              "length": { "type": "number", "min": 1 },
              "width": { "type": "number", "min": 1 },
              "height": { "type": "number", "min": 1 }
            }
          },
          "ui_config": {
            "fields": [
              { "name": "length", "label": "Length (in)", "type": "number" },
              { "name": "width", "label": "Width (in)", "type": "number" },
              { "name": "height", "label": "Height (in)", "type": "number" }
            ]
          }
        },
        {
          "name": "color_options",
          "label": "Color/Finish",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Space Gray", "Silver", "Gold", "Rose Gold", "Midnight", "Starlight",
              "Blue", "Green", "Red", "Black", "White", "Gray", "Aluminum", "Plastic", "Other"
            ]
          },
          "ui_config": {
            "allow_custom": true,
            "placeholder": "Select or enter color/finish"
          }
        }
      ]
    },
    {
      "title": "Software & Features",
      "order": 4,
      "description": "Software capabilities and special features",
      "is_collapsible": true,
      "fields": [
        {
          "name": "pre_installed_software",
          "label": "Pre-installed Software",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Microsoft Office", "Microsoft 365", "Google Workspace", "Apple iWork",
              "Antivirus Software", "Productivity Suite", "Creative Software", "Gaming Software",
              "Development Tools", "Media Software", "Security Software", "Utility Software"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "special_features",
          "label": "Special Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Touchscreen", "2-in-1 Convertible", "360° Hinge", "Stylus Support",
              "Face Recognition", "Fingerprint Sensor", "IR Camera", "Ambient Light Sensor",
              "Accelerometer", "Gyroscope", "GPS", "NFC", "Thunderbolt 3/4", "USB-C Power Delivery",
              "Fast Charging", "Wireless Charging", "VR Ready", "Gaming Optimized"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "security_features",
          "label": "Security Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "TPM 2.0", "Secure Boot", "BIOS Password", "HDD Password", "Kensington Lock Slot",
              "Smart Card Reader", "Fingerprint Reader", "Face Recognition", "IR Camera",
              "Hardware Encryption", "Self-Encrypting Drive", "Endpoint Security"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "warranty_type",
          "label": "Included Warranty",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Manufacturer Warranty", "Extended Warranty", "Accidental Damage Protection",
              "On-site Service", "Carry-in Service", "Mail-in Service", "International Warranty"
            ]
          },
          "ui_config": {
            "placeholder": "Select included warranty type"
          }
        },
        {
          "name": "support_services",
          "label": "Support Services",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "24/7 Phone Support", "Online Chat Support", "Email Support", "Community Forums",
              "Knowledge Base", "Video Tutorials", "Remote Assistance", "On-site Support"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        }
      ]
    },
    {
      "title": "Condition & Warranty",
      "order": 5,
      "description": "Product condition and warranty information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "condition",
          "label": "Condition",
          "type": "radio",
          "required": true,
          "validation": {
            "options": [
              "New (Sealed)", "New (Open Box)", "Excellent", "Very Good",
              "Good", "Fair", "Poor", "For Parts/Repair"
            ]
          },
          "ui_config": {
            "layout": "vertical"
          }
        },
        {
          "name": "condition_description",
          "label": "Condition Description",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 1000
          },
          "ui_config": {
            "placeholder": "Describe any wear, scratches, or issues",
            "rows": 4
          }
        },
        {
          "name": "warranty_status",
          "label": "Warranty Status",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "Full Manufacturer Warranty", "Partial Warranty Remaining",
              "Extended Warranty Available", "No Warranty", "As-Is"
            ]
          },
          "ui_config": {
            "placeholder": "Select warranty status"
          }
        },
        {
          "name": "warranty_period",
          "label": "Warranty Period (Years)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 10
          },
          "ui_config": {
            "placeholder": "e.g., 1",
            "suffix": "years"
          }
        },
        {
          "name": "original_accessories",
          "label": "Original Accessories Included",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Power Adapter", "Power Cord", "USB Cable", "HDMI Cable", "User Manual",
              "Quick Start Guide", "Driver CDs", "Recovery Media", "Carrying Case",
              "Screen Protector", "Cleaning Cloth", "Stylus Pen", "Docking Station"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "service_history",
          "label": "Service History Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "label": "Service/maintenance records available"
          }
        }
      ]
    },
    {
      "title": "Pricing & Availability",
      "order": 6,
      "description": "Pricing, availability, and auction details",
      "is_collapsible": true,
      "fields": [
        {
          "name": "price",
          "label": "Price (INR)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 1,
            "max": 10000000
          },
          "ui_config": {
            "placeholder": "Enter price in INR",
            "prefix": "₹"
          }
        },
        {
          "name": "currency",
          "label": "Currency",
          "type": "select",
          "required": true,
          "validation": {
            "options": ["INR", "USD", "EUR", "GBP"]
          },
          "ui_config": {
            "default": "INR"
          }
        },
        {
          "name": "price_type",
          "label": "Price Type",
          "type": "radio",
          "required": true,
          "validation": {
            "options": [
              "Fixed Price", "Auction Starting Price", "Best Offer",
              "Make an Offer"
            ]
          },
          "ui_config": {
            "layout": "horizontal"
          }
        },
        {
          "name": "quantity_available",
          "label": "Quantity Available",
          "type": "number",
          "required": true,
          "validation": {
            "min": 1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "e.g., 1",
            "default": 1
          }
        },
        {
          "name": "reserve_price",
          "label": "Reserve Price (INR)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1
          },
          "ui_config": {
            "placeholder": "Optional reserve price",
            "prefix": "₹",
            "help_text": "Minimum price for auction to sell"
          }
        },
        {
          "name": "buy_it_now_price",
          "label": "Buy It Now Price (INR)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1
          },
          "ui_config": {
            "placeholder": "Optional Buy It Now price",
            "prefix": "₹"
          }
        }
      ]
    },
    {
      "title": "Seller Information",
      "order": 7,
      "description": "Seller details and business information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "seller_type",
          "label": "Seller Type",
          "type": "radio",
          "required": true,
          "validation": {
            "options": [
              "Individual", "Computer Store", "Authorized Reseller", "Manufacturer",
              "Refurbisher", "IT Solutions Provider", "Educational Institution"
            ]
          },
          "ui_config": {
            "layout": "horizontal"
          }
        },
        {
          "name": "business_name",
          "label": "Business Name",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "Enter business name if applicable"
          }
        },
        {
          "name": "seller_location",
          "label": "Seller Location",
          "type": "text",
          "required": true,
          "validation": {
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "City, State/Province, Country"
          }
        },
        {
          "name": "seller_rating",
          "label": "Seller Rating",
          "type": "rating",
          "required": false,
          "validation": {
            "min": 1,
            "max": 5
          },
          "ui_config": {
            "max_rating": 5,
            "show_value": true
          }
        },
        {
          "name": "return_policy",
          "label": "Return Policy",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "14 Days Return", "30 Days Return", "No Returns",
              "Store Credit Only", "Exchange Only", "Restocking Fee Applies"
            ]
          },
          "ui_config": {
            "placeholder": "Select return policy"
          }
        },
        {
          "name": "technical_support",
          "label": "Technical Support Offered",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "label": "Seller provides technical support and setup assistance"
          }
        },
        {
          "name": "data_wiping",
          "label": "Data Wiping Service",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "label": "Professional data wiping and privacy protection included"
          }
        }
      ]
    },
    {
      "title": "Shipping & Delivery",
      "order": 8,
      "description": "Shipping options and delivery information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "shipping_type",
          "label": "Shipping Type",
          "type": "radio",
          "required": true,
          "validation": {
            "options": [
              "Free Shipping", "Standard Shipping", "Express Shipping",
              "White Glove Delivery", "Local Pickup Only", "Freight Shipping"
            ]
          },
          "ui_config": {
            "layout": "horizontal"
          }
        },
        {
          "name": "shipping_cost",
          "label": "Shipping Cost (INR)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0
          },
          "ui_config": {
            "placeholder": "Enter shipping cost",
            "prefix": "₹",
            "help_text": "Leave blank for free shipping"
          }
        },
        {
          "name": "estimated_delivery",
          "label": "Estimated Delivery Time",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "1-2 Business Days", "3-5 Business Days", "1-2 Weeks",
              "2-4 Weeks", "4-6 Weeks", "6-8 Weeks", "Local Pickup"
            ]
          },
          "ui_config": {
            "placeholder": "Select delivery time"
          }
        },
        {
          "name": "shipping_weight",
          "label": "Shipping Weight (lbs)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 100
          },
          "ui_config": {
            "placeholder": "e.g., 7.5",
            "suffix": "lbs"
          }
        },
        {
          "name": "packaging_type",
          "label": "Packaging Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Original Manufacturer Packaging", "Generic Packaging",
              "Anti-Static Packaging", "Custom Crating", "Palletized"
            ]
          },
          "ui_config": {
            "placeholder": "Select packaging type"
          }
        },
        {
          "name": "insurance_included",
          "label": "Shipping Insurance Included",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "label": "Shipping insurance for damage protection included"
          }
        },
        {
          "name": "international_shipping",
          "label": "International Shipping",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "label": "Available for international shipping"
          }
        }
      ]
    },
    {
      "title": "Compliance & Documentation",
      "order": 9,
      "description": "Regulatory compliance and documentation",
      "is_collapsible": true,
      "fields": [
        {
          "name": "serial_number",
          "label": "Serial Number",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "Enter serial number if available"
          }
        },
        {
          "name": "manufacture_date",
          "label": "Manufacture Date",
          "type": "date",
          "required": false,
          "ui_config": {
            "placeholder": "Select manufacture date"
          }
        },
        {
          "name": "purchase_date",
          "label": "Original Purchase Date",
          "type": "date",
          "required": false,
          "ui_config": {
            "placeholder": "Select original purchase date"
          }
        },
        {
          "name": "receipt_available",
          "label": "Receipt Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "label": "Original receipt available"
          }
        },
        {
          "name": "certifications",
          "label": "Certifications & Standards",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "FCC Certified", "CE Certified", "RoHS Compliant", "Energy Star",
              "UL Listed", "CSA Certified", "TUV Certified", "ISO 9001",
              "Microsoft Certified", "Apple Certified", "EPEAT Registered", "BIS Certified"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "compliance_info",
          "label": "Compliance Information",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "EMI compliance, safety standards, etc.",
            "rows": 3
          }
        },
        {
          "name": "additional_notes",
          "label": "Additional Notes",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 1000
          },
          "ui_config": {
            "placeholder": "Any additional information about the computer",
            "rows": 4
          }
        },
        {
          "name": "product_images",
          "label": "Product Images",
          "type": "file",
          "required": true,
          "validation": {
            "max_files": 15,
            "allowed_types": ["image/jpeg", "image/png", "image/webp"],
            "max_size_mb": 5
          },
          "ui_config": {
            "multiple": true,
            "help_text": "Upload up to 15 high-quality images showing all angles, screen, keyboard, ports, and any wear"
          }
        }
      ]
    }
  ]
}
```