# Power Banks & Chargers Template

```json
{
  "name": "Power Banks & Chargers",
  "description": "Comprehensive template for power banks, portable chargers, wall chargers, car chargers, and charging accessories with detailed technical specifications and marketplace features",
  "category_type": "electronics",
  "is_active": true,
  "sections": [
    {
      "title": "Basic Information",
      "order": 1,
      "description": "Essential charger and power bank details and identification",
      "is_collapsible": false,
      "fields": [
        {
          "name": "product_type",
          "label": "Product Type",
          "type": "select",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please select the product type"
          },
          "ui_config": {
            "placeholder": "Select product type",
            "options": [
              "Power Bank", "Wall Charger", "Car Charger", "Wireless Charger", "USB Hub", "Charging Cable", "Charging Station", "Solar Charger", "Battery Pack", "Other"
            ]
          }
        },
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
              "Anker", "Samsung", "Xiaomi", "Realme", "OnePlus", "Belkin", "Sony", "JBL", "Baseus", "UGreen", "Aukey", "RavPower", "Amazon Basics", "Other"
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
            "placeholder": "e.g., PowerCore 10000, SuperVOOC 65W, Wireless Charging Pad"
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
            "placeholder": "e.g., A1269, PB10000, QC3.0"
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
              "Black", "White", "Silver", "Gold", "Blue", "Red", "Green", "Gray", "Pink", "Purple", "Orange", "Rose Gold", "Transparent", "Other"
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
            "custom_message": "Compatibility information cannot exceed 200 characters"
          },
          "ui_config": {
            "placeholder": "e.g., iPhone, Android, Universal USB-C"
          }
        },
        {
          "name": "connector_type",
          "label": "Connector Type",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "USB-A", "USB-C", "Lightning", "Micro USB", "Mini USB", "Wireless", "Proprietary"
            ]
          }
        }
      ]
    },
    {
      "title": "Technical Specifications",
      "order": 2,
      "description": "Detailed specifications and technical details",
      "is_collapsible": true,
      "fields": [
        {
          "name": "capacity",
          "label": "Battery Capacity",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:50"],
            "custom_message": "Capacity cannot exceed 50 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 10000mAh, 65W, 15W Wireless"
          }
        },
        {
          "name": "output_power",
          "label": "Output Power",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:100"],
            "custom_message": "Output power cannot exceed 100 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 18W USB-C, 22.5W USB-A, 15W Wireless"
          }
        },
        {
          "name": "input_power",
          "label": "Input Power",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:100"],
            "custom_message": "Input power cannot exceed 100 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 18W USB-C, 65W SuperVOOC"
          }
        },
        {
          "name": "charging_standards",
          "label": "Charging Standards",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "USB PD", "Quick Charge 3.0", "Quick Charge 4+", "SuperVOOC", "VOOC", "Warp Charge", "Dash Charge", "Pump Express", "Adaptive Fast Charging", "Wireless Qi", "Magnetic Wireless"
            ]
          }
        },
        {
          "name": "battery_type",
          "label": "Battery Type",
          "type": "select",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "placeholder": "Select battery type",
            "options": [
              "Lithium-ion", "Lithium-polymer", "Nickel-metal hydride", "Alkaline", "Solar-powered", "AC-powered", "DC-powered"
            ]
          }
        },
        {
          "name": "dimensions",
          "label": "Dimensions (L x W x H)",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:50"],
            "custom_message": "Dimensions cannot exceed 50 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 15 x 7 x 1.5 cm, 6 x 3 x 0.6 inches"
          }
        },
        {
          "name": "weight",
          "label": "Weight",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:30"],
            "custom_message": "Weight cannot exceed 30 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 200 grams, 7 oz"
          }
        },
        {
          "name": "ports",
          "label": "Number of Ports/Outputs",
          "type": "number",
          "required": false,
          "validation": {
            "rules": ["min:1", "max:10"],
            "custom_message": "Number of ports must be between 1 and 10"
          },
          "ui_config": {
            "placeholder": "Number of charging ports"
          }
        },
        {
          "name": "cable_length",
          "label": "Cable Length (if applicable)",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:30"],
            "custom_message": "Cable length cannot exceed 30 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 1.2m, 6ft, 2m braided"
          }
        },
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
              "Fast Charging", "Wireless Charging", "Multi-device Charging", "LED Indicators", "Overcharge Protection", "Short Circuit Protection", "Temperature Control", "Smart Charging", "Foldable Design", "Solar Charging", "Car Mount", "Wall Mount", "Magnetic Attachment"
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
            "custom_message": "Please select the condition"
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
              "Power Output Verified", "Charging Speed Tested", "Cable Integrity", "Connector Fit", "LED Indicators Working", "Safety Features", "Compatibility Verified", "All Ports Working"
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
      "title": "Additional Features",
      "order": 8,
      "description": "Special features and additional product information",
      "is_collapsible": true,
      "fields": [
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
              "Recyclable Materials", "Biodegradable", "Sustainable Sourcing", "Reduced Packaging", "Carbon Neutral", "Plastic-Free"
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
              "CE Certified", "FCC Certified", "RoHS Compliant", "Energy Star", "UL Listed", "MFi Certified", "BIS Certified", "WPC Approved", "PSE Certified"
            ]
          }
        },
        {
          "name": "usage_recommendations",
          "label": "Usage Recommendations",
          "type": "textarea",
          "required": false,
          "validation": {
            "rules": ["max_length:300"],
            "custom_message": "Usage recommendations cannot exceed 300 characters"
          },
          "ui_config": {
            "placeholder": "Any special care instructions or usage tips...",
            "rows": 2
          }
        },
        {
          "name": "compatible_devices",
          "label": "Compatible Devices/Models",
          "type": "textarea",
          "required": false,
          "validation": {
            "rules": ["max_length:500"],
            "custom_message": "Compatible devices cannot exceed 500 characters"
          },
          "ui_config": {
            "placeholder": "List specific devices or models this charger works with...",
            "rows": 3
          }
        },
        {
          "name": "additional_accessories",
          "label": "Additional Accessories Included",
          "type": "textarea",
          "required": false,
          "validation": {
            "rules": ["max_length:200"],
            "custom_message": "Additional accessories cannot exceed 200 characters"
          },
          "ui_config": {
            "placeholder": "List any extra items or accessories included...",
            "rows": 2
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
              "China", "India", "USA", "South Korea", "Japan", "Taiwan", "Vietnam", "Thailand", "Malaysia", "Indonesia", "Other"
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
              "BIS Certified", "WPC Approved", "EMI/EMC Compliant", "Safety Standards", "Consumer Protection Compliant", "Battery Safety Standards"
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