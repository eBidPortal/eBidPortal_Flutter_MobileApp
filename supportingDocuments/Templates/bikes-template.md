# Professional Bikes Template for eBidPortal

**Template Name:** Bikes Template
**Version:** 1.0
**Category Type:** bikes
**Created:** November 20, 2025
**Industry Standards:** Based on automotive and bicycle industry standards, road safety regulations, and vehicle registration norms

## Template JSON Structure

```json
{
  "name": "Bikes Template",
  "description": "Comprehensive template for motorcycles, scooters, and bicycles. Includes detailed specifications, safety features, regulatory compliance, and performance metrics for all bike categories.",
  "category_type": "bikes",
  "is_active": true,
  "sections": [
    {
      "title": "Bike Information",
      "order": 1,
      "description": "Basic bike identification and classification details",
      "is_collapsible": false,
      "fields": [
        {
          "name": "listing_title",
          "label": "Listing Title",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:10", "max_length:100"],
          "ui_config": {
            "placeholder": "e.g., 2023 Royal Enfield Classic 350 - Excellent Condition",
            "helpText": "Create an attractive title highlighting key specifications and condition"
          }
        },
        {
          "name": "bike_category",
          "label": "Bike Category",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "motorcycle", "label": "Motorcycle"},
              {"value": "scooter", "label": "Scooter"},
              {"value": "bicycle", "label": "Bicycle"}
            ],
            "placeholder": "Select bike category"
          }
        },
        {
          "name": "bike_type",
          "label": "Specific Bike Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "cruiser", "label": "Cruiser Motorcycle"},
              {"value": "sports", "label": "Sports Motorcycle"},
              {"value": "touring", "label": "Touring Motorcycle"},
              {"value": "standard", "label": "Standard Motorcycle"},
              {"value": "off_road", "label": "Off-Road Motorcycle"},
              {"value": "naked", "label": "Naked Motorcycle"},
              {"value": "scooter_100cc", "label": "100cc Scooter"},
              {"value": "scooter_125cc", "label": "125cc Scooter"},
              {"value": "scooter_150cc", "label": "150cc Scooter"},
              {"value": "electric_scooter", "label": "Electric Scooter"},
              {"value": "mountain_bike", "label": "Mountain Bike"},
              {"value": "road_bike", "label": "Road Bike"},
              {"value": "hybrid_bike", "label": "Hybrid Bike"},
              {"value": "folding_bike", "label": "Folding Bike"},
              {"value": "electric_bike", "label": "Electric Bike"},
              {"value": "kids_bike", "label": "Kids Bike"}
            ],
            "placeholder": "Select specific bike type"
          }
        },
        {
          "name": "condition",
          "label": "Bike Condition",
          "type": "radio",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "new", "label": "Brand New"},
              {"value": "excellent", "label": "Excellent"},
              {"value": "very_good", "label": "Very Good"},
              {"value": "good", "label": "Good"},
              {"value": "fair", "label": "Fair"},
              {"value": "needs_repair", "label": "Needs Repair"},
              {"value": "parts_only", "label": "Parts Only"}
            ]
          }
        },
        {
          "name": "price",
          "label": "Price (INR)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:5000", "max:5000000"],
          "ui_config": {
            "step": 1000,
            "prefix": "₹",
            "suffix": "INR",
            "helpText": "Enter the selling price in Indian Rupees"
          }
        },
        {
          "name": "negotiable",
          "label": "Price Negotiable",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "defaultValue": true
          }
        }
      ]
    },
    {
      "title": "Bike Specifications",
      "order": 2,
      "description": "Detailed technical specifications and performance details",
      "is_collapsible": false,
      "fields": [
        {
          "name": "brand",
          "label": "Brand/Manufacturer",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "royal_enfield", "label": "Royal Enfield"},
              {"value": "bajaj", "label": "Bajaj"},
              {"value": "hero", "label": "Hero"},
              {"value": "honda", "label": "Honda"},
              {"value": "yamaha", "label": "Yamaha"},
              {"value": "suzuki", "label": "Suzuki"},
              {"value": "ktm", "label": "KTM"},
              {"value": "kawasaki", "label": "Kawasaki"},
              {"value": "ducati", "label": "Ducati"},
              {"value": "harley_davidson", "label": "Harley-Davidson"},
              {"value": "tvs", "label": "TVS"},
              {"value": "mahindra", "label": "Mahindra"},
              {"value": "vespa", "label": "Vespa"},
              {"value": "aprilia", "label": "Aprilia"},
              {"value": "trek", "label": "Trek"},
              {"value": "giant", "label": "Giant"},
              {"value": "specialized", "label": "Specialized"},
              {"value": "cannondale", "label": "Cannondale"},
              {"value": "other", "label": "Other"}
            ],
            "placeholder": "Select bike brand"
          }
        },
        {
          "name": "model",
          "label": "Model",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:50"],
          "ui_config": {
            "placeholder": "e.g., Classic 350, Pulsar 150, Apache RTR 160"
          }
        },
        {
          "name": "year_of_manufacture",
          "label": "Year of Manufacture",
          "type": "number",
          "required": true,
          "validation": ["required", "min:1990", "max:2026"],
          "ui_config": {
            "helpText": "Manufacturing year as per registration certificate"
          }
        },
        {
          "name": "engine_type",
          "label": "Engine Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "petrol", "label": "Petrol"},
              {"value": "diesel", "label": "Diesel"},
              {"value": "electric", "label": "Electric"},
              {"value": "hybrid", "label": "Hybrid"},
              {"value": "pedal", "label": "Pedal Power (Bicycle)"}
            ]
          }
        },
        {
          "name": "engine_capacity",
          "label": "Engine Capacity (CC)",
          "type": "number",
          "required": false,
          "validation": ["min:50", "max:2500"],
          "ui_config": {
            "suffix": "CC",
            "helpText": "Engine displacement in cubic centimeters"
          }
        },
        {
          "name": "power_output",
          "label": "Power Output (BHP)",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:300"],
          "ui_config": {
            "step": 0.1,
            "suffix": "BHP",
            "helpText": "Maximum power output in brake horsepower"
          }
        },
        {
          "name": "torque",
          "label": "Torque (Nm)",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:200"],
          "ui_config": {
            "step": 0.1,
            "suffix": "Nm",
            "helpText": "Maximum torque in Newton-meters"
          }
        },
        {
          "name": "transmission",
          "label": "Transmission Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "manual", "label": "Manual"},
              {"value": "automatic", "label": "Automatic"},
              {"value": "semi_automatic", "label": "Semi-Automatic"},
              {"value": "cvt", "label": "CVT"},
              {"value": "single_speed", "label": "Single Speed"},
              {"value": "multi_gear", "label": "Multi-Gear"},
              {"value": "fixed_gear", "label": "Fixed Gear"}
            ]
          }
        },
        {
          "name": "fuel_capacity",
          "label": "Fuel Capacity (Liters)",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:30"],
          "ui_config": {
            "step": 0.5,
            "suffix": "L",
            "helpText": "Fuel tank capacity in liters"
          }
        },
        {
          "name": "battery_capacity",
          "label": "Battery Capacity (kWh)",
          "type": "number",
          "required": false,
          "validation": ["min:0.5", "max:10"],
          "ui_config": {
            "step": 0.1,
            "suffix": "kWh",
            "helpText": "Battery capacity for electric bikes"
          }
        },
        {
          "name": "range",
          "label": "Range (km)",
          "type": "number",
          "required": false,
          "validation": ["min:10", "max:500"],
          "ui_config": {
            "suffix": "km",
            "helpText": "Approximate range per full charge/fuel tank"
          }
        },
        {
          "name": "top_speed",
          "label": "Top Speed (km/h)",
          "type": "number",
          "required": false,
          "validation": ["min:10", "max:350"],
          "ui_config": {
            "suffix": "km/h",
            "helpText": "Maximum speed capability"
          }
        },
        {
          "name": "weight",
          "label": "Weight (kg)",
          "type": "number",
          "required": false,
          "validation": ["min:10", "max:500"],
          "ui_config": {
            "suffix": "kg",
            "helpText": "Total weight including battery/fuel"
          }
        },
        {
          "name": "wheel_size",
          "label": "Wheel Size (inches)",
          "type": "number",
          "required": false,
          "validation": ["min:10", "max:30"],
          "ui_config": {
            "suffix": "inches",
            "helpText": "Wheel diameter in inches"
          }
        }
      ]
    },
    {
      "title": "Usage & Performance",
      "order": 3,
      "description": "Usage history and performance metrics",
      "is_collapsible": false,
      "fields": [
        {
          "name": "mileage",
          "label": "Current Mileage (km)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:200000"],
          "ui_config": {
            "suffix": "km",
            "helpText": "Current odometer reading"
          }
        },
        {
          "name": "average_mileage",
          "label": "Average Mileage (km/l)",
          "type": "number",
          "required": false,
          "validation": ["min:10", "max:100"],
          "ui_config": {
            "step": 0.5,
            "suffix": "km/l",
            "helpText": "Average fuel efficiency"
          }
        },
        {
          "name": "usage_type",
          "label": "Primary Usage Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "daily_commute", "label": "Daily Commute"},
              {"value": "weekend_rides", "label": "Weekend Rides"},
              {"value": "touring", "label": "Long Distance Touring"},
              {"value": "sports_riding", "label": "Sports/Performance Riding"},
              {"value": "off_road", "label": "Off-Road Riding"},
              {"value": "delivery", "label": "Delivery Services"},
              {"value": "rental", "label": "Bike Rental"},
              {"value": "exercise", "label": "Exercise/Fitness"},
              {"value": "recreation", "label": "Recreational Riding"},
              {"value": "competition", "label": "Competition/Sports"}
            ],
            "placeholder": "Select primary usage type"
          }
        },
        {
          "name": "riding_experience",
          "label": "Riding Experience Required",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "beginner", "label": "Beginner Friendly"},
              {"value": "intermediate", "label": "Intermediate"},
              {"value": "experienced", "label": "Experienced Rider"},
              {"value": "expert", "label": "Expert Only"}
            ],
            "helpText": "Recommended rider experience level"
          }
        },
        {
          "name": "last_service_date",
          "label": "Last Service Date",
          "type": "date",
          "required": false,
          "ui_config": {
            "maxDate": "today",
            "helpText": "Date of last major service"
          }
        },
        {
          "name": "next_service_due",
          "label": "Next Service Due (km)",
          "type": "number",
          "required": false,
          "validation": ["min:500", "max:20000"],
          "ui_config": {
            "suffix": "km",
            "helpText": "Kilometers until next service is due"
          }
        },
        {
          "name": "tyre_condition",
          "label": "Tyre Condition",
          "type": "radio",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "excellent", "label": "Excellent"},
              {"value": "good", "label": "Good"},
              {"value": "fair", "label": "Fair"},
              {"value": "poor", "label": "Poor - Needs Replacement"}
            ]
          }
        },
        {
          "name": "brake_condition",
          "label": "Brake Condition",
          "type": "radio",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "excellent", "label": "Excellent"},
              {"value": "good", "label": "Good"},
              {"value": "fair", "label": "Fair"},
              {"value": "poor", "label": "Poor - Needs Service"}
            ]
          }
        },
        {
          "name": "chain_condition",
          "label": "Chain/Drive Train Condition",
          "type": "radio",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "excellent", "label": "Excellent"},
              {"value": "good", "label": "Good"},
              {"value": "fair", "label": "Fair"},
              {"value": "poor", "label": "Poor - Needs Replacement"}
            ]
          }
        }
      ]
    },
    {
      "title": "Regulatory & Documentation",
      "order": 4,
      "description": "Legal compliance and documentation details",
      "is_collapsible": false,
      "fields": [
        {
          "name": "registration_number",
          "label": "Registration Number",
          "type": "text",
          "required": false,
          "validation": ["pattern:^[A-Z]{2}\\d{2}[A-Z]{1,2}\\d{4}$"],
          "ui_config": {
            "placeholder": "e.g., MH12AB1234 (not required for bicycles)",
            "helpText": "Vehicle registration number (motorcycles/scooters only)"
          }
        },
        {
          "name": "insurance_type",
          "label": "Insurance Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "comprehensive", "label": "Comprehensive Insurance"},
              {"value": "third_party", "label": "Third Party Insurance"},
              {"value": "no_insurance", "label": "No Insurance"}
            ],
            "helpText": "Insurance coverage (motorcycles/scooters only)"
          }
        },
        {
          "name": "insurance_validity",
          "label": "Insurance Validity",
          "type": "date",
          "required": false,
          "ui_config": {
            "minDate": "today",
            "helpText": "Insurance expiry date"
          }
        },
        {
          "name": "rto_clearance",
          "label": "RTO Clearance Status",
          "type": "radio",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "cleared", "label": "All Clearances Done"},
              {"value": "pending", "label": "Some Clearances Pending"},
              {"value": "issues", "label": "Has Clearance Issues"},
              {"value": "not_applicable", "label": "Not Applicable (Bicycle)"}
            ]
          }
        },
        {
          "name": "license_required",
          "label": "License Required",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "learner", "label": "Learner's License"},
              {"value": "permanent", "label": "Permanent License"},
              {"value": "no_license", "label": "No License Required (Bicycle)"}
            ],
            "helpText": "Driving license requirement"
          }
        }
      ]
    },
    {
      "title": "Features & Accessories",
      "order": 5,
      "description": "Bike features, safety equipment, and accessories",
      "is_collapsible": true,
      "fields": [
        {
          "name": "safety_features",
          "label": "Safety Features",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "abs_brakes", "label": "ABS Brakes"},
              {"value": "disc_brakes", "label": "Disc Brakes"},
              {"value": "helmet", "label": "Helmet Included"},
              {"value": "safety_gloves", "label": "Safety Gloves"},
              {"value": "reflectors", "label": "Reflectors"},
              {"value": "lights", "label": "Proper Lighting"},
              {"value": "horn", "label": "Horn"},
              {"value": "mirrors", "label": "Rear View Mirrors"},
              {"value": "side_stand", "label": "Side Stand"},
              {"value": "center_stand", "label": "Center Stand"}
            ],
            "helpText": "Select all safety features available"
          }
        },
        {
          "name": "comfort_features",
          "label": "Comfort Features",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "adjustable_seat", "label": "Adjustable Seat Height"},
              {"value": "pillion_seat", "label": "Pillion Seat"},
              {"value": "pillion_grab_rail", "label": "Pillion Grab Rails"},
              {"value": "foot_pegs", "label": "Foot Pegs"},
              {"value": "windshield", "label": "Windshield"},
              {"value": "crash_guard", "label": "Crash Guards"},
              {"value": "engine_guard", "label": "Engine Guards"},
              {"value": "luggage_carrier", "label": "Luggage Carrier"},
              {"value": "saddle_bags", "label": "Saddle Bags"},
              {"value": "tank_bag", "label": "Tank Bag"}
            ]
          }
        },
        {
          "name": "performance_features",
          "label": "Performance Features",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "alloy_wheels", "label": "Alloy Wheels"},
              {"value": "tubeless_tyres", "label": "Tubeless Tyres"},
              {"value": "digital_speedometer", "label": "Digital Speedometer"},
              {"value": "fuel_gauge", "label": "Fuel Gauge"},
              {"value": "trip_meter", "label": "Trip Meter"},
              {"value": "odometer", "label": "Odometer"},
              {"value": "tachometer", "label": "Tachometer"},
              {"value": "gear_indicator", "label": "Gear Position Indicator"},
              {"value": "usb_charging", "label": "USB Charging Port"},
              {"value": "mobile_holder", "label": "Mobile Phone Holder"}
            ]
          }
        },
        {
          "name": "bicycle_specific",
          "label": "Bicycle-Specific Features",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "gears", "label": "Multiple Gears"},
              {"value": "suspension", "label": "Suspension"},
              {"value": "carbon_frame", "label": "Carbon Fiber Frame"},
              {"value": "aluminum_frame", "label": "Aluminum Frame"},
              {"value": "disc_brakes", "label": "Disc Brakes"},
              {"value": "v_brakes", "label": "V-Brakes"},
              {"value": "quick_release", "label": "Quick Release Wheels"},
              {"value": "water_bottle_holder", "label": "Water Bottle Holder"},
              {"value": "mudguards", "label": "Mudguards"},
              {"value": "bell", "label": "Bell"}
            ],
            "helpText": "Features specific to bicycles"
          }
        },
        {
          "name": "additional_accessories",
          "label": "Additional Accessories",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "List any additional accessories, modifications, or customizations...",
            "rows": 3
          }
        }
      ]
    },
    {
      "title": "Business & Financial Information",
      "order": 6,
      "description": "Business details and financial information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "ownership_type",
          "label": "Ownership Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "individual", "label": "Individual Owner"},
              {"value": "company", "label": "Company Owned"},
              {"value": "financed", "label": "Financed/Leased"},
              {"value": "rental_company", "label": "Rental Company"},
              {"value": "showroom", "label": "Showroom/Dealer"}
            ]
          }
        },
        {
          "name": "warranty_available",
          "label": "Warranty Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "defaultValue": false,
            "helpText": "Check if bike comes with warranty"
          }
        },
        {
          "name": "warranty_details",
          "label": "Warranty Details",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "Specify warranty coverage, duration, and terms...",
            "rows": 2
          }
        },
        {
          "name": "financing_available",
          "label": "Financing Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "defaultValue": false,
            "helpText": "Check if seller offers financing options"
          }
        },
        {
          "name": "test_ride_available",
          "label": "Test Ride Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "defaultValue": false,
            "helpText": "Check if test ride is available"
          }
        },
        {
          "name": "delivery_available",
          "label": "Home Delivery Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "defaultValue": false,
            "helpText": "Check if home delivery is available"
          }
        }
      ]
    },
    {
      "title": "Contact & Additional Information",
      "order": 7,
      "description": "Contact details and additional service information",
      "is_collapsible": false,
      "fields": [
        {
          "name": "contact_name",
          "label": "Contact Person Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:50"],
          "ui_config": {
            "placeholder": "Full name of contact person"
          }
        },
        {
          "name": "contact_number",
          "label": "Contact Number",
          "type": "phone",
          "required": true,
          "validation": ["required", "phone"],
          "ui_config": {
            "placeholder": "+91-9876543210"
          }
        },
        {
          "name": "email",
          "label": "Email Address",
          "type": "email",
          "required": false,
          "validation": ["email"],
          "ui_config": {
            "placeholder": "contact@company.com"
          }
        },
        {
          "name": "location",
          "label": "Bike Location",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3", "max_length:100"],
          "ui_config": {
            "placeholder": "City, State - e.g., Mumbai, Maharashtra"
          }
        },
        {
          "name": "detailed_description",
          "label": "Detailed Description",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:50", "max_length:2000"],
          "ui_config": {
            "placeholder": "Provide detailed information about the bike, its condition, usage history, and any additional features...",
            "rows": 6,
            "helpText": "Include maintenance history, recent repairs, and unique selling points"
          }
        },
        {
          "name": "bike_images",
          "label": "Bike Images",
          "type": "file",
          "required": true,
          "validation": ["required", "fileType:image", "fileSize:5000000"],
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "maxFiles": 15,
            "helpText": "Upload high-quality images from multiple angles (max 15 images, 5MB each)"
          }
        },
        {
          "name": "documents",
          "label": "Supporting Documents",
          "type": "file",
          "required": false,
          "validation": ["fileType:pdf,doc,docx", "fileSize:10000000"],
          "ui_config": {
            "accept": ".pdf,.doc,.docx",
            "multiple": true,
            "maxFiles": 5,
            "helpText": "Upload RC copy, insurance, service records (max 5 files, 10MB each)"
          }
        }
      ]
    }
  ]
}
```

## Template Features

### **🏍️ Comprehensive Bike Coverage:**
- **Motorcycles:** Cruisers, sports bikes, touring, standard, off-road, naked bikes
- **Scooters:** 100cc, 125cc, 150cc, and electric scooters
- **Bicycles:** Mountain bikes, road bikes, hybrid, folding, electric, and kids bikes

### **📊 Technical Specifications:**
- **Engine & Performance:** Capacity, power, torque, transmission, fuel efficiency
- **Electric Features:** Battery capacity, range, charging specifications
- **Physical Specs:** Weight, dimensions, wheel size, fuel capacity
- **Performance Metrics:** Top speed, mileage, range calculations

### **⚖️ Regulatory Compliance:**
- **Registration:** Vehicle registration numbers for motorized bikes
- **Insurance:** Comprehensive and third-party coverage options
- **Licensing:** License requirements and RTO clearance status
- **Documentation:** Complete legal compliance tracking

### **🛡️ Safety & Features:**
- **Safety Equipment:** ABS brakes, helmets, protective gear, lighting
- **Comfort Features:** Adjustable seats, windshields, luggage options
- **Performance Features:** Digital displays, alloy wheels, modern tech
- **Bicycle-Specific:** Gears, suspension, frame materials, braking systems

### **💰 Business Intelligence:**
- **Ownership Types:** Individual, company, financed, rental, showroom
- **Service Options:** Warranty, financing, test rides, home delivery
- **Market Positioning:** Usage types and rider experience levels
- **Documentation Management:** Service records and maintenance history

### **📱 Digital Documentation:**
- **Multi-angle Imaging:** Comprehensive photo requirements
- **Document Upload:** RC, insurance, service records, warranty documents
- **Contact Integration:** Multiple communication channels
- **Location Services:** Geographic availability tracking

## API Integration Points

### **Car Management APIs Used:**
```javascript
// Get available bike brands
GET /api/v1/cars/brands?category=bikes

// Get models for specific brand
GET /api/v1/cars/brands/{brandId}/models

// Get variants for specific model
GET /api/v1/cars/models/{modelId}/variants
```

### **Schema Template APIs:**
```javascript
// Create the bikes template
POST /api/v1/schema-templates

// Assign template to bikes category
POST /api/v1/templates/{id}/assign-category

// Get dynamic form for category
GET /api/v1/catalog/categories/{id}/schema
```

## Implementation Notes

### **Field Validation Rules:**
- **Required Fields:** Title, category, type, condition, price, specifications, contact details
- **Conditional Requirements:** Registration and insurance only for motorized bikes
- **Technical Validation:** Realistic ranges for engine specs, performance metrics
- **File Uploads:** Image and document validation with size and type restrictions

### **Frontend Integration:**
- **Category-Based Logic:** Different fields shown based on bike category (motorcycle/scooter/bicycle)
- **Progressive Disclosure:** Technical sections collapsible for better UX
- **Real-time Validation:** Client-side validation with server-side verification
- **Multi-step Process:** Logical flow from basic info to detailed specifications

### **Business Logic:**
- **Compliance Tracking:** Automatic alerts for expiring insurance and registration
- **Usage Analytics:** Mileage tracking and service scheduling
- **Market Valuation:** Price guidance based on specifications and condition
- **Safety Compliance:** Mandatory safety feature verification

## Usage Examples

### **Royal Enfield Motorcycle Listing:**
- Category: "Motorcycle"
- Type: "Cruiser Motorcycle"
- Brand: "Royal Enfield"
- Model: "Classic 350"
- Engine: "346cc, 20.2 BHP"
- Usage: "Weekend Rides"

### **Honda Scooter Listing:**
- Category: "Scooter"
- Type: "125cc Scooter"
- Brand: "Honda"
- Model: "Activa 6G"
- Engine: "124cc, 8 BHP"
- Usage: "Daily Commute"

### **Trek Mountain Bike Listing:**
- Category: "Bicycle"
- Type: "Mountain Bike"
- Brand: "Trek"
- Model: "Marlin 7"
- Gears: "21-speed"
- Usage: "Off-Road Riding"

This template provides a comprehensive framework for bike listings with industry-standard specifications, regulatory compliance tracking, and detailed technical documentation required for professional bike transactions across all categories.</content>
<parameter name="filePath">/Volumes/ManishData/ManishPersonal/eBidPortal_2/eBidPortal_Apis/Docs/Templates/bikes-template.md