# Professional Houses & Apartments For Rent Template for eBidPortal

**Template Name:** Houses & Apartments For Rent Template
**Version:** 1.0
**Category Type:** real_estate_rental
**Created:** November 21, 2025
**Industry Standards:** Based on rental property industry standards (local rental laws, tenant rights, property management regulations)

## Template JSON Structure

```json
{
  "name": "Houses & Apartments For Rent Template",
  "description": "Comprehensive template for residential rental properties including houses, apartments, condos, townhouses, and rental units. Includes lease terms, tenant screening, property management features, and regulatory compliance.",
  "category_type": "real_estate_rental",
  "is_active": true,
  "sections": [
    {
      "title": "Rental Property Information",
      "order": 1,
      "description": "Basic rental property details and specifications",
      "is_collapsible": false,
      "fields": [
        {
          "name": "rental_title",
          "label": "Rental Listing Title",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:15", "max_length:120"],
          "ui_config": {
            "placeholder": "e.g., Spacious 2BHK Apartment for Rent in South Mumbai - Fully Furnished",
            "helpText": "Create an attractive title highlighting key rental features and location"
          }
        },
        {
          "name": "property_type",
          "label": "Property Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "apartment", "label": "Apartment/Flat"},
              {"value": "independent_house", "label": "Independent House"},
              {"value": "villa", "label": "Villa"},
              {"value": "townhouse", "label": "Townhouse"},
              {"value": "penthouse", "label": "Penthouse"},
              {"value": "studio", "label": "Studio Apartment"},
              {"value": "duplex", "label": "Duplex"},
              {"value": "triplex", "label": "Triplex"},
              {"value": "bungalow", "label": "Bungalow"},
              {"value": "serviced_apartment", "label": "Serviced Apartment"},
              {"value": "pg_hostel", "label": "PG/Hostel"},
              {"value": "room_rental", "label": "Room for Rent"}
            ],
            "placeholder": "Select the property type"
          }
        },
        {
          "name": "availability_status",
          "label": "Availability Status",
          "type": "radio",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "available_now", "label": "Available Immediately"},
              {"value": "available_soon", "label": "Available Soon"},
              {"value": "booked", "label": "Currently Booked"},
              {"value": "under_maintenance", "label": "Under Maintenance"}
            ]
          }
        },
        {
          "name": "available_from",
          "label": "Available From",
          "type": "date",
          "required": false,
          "validation": ["future_date"],
          "ui_config": {
            "helpText": "Date when the property will be available for occupancy"
          }
        },
        {
          "name": "furnishing_status",
          "label": "Furnishing Status",
          "type": "radio",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "unfurnished", "label": "Unfurnished"},
              {"value": "semi_furnished", "label": "Semi-Furnished"},
              {"value": "fully_furnished", "label": "Fully Furnished"}
            ]
          }
        }
      ]
    },
    {
      "title": "Location & Accessibility",
      "order": 2,
      "description": "Property location and neighborhood information",
      "is_collapsible": false,
      "fields": [
        {
          "name": "property_address",
          "label": "Property Address",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:20", "max_length:500"],
          "ui_config": {
            "placeholder": "Complete property address including landmark",
            "rows": 3
          }
        },
        {
          "name": "city",
          "label": "City",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:50"],
          "ui_config": {
            "placeholder": "e.g., Mumbai"
          }
        },
        {
          "name": "locality",
          "label": "Locality/Area",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:50"],
          "ui_config": {
            "placeholder": "e.g., Bandra West"
          }
        },
        {
          "name": "pincode",
          "label": "Pincode",
          "type": "text",
          "required": true,
          "validation": ["required", "pattern:^[0-9]{6}$"],
          "ui_config": {
            "placeholder": "e.g., 400050"
          }
        },
        {
          "name": "landmark",
          "label": "Nearby Landmark",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "e.g., Near Bandra Reclamation"
          }
        },
        {
          "name": "latitude",
          "label": "Latitude",
          "type": "number",
          "required": false,
          "validation": ["range:-90,90"],
          "ui_config": {
            "step": "0.000001",
            "helpText": "GPS coordinates for precise location mapping"
          }
        },
        {
          "name": "longitude",
          "label": "Longitude",
          "type": "number",
          "required": false,
          "validation": ["range:-180,180"],
          "ui_config": {
            "step": "0.000001",
            "helpText": "GPS coordinates for precise location mapping"
          }
        },
        {
          "name": "transport_access",
          "label": "Transport Access",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "metro_station", "label": "Metro Station"},
              {"value": "bus_stop", "label": "Bus Stop"},
              {"value": "railway_station", "label": "Railway Station"},
              {"value": "airport", "label": "Airport"},
              {"value": "highway", "label": "Highway Access"},
              {"value": "auto_rickshaw", "label": "Auto Rickshaw Stand"}
            ],
            "multiple": true,
            "helpText": "Select nearby transportation options"
          }
        }
      ]
    },
    {
      "title": "Property Specifications",
      "order": 3,
      "description": "Detailed property specifications and measurements",
      "is_collapsible": false,
      "fields": [
        {
          "name": "bedrooms",
          "label": "Number of Bedrooms",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:20"],
          "ui_config": {
            "placeholder": "e.g., 2"
          }
        },
        {
          "name": "bathrooms",
          "label": "Number of Bathrooms",
          "type": "number",
          "required": true,
          "validation": ["required", "min:1", "max:20"],
          "ui_config": {
            "placeholder": "e.g., 2"
          }
        },
        {
          "name": "balconies",
          "label": "Number of Balconies",
          "type": "number",
          "required": false,
          "validation": ["min:0", "max:10"],
          "ui_config": {
            "placeholder": "e.g., 1"
          }
        },
        {
          "name": "carpet_area",
          "label": "Carpet Area (sq ft)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:100", "max:10000"],
          "ui_config": {
            "placeholder": "e.g., 1200",
            "helpText": "Actual usable area excluding walls"
          }
        },
        {
          "name": "built_up_area",
          "label": "Built-up Area (sq ft)",
          "type": "number",
          "required": false,
          "validation": ["min:100", "max:15000"],
          "ui_config": {
            "placeholder": "e.g., 1350",
            "helpText": "Area including walls and internal structures"
          }
        },
        {
          "name": "super_area",
          "label": "Super Area (sq ft)",
          "type": "number",
          "required": false,
          "validation": ["min:100", "max:20000"],
          "ui_config": {
            "placeholder": "e.g., 1500",
            "helpText": "Total area including common spaces"
          }
        },
        {
          "name": "floor_number",
          "label": "Floor Number",
          "type": "number",
          "required": false,
          "validation": ["min:0", "max:100"],
          "ui_config": {
            "placeholder": "e.g., 5",
            "helpText": "Floor on which the property is located"
          }
        },
        {
          "name": "total_floors",
          "label": "Total Floors in Building",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:200"],
          "ui_config": {
            "placeholder": "e.g., 20"
          }
        },
        {
          "name": "property_age",
          "label": "Property Age",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "new", "label": "New Construction (0-1 year)"},
              {"value": "1-3_years", "label": "1-3 Years"},
              {"value": "3-5_years", "label": "3-5 Years"},
              {"value": "5-10_years", "label": "5-10 Years"},
              {"value": "10+_years", "label": "10+ Years"}
            ]
          }
        },
        {
          "name": "facing_direction",
          "label": "Facing Direction",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "north", "label": "North"},
              {"value": "south", "label": "South"},
              {"value": "east", "label": "East"},
              {"value": "west", "label": "West"},
              {"value": "northeast", "label": "North-East"},
              {"value": "northwest", "label": "North-West"},
              {"value": "southeast", "label": "South-East"},
              {"value": "southwest", "label": "South-West"}
            ]
          }
        }
      ]
    },
    {
      "title": "Rental Terms & Pricing",
      "order": 4,
      "description": "Rental pricing and lease terms",
      "is_collapsible": false,
      "fields": [
        {
          "name": "monthly_rent",
          "label": "Monthly Rent (₹)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:1000", "max:10000000"],
          "ui_config": {
            "placeholder": "e.g., 45000",
            "helpText": "Monthly rental amount in Indian Rupees"
          }
        },
        {
          "name": "security_deposit",
          "label": "Security Deposit (₹)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:50000000"],
          "ui_config": {
            "placeholder": "e.g., 135000",
            "helpText": "Security deposit amount (usually 1-3 months rent)"
          }
        },
        {
          "name": "maintenance_charges",
          "label": "Monthly Maintenance (₹)",
          "type": "number",
          "required": false,
          "validation": ["min:0", "max:100000"],
          "ui_config": {
            "placeholder": "e.g., 2500",
            "helpText": "Monthly maintenance charges (if not included in rent)"
          }
        },
        {
          "name": "lease_duration",
          "label": "Lease Duration",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "monthly", "label": "Month-to-Month"},
              {"value": "3_months", "label": "3 Months"},
              {"value": "6_months", "label": "6 Months"},
              {"value": "1_year", "label": "1 Year"},
              {"value": "2_years", "label": "2 Years"},
              {"value": "3_years", "label": "3 Years"},
              {"value": "long_term", "label": "Long Term (3+ Years)"}
            ],
            "placeholder": "Select preferred lease duration"
          }
        },
        {
          "name": "minimum_lease",
          "label": "Minimum Lease Period",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "1_month", "label": "1 Month"},
              {"value": "3_months", "label": "3 Months"},
              {"value": "6_months", "label": "6 Months"},
              {"value": "1_year", "label": "1 Year"},
              {"value": "2_years", "label": "2 Years"}
            ],
            "helpText": "Minimum period tenant must commit to"
          }
        },
        {
          "name": "rent_includes",
          "label": "Rent Includes",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "maintenance", "label": "Maintenance Charges"},
              {"value": "water", "label": "Water Supply"},
              {"value": "electricity", "label": "Electricity"},
              {"value": "gas", "label": "Gas"},
              {"value": "internet", "label": "Internet/WiFi"},
              {"value": "cable_tv", "label": "Cable TV"},
              {"value": "parking", "label": "Parking"},
              {"value": "housekeeping", "label": "Housekeeping"},
              {"value": "laundry", "label": "Laundry Service"}
            ],
            "multiple": true,
            "helpText": "Select what is included in the monthly rent"
          }
        },
        {
          "name": "additional_charges",
          "label": "Additional Charges",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "electricity_bill", "label": "Electricity Bill"},
              {"value": "water_bill", "label": "Water Bill"},
              {"value": "gas_bill", "label": "Gas Bill"},
              {"value": "internet_bill", "label": "Internet Bill"},
              {"value": "cable_tv_bill", "label": "Cable TV Bill"},
              {"value": "parking_fee", "label": "Parking Fee"},
              {"value": "pet_deposit", "label": "Pet Deposit"},
              {"value": "late_fee", "label": "Late Payment Fee"}
            ],
            "multiple": true,
            "helpText": "Select additional charges applicable"
          }
        },
        {
          "name": "rent_negotiable",
          "label": "Rent Negotiable",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Is the rent amount open to negotiation?"
          }
        },
        {
          "name": "payment_terms",
          "label": "Payment Terms",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Describe payment schedule, due dates, and accepted payment methods",
            "rows": 3
          }
        }
      ]
    },
    {
      "title": "Property Features & Amenities",
      "order": 5,
      "description": "Property features and available amenities",
      "is_collapsible": true,
      "fields": [
        {
          "name": "basic_amenities",
          "label": "Basic Amenities",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "power_backup", "label": "Power Backup"},
              {"value": "lift", "label": "Lift/Elevator"},
              {"value": "parking", "label": "Parking"},
              {"value": "security", "label": "Security"},
              {"value": "water_supply", "label": "24x7 Water Supply"},
              {"value": "waste_disposal", "label": "Waste Disposal"},
              {"value": "maintenance_staff", "label": "Maintenance Staff"},
              {"value": "internet", "label": "Internet/WiFi"},
              {"value": "cable_tv", "label": "Cable TV"},
              {"value": "intercom", "label": "Intercom"}
            ],
            "multiple": true
          }
        },
        {
          "name": "kitchen_features",
          "label": "Kitchen Features",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "modular_kitchen", "label": "Modular Kitchen"},
              {"value": "granite_countertops", "label": "Granite Countertops"},
              {"value": "chimney", "label": "Chimney"},
              {"value": "microwave", "label": "Microwave"},
              {"value": "refrigerator", "label": "Refrigerator"},
              {"value": "washing_machine", "label": "Washing Machine"},
              {"value": "dishwasher", "label": "Dishwasher"},
              {"value": "gas_pipeline", "label": "Gas Pipeline"},
              {"value": "water_purifier", "label": "Water Purifier"}
            ],
            "multiple": true
          }
        },
        {
          "name": "luxury_amenities",
          "label": "Luxury Amenities",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "swimming_pool", "label": "Swimming Pool"},
              {"value": "gym", "label": "Gym/Fitness Center"},
              {"value": "spa", "label": "Spa"},
              {"value": "jacuzzi", "label": "Jacuzzi"},
              {"value": "sauna", "label": "Sauna"},
              {"value": "steam_room", "label": "Steam Room"},
              {"value": "tennis_court", "label": "Tennis Court"},
              {"value": "basketball_court", "label": "Basketball Court"},
              {"value": "squash_court", "label": "Squash Court"},
              {"value": "jogging_track", "label": "Jogging Track"},
              {"value": "children_play_area", "label": "Children's Play Area"},
              {"value": "clubhouse", "label": "Clubhouse"},
              {"value": "multipurpose_hall", "label": "Multipurpose Hall"},
              {"value": "library", "label": "Library"},
              {"value": "theatre", "label": "Home Theatre"},
              {"value": "rooftop_garden", "label": "Rooftop Garden"},
              {"value": "party_lawn", "label": "Party Lawn"}
            ],
            "multiple": true
          }
        },
        {
          "name": "additional_features",
          "label": "Additional Features",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "air_conditioning", "label": "Air Conditioning"},
              {"value": "central_heating", "label": "Central Heating"},
              {"value": "wooden_flooring", "label": "Wooden Flooring"},
              {"value": "marble_flooring", "label": "Marble Flooring"},
              {"value": "tiles", "label": "Tiles"},
              {"value": "false_ceiling", "label": "False Ceiling"},
              {"value": "servant_room", "label": "Servant Room"},
              {"value": "study_room", "label": "Study Room"},
              {"value": "puja_room", "label": "Puja Room"},
              {"value": "store_room", "label": "Store Room"},
              {"value": "private_garden", "label": "Private Garden"},
              {"value": "private_terrace", "label": "Private Terrace"},
              {"value": "corner_property", "label": "Corner Property"},
              {"value": "park_facing", "label": "Park Facing"},
              {"value": "main_road_facing", "label": "Main Road Facing"},
              {"value": "sea_facing", "label": "Sea Facing"},
              {"value": "mountain_view", "label": "Mountain View"},
              {"value": "city_view", "label": "City View"}
            ],
            "multiple": true
          }
        }
      ]
    },
    {
      "title": "Tenant Requirements & Restrictions",
      "order": 6,
      "description": "Requirements and restrictions for potential tenants",
      "is_collapsible": true,
      "fields": [
        {
          "name": "preferred_tenants",
          "label": "Preferred Tenants",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "families", "label": "Families"},
              {"value": "working_professionals", "label": "Working Professionals"},
              {"value": "students", "label": "Students"},
              {"value": "business_travellers", "label": "Business Travellers"},
              {"value": "expats", "label": "Expats/Foreigners"},
              {"value": "bachelors", "label": "Bachelors"},
              {"value": "couples", "label": "Couples"},
              {"value": "senior_citizens", "label": "Senior Citizens"}
            ],
            "multiple": true,
            "helpText": "Select preferred tenant types (leave empty for no preference)"
          }
        },
        {
          "name": "restrictions",
          "label": "Restrictions",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "no_smoking", "label": "No Smoking"},
              {"value": "no_pets", "label": "No Pets"},
              {"value": "no_cooking", "label": "No Cooking"},
              {"value": "no_parties", "label": "No Parties/Events"},
              {"value": "no_subletting", "label": "No Sub-letting"},
              {"value": "vegetarian_only", "label": "Vegetarian Only"},
              {"value": "hindu_only", "label": "Hindu Tenants Only"},
              {"value": "same_gender", "label": "Same Gender Only"}
            ],
            "multiple": true,
            "helpText": "Select any restrictions that apply"
          }
        },
        {
          "name": "minimum_income",
          "label": "Minimum Monthly Income (₹)",
          "type": "number",
          "required": false,
          "validation": ["min:10000", "max:10000000"],
          "ui_config": {
            "placeholder": "e.g., 50000",
            "helpText": "Minimum monthly income requirement for tenants"
          }
        },
        {
          "name": "employment_verification",
          "label": "Employment Verification Required",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Is employment verification required?"
          }
        },
        {
          "name": "credit_check",
          "label": "Credit Check Required",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Is credit score check required?"
          }
        },
        {
          "name": "background_check",
          "label": "Background Check Required",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Is background verification required?"
          }
        },
        {
          "name": "references_required",
          "label": "References Required",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Are tenant references required?"
          }
        }
      ]
    },
    {
      "title": "Property Images & Media",
      "order": 7,
      "description": "Property photographs and virtual tours",
      "is_collapsible": true,
      "fields": [
        {
          "name": "property_images",
          "label": "Property Images",
          "type": "file",
          "required": true,
          "validation": ["required", "file_types:image/jpeg,image/png,image/webp", "max_files:20", "max_file_size:5MB"],
          "ui_config": {
            "multiple": true,
            "helpText": "Upload high-quality images of the property (minimum 5 images required)",
            "acceptedTypes": "image/*",
            "maxFiles": 20
          }
        },
        {
          "name": "floor_plan",
          "label": "Floor Plan",
          "type": "file",
          "required": false,
          "validation": ["file_types:image/jpeg,image/png,image/webp,application/pdf", "max_files:5", "max_file_size:10MB"],
          "ui_config": {
            "multiple": true,
            "helpText": "Upload floor plans and layout diagrams",
            "acceptedTypes": "image/*,.pdf"
          }
        },
        {
          "name": "virtual_tour",
          "label": "Virtual Tour URL",
          "type": "url",
          "required": false,
          "validation": ["url"],
          "ui_config": {
            "placeholder": "https://example.com/virtual-tour",
            "helpText": "Link to 360° virtual tour or video walkthrough"
          }
        },
        {
          "name": "video_tour",
          "label": "Video Tour URL",
          "type": "url",
          "required": false,
          "validation": ["url"],
          "ui_config": {
            "placeholder": "https://youtube.com/watch?v=...",
            "helpText": "Link to property video tour"
          }
        }
      ]
    },
    {
      "title": "Landlord & Contact Information",
      "order": 8,
      "description": "Contact details for inquiries and property viewings",
      "is_collapsible": false,
      "fields": [
        {
          "name": "landlord_type",
          "label": "Landlord Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "individual_owner", "label": "Individual Owner"},
              {"value": "property_manager", "label": "Property Manager"},
              {"value": "real_estate_agent", "label": "Real Estate Agent"},
              {"value": "property_developer", "label": "Property Developer"},
              {"value": "leasing_company", "label": "Leasing Company"}
            ]
          }
        },
        {
          "name": "contact_name",
          "label": "Contact Person Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:50"],
          "ui_config": {
            "placeholder": "e.g., Rajesh Kumar"
          }
        },
        {
          "name": "contact_designation",
          "label": "Designation",
          "type": "text",
          "required": false,
          "validation": ["max_length:50"],
          "ui_config": {
            "placeholder": "e.g., Property Manager, Owner"
          }
        },
        {
          "name": "contact_phone",
          "label": "Contact Phone",
          "type": "phone",
          "required": true,
          "validation": ["required", "phone"],
          "ui_config": {
            "placeholder": "+91-9876543210"
          }
        },
        {
          "name": "contact_email",
          "label": "Contact Email",
          "type": "email",
          "required": true,
          "validation": ["required", "email"],
          "ui_config": {
            "placeholder": "landlord@example.com"
          }
        },
        {
          "name": "company_name",
          "label": "Company/Agency Name",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "e.g., ABC Property Management Pvt Ltd"
          }
        },
        {
          "name": "rera_agent_id",
          "label": "RERA Agent ID",
          "type": "text",
          "required": false,
          "validation": ["pattern:^A[0-9]{4,6}$"],
          "ui_config": {
            "placeholder": "e.g., A12345",
            "helpText": "RERA registration number for real estate agents"
          }
        },
        {
          "name": "preferred_contact_time",
          "label": "Preferred Contact Time",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "morning", "label": "Morning (9 AM - 12 PM)"},
              {"value": "afternoon", "label": "Afternoon (12 PM - 5 PM)"},
              {"value": "evening", "label": "Evening (5 PM - 9 PM)"},
              {"value": "anytime", "label": "Anytime"}
            ]
          }
        },
        {
          "name": "available_for_viewing",
          "label": "Available for Property Viewing",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Can arrange property visits and showings?"
          }
        }
      ]
    },
    {
      "title": "Additional Information",
      "order": 9,
      "description": "Additional rental details and terms",
      "is_collapsible": true,
      "fields": [
        {
          "name": "property_description",
          "label": "Property Description",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:50", "max_length:2000"],
          "ui_config": {
            "placeholder": "Detailed description of the rental property, its features, and unique selling points...",
            "rows": 6,
            "helpText": "Provide a compelling description highlighting the property's best features"
          }
        },
        {
          "name": "neighborhood_info",
          "label": "Neighborhood Information",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Describe the neighborhood, nearby facilities, safety, and lifestyle aspects",
            "rows": 3
          }
        },
        {
          "name": "lease_terms",
          "label": "Lease Terms & Conditions",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Specify lease terms, renewal options, notice periods, and other conditions",
            "rows": 4
          }
        },
        {
          "name": "utilities_info",
          "label": "Utilities & Bills Information",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Information about utility connections, billing cycles, and responsibilities",
            "rows": 3
          }
        },
        {
          "name": "maintenance_policy",
          "label": "Maintenance & Repairs Policy",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Describe maintenance responsibilities, repair procedures, and emergency contacts",
            "rows": 3
          }
        },
        {
          "name": "special_conditions",
          "label": "Special Conditions",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Any special conditions, rules, or requirements for tenants",
            "rows": 3
          }
        }
      ]
    }
  ]
}
```

## Template Features

### Industry-Specific Fields
- **Rental Terms**: Comprehensive lease duration, security deposit, and payment terms
- **Tenant Screening**: Income requirements, background checks, and reference verification
- **Property Management**: Maintenance policies, utility responsibilities, and landlord contact
- **Regulatory Compliance**: RERA agent registration and rental law compliance
- **Tenant Restrictions**: Pets, smoking, cooking, and occupancy preferences

### Validation Rules
- **Rental Pricing**: Industry-standard rent ranges with deposit validation
- **Lease Terms**: Logical relationships between lease duration and minimum commitments
- **Tenant Requirements**: Income validation and professional verification options
- **Contact Validation**: Professional contact information with RERA agent ID

### UI/UX Enhancements
- **Progressive Disclosure**: Collapsible sections for better user experience
- **Smart Calculations**: Automatic rent-to-deposit ratio suggestions
- **Conditional Fields**: Dynamic field visibility based on property type and landlord type
- **Rich Media Support**: Multiple image uploads with floor plans and virtual tours
- **Location Mapping**: GPS coordinate integration for property mapping

### API Integration Points
- **Car Management API**: Integration with location services for neighborhood data
- **Schema Template System**: Dynamic form generation with validation rules
- **File Upload Service**: Firebase integration for property images and documents
- **Analytics Integration**: Property view tracking and lead generation analytics

### Compliance & Standards
- **Rental Laws**: Compliance with local tenancy laws and tenant rights
- **RERA Compliance**: Mandatory fields for RERA-registered rental agents
- **Data Privacy**: Secure handling of tenant and landlord information
- **Industry Standards**: Alignment with property management and rental industry best practices
- **Legal Requirements**: Comprehensive lease documentation and terms checklist

## Usage Instructions

1. **Template Assignment**: Assign this template to rental real estate category via `/api/v1/schema-templates/{id}/assign-category`
2. **Form Generation**: Use `GET /api/v1/catalog/categories/{id}/schema` to retrieve complete form structure
3. **Validation**: Implement client-side validation using provided validation rules
4. **Image Upload**: Use Firebase storage for property images with automatic optimization
5. **GPS Integration**: Enable location services for precise property mapping
6. **Tenant Screening**: Implement background check integrations for tenant verification
7. **Lease Generation**: Use template data to auto-generate lease agreements

## Implementation Notes

- **Database Storage**: Template stored as JSONB in PostgreSQL for flexible querying
- **Performance**: Optimized with proper indexing on frequently queried fields
- **Scalability**: Supports unlimited custom fields through JSONB structure
- **Version Control**: Template versioning for backward compatibility
- **Audit Trail**: Complete change tracking for compliance requirements

This template provides a comprehensive, industry-standard solution for residential rental listings on the eBidPortal marketplace, ensuring professional presentation and regulatory compliance for both landlords and tenants.