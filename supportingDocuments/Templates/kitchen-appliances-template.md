# Kitchen Appliances Template

```json
{
  "name": "Kitchen Appliances",
  "description": "Comprehensive template for kitchen appliances including refrigerators, ovens, microwaves, dishwashers, blenders, coffee makers, and cooking equipment with professional specifications and industry standards.",
  "category_type": "appliances",
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
            "placeholder": "e.g., Samsung 28 Cu Ft French Door Refrigerator",
            "help_text": "Include brand, capacity/size, and key features"
          }
        },
        {
          "name": "brand",
          "label": "Brand",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "Samsung", "LG", "Whirlpool", "GE", "KitchenAid", "Bosch", "Siemens",
              "Electrolux", "Frigidaire", "Maytag", "Kenmore", "Breville", "Cuisinart",
              "Ninja", "Oster", "Hamilton Beach", "Black+Decker", "Other"
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
            "placeholder": "e.g., RF28R7351SG"
          }
        },
        {
          "name": "appliance_type",
          "label": "Appliance Type",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "Refrigerator", "Freezer", "Washing Machine", "Dryer", "Dishwasher",
              "Oven", "Cooktop", "Range", "Microwave", "Air Fryer", "Blender",
              "Food Processor", "Coffee Maker", "Toaster", "Mixer", "Juicer",
              "Ice Maker", "Wine Cooler", "Trash Compactor", "Other"
            ]
          },
          "ui_config": {
            "placeholder": "Select appliance type"
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
          "name": "capacity",
          "label": "Capacity",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.1,
            "max": 100
          },
          "ui_config": {
            "placeholder": "e.g., 28",
            "suffix": "Cu Ft / Liters",
            "help_text": "Capacity in cubic feet or liters"
          }
        },
        {
          "name": "power_rating",
          "label": "Power Rating",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 10000
          },
          "ui_config": {
            "placeholder": "e.g., 1500",
            "suffix": "Watts",
            "help_text": "Power consumption in watts"
          }
        },
        {
          "name": "voltage",
          "label": "Voltage",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "120V", "220V", "240V", "Dual Voltage (120V/240V)", "Other"
            ]
          },
          "ui_config": {
            "placeholder": "Select voltage requirement"
          }
        },
        {
          "name": "dimensions",
          "label": "Dimensions (inches)",
          "type": "object",
          "required": false,
          "validation": {
            "properties": {
              "height": { "type": "number", "min": 1 },
              "width": { "type": "number", "min": 1 },
              "depth": { "type": "number", "min": 1 }
            }
          },
          "ui_config": {
            "fields": [
              { "name": "height", "label": "Height (in)", "type": "number" },
              { "name": "width", "label": "Width (in)", "type": "number" },
              { "name": "depth", "label": "Depth (in)", "type": "number" }
            ]
          }
        },
        {
          "name": "weight",
          "label": "Weight",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 500
          },
          "ui_config": {
            "placeholder": "e.g., 250",
            "suffix": "lbs / kg",
            "help_text": "Product weight"
          }
        },
        {
          "name": "material",
          "label": "Primary Material",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Stainless Steel", "Plastic", "Glass", "Aluminum", "Ceramic",
              "Cast Iron", "Copper", "Brass", "Wood", "Other"
            ]
          },
          "ui_config": {
            "placeholder": "Select primary material"
          }
        },
        {
          "name": "finish",
          "label": "Finish/Color",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Stainless Steel", "Black", "White", "Silver", "Gray",
              "Red", "Blue", "Green", "Copper", "Bronze", "Other"
            ]
          },
          "ui_config": {
            "allow_custom": true,
            "placeholder": "Select or enter finish/color"
          }
        }
      ]
    },
    {
      "title": "Features & Capabilities",
      "order": 3,
      "description": "Advanced features and functionality",
      "is_collapsible": true,
      "fields": [
        {
          "name": "smart_features",
          "label": "Smart Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Wi-Fi Connected", "Smartphone App Control", "Voice Control",
              "Auto-Replenish", "Energy Monitoring", "Remote Diagnostics",
              "Smart Grid Ready", "Home Automation Integration"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "cooking_features",
          "label": "Cooking Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Convection Cooking", "Air Frying", "Steam Cooking", "Grilling",
              "Broiling", "Baking", "Roasting", "Slow Cooking", "Pressure Cooking",
              "Microwave Cooking", "Toasting", "Warming", "Defrosting"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "refrigeration_features",
          "label": "Refrigeration Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Ice Maker", "Ice Dispenser", "Water Dispenser", "French Doors",
              "Side-by-Side", "Bottom Freezer", "Top Freezer", "Counter-Depth",
              "Adjustable Shelves", "Door-in-Door", "Smart Cooling", "Humidity Control"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "washing_features",
          "label": "Washing/Drying Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Front Load", "Top Load", "High Efficiency", "Steam Cleaning",
              "Sanitize Cycle", "Quick Wash", "Delay Start", "Smart Dispense",
              "Load Sensing", "Wrinkle Prevention", "Multiple Spin Speeds"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "safety_features",
          "label": "Safety Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Child Lock", "Auto Shut-Off", "Overheat Protection", "Leak Detection",
              "Door Lock", "Tamper Resistant", "UL Listed", "Energy Safe"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "control_type",
          "label": "Control Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Digital Touch Controls", "Knob Controls", "Button Controls",
              "Rotary Controls", "Smartphone App", "Voice Control", "Mechanical"
            ]
          },
          "ui_config": {
            "placeholder": "Select control type"
          }
        },
        {
          "name": "noise_level",
          "label": "Noise Level",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Very Quiet (<40 dB)", "Quiet (40-50 dB)", "Moderate (50-60 dB)",
              "Loud (60-70 dB)", "Very Loud (>70 dB)"
            ]
          },
          "ui_config": {
            "placeholder": "Select noise level"
          }
        }
      ]
    },
    {
      "title": "Energy & Performance",
      "order": 4,
      "description": "Energy efficiency and performance ratings",
      "is_collapsible": true,
      "fields": [
        {
          "name": "energy_rating",
          "label": "Energy Rating",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Energy Star Certified", "CEE Tier 1", "CEE Tier 2", "CEE Tier 3",
              "ENERGY STAR Most Efficient", "Not Rated"
            ]
          },
          "ui_config": {
            "placeholder": "Select energy rating"
          }
        },
        {
          "name": "annual_energy_cost",
          "label": "Estimated Annual Energy Cost",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1
          },
          "ui_config": {
            "placeholder": "e.g., 75",
            "prefix": "$",
            "help_text": "Estimated yearly energy cost"
          }
        },
        {
          "name": "energy_consumption",
          "label": "Energy Consumption (kWh/year)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1
          },
          "ui_config": {
            "placeholder": "e.g., 350",
            "suffix": "kWh/year"
          }
        },
        {
          "name": "water_efficiency",
          "label": "Water Efficiency Rating",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "WaterSense Certified", "High Efficiency", "Standard Efficiency",
              "Not Rated"
            ]
          },
          "ui_config": {
            "placeholder": "Select water efficiency rating"
          }
        },
        {
          "name": "performance_rating",
          "label": "Performance Rating",
          "type": "rating",
          "required": false,
          "validation": {
            "min": 1,
            "max": 5
          },
          "ui_config": {
            "max_rating": 5,
            "show_value": true,
            "help_text": "Rate the appliance's performance (1-5 stars)"
          }
        },
        {
          "name": "cycle_times",
          "label": "Typical Cycle Times",
          "type": "object",
          "required": false,
          "validation": {
            "properties": {
              "wash_cycle": { "type": "number", "min": 1 },
              "dry_cycle": { "type": "number", "min": 1 },
              "cooking_time": { "type": "number", "min": 1 }
            }
          },
          "ui_config": {
            "fields": [
              { "name": "wash_cycle", "label": "Wash Cycle (min)", "type": "number" },
              { "name": "dry_cycle", "label": "Dry Cycle (min)", "type": "number" },
              { "name": "cooking_time", "label": "Cooking Time (min)", "type": "number" }
            ]
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
            "placeholder": "Describe any wear, damage, or imperfections",
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
            "max": 20
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
              "Power Cord", "User Manual", "Installation Kit", "Water Line",
              "Drain Hose", "Ice Maker Kit", "Filter", "Remote Control",
              "Baking Pans", "Utensils", "Original Box", "Quick Start Guide"
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
        },
        {
          "name": "installation_included",
          "label": "Installation Included",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "label": "Professional installation included in price"
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
              "Individual", "Appliance Store", "Authorized Dealer",
              "Manufacturer", "Liquidator", "Home Improvement Store"
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
          "name": "delivery_service",
          "label": "Delivery Service Offered",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "label": "White glove delivery service available"
          }
        },
        {
          "name": "removal_service",
          "label": "Old Appliance Removal",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "label": "Old appliance removal and disposal service available"
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
            "max": 1000
          },
          "ui_config": {
            "placeholder": "e.g., 150",
            "suffix": "lbs"
          }
        },
        {
          "name": "shipping_dimensions",
          "label": "Shipping Dimensions (inches)",
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
          "name": "curbside_delivery",
          "label": "Curbside Delivery",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "label": "Curbside delivery available (no inside delivery)"
          }
        },
        {
          "name": "threshold_delivery",
          "label": "Threshold Delivery",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "label": "Delivery to doorway/front door included"
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
              "UL Listed", "CSA Certified", "CE Certified", "FCC Certified",
              "Energy Star", "WaterSense", "NSF Certified", "AHAM Certified",
              "ETL Listed", "BIS Certified", "ISI Marked"
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
            "placeholder": "Safety standards, electrical compliance, etc.",
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
            "placeholder": "Any additional information about the appliance",
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
            "help_text": "Upload up to 15 high-quality images showing all angles, interior, controls, and any wear"
          }
        }
      ]
    }
  ]
}
```