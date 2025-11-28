# Professional Commercial Vehicles Template for eBidPortal

**Template Name:** Commercial Vehicles Template
**Version:** 1.0
**Category Type:** commercial_vehicles
**Created:** November 20, 2025
**Industry Standards:** Based on commercial vehicle industry standards (CV industry norms, transportation regulations, safety standards)

## Template JSON Structure

```json
{
  "name": "Commercial Vehicles Template",
  "description": "Comprehensive template for commercial vehicles including trucks, buses, construction equipment, and heavy machinery. Includes detailed specifications, regulatory compliance, maintenance tracking, and commercial usage analytics.",
  "category_type": "commercial_vehicles",
  "is_active": true,
  "sections": [
    {
      "title": "Vehicle Information",
      "order": 1,
      "description": "Basic vehicle identification and classification details",
      "is_collapsible": false,
      "fields": [
        {
          "name": "listing_title",
          "label": "Listing Title",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:10", "max_length:100"],
          "ui_config": {
            "placeholder": "e.g., 2022 Tata Signa 1923.K 16 Ton Truck - Excellent Condition",
            "helpText": "Create an attractive title highlighting key specifications and condition"
          }
        },
        {
          "name": "vehicle_category",
          "label": "Vehicle Category",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "light_commercial", "label": "Light Commercial Vehicle (LCV)"},
              {"value": "medium_commercial", "label": "Medium Commercial Vehicle (MCV)"},
              {"value": "heavy_commercial", "label": "Heavy Commercial Vehicle (HCV)"},
              {"value": "extra_heavy", "label": "Extra Heavy Commercial Vehicle"},
              {"value": "bus", "label": "Bus/Coach"},
              {"value": "construction_equipment", "label": "Construction Equipment"},
              {"value": "agricultural", "label": "Agricultural Equipment"},
              {"value": "special_purpose", "label": "Special Purpose Vehicle"},
              {"value": "tanker", "label": "Tanker Vehicle"},
              {"value": "refrigerated", "label": "Refrigerated Vehicle"}
            ],
            "placeholder": "Select vehicle category"
          }
        },
        {
          "name": "vehicle_type",
          "label": "Specific Vehicle Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "pickup_truck", "label": "Pickup Truck"},
              {"value": "cargo_truck", "label": "Cargo Truck"},
              {"value": "dump_truck", "label": "Dump Truck"},
              {"value": "tanker_truck", "label": "Tanker Truck"},
              {"value": "refrigerated_truck", "label": "Refrigerated Truck"},
              {"value": "flatbed_truck", "label": "Flatbed Truck"},
              {"value": "tow_truck", "label": "Tow Truck"},
              {"value": "concrete_mixer", "label": "Concrete Mixer"},
              {"value": "crane", "label": "Crane"},
              {"value": "excavator", "label": "Excavator"},
              {"value": "loader", "label": "Loader"},
              {"value": "grader", "label": "Grader"},
              {"value": "bulldozer", "label": "Bulldozer"},
              {"value": "forklift", "label": "Forklift"},
              {"value": "bus", "label": "Bus"},
              {"value": "mini_bus", "label": "Mini Bus"},
              {"value": "coach", "label": "Coach"},
              {"value": "school_bus", "label": "School Bus"},
              {"value": "tractor", "label": "Tractor"},
              {"value": "harvester", "label": "Harvester"}
            ],
            "placeholder": "Select specific vehicle type"
          }
        },
        {
          "name": "condition",
          "label": "Vehicle Condition",
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
          "validation": ["required", "min:50000", "max:50000000"],
          "ui_config": {
            "step": 10000,
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
      "title": "Vehicle Specifications",
      "order": 2,
      "description": "Detailed technical specifications and capacity information",
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
              {"value": "tata", "label": "Tata Motors"},
              {"value": "mahindra", "label": "Mahindra"},
              {"value": "ashok_leyland", "label": "Ashok Leyland"},
              {"value": "force_motors", "label": "Force Motors"},
              {"value": "eicher", "label": "Eicher Motors"},
              {"value": "bharat_benz", "label": "BharatBenz"},
              {"value": "volvo", "label": "Volvo"},
              {"value": "scania", "label": "Scania"},
              {"value": "mercedes_benz", "label": "Mercedes-Benz"},
              {"value": "man", "label": "MAN"},
              {"value": "iveco", "label": "Iveco"},
              {"value": "jcb", "label": "JCB"},
              {"value": "caterpillar", "label": "Caterpillar"},
              {"value": "komatsu", "label": "Komatsu"},
              {"value": "liebherr", "label": "Liebherr"},
              {"value": "other", "label": "Other"}
            ],
            "placeholder": "Select vehicle brand"
          }
        },
        {
          "name": "model",
          "label": "Model",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:50"],
          "ui_config": {
            "placeholder": "e.g., Signa 1923.K, Prima 3530, 2518 IL"
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
          "name": "engine_power",
          "label": "Engine Power (HP)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:50", "max:1000"],
          "ui_config": {
            "suffix": "HP",
            "helpText": "Engine power in horsepower"
          }
        },
        {
          "name": "engine_capacity",
          "label": "Engine Capacity (CC)",
          "type": "number",
          "required": false,
          "validation": ["min:2000", "max:15000"],
          "ui_config": {
            "suffix": "CC",
            "helpText": "Engine displacement in cubic centimeters"
          }
        },
        {
          "name": "fuel_type",
          "label": "Fuel Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "diesel", "label": "Diesel"},
              {"value": "petrol", "label": "Petrol"},
              {"value": "cng", "label": "CNG"},
              {"value": "lng", "label": "LNG"},
              {"value": "electric", "label": "Electric"},
              {"value": "hybrid", "label": "Hybrid"},
              {"value": "hydrogen", "label": "Hydrogen"}
            ]
          }
        },
        {
          "name": "transmission",
          "label": "Transmission Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "manual", "label": "Manual"},
              {"value": "automatic", "label": "Automatic"},
              {"value": "semi_automatic", "label": "Semi-Automatic"},
              {"value": "cvt", "label": "CVT"},
              {"value": "amt", "label": "AMT"}
            ]
          }
        },
        {
          "name": "drive_type",
          "label": "Drive Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "2wd", "label": "2WD"},
              {"value": "4wd", "label": "4WD"},
              {"value": "6wd", "label": "6WD"},
              {"value": "8wd", "label": "8WD"},
              {"value": "all_wheel", "label": "All Wheel Drive"}
            ]
          }
        },
        {
          "name": "load_capacity",
          "label": "Load Capacity (Tonnes)",
          "type": "number",
          "required": false,
          "validation": ["min:0.5", "max:100"],
          "ui_config": {
            "step": 0.5,
            "suffix": "Tonnes",
            "helpText": "Maximum load carrying capacity"
          }
        },
        {
          "name": "gross_vehicle_weight",
          "label": "Gross Vehicle Weight (Tonnes)",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:200"],
          "ui_config": {
            "step": 0.5,
            "suffix": "Tonnes",
            "helpText": "Maximum permissible gross weight"
          }
        },
        {
          "name": "seating_capacity",
          "label": "Seating Capacity",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:100"],
          "ui_config": {
            "suffix": "persons",
            "helpText": "Total seating capacity including driver"
          }
        },
        {
          "name": "dimensions_length",
          "label": "Length (mm)",
          "type": "number",
          "required": false,
          "validation": ["min:1000", "max:20000"],
          "ui_config": {
            "suffix": "mm"
          }
        },
        {
          "name": "dimensions_width",
          "label": "Width (mm)",
          "type": "number",
          "required": false,
          "validation": ["min:500", "max:5000"],
          "ui_config": {
            "suffix": "mm"
          }
        },
        {
          "name": "dimensions_height",
          "label": "Height (mm)",
          "type": "number",
          "required": false,
          "validation": ["min:500", "max:5000"],
          "ui_config": {
            "suffix": "mm"
          }
        }
      ]
    },
    {
      "title": "Usage & Performance",
      "order": 3,
      "description": "Vehicle usage history and performance metrics",
      "is_collapsible": false,
      "fields": [
        {
          "name": "mileage",
          "label": "Current Mileage (km)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:2000000"],
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
          "validation": ["min:1", "max:50"],
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
              {"value": "cargo_transport", "label": "Cargo Transport"},
              {"value": "passenger_transport", "label": "Passenger Transport"},
              {"value": "construction", "label": "Construction Work"},
              {"value": "agricultural", "label": "Agricultural Work"},
              {"value": "mining", "label": "Mining/Quarrying"},
              {"value": "waste_management", "label": "Waste Management"},
              {"value": "fuel_delivery", "label": "Fuel/Chemical Delivery"},
              {"value": "food_delivery", "label": "Food Delivery"},
              {"value": "emergency_services", "label": "Emergency Services"},
              {"value": "towing", "label": "Towing Services"},
              {"value": "rental", "label": "Vehicle Rental"},
              {"value": "personal", "label": "Personal Use"}
            ],
            "placeholder": "Select primary usage type"
          }
        },
        {
          "name": "operating_hours",
          "label": "Total Operating Hours",
          "type": "number",
          "required": false,
          "validation": ["min:0", "max:100000"],
          "ui_config": {
            "suffix": "hours",
            "helpText": "Total engine operating hours"
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
          "validation": ["min:1000", "max:200000"],
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
          "required": true,
          "validation": ["required", "pattern:^[A-Z]{2}\\d{2}[A-Z]{1,2}\\d{4}$"],
          "ui_config": {
            "placeholder": "e.g., MH12AB1234",
            "helpText": "Vehicle registration number"
          }
        },
        {
          "name": "permit_type",
          "label": "Permit Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "all_india", "label": "All India Permit"},
              {"value": "state", "label": "State Permit"},
              {"value": "national", "label": "National Permit"},
              {"value": "goods_carriage", "label": "Goods Carriage Permit"},
              {"value": "passenger_carriage", "label": "Passenger Carriage Permit"},
              {"value": "contract_carriage", "label": "Contract Carriage Permit"},
              {"value": "stage_carriage", "label": "Stage Carriage Permit"},
              {"value": "temporary", "label": "Temporary Permit"}
            ]
          }
        },
        {
          "name": "permit_validity",
          "label": "Permit Validity",
          "type": "date",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "minDate": "today",
            "helpText": "Permit expiry date"
          }
        },
        {
          "name": "insurance_type",
          "label": "Insurance Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "comprehensive", "label": "Comprehensive Insurance"},
              {"value": "third_party", "label": "Third Party Insurance"},
              {"value": "act_only", "label": "Act Only Insurance"},
              {"value": "goods_in_transit", "label": "Goods in Transit Insurance"}
            ]
          }
        },
        {
          "name": "insurance_validity",
          "label": "Insurance Validity",
          "type": "date",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "minDate": "today",
            "helpText": "Insurance expiry date"
          }
        },
        {
          "name": "fitness_certificate",
          "label": "Fitness Certificate Valid Till",
          "type": "date",
          "required": false,
          "ui_config": {
            "minDate": "today",
            "helpText": "Fitness certificate expiry date"
          }
        },
        {
          "name": "pollution_certificate",
          "label": "Pollution Certificate Valid Till",
          "type": "date",
          "required": false,
          "ui_config": {
            "minDate": "today",
            "helpText": "Pollution under control certificate expiry date"
          }
        },
        {
          "name": "rto_clearance",
          "label": "RTO Clearance Status",
          "type": "radio",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "cleared", "label": "All Clearances Done"},
              {"value": "pending", "label": "Some Clearances Pending"},
              {"value": "issues", "label": "Has Clearance Issues"}
            ]
          }
        }
      ]
    },
    {
      "title": "Equipment & Features",
      "order": 5,
      "description": "Additional equipment and safety features",
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
              {"value": "airbags", "label": "Airbags"},
              {"value": "seatbelts", "label": "Seat Belts"},
              {"value": "speed_governor", "label": "Speed Governor"},
              {"value": "reverse_camera", "label": "Reverse Camera"},
              {"value": "emergency_brake", "label": "Emergency Brake System"},
              {"value": "hill_assist", "label": "Hill Assist"},
              {"value": "stability_control", "label": "Stability Control"},
              {"value": "fire_extinguisher", "label": "Fire Extinguisher"},
              {"value": "first_aid_kit", "label": "First Aid Kit"}
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
              {"value": "ac", "label": "Air Conditioning"},
              {"value": "power_steering", "label": "Power Steering"},
              {"value": "power_windows", "label": "Power Windows"},
              {"value": "music_system", "label": "Music System"},
              {"value": "bluetooth", "label": "Bluetooth Connectivity"},
              {"value": "usb_charging", "label": "USB Charging Ports"},
              {"value": "cruise_control", "label": "Cruise Control"},
              {"value": "adjustable_seats", "label": "Adjustable Seats"},
              {"value": "sunroof", "label": "Sunroof"},
              {"value": "tinted_glass", "label": "Tinted Glass"}
            ]
          }
        },
        {
          "name": "cargo_features",
          "label": "Cargo/Utility Features",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "hydraulic_lift", "label": "Hydraulic Lift"},
              {"value": "tail_lift", "label": "Tail Lift"},
              {"value": "side_loader", "label": "Side Loader"},
              {"value": "refrigeration_unit", "label": "Refrigeration Unit"},
              {"value": "tanker_body", "label": "Tanker Body"},
              {"value": "crane_attachment", "label": "Crane Attachment"},
              {"value": "forklift_attachment", "label": "Forklift Attachment"},
              {"value": "gps_tracking", "label": "GPS Tracking"},
              {"value": "weighbridge", "label": "On-board Weighbridge"},
              {"value": "cargo_securing", "label": "Cargo Securing Points"}
            ]
          }
        },
        {
          "name": "additional_equipment",
          "label": "Additional Equipment",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "List any additional equipment, attachments, or modifications...",
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
              {"value": "partnership", "label": "Partnership Firm"},
              {"value": "financed", "label": "Financed/Leased"},
              {"value": "rental_company", "label": "Rental Company"},
              {"value": "transport_company", "label": "Transport Company"}
            ]
          }
        },
        {
          "name": "monthly_revenue",
          "label": "Monthly Revenue (INR)",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "0_50000", "label": "Under ₹50,000"},
              {"value": "50000_100000", "label": "₹50,000 - ₹1,00,000"},
              {"value": "100000_200000", "label": "₹1,00,000 - ₹2,00,000"},
              {"value": "200000_500000", "label": "₹2,00,000 - ₹5,00,000"},
              {"value": "500000_plus", "label": "Over ₹5,00,000"}
            ],
            "helpText": "Approximate monthly revenue generated by this vehicle"
          }
        },
        {
          "name": "monthly_expenses",
          "label": "Monthly Expenses (INR)",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "0_10000", "label": "Under ₹10,000"},
              {"value": "10000_25000", "label": "₹10,000 - ₹25,000"},
              {"value": "25000_50000", "label": "₹25,000 - ₹50,000"},
              {"value": "50000_100000", "label": "₹50,000 - ₹1,00,000"},
              {"value": "100000_plus", "label": "Over ₹1,00,000"}
            ],
            "helpText": "Approximate monthly operating expenses"
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
          "name": "warranty_available",
          "label": "Warranty Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "defaultValue": false,
            "helpText": "Check if vehicle comes with warranty"
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
          "label": "Vehicle Location",
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
            "placeholder": "Provide detailed information about the vehicle, its condition, usage history, and any additional features...",
            "rows": 6,
            "helpText": "Include maintenance history, recent repairs, and unique selling points"
          }
        },
        {
          "name": "vehicle_images",
          "label": "Vehicle Images",
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
            "helpText": "Upload RC copy, insurance, permit, service records (max 5 files, 10MB each)"
          }
        }
      ]
    }
  ]
}
```

## Template Features

### **🚛 Vehicle Category Coverage:**
- **Light Commercial Vehicles (LCV):** Pickup trucks, small cargo vehicles
- **Medium Commercial Vehicles (MCV):** Medium-duty trucks and vans
- **Heavy Commercial Vehicles (HCV):** Heavy-duty trucks and construction equipment
- **Buses & Coaches:** Passenger transport vehicles
- **Construction Equipment:** Excavators, loaders, cranes, bulldozers
- **Special Purpose Vehicles:** Tankers, refrigerated vehicles, tow trucks

### **📊 Technical Specifications:**
- **Engine & Performance:** Power, capacity, fuel type, transmission
- **Load & Capacity:** Weight limits, dimensions, seating capacity
- **Usage Metrics:** Mileage, operating hours, fuel efficiency
- **Maintenance Tracking:** Service history, next service due dates

### **⚖️ Regulatory Compliance:**
- **Permits & Licenses:** All India, state, national permits
- **Insurance Coverage:** Comprehensive, third-party, goods in transit
- **Certificates:** Fitness, pollution control, RTO clearance
- **Documentation:** Complete legal compliance tracking

### **🛡️ Safety & Equipment:**
- **Safety Features:** ABS brakes, airbags, emergency systems
- **Comfort Amenities:** AC, music systems, power steering
- **Cargo Equipment:** Hydraulic lifts, refrigeration units, GPS tracking
- **Specialized Attachments:** Cranes, forklifts, tanker bodies

### **💰 Business Intelligence:**
- **Revenue Tracking:** Monthly income estimates
- **Cost Analysis:** Operating expense breakdowns
- **Ownership Types:** Individual, company, financed options
- **Warranty Information:** Coverage details and terms

### **📱 Digital Documentation:**
- **Multi-angle Imaging:** Comprehensive photo requirements
- **Document Upload:** RC, insurance, permits, service records
- **Contact Integration:** Multiple communication channels
- **Location Services:** Geographic availability tracking

## API Integration Points

### **Car Management APIs Used:**
```javascript
// Get available commercial vehicle brands
GET /api/v1/cars/brands?category=commercial

// Get models for specific brand
GET /api/v1/cars/brands/{brandId}/models

// Get variants for specific model
GET /api/v1/cars/models/{modelId}/variants
```

### **Schema Template APIs:**
```javascript
// Create the commercial vehicles template
POST /api/v1/schema-templates

// Assign template to commercial vehicles category
POST /api/v1/templates/{id}/assign-category

// Get dynamic form for category
GET /api/v1/catalog/categories/{id}/schema
```

## Implementation Notes

### **Field Validation Rules:**
- **Required Fields:** Title, category, type, condition, price, specifications, documentation
- **Technical Validation:** Realistic ranges for engine power, load capacity, dimensions
- **Regulatory Compliance:** Mandatory permit and insurance validity checks
- **File Uploads:** Image and document validation with size and type restrictions

### **Frontend Integration:**
- **Progressive Disclosure:** Technical sections collapsible for better UX
- **Conditional Logic:** Fields shown based on vehicle category and type
- **Real-time Validation:** Client-side validation with server-side verification
- **Multi-step Process:** Logical flow from basic info to detailed specifications

### **Business Logic:**
- **Compliance Tracking:** Automatic alerts for expiring permits and insurance
- **Performance Analytics:** Usage metrics and maintenance scheduling
- **Market Valuation:** Price guidance based on specifications and condition
- **Documentation Management:** Centralized storage of all legal documents

## Usage Examples

### **Heavy-Duty Truck Listing:**
- Category: "Heavy Commercial Vehicle"
- Type: "Cargo Truck"
- Brand: "Tata Motors"
- Model: "Signa 1923.K"
- Load Capacity: "16 Tonnes"
- Engine Power: "180 HP"
- Usage: "Cargo Transport"

### **Construction Excavator:**
- Category: "Construction Equipment"
- Type: "Excavator"
- Brand: "JCB"
- Operating Hours: "2,500 hours"
- Engine Power: "120 HP"
- Usage: "Construction Work"

### **Intercity Bus:**
- Category: "Bus/Coach"
- Type: "Coach"
- Seating Capacity: "45 persons"
- Permit: "All India Permit"
- Usage: "Passenger Transport"

This template provides a comprehensive framework for commercial vehicle listings with industry-standard specifications, regulatory compliance tracking, and detailed technical documentation required for professional commercial vehicle transactions.</content>
<parameter name="filePath">/Volumes/ManishData/ManishPersonal/eBidPortal_2/eBidPortal_Apis/Docs/Templates/commercial-vehicles-template.md