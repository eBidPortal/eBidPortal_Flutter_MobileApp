# Smart Watches Template

```json
{
  "name": "Smart Watches",
  "description": "Comprehensive template for smart watches and wearable devices with detailed technical specifications, health monitoring features, connectivity options, and marketplace features",
  "category_type": "electronics",
  "is_active": true,
  "sections": [
    {
      "title": "Basic Information",
      "order": 1,
      "description": "Essential smart watch details and identification",
      "is_collapsible": false,
      "fields": [
        {
          "name": "brand",
          "label": "Brand",
          "type": "select",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please select the brand"
          },
          "ui_config": {
            "placeholder": "Select brand",
            "options": [
              "Apple", "Samsung", "Garmin", "Fitbit", "Huawei", "Xiaomi", "OnePlus", "Google", "Fossil", "TicWatch", "Amazfit", "Withings", "Polar", "Suunto", "Coros", "Other"
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
            "placeholder": "e.g., Apple Watch Series 9, Galaxy Watch 6, Garmin Fenix 7"
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
            "placeholder": "e.g., A2981, SM-R950, 010-02840-00"
          }
        },
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
              "watchOS", "Wear OS", "Proprietary OS", "Tizen", "HarmonyOS", "FreeRTOS", "Other"
            ]
          }
        },
        {
          "name": "color",
          "label": "Color/Variant",
          "type": "select",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please select the color"
          },
          "ui_config": {
            "placeholder": "Select color",
            "options": [
              "Black", "White", "Silver", "Gold", "Rose Gold", "Blue", "Red", "Green", "Gray", "Pink", "Orange", "Purple", "Brown", "Space Gray", "Midnight", "Other"
            ]
          }
        },
        {
          "name": "case_size",
          "label": "Case Size",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:30"],
            "custom_message": "Case size cannot exceed 30 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 45mm, 41mm, 42mm"
          }
        },
        {
          "name": "band_type",
          "label": "Band Type",
          "type": "select",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "placeholder": "Select band type",
            "options": [
              "Silicone", "Leather", "Stainless Steel", "Aluminum", "Titanium", "Nylon", "Fluoroelastomer", "Milanese Loop", "Sport Band", "Link Bracelet", "Other"
            ]
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
          "name": "display_type",
          "label": "Display Type",
          "type": "select",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please select display type"
          },
          "ui_config": {
            "placeholder": "Select display type",
            "options": [
              "AMOLED", "Super AMOLED", "OLED", "LCD", "Retina", "Always-On Retina", "MIP", "Other"
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
            "placeholder": "e.g., 1.9 inches, 45mm"
          }
        },
        {
          "name": "resolution",
          "label": "Display Resolution",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:30"],
            "custom_message": "Resolution cannot exceed 30 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 396 x 484, 450 x 450"
          }
        },
        {
          "name": "processor",
          "label": "Processor/Chipset",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:50"],
            "custom_message": "Processor info cannot exceed 50 characters"
          },
          "ui_config": {
            "placeholder": "e.g., S9 SiP, Snapdragon Wear 4100, Exynos W920"
          }
        },
        {
          "name": "ram_storage",
          "label": "RAM & Storage",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:50"],
            "custom_message": "RAM/Storage cannot exceed 50 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 1GB RAM, 32GB Storage"
          }
        },
        {
          "name": "battery_capacity",
          "label": "Battery Capacity",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:30"],
            "custom_message": "Battery capacity cannot exceed 30 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 308mAh, All-day battery"
          }
        },
        {
          "name": "battery_life",
          "label": "Battery Life",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:100"],
            "custom_message": "Battery life cannot exceed 100 characters"
          },
          "ui_config": {
            "placeholder": "e.g., Up to 18 hours, 40 hours with GPS"
          }
        },
        {
          "name": "charging_type",
          "label": "Charging Type",
          "type": "select",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "placeholder": "Select charging type",
            "options": [
              "Magnetic Charging", "USB-C", "Wireless Charging", "Proprietary Charger", "Solar Charging", "Other"
            ]
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
              "Bluetooth 5.0+", "Wi-Fi", "GPS", "GLONASS", "Galileo", "NFC", "Cellular/LTE", "Wi-Fi Calling", "eSIM"
            ]
          }
        },
        {
          "name": "sensors",
          "label": "Sensors",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "Heart Rate Monitor", "ECG", "Blood Oxygen (SpO2)", "Accelerometer", "Gyroscope", "Compass", "Barometer", "Thermometer", "Ambient Light", "Skin Temperature", "Electrical Heart Sensor", "Multi-frequency GPS"
            ]
          }
        },
        {
          "name": "water_resistance",
          "label": "Water Resistance",
          "type": "select",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "placeholder": "Select water resistance",
            "options": [
              "IPX7", "5ATM", "10ATM", "IP68", "WR50", "Not water resistant", "Swim-proof", "Diving certified"
            ]
          }
        },
        {
          "name": "dimensions_weight",
          "label": "Dimensions & Weight",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:100"],
            "custom_message": "Dimensions/weight cannot exceed 100 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 45 x 38 x 10.7 mm, 38.8 grams"
          }
        }
      ]
    },
    {
      "title": "Health & Fitness Features",
      "order": 3,
      "description": "Health monitoring and fitness tracking capabilities",
      "is_collapsible": true,
      "fields": [
        {
          "name": "health_features",
          "label": "Health Monitoring Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "Heart Rate Monitoring", "ECG/EKG", "Blood Oxygen Monitoring", "Sleep Tracking", "Stress Monitoring", "Respiratory Rate", "Body Temperature", "Skin Temperature", "Menstrual Cycle Tracking", "High/Low Heart Rate Notifications", "Irregular Heart Rhythm Detection", "Fall Detection"
            ]
          }
        },
        {
          "name": "fitness_features",
          "label": "Fitness & Activity Tracking",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "Step Counter", "Calories Burned", "Distance Traveled", "Active Minutes", "Workout Detection", "GPS Tracking", "Pace & Speed", "Elevation Tracking", "Swim Metrics", "Cycling Metrics", "Running Metrics", "HIIT Support", "Custom Workouts"
            ]
          }
        },
        {
          "name": "sports_modes",
          "label": "Sports & Activity Modes",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "Running", "Cycling", "Swimming", "Tennis", "Golf", "Hiking", "Skiing", "Snowboarding", "Surfing", "Yoga", "Pilates", "Weight Training", "Cardio", "Elliptical", "Rowing", "Other Sports"
            ]
          }
        },
        {
          "name": "smart_notifications",
          "label": "Smart Notifications",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "Call Notifications", "Text Messages", "Email Alerts", "Calendar Reminders", "App Notifications", "Weather Updates", "Music Controls", "Smartphone Finder", "Emergency SOS", "Silent Mode"
            ]
          }
        },
        {
          "name": "compatibility",
          "label": "Device Compatibility",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:200"],
            "custom_message": "Compatibility cannot exceed 200 characters"
          },
          "ui_config": {
            "placeholder": "e.g., iPhone 8+, Android 8.0+, iOS 16+"
          }
        }
      ]
    },
    {
      "title": "Condition & Warranty",
      "order": 4,
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
            "custom_message": "Please select the watch condition"
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
              "Power On/Off", "Display Functionality", "Touch Screen", "Sensors Working", "GPS/Location", "Bluetooth/Wi-Fi", "Heart Rate Monitor", "Notifications", "Apps Working", "Charging", "All Features Working"
            ]
          }
        },
        {
          "name": "packaging_condition",
          "label": "Packaging Condition",
          "type": "select",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "placeholder": "Select packaging condition",
            "options": [
              "Original Sealed", "Opened but Complete", "Missing Manual", "No Original Box", "Generic Packaging", "Damaged Packaging"
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
          "name": "return_eligibility",
          "label": "Return Eligibility",
          "type": "select",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "placeholder": "Select return eligibility",
            "options": [
              "Returnable", "Final Sale", "Exchange Only", "Store Credit Only", "Depends on Condition"
            ]
          }
        }
      ]
    },
    {
      "title": "Pricing & Availability",
      "order": 5,
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
            "rules": ["required", "min:1", "max:1000"],
            "custom_message": "Quantity must be between 1 and 1000"
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
          "name": "bulk_pricing",
          "label": "Bulk Pricing Available",
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
      "order": 6,
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
        },
        {
          "name": "usage_images",
          "label": "Usage/Compatibility Images",
          "type": "file",
          "required": false,
          "validation": {
            "rules": ["file_type:image", "max_size:5MB", "max_files:5"],
            "custom_message": "Upload up to 5 usage images (max 5MB each)"
          },
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "max_files": 5
          }
        }
      ]
    },
    {
      "title": "Seller Information",
      "order": 7,
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
              "Individual", "Authorized Dealer", "Retail Store", "Online Seller", "Manufacturer", "Refurbisher", "Wholesaler", "Other"
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
        },
        {
          "name": "authenticity_guarantee",
          "label": "Authenticity Guarantee",
          "type": "boolean",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "label": "Seller provides authenticity guarantee"
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
              "Standard Delivery", "Express Delivery", "Same Day Delivery", "Cash on Delivery", "Pickup Available", "International Shipping"
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
          "name": "package_dimensions",
          "label": "Package Dimensions (L x W x H)",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:50"],
            "custom_message": "Dimensions cannot exceed 50 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 20 x 15 x 5 cm"
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
            "placeholder": "e.g., 200 grams, 0.44 lbs"
          }
        },
        {
          "name": "fragile_item",
          "label": "Fragile Item",
          "type": "boolean",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "label": "Item requires careful handling during shipping"
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
              "China", "USA", "South Korea", "Taiwan", "Japan", "Vietnam", "Thailand", "Malaysia", "Indonesia", "Other"
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
              "CE Certified", "FCC Certified", "RoHS Compliant", "IP Rated", "BIS Certified", "WPC Approved", "Medical Device Certified", "FDA Approved", "ISO Standards"
            ]
          }
        },
        {
          "name": "safety_warnings",
          "label": "Safety Warnings",
          "type": "textarea",
          "required": false,
          "validation": {
            "rules": ["max_length:300"],
            "custom_message": "Safety warnings cannot exceed 300 characters"
          },
          "ui_config": {
            "placeholder": "Any safety warnings or precautions...",
            "rows": 2
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