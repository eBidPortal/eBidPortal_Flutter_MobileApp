# Mobile Parts & Repairs Template

```json
{
  "name": "Mobile Parts & Repairs",
  "description": "Comprehensive template for mobile phone parts, components, repair services, and accessories with detailed technical specifications, compatibility information, and professional repair standards",
  "category_type": "electronics",
  "is_active": true,
  "sections": [
    {
      "title": "Basic Information",
      "order": 1,
      "description": "Essential mobile part or repair service details and identification",
      "is_collapsible": false,
      "fields": [
        {
          "name": "service_type",
          "label": "Service Type",
          "type": "select",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please select the service type"
          },
          "ui_config": {
            "placeholder": "Select service type",
            "options": [
              "Mobile Parts", "Repair Service", "Screen Replacement", "Battery Replacement", "Charging Port Repair", "Camera Repair", "Speaker/Microphone Repair", "Motherboard Repair", "Water Damage Repair", "Software Repair", "Diagnostic Service", "Other"
            ]
          }
        },
        {
          "name": "part_category",
          "label": "Part Category",
          "type": "select",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please select the part category"
          },
          "ui_config": {
            "placeholder": "Select part category",
            "options": [
              "Display & Screen", "Battery & Power", "Camera & Lens", "Audio & Speaker", "Charging & Ports", "Motherboard & Logic", "Housing & Frame", "Buttons & Sensors", "Antenna & Connectivity", "Internal Components", "Repair Tools", "Other"
            ]
          }
        },
        {
          "name": "brand",
          "label": "Device Brand",
          "type": "select",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please select the device brand"
          },
          "ui_config": {
            "placeholder": "Select device brand",
            "options": [
              "Apple", "Samsung", "Google", "OnePlus", "Xiaomi", "Oppo", "Vivo", "Realme", "Huawei", "Sony", "LG", "Motorola", "Nokia", "Asus", "Lenovo", "Other"
            ]
          }
        },
        {
          "name": "model_compatibility",
          "label": "Compatible Models",
          "type": "text",
          "required": true,
          "validation": {
            "rules": ["required", "min_length:2", "max_length:200"],
            "custom_message": "Compatible models must be 2-200 characters"
          },
          "ui_config": {
            "placeholder": "e.g., iPhone 12, 13, 14 series, Galaxy S21, S22, S23"
          }
        },
        {
          "name": "part_name",
          "label": "Part/Service Name",
          "type": "text",
          "required": true,
          "validation": {
            "rules": ["required", "min_length:2", "max_length:100"],
            "custom_message": "Part/service name must be 2-100 characters"
          },
          "ui_config": {
            "placeholder": "e.g., OLED Display Assembly, Li-ion Battery 4000mAh, Charging Flex Cable"
          }
        },
        {
          "name": "part_number",
          "label": "Part Number/OEM Code",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:50"],
            "custom_message": "Part number cannot exceed 50 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 821-00123-A0, GH82-12345-A"
          }
        },
        {
          "name": "quality_grade",
          "label": "Quality Grade",
          "type": "select",
          "required": true,
          "validation": {
            "rules": ["required"],
            "custom_message": "Please select the quality grade"
          },
          "ui_config": {
            "placeholder": "Select quality grade",
            "options": [
              "Original OEM", "Genuine Replacement", "Aftermarket Premium", "Aftermarket Standard", "Refurbished OEM", "Used/Recycled", "Generic"
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
          "name": "specifications",
          "label": "Technical Specifications",
          "type": "textarea",
          "required": false,
          "validation": {
            "rules": ["max_length:1000"],
            "custom_message": "Specifications cannot exceed 1000 characters"
          },
          "ui_config": {
            "placeholder": "Detailed technical specs, dimensions, materials, compatibility details...",
            "rows": 4
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
            "placeholder": "e.g., 150 x 70 x 8 mm, 6.1 x 3.1 x 0.3 inches"
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
            "placeholder": "e.g., 45 grams, 1.6 oz"
          }
        },
        {
          "name": "material_composition",
          "label": "Material Composition",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:200"],
            "custom_message": "Material composition cannot exceed 200 characters"
          },
          "ui_config": {
            "placeholder": "e.g., Aluminum alloy frame, Gorilla Glass 5, Lithium-ion cells"
          }
        },
        {
          "name": "electrical_specs",
          "label": "Electrical Specifications",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:200"],
            "custom_message": "Electrical specs cannot exceed 200 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 3.7V 4000mAh, 20V 3A charging, 1080p resolution"
          }
        },
        {
          "name": "connector_types",
          "label": "Connector Types",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "Lightning", "USB-C", "USB-A", "Pogo Pins", "ZIF Connectors", "Solder Points", "Press Fit", "Proprietary Connectors"
            ]
          }
        },
        {
          "name": "repair_difficulty",
          "label": "Repair Difficulty Level",
          "type": "select",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "placeholder": "Select repair difficulty",
            "options": [
              "Beginner", "Intermediate", "Advanced", "Professional Only", "Requires Specialized Equipment"
            ]
          }
        },
        {
          "name": "estimated_repair_time",
          "label": "Estimated Repair Time",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:50"],
            "custom_message": "Repair time cannot exceed 50 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 30-45 minutes, 2-3 hours, 1-2 days"
          }
        },
        {
          "name": "tools_required",
          "label": "Tools Required",
          "type": "textarea",
          "required": false,
          "validation": {
            "rules": ["max_length:300"],
            "custom_message": "Tools required cannot exceed 300 characters"
          },
          "ui_config": {
            "placeholder": "List tools needed for installation/repair...",
            "rows": 2
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
            "placeholder": "Describe any wear, damage, or testing performed...",
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
              "Visual Inspection", "Electrical Testing", "Compatibility Testing", "Fit Testing", "Performance Testing", "Burn-in Testing", "All Functions Working"
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
          "name": "warranty_period",
          "label": "Warranty Period",
          "type": "text",
          "required": false,
          "validation": {
            "rules": ["max_length:50"],
            "custom_message": "Warranty period cannot exceed 50 characters"
          },
          "ui_config": {
            "placeholder": "e.g., 6 months, 1 year, 2 years"
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
          "name": "compatibility_images",
          "label": "Compatibility/Model Images",
          "type": "file",
          "required": false,
          "validation": {
            "rules": ["file_type:image", "max_size:5MB", "max_files:5"],
            "custom_message": "Upload up to 5 compatibility images (max 5MB each)"
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
              "Individual", "Authorized Dealer", "Retail Store", "Online Seller", "Manufacturer", "Refurbisher", "Repair Shop", "Wholesaler", "Other"
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
          "name": "certifications",
          "label": "Repair Certifications",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "Authorized Service Center", "Certified Technician", "Apple Certified", "Samsung Certified", "Google Certified", "Microsoft Certified", "ISO Certified"
            ]
          }
        },
        {
          "name": "experience_years",
          "label": "Years of Experience",
          "type": "number",
          "required": false,
          "validation": {
            "rules": ["min:0", "max:50"],
            "custom_message": "Experience years must be between 0 and 50"
          },
          "ui_config": {
            "placeholder": "Years of repair experience"
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
          "name": "repair_standards",
          "label": "Repair Standards",
          "type": "checkbox",
          "required": false,
          "validation": {
            "rules": [],
            "custom_message": ""
          },
          "ui_config": {
            "options": [
              "Industry Standard Repair", "OEM Specifications", "Quality Assurance Tested", "Performance Verified", "Safety Certified", "Data Protection", "Privacy Compliant"
            ]
          }
        },
        {
          "name": "usage_instructions",
          "label": "Installation/Usage Instructions",
          "type": "textarea",
          "required": false,
          "validation": {
            "rules": ["max_length:500"],
            "custom_message": "Instructions cannot exceed 500 characters"
          },
          "ui_config": {
            "placeholder": "Any special installation or usage instructions...",
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
            "custom_message": "Compatible accessories cannot exceed 300 characters"
          },
          "ui_config": {
            "placeholder": "List recommended or compatible accessories...",
            "rows": 2
          }
        },
        {
          "name": "additional_services",
          "label": "Additional Services Offered",
          "type": "textarea",
          "required": false,
          "validation": {
            "rules": ["max_length:300"],
            "custom_message": "Additional services cannot exceed 300 characters"
          },
          "ui_config": {
            "placeholder": "Any additional services like data transfer, software setup...",
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
              "CE Certified", "FCC Certified", "RoHS Compliant", "BIS Certified", "WPC Approved", "Safety Standards", "EMI/EMC Compliant", "ISO Certified"
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