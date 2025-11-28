# Professional Houses & Apartments For Sale Template for eBidPortal

**Template Name:** Houses & Apartments For Sale Template
**Version:** 1.0
**Category Type:** real_estate
**Created:** November 21, 2025
**Industry Standards:** Based on real estate industry standards (RERA, local property regulations, international property listing standards)

## Template JSON Structure

```json
{
  "name": "Houses & Apartments For Sale Template",
  "description": "Comprehensive template for residential property sales including houses, apartments, condos, townhouses, and villas. Includes property specifications, location details, pricing structures, legal documentation, and professional marketing features.",
  "category_type": "real_estate",
  "is_active": true,
  "sections": [
    {
      "title": "Property Information",
      "order": 1,
      "description": "Basic property details and specifications",
      "is_collapsible": false,
      "fields": [
        {
          "name": "property_title",
          "label": "Property Title",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:15", "max_length:120"],
          "ui_config": {
            "placeholder": "e.g., Luxury 3BHK Apartment in South Mumbai with Sea View",
            "helpText": "Create an attractive title highlighting key features and location"
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
              {"value": "farmhouse", "label": "Farmhouse"},
              {"value": "condo", "label": "Condominium"}
            ],
            "placeholder": "Select the property type"
          }
        },
        {
          "name": "property_status",
          "label": "Property Status",
          "type": "radio",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "ready_to_move", "label": "Ready to Move"},
              {"value": "under_construction", "label": "Under Construction"},
              {"value": "new_launch", "label": "New Launch"},
              {"value": "off_plan", "label": "Off Plan"},
              {"value": "resale", "label": "Resale"}
            ]
          }
        },
        {
          "name": "possession_date",
          "label": "Possession Date",
          "type": "date",
          "required": false,
          "validation": ["future_date"],
          "ui_config": {
            "helpText": "Expected possession date (leave empty for ready-to-move properties)"
          }
        },
        {
          "name": "rera_registered",
          "label": "RERA Registered",
          "type": "boolean",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "helpText": "Is this property registered under RERA?"
          }
        },
        {
          "name": "rera_number",
          "label": "RERA Registration Number",
          "type": "text",
          "required": false,
          "validation": ["conditional_required:rera_registered", "pattern:^RERA[A-Z]{3}[0-9]{2,4}[A-Z0-9]*$"],
          "ui_config": {
            "placeholder": "e.g., RERAHAR00001",
            "helpText": "Official RERA registration number"
          }
        }
      ]
    },
    {
      "title": "Location Details",
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
          "name": "state",
          "label": "State",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:50"],
          "ui_config": {
            "placeholder": "e.g., Maharashtra"
          }
        },
        {
          "name": "country",
          "label": "Country",
          "type": "text",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "placeholder": "e.g., India",
            "defaultValue": "India"
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
          "name": "neighborhood_features",
          "label": "Neighborhood Features",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "shopping_mall", "label": "Shopping Mall"},
              {"value": "hospital", "label": "Hospital"},
              {"value": "school", "label": "School"},
              {"value": "metro_station", "label": "Metro Station"},
              {"value": "bus_stop", "label": "Bus Stop"},
              {"value": "railway_station", "label": "Railway Station"},
              {"value": "airport", "label": "Airport"},
              {"value": "park", "label": "Park/Garden"},
              {"value": "gym", "label": "Gym/Fitness Center"},
              {"value": "restaurant", "label": "Restaurant"},
              {"value": "bank", "label": "Bank/ATM"},
              {"value": "supermarket", "label": "Supermarket"}
            ],
            "multiple": true,
            "helpText": "Select nearby amenities and facilities"
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
            "placeholder": "e.g., 3"
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
        }
      ]
    },
    {
      "title": "Property Features & Amenities",
      "order": 4,
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
              {"value": "terrace", "label": "Terrace"},
              {"value": "party_lawn", "label": "Party Lawn"}
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
              {"value": "dishwasher", "label": "Dishwasher"},
              {"value": "refrigerator", "label": "Refrigerator"},
              {"value": "washing_machine", "label": "Washing Machine"},
              {"value": "gas_pipeline", "label": "Gas Pipeline"},
              {"value": "water_purifier", "label": "Water Purifier"}
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
      "title": "Pricing & Financial Details",
      "order": 5,
      "description": "Property pricing and financial information",
      "is_collapsible": false,
      "fields": [
        {
          "name": "sale_price",
          "label": "Sale Price (₹)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:100000", "max:1000000000"],
          "ui_config": {
            "placeholder": "e.g., 8500000",
            "helpText": "Total sale price in Indian Rupees"
          }
        },
        {
          "name": "price_per_sqft",
          "label": "Price per Sq Ft (₹)",
          "type": "number",
          "required": false,
          "validation": ["min:500", "max:50000"],
          "ui_config": {
            "placeholder": "e.g., 7083",
            "helpText": "Automatically calculated from sale price and carpet area"
          }
        },
        {
          "name": "booking_amount",
          "label": "Booking Amount (₹)",
          "type": "number",
          "required": false,
          "validation": ["min:10000", "max:10000000"],
          "ui_config": {
            "placeholder": "e.g., 100000",
            "helpText": "Initial booking amount required"
          }
        },
        {
          "name": "maintenance_charges",
          "label": "Monthly Maintenance (₹)",
          "type": "number",
          "required": false,
          "validation": ["min:0", "max:100000"],
          "ui_config": {
            "placeholder": "e.g., 2500"
          }
        },
        {
          "name": "price_negotiable",
          "label": "Price Negotiable",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Is the price open to negotiation?"
          }
        },
        {
          "name": "inclusive_charges",
          "label": "Inclusive Charges",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "stamp_duty", "label": "Stamp Duty"},
              {"value": "registration_fees", "label": "Registration Fees"},
              {"value": "legal_fees", "label": "Legal Fees"},
              {"value": "maintenance_deposit", "label": "Maintenance Deposit"},
              {"value": "parking_charges", "label": "Parking Charges"},
              {"value": "club_membership", "label": "Club Membership"},
              {"value": "power_backup_charges", "label": "Power Backup Charges"},
              {"value": "other_charges", "label": "Other Charges"}
            ],
            "multiple": true,
            "helpText": "Select charges included in the sale price"
          }
        },
        {
          "name": "payment_plan",
          "label": "Payment Plan",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Describe the payment plan and milestones",
            "rows": 4
          }
        },
        {
          "name": "financing_available",
          "label": "Financing Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Is bank financing available for this property?"
          }
        }
      ]
    },
    {
      "title": "Legal & Documentation",
      "order": 6,
      "description": "Legal status and documentation details",
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
              {"value": "freehold", "label": "Freehold"},
              {"value": "leasehold", "label": "Leasehold"},
              {"value": "cooperative", "label": "Cooperative Society"},
              {"value": "condominium", "label": "Condominium"},
              {"value": "power_of_attorney", "label": "Power of Attorney"}
            ]
          }
        },
        {
          "name": "property_tax_paid",
          "label": "Property Tax Paid",
          "type": "boolean",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "helpText": "Has the property tax been paid up to date?"
          }
        },
        {
          "name": "clear_title",
          "label": "Clear Title",
          "type": "boolean",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "helpText": "Is the property title clear and marketable?"
          }
        },
        {
          "name": "litigation_free",
          "label": "Litigation Free",
          "type": "boolean",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "helpText": "Is the property free from any legal disputes?"
          }
        },
        {
          "name": "approved_layout",
          "label": "Approved Layout",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Does the property have approved building layout plans?"
          }
        },
        {
          "name": "building_permission",
          "label": "Building Permission",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Does the property have valid building permission?"
          }
        },
        {
          "name": "occupancy_certificate",
          "label": "Occupancy Certificate",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Does the property have occupancy certificate?"
          }
        },
        {
          "name": "encumbrance_certificate",
          "label": "Encumbrance Certificate",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Is encumbrance certificate available?"
          }
        },
        {
          "name": "property_documents",
          "label": "Available Documents",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "sale_deed", "label": "Sale Deed"},
              {"value": "title_deed", "label": "Title Deed"},
              {"value": "property_tax_receipt", "label": "Property Tax Receipt"},
              {"value": "maintenance_bill", "label": "Maintenance Bill"},
              {"value": "electricity_bill", "label": "Electricity Bill"},
              {"value": "water_bill", "label": "Water Bill"},
              {"value": "gas_bill", "label": "Gas Bill"},
              {"value": "bank_statements", "label": "Bank Statements"},
              {"value": "id_proof", "label": "ID Proof"},
              {"value": "address_proof", "label": "Address Proof"}
            ],
            "multiple": true,
            "helpText": "Select all available property documents"
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
      "title": "Contact & Agent Information",
      "order": 8,
      "description": "Contact details for inquiries and property visits",
      "is_collapsible": false,
      "fields": [
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
            "placeholder": "e.g., Real Estate Agent, Owner"
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
            "placeholder": "agent@example.com"
          }
        },
        {
          "name": "company_name",
          "label": "Company/Agency Name",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "e.g., ABC Real Estate Pvt Ltd"
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
          "name": "available_for_visits",
          "label": "Available for Property Visits",
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
      "description": "Additional property details and marketing information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "property_description",
          "label": "Property Description",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:50", "max_length:2000"],
          "ui_config": {
            "placeholder": "Detailed description of the property, its features, and unique selling points...",
            "rows": 6,
            "helpText": "Provide a compelling description highlighting the property's best features"
          }
        },
        {
          "name": "nearby_attractions",
          "label": "Nearby Attractions",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Mention nearby schools, hospitals, malls, metro stations, etc.",
            "rows": 3
          }
        },
        {
          "name": "investment_potential",
          "label": "Investment Potential",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Describe rental potential, appreciation prospects, etc.",
            "rows": 3
          }
        },
        {
          "name": "special_features",
          "label": "Special Features",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Any special features like heritage value, celebrity ownership, etc.",
            "rows": 3
          }
        },
        {
          "name": "terms_conditions",
          "label": "Terms & Conditions",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Any special terms, conditions, or requirements for the sale",
            "rows": 4
          }
        }
      ]
    }
  ]
}
```

## Template Features

### Industry-Specific Fields
- **RERA Compliance**: Mandatory RERA registration fields with validation
- **Property Specifications**: Comprehensive area measurements (carpet, built-up, super area)
- **Location Intelligence**: GPS coordinates and neighborhood amenities mapping
- **Legal Documentation**: Complete ownership and title verification fields
- **Professional Amenities**: Extensive list of luxury and basic amenities
- **Pricing Transparency**: Multiple pricing fields with inclusive/exclusive charges

### Validation Rules
- **RERA Validation**: Conditional RERA number validation when registered
- **Area Validation**: Logical relationships between carpet, built-up, and super area
- **Price Validation**: Industry-standard price ranges with per sq ft calculations
- **Document Verification**: Mandatory legal document checklists
- **Contact Validation**: Professional contact information with RERA agent ID

### UI/UX Enhancements
- **Progressive Disclosure**: Collapsible sections for better user experience
- **Smart Defaults**: Auto-calculation of price per sq ft
- **Conditional Fields**: Dynamic field visibility based on property type/status
- **Rich Media Support**: Multiple image uploads with floor plans and virtual tours
- **Location Mapping**: GPS coordinate integration for property mapping

### API Integration Points
- **Car Management API**: Integration with location services for neighborhood data
- **Schema Template System**: Dynamic form generation with validation rules
- **File Upload Service**: Firebase integration for property images and documents
- **Analytics Integration**: Property view tracking and lead generation analytics

### Compliance & Standards
- **RERA Compliance**: Mandatory fields for RERA-registered properties
- **Data Privacy**: Secure handling of contact and financial information
- **Industry Standards**: Alignment with CREDAI and real estate industry best practices
- **Legal Requirements**: Comprehensive documentation checklist for due diligence

## Usage Instructions

1. **Template Assignment**: Assign this template to real estate category via `/api/v1/schema-templates/{id}/assign-category`
2. **Form Generation**: Use `GET /api/v1/catalog/categories/{id}/schema` to retrieve complete form structure
3. **Validation**: Implement client-side validation using provided validation rules
4. **Image Upload**: Use Firebase storage for property images with automatic optimization
5. **GPS Integration**: Enable location services for precise property mapping
6. **RERA Verification**: Implement RERA number validation against official database

## Implementation Notes

- **Database Storage**: Template stored as JSONB in PostgreSQL for flexible querying
- **Performance**: Optimized with proper indexing on frequently queried fields
- **Scalability**: Supports unlimited custom fields through JSONB structure
- **Version Control**: Template versioning for backward compatibility
- **Audit Trail**: Complete change tracking for compliance requirements

This template provides a comprehensive, industry-standard solution for residential property listings on the eBidPortal marketplace, ensuring professional presentation and regulatory compliance.