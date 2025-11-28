# Tablets Template

```json
{
  "name": "Tablets",
  "description": "Comprehensive template for tablets, iPads, and slate computers with detailed specifications, condition assessment, and marketplace features",
  "category_type": "electronics",
  "is_active": true,
  "sections": [
    {
      "title": "Basic Information",
      "order": 1,
      "description": "Essential tablet details and identification",
      "is_collapsible": false,
      "fields": [
        {
          "name": "brand",
          "label": "Brand",
          "type": "select",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please select the tablet brand"
          },
          "ui_config": {
            "placeholder": "Select brand",
            "options": [
              "Apple", "Samsung", "Google", "Amazon", "Microsoft", "Lenovo", "Huawei", "ASUS", "Sony", "Acer", "HP", "Dell", "Other"
            ]
          }
        },
        {
          "name": "model",
          "label": "Model Name",
          "type": "text",
          "required": true,
          "validation": {
            "rules": ["required", "min_length:2", "max_length:100"],
            "custom_message": "Model name must be 2-100 characters"
          },
          "ui_config": {
            "placeholder": "e.g., iPad Pro 12.9\", Galaxy Tab S9, Surface Pro"
          }
        },
        {
          "name": "model_number",
          "label": "Model Number/SKU",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:50"],
            "custom_message": "Model number cannot exceed 50 characters"
          },
          "ui_config": {
            "placeholder": "e.g., A2436, SM-X810, 1769"
          }
        },
        {
          "name": "color",
          "label": "Color/Variant",
          "type": "select",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please select the tablet color"
          },
          "ui_config": {
            "placeholder": "Select color",
            "options": [
              "Black", "White", "Silver", "Gold", "Rose Gold", "Blue", "Green", "Purple", "Red", "Gray", "Space Gray", "Midnight", "Starlight", "Graphite", "Platinum", "Other"
            ]
          }
        },
        {
          "name": "storage_capacity",
          "label": "Storage Capacity",
          "type": "select",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please select storage capacity"
          },
          "ui_config": {
            "placeholder": "Select storage",
            "options": [
              "32GB", "64GB", "128GB", "256GB", "512GB", "1TB", "2TB", "Other"
            ]
          }
        },
        {
          "name": "cellular_connectivity",
          "label": "Cellular Connectivity",
          "type": "select",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "placeholder": "Select cellular option",
            "options": [
              "Wi-Fi Only", "Wi-Fi + Cellular", "Unknown"
            ]
          }
        },
        {
          "name": "release_year",
          "label": "Release Year",
          "type": "number",
          "required": false,
          "validation": {
            "rules": ["min:2000", "max:2026"],
            "custom_message": "Release year must be between 2000 and 2026"
          },
          "ui_config": {
            "placeholder": "e.g., 2024"
          }
        }
      ]
    },
    {
      "title": "Technical Specifications",
      "order": 2,
      "description": "Detailed hardware and software specifications",
      "is_collapsible": true,
      "fields": [
        {
          "name": "operating_system",
          "label": "Operating System",
          "type": "select",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please select the operating system"
          },
          "ui_config": {
            "placeholder": "Select OS",
            "options": [
              "iPadOS", "Android", "Windows", "HarmonyOS", "Other"
            ]
          }
        },
        {
          "name": "os_version",
          "label": "OS Version",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:20"],
            "custom_message": "OS version cannot exceed 20 characters"
          },
          "ui_config": {
            "placeholder": "e.g., iPadOS 17.2, Android 14"
          }
        },
        {
          "name": "processor",
          "label": "Processor/Chipset",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:100"],
            "custom_message": "Processor name cannot exceed 100 characters"
          },
          "ui_config": {
            "placeholder": "e.g., M2 chip, Snapdragon 8 Gen 3, Intel Core i5"
          }
        },
        {
          "name": "ram",
          "label": "RAM",
          "type": "select",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "placeholder": "Select RAM",
            "options": [
              "4GB", "6GB", "8GB", "12GB", "16GB", "24GB", "32GB", "Other"
            ]
          }
        },
        {
          "name": "display_size",
          "label": "Display Size",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:20"],
            "custom_message": "Display size cannot exceed 20 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 12.9 inches, 11 inches, 10.9 inches"
          }
        },
        {
          "name": "display_type",
          "label": "Display Type",
          "type": "select",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "placeholder": "Select display type",
            "options": [
              "Liquid Retina XDR", "Liquid Retina", "Tandem OLED", "AMOLED", "IPS LCD", "TFT LCD", "Other"
            ]
          }
        },
        {
          "name": "resolution",
          "label": "Display Resolution",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:20"],
            "custom_message": "Resolution cannot exceed 20 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 2732 x 2048, 2360 x 1640"
          }
        },
        {
          "name": "refresh_rate",
          "label": "Refresh Rate",
          "type": "select",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "placeholder": "Select refresh rate",
            "options": [
              "60Hz", "90Hz", "120Hz", "144Hz", "Variable (ProMotion)", "Other"
            ]
          }
        },
        {
          "name": "camera_front",
          "label": "Front Camera",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:50"],
            "custom_message": "Front camera specs cannot exceed 50 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 12MP Ultra Wide, 8MP"
          }
        },
        {
          "name": "camera_rear",
          "label": "Rear Camera",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:50"],
            "custom_message": "Rear camera specs cannot exceed 50 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 12MP Wide, 10MP + 12MP"
          }
        },
        {
          "name": "battery_capacity",
          "label": "Battery Capacity",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:20"],
            "custom_message": "Battery capacity cannot exceed 20 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 40.88Wh, 9720 mAh"
          }
        },
        {
          "name": "battery_life",
          "label": "Battery Life",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:50"],
            "custom_message": "Battery life cannot exceed 50 characters"
          },
          "ui_config": {
            "placeholder": "e.g., Up to 10 hours, All-day battery"
          }
        },
        {
          "name": "charging_speed",
          "label": "Charging Speed",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:50"],
            "custom_message": "Charging speed cannot exceed 50 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 27W USB-C, 18W USB-C, Thunderbolt"
          }
        },
        {
          "name": "connectivity",
          "label": "Connectivity Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "Wi-Fi 6", "Wi-Fi 6E", "5G", "4G LTE", "Bluetooth 5.0+", "USB-C", "Thunderbolt", "NFC", "GPS", "GLONASS", "BeiDou", "HDMI", "SD Card Slot"
            ]
          }
        },
        {
          "name": "biometric_security",
          "label": "Biometric Security",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "Face ID", "Touch ID", "Fingerprint", "Iris Scanner"
            ]
          }
        },
        {
          "name": "audio_features",
          "label": "Audio Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "Four Speaker Audio", "Dolby Atmos", "Spatial Audio", "3.5mm Headphone Jack", "Microphone Array", "Noise Cancellation"
            ]
          }
        }
      ]
    },
    {
      "title": "Condition & Warranty",
      "order": 3,
      "description": "Physical condition, functionality, and warranty information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "condition",
          "label": "Overall Condition",
          "type": "select",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please select the tablet condition"
          },
          "ui_config": {
            "placeholder": "Select condition",
            "options": [
              "New (Sealed)", "New (Open Box)", "Excellent", "Very Good", "Good", "Fair", "Poor", "For Parts/Repair"
            ]
          }
        },
        {
          "name": "condition_details",
          "label": "Condition Details",
          "type": "textarea",
          "required": false,
          "validation": {
            "rules": ["max_length:1000"],
            "custom_message": "Condition details cannot exceed 1000 characters"
          },
          "ui_config": {
            "placeholder": "Describe any wear, scratches, or issues...",
            "rows": 4
          }
        },
        {
          "name": "screen_condition",
          "label": "Screen Condition",
          "type": "select",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "placeholder": "Select screen condition",
            "options": [
              "Perfect", "Minor scratches", "Major scratches", "Cracked", "Dead pixels", "Unknown"
            ]
          }
        },
        {
          "name": "functionality_tested",
          "label": "Functionality Tested",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "Screen/Touch", "Cameras", "Speakers/Microphone", "Buttons", "Sensors", "Charging", "Wi-Fi/Bluetooth", "Cellular Network", "GPS", "Biometrics", "Stylus Support", "Keyboard Compatibility"
            ]
          }
        },
        {
          "name": "warranty_status",
          "label": "Warranty Status",
          "type": "select",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please select warranty status"
          },
          "ui_config": {
            "placeholder": "Select warranty status",
            "options": [
              "Under Manufacturer Warranty", "Under Seller Warranty", "No Warranty", "Extended Warranty Available", "Unknown"
            ]
          }
        },
        {
          "name": "warranty_expiry",
          "label": "Warranty Expiry Date",
          "type": "date",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "placeholder": "Select expiry date"
          }
        },
        {
          "name": "original_accessories",
          "label": "Original Accessories Included",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "Original Box", "Charger", "USB Cable", "Headphones/Earbuds", "Screen Protector", "Case", "Stylus Pen", "Keyboard", "Documentation", "SIM Card Ejector"
            ]
          }
        },
        {
          "name": "imei_verified",
          "label": "IMEI/Serial Verified",
          "type": "boolean",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "label": "IMEI/Serial number has been verified"
          }
        },
        {
          "name": "serial_number",
          "label": "Serial Number",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:50"],
            "custom_message": "Serial number cannot exceed 50 characters"
          },
          "ui_config": {
            "placeholder": "Device serial number"
          }
        }
      ]
    },
    {
      "title": "Pricing & Availability",
      "order": 4,
      "description": "Pricing information and availability details",
      "is_collapsible": true,
      "fields": [
        {
          "name": "price",
          "label": "Selling Price",
          "type": "number",
          "required": true,
          "validation": {
            "rules": ["required", "min:1"],
            "custom_message": "Price must be greater than 0"
          },
          "ui_config": {
            "placeholder": "Enter price in INR",
            "prefix": "₹"
          }
        },
        {
          "name": "original_price",
          "label": "Original Market Price",
          "type": "number",
          "required": false,
          "validation": {
            "rules": ["min:1"],
            "custom_message": "Original price must be greater than 0"
          },
          "ui_config": {
            "placeholder": "MRP or original price",
            "prefix": "₹"
          }
        },
        {
          "name": "currency",
          "label": "Currency",
          "type": "select",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please select currency"
          },
          "ui_config": {
            "placeholder": "Select currency",
            "options": ["INR", "USD", "EUR", "GBP"]
          }
        },
        {
          "name": "quantity_available",
          "label": "Quantity Available",
          "type": "number",
          "required": true,
          "validation": {
            "rules": ["required", "min:1", "max:100"],
            "custom_message": "Quantity must be between 1 and 100"
          },
          "ui_config": {
            "placeholder": "Number of units available"
          }
        },
        {
          "name": "price_negotiable",
          "label": "Price Negotiable",
          "type": "boolean",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "label": "Open to price negotiation"
          }
        },
        {
          "name": "bulk_discount",
          "label": "Bulk Purchase Discount",
          "type": "boolean",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "label": "Bulk purchase discounts available"
          }
        },
        {
          "name": "availability_date",
          "label": "Available From",
          "type": "date",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "placeholder": "Select availability date"
          }
        }
      ]
    },
    {
      "title": "Images & Media",
      "order": 5,
      "description": "Product images and media assets",
      "is_collapsible": true,
      "fields": [
        {
          "name": "main_image",
          "label": "Main Product Image",
          "type": "file",
          "required": true,
          "validation": {
            "rules": ["required", "file_type:image", "max_size:5MB"],
            "custom_message": "Please upload a main product image (max 5MB)"
          },
          "ui_config": {
            "accept": "image/*",
            "multiple": false,
            "max_files": 1
          }
        },
        {
          "name": "additional_images",
          "label": "Additional Images",
          "type": "file",
          "required": false,
          "validation": {
            "rules": ["file_type:image", "max_size:5MB", "max_files:10"],
            "custom_message": "Upload up to 10 additional images (max 5MB each)"
          },
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "max_files": 10
          }
        },
        {
          "name": "image_descriptions",
          "label": "Image Descriptions",
          "type": "textarea",
          "required": false,
          "validation": {
            "rules": ["max_length:500"],
            "custom_message": "Image descriptions cannot exceed 500 characters"
          },
          "ui_config": {
            "placeholder": "Describe what each image shows...",
            "rows": 3
          }
        },
        {
          "name": "video_demo",
          "label": "Product Demo Video",
          "type": "url",
          "required": false,
          "validation": {
            "rules": ["url"],
            "custom_message": "Please enter a valid video URL"
          },
          "ui_config": {
            "placeholder": "YouTube, Vimeo, or direct video URL"
          }
        }
      ]
    },
    {
      "title": "Seller Information",
      "order": 6,
      "description": "Seller details and contact information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "seller_type",
          "label": "Seller Type",
          "type": "select",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please select seller type"
          },
          "ui_config": {
            "placeholder": "Select seller type",
            "options": [
              "Individual", "Authorized Dealer", "Retail Store", "Online Seller", "Manufacturer", "Refurbisher", "Other"
            ]
          }
        },
        {
          "name": "business_name",
          "label": "Business Name (if applicable)",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:100"],
            "custom_message": "Business name cannot exceed 100 characters"
          },
          "ui_config": {
            "placeholder": "Enter business or store name"
          }
        },
        {
          "name": "seller_rating",
          "label": "Seller Rating",
          "type": "rating",
          "required": false,
          "validation": {
            "rules": ["min:1", "max:5"],
            "custom_message": "Rating must be between 1 and 5"
          },
          "ui_config": {
            "max_rating": 5,
            "allow_half": true
          }
        },
        {
          "name": "return_policy",
          "label": "Return Policy",
          "type": "select",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please select return policy"
          },
          "ui_config": {
            "placeholder": "Select return policy",
            "options": [
              "7 days", "14 days", "30 days", "No returns", "Store credit only", "Exchange only"
            ]
          }
        },
        {
          "name": "customer_support",
          "label": "Customer Support Contact",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:100"],
            "custom_message": "Contact information cannot exceed 100 characters"
          },
          "ui_config": {
            "placeholder": "Phone, email, or support channel"
          }
        }
      ]
    },
    {
      "title": "Shipping & Delivery",
      "order": 7,
      "description": "Shipping options and delivery information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "shipping_available",
          "label": "Shipping Available",
          "type": "boolean",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please specify if shipping is available"
          },
          "ui_config": {
            "label": "Product can be shipped"
          }
        },
        {
          "name": "shipping_cost",
          "label": "Shipping Cost",
          "type": "number",
          "required": false,
          "validation": {
            "rules": ["min:0"],
            "custom_message": "Shipping cost cannot be negative"
          },
          "ui_config": {
            "placeholder": "Cost in INR (0 for free shipping)",
            "prefix": "₹"
          }
        },
        {
          "name": "free_shipping",
          "label": "Free Shipping",
          "type": "boolean",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "label": "Free shipping available"
          }
        },
        {
          "name": "shipping_methods",
          "label": "Shipping Methods",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "Standard Delivery", "Express Delivery", "Same Day Delivery", "Cash on Delivery", "Pickup Available", "White Glove Delivery"
            ]
          }
        },
        {
          "name": "delivery_time",
          "label": "Estimated Delivery Time",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:50"],
            "custom_message": "Delivery time cannot exceed 50 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 2-3 business days, 1 week"
          }
        },
        {
          "name": "international_shipping",
          "label": "International Shipping",
          "type": "boolean",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "label": "Ships internationally"
          }
        },
        {
          "name": "package_dimensions",
          "label": "Package Dimensions (L x W x H)",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:50"],
            "custom_message": "Dimensions cannot exceed 50 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 15 x 10 x 2 cm"
          }
        },
        {
          "name": "package_weight",
          "label": "Package Weight",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:30"],
            "custom_message": "Weight cannot exceed 30 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 1.5 kg, 3.3 lbs"
          }
        }
      ]
    },
    {
      "title": "Additional Features",
      "order": 8,
      "description": "Special features and additional product information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "special_features",
          "label": "Special Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "Apple Pencil Support", "Smart Keyboard Compatible", "Face ID", "Touch ID", "5G Ready", "Wi-Fi 6E", "Thunderbolt Support", "Expandable Storage", "Dual SIM", "eSIM Support", "Military Grade Protection", "Water Resistant", "Stylus Included", "Keyboard Included", "Gaming Optimized", "Professional Creative Tools"
            ]
          }
        },
        {
          "name": "included_apps",
          "label": "Pre-installed Apps/Services",
          "type": "textarea",
          "required": false,
          "validation": {
            "rules": ["max_length:500"],
            "custom_message": "App list cannot exceed 500 characters"
          },
          "ui_config": {
            "placeholder": "List any pre-installed apps or services...",
            "rows": 3
          }
        },
        {
          "name": "compatible_accessories",
          "label": "Compatible Accessories",
          "type": "textarea",
          "required": false,
          "validation": {
            "rules": ["max_length:300"],
            "custom_message": "Accessories list cannot exceed 300 characters"
          },
          "ui_config": {
            "placeholder": "List compatible accessories or recommendations...",
            "rows": 2
          }
        },
        {
          "name": "eco_friendly",
          "label": "Eco-Friendly Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "Recyclable Materials", "Energy Efficient", "Reduced Packaging", "Carbon Neutral", "Sustainable Sourcing"
            ]
          }
        },
        {
          "name": "certifications",
          "label": "Certifications & Standards",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "CE Certified", "FCC Certified", "RoHS Compliant", "Energy Star", "IP68 Rated", "MIL-STD-810G", "SAR Compliant", "UL Listed"
            ]
          }
        },
        {
          "name": "use_case",
          "label": "Primary Use Case",
          "type": "select",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "placeholder": "Select primary use case",
            "options": [
              "General Use", "Business/Productivity", "Creative Work", "Gaming", "Education", "Entertainment", "Note Taking", "Digital Art", "Photography", "Video Editing"
            ]
          }
        }
      ]
    },
    {
      "title": "Compliance & Legal",
      "order": 9,
      "description": "Legal compliance and regulatory information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "country_origin",
          "label": "Country of Origin",
          "type": "select",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "placeholder": "Select country",
            "options": [
              "China", "India", "USA", "South Korea", "Japan", "Taiwan", "Vietnam", "Other"
            ]
          }
        },
        {
          "name": "import_duties",
          "label": "Import Duties Applicable",
          "type": "boolean",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "label": "Buyer responsible for import duties"
          }
        },
        {
          "name": "legal_compliance",
          "label": "Legal Compliance",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "BIS Certified", "WPC Approved", "EMI/EMC Compliant", "Telecom Standards", "Safety Standards", "Accessibility Compliant"
            ]
          }
        },
        {
          "name": "disclaimer",
          "label": "Additional Disclaimer",
          "type": "textarea",
          "required": false,
          "validation": {
            "rules": ["max_length:500"],
            "custom_message": "Disclaimer cannot exceed 500 characters"
          },
          "ui_config": {
            "placeholder": "Any additional legal disclaimers or terms...",
            "rows": 3
          }
        },
        {
          "name": "last_updated",
          "label": "Information Last Updated",
          "type": "date",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "placeholder": "When was this listing last updated"
          }
        }
      ]
    }
  ]
}
```