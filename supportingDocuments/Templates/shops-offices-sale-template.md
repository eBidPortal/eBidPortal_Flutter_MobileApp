# Professional Shops & Offices For Sale Template for eBidPortal

**Template Name:** Shops & Offices For Sale Template
**Version:** 1.0
**Category Type:** real_estate_commercial_sale
**Created:** November 21, 2025
**Industry Standards:** Based on commercial real estate sales industry standards (property valuations, commercial property regulations, business occupancy requirements)

## Template JSON Structure

```json
{
  "name": "Shops & Offices For Sale Template",
  "description": "Comprehensive template for commercial property sales including retail shops, office spaces, showrooms, and commercial establishments. Includes sales pricing, property specifications, business suitability, and professional sales features.",
  "category_type": "real_estate_commercial_sale",
  "is_active": true,
  "sections": [
    {
      "title": "Property Information",
      "order": 1,
      "description": "Basic commercial property details and specifications",
      "is_collapsible": false,
      "fields": [
        {
          "name": "property_title",
          "label": "Property Title",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:15", "max_length:120"],
          "ui_config": {
            "placeholder": "e.g., Prime Commercial Shop in Business District - 2500 Sq Ft - High ROI Investment",
            "helpText": "Create an attractive title highlighting key features and investment potential"
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
              {"value": "retail_shop", "label": "Retail Shop"},
              {"value": "office_space", "label": "Office Space"},
              {"value": "showroom", "label": "Showroom"},
              {"value": "commercial_space", "label": "Commercial Space"},
              {"value": "restaurant_space", "label": "Restaurant Space"},
              {"value": "warehouse_space", "label": "Warehouse Space"},
              {"value": "godown", "label": "Godown"},
              {"value": "industrial_shed", "label": "Industrial Shed"},
              {"value": "co_working_space", "label": "Co-Working Space"},
              {"value": "clinic_space", "label": "Clinic/Salon Space"},
              {"value": "commercial_plot", "label": "Commercial Plot"},
              {"value": "office_building", "label": "Office Building"}
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
              {"value": "shell_condition", "label": "Shell & Core"},
              {"value": "bare_shell", "label": "Bare Shell"},
              {"value": "occupied", "label": "Tenanted"}
            ]
          }
        },
        {
          "name": "building_type",
          "label": "Building Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "standalone", "label": "Standalone Building"},
              {"value": "mall", "label": "Shopping Mall"},
              {"value": "commercial_complex", "label": "Commercial Complex"},
              {"value": "office_building", "label": "Office Building"},
              {"value": "high_street", "label": "High Street Retail"},
              {"value": "residential_commercial", "label": "Residential Commercial"},
              {"value": "industrial_estate", "label": "Industrial Estate"},
              {"value": "it_park", "label": "IT Park/SEZ"},
              {"value": "business_park", "label": "Business Park"}
            ],
            "helpText": "Type of building or complex where the property is located"
          }
        },
        {
          "name": "floor_location",
          "label": "Floor Location",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "ground_floor", "label": "Ground Floor"},
              {"value": "first_floor", "label": "First Floor"},
              {"value": "second_floor", "label": "Second Floor"},
              {"value": "third_floor", "label": "Third Floor"},
              {"value": "fourth_floor", "label": "Fourth Floor"},
              {"value": "fifth_floor", "label": "Fifth Floor"},
              {"value": "basement", "label": "Basement"},
              {"value": "mezzanine", "label": "Mezzanine"},
              {"value": "multiple_floors", "label": "Multiple Floors"},
              {"value": "entire_building", "label": "Entire Building"}
            ],
            "helpText": "Floor level of the property"
          }
        },
        {
          "name": "construction_year",
          "label": "Year of Construction",
          "type": "number",
          "required": false,
          "validation": ["min:1900", "max:2030"],
          "ui_config": {
            "placeholder": "e.g., 2018",
            "helpText": "Year when the building was constructed"
          }
        },
        {
          "name": "age_of_property",
          "label": "Age of Property",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "new", "label": "New Construction (0-2 years)"},
              {"value": "moderately_old", "label": "3-10 years"},
              {"value": "old", "label": "11-20 years"},
              {"value": "very_old", "label": "20+ years"}
            ],
            "helpText": "Approximate age category of the property"
          }
        }
      ]
    },
    {
      "title": "Location & Accessibility",
      "order": 2,
      "description": "Property location and accessibility information",
      "is_collapsible": false,
      "fields": [
        {
          "name": "property_address",
          "label": "Property Address",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:20", "max_length:500"],
          "ui_config": {
            "placeholder": "Complete property address including landmark and nearby attractions",
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
            "placeholder": "e.g., Bandra West, Connaught Place"
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
            "placeholder": "e.g., Near Metro Station, Opposite Corporate Park"
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
          "name": "footfall_density",
          "label": "Footfall Density",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "very_high", "label": "Very High (Mall/CBD)"},
              {"value": "high", "label": "High (Commercial Hub)"},
              {"value": "medium", "label": "Medium (Mixed Use)"},
              {"value": "low", "label": "Low (Industrial/Remote)"}
            ],
            "helpText": "Expected customer/employee footfall in the area"
          }
        },
        {
          "name": "parking_available",
          "label": "Parking Available",
          "type": "radio",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "dedicated", "label": "Dedicated Parking"},
              {"value": "shared", "label": "Shared Parking"},
              {"value": "street_parking", "label": "Street Parking"},
              {"value": "multi_level", "label": "Multi-Level Parking"},
              {"value": "no_parking", "label": "No Parking"}
            ]
          }
        },
        {
          "name": "connectivity",
          "label": "Connectivity",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "metro", "label": "Metro Station"},
              {"value": "railway", "label": "Railway Station"},
              {"value": "airport", "label": "Airport"},
              {"value": "bus_stand", "label": "Bus Stand"},
              {"value": "highway", "label": "Highway"},
              {"value": "port", "label": "Port"}
            ],
            "multiple": true,
            "helpText": "Nearby transportation connectivity"
          }
        }
      ]
    },
    {
      "title": "Property Specifications",
      "order": 3,
      "description": "Detailed property measurements and specifications",
      "is_collapsible": false,
      "fields": [
        {
          "name": "carpet_area",
          "label": "Carpet Area (Sq Ft)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:100", "max:100000"],
          "ui_config": {
            "placeholder": "e.g., 2500",
            "helpText": "Usable carpet area in square feet"
          }
        },
        {
          "name": "built_up_area",
          "label": "Built-up Area (Sq Ft)",
          "type": "number",
          "required": false,
          "validation": ["min:100", "max:100000"],
          "ui_config": {
            "placeholder": "e.g., 2750",
            "helpText": "Total built-up area including walls"
          }
        },
        {
          "name": "super_area",
          "label": "Super Area (Sq Ft)",
          "type": "number",
          "required": false,
          "validation": ["min:100", "max:100000"],
          "ui_config": {
            "placeholder": "e.g., 3000",
            "helpText": "Super area including common areas"
          }
        },
        {
          "name": "ceiling_height",
          "label": "Ceiling Height (Feet)",
          "type": "number",
          "required": false,
          "validation": ["min:8", "max:50"],
          "ui_config": {
            "placeholder": "e.g., 12",
            "helpText": "Height from floor to ceiling"
          }
        },
        {
          "name": "frontage_feet",
          "label": "Frontage (Feet)",
          "type": "number",
          "required": false,
          "validation": ["min:5", "max:200"],
          "ui_config": {
            "placeholder": "e.g., 30",
            "helpText": "Road frontage width in feet"
          }
        },
        {
          "name": "depth_feet",
          "label": "Depth (Feet)",
          "type": "number",
          "required": false,
          "validation": ["min:10", "max:500"],
          "ui_config": {
            "placeholder": "e.g., 85",
            "helpText": "Property depth in feet"
          }
        },
        {
          "name": "layout_type",
          "label": "Layout Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "open_plan", "label": "Open Plan"},
              {"value": "partitioned", "label": "Partitioned"},
              {"value": "cabin_system", "label": "Cabin System"},
              {"value": "retail_layout", "label": "Retail Layout"},
              {"value": "warehouse_layout", "label": "Warehouse Layout"},
              {"value": "flexible", "label": "Flexible Layout"}
            ],
            "helpText": "Current interior layout configuration"
          }
        },
        {
          "name": "entrance_doors",
          "label": "Entrance Doors",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:10"],
          "ui_config": {
            "placeholder": "e.g., 2",
            "helpText": "Number of entrance/exit doors"
          }
        },
        {
          "name": "power_backup",
          "label": "Power Backup",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "full_backup", "label": "Full Power Backup"},
              {"value": "partial_backup", "label": "Partial Backup"},
              {"value": "generator", "label": "Generator Available"},
              {"value": "no_backup", "label": "No Backup"}
            ],
            "helpText": "Power backup availability and capacity"
          }
        },
        {
          "name": "power_load",
          "label": "Power Load (KVA)",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:1000"],
          "ui_config": {
            "placeholder": "e.g., 25",
            "helpText": "Sanctioned electrical power load"
          }
        }
      ]
    },
    {
      "title": "Pricing & Financial Details",
      "order": 4,
      "description": "Property pricing and financial information",
      "is_collapsible": false,
      "fields": [
        {
          "name": "sale_price",
          "label": "Sale Price (₹)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:100000", "max:10000000000"],
          "ui_config": {
            "placeholder": "e.g., 75000000",
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
            "placeholder": "e.g., 30000",
            "helpText": "Automatically calculated from sale price and area"
          }
        },
        {
          "name": "booking_amount",
          "label": "Booking Amount (₹)",
          "type": "number",
          "required": false,
          "validation": ["min:10000", "max:10000000"],
          "ui_config": {
            "placeholder": "e.g., 1000000",
            "helpText": "Initial booking amount required"
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
          "name": "payment_terms",
          "label": "Payment Terms",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Describe payment schedule, milestones, and accepted payment methods",
            "rows": 3
          }
        },
        {
          "name": "registry_charges_included",
          "label": "Registry Charges Included",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Are stamp duty and registration charges included in the price?"
          }
        },
        {
          "name": "taxes_included",
          "label": "Taxes Included",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Are property taxes included in the price?"
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
        },
        {
          "name": "expected_roi",
          "label": "Expected ROI (%)",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:50"],
          "ui_config": {
            "step": "0.5",
            "placeholder": "e.g., 8.5",
            "helpText": "Expected return on investment percentage"
          }
        },
        {
          "name": "current_rental_income",
          "label": "Current Rental Income (₹)",
          "type": "number",
          "required": false,
          "validation": ["min:0", "max:10000000"],
          "ui_config": {
            "placeholder": "e.g., 150000",
            "helpText": "Current monthly rental income if tenanted"
          }
        },
        {
          "name": "rental_yield",
          "label": "Rental Yield (%)",
          "type": "number",
          "required": false,
          "validation": ["min:0", "max:20"],
          "ui_config": {
            "step": "0.1",
            "placeholder": "e.g., 6.2",
            "helpText": "Annual rental yield percentage"
          }
        }
      ]
    },
    {
      "title": "Business Suitability & Amenities",
      "order": 5,
      "description": "Business suitability and available amenities",
      "is_collapsible": true,
      "fields": [
        {
          "name": "suitable_businesses",
          "label": "Suitable For",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "retail_store", "label": "Retail Store"},
              {"value": "restaurant_cafe", "label": "Restaurant/Cafe"},
              {"value": "office", "label": "Office"},
              {"value": "clinic_hospital", "label": "Clinic/Hospital"},
              {"value": "salon_spa", "label": "Salon/Spa"},
              {"value": "showroom", "label": "Showroom"},
              {"value": "coaching_classes", "label": "Coaching Classes"},
              {"value": "consulting_office", "label": "Consulting Office"},
              {"value": "it_office", "label": "IT Office"},
              {"value": "call_center", "label": "Call Center"},
              {"value": "warehouse", "label": "Warehouse"},
              {"value": "manufacturing", "label": "Manufacturing"},
              {"value": "investment", "label": "Investment"}
            ],
            "multiple": true,
            "helpText": "Types of businesses suitable for this property"
          }
        },
        {
          "name": "amenities_available",
          "label": "Amenities Available",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "air_conditioning", "label": "Air Conditioning"},
              {"value": "lift_elevator", "label": "Lift/Elevator"},
              {"value": "security_24x7", "label": "24x7 Security"},
              {"value": "fire_safety", "label": "Fire Safety Systems"},
              {"value": "reception_area", "label": "Reception Area"},
              {"value": "pantry", "label": "Pantry/Kitchen"},
              {"value": "conference_room", "label": "Conference Room"},
              {"value": "storage_space", "label": "Storage Space"},
              {"value": "loading_dock", "label": "Loading Dock"},
              {"value": "ramp_access", "label": "Ramp Access"},
              {"value": "high_speed_internet", "label": "High-Speed Internet"},
              {"value": "backup_power", "label": "Power Backup"},
              {"value": "cctv", "label": "CCTV Surveillance"},
              {"value": "housekeeping", "label": "Housekeeping"},
              {"value": "maintenance_staff", "label": "Maintenance Staff"},
              {"value": "backup_water", "label": "Water Backup"},
              {"value": "waste_management", "label": "Waste Management"}
            ],
            "multiple": true,
            "helpText": "Amenities and facilities available in the property"
          }
        },
        {
          "name": "furnishing_status",
          "label": "Furnishing Status",
          "type": "radio",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "fully_furnished", "label": "Fully Furnished"},
              {"value": "semi_furnished", "label": "Semi-Furnished"},
              {"value": "bare_shell", "label": "Bare Shell"},
              {"value": "basic_fitting", "label": "Basic Fitting Out"},
              {"value": "plug_play", "label": "Plug & Play"}
            ]
          }
        },
        {
          "name": "business_hours",
          "label": "Permitted Business Hours",
          "type": "text",
          "required": false,
          "validation": ["max_length:50"],
          "ui_config": {
            "placeholder": "e.g., 9 AM - 9 PM, 24x7",
            "helpText": "Permitted operating hours for business"
          }
        },
        {
          "name": "restrictions",
          "label": "Business Restrictions",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "Any restrictions on type of business, noise levels, etc.",
            "rows": 2
          }
        },
        {
          "name": "tenancy_status",
          "label": "Current Tenancy Status",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "vacant", "label": "Vacant"},
              {"value": "single_tenant", "label": "Single Tenant"},
              {"value": "multi_tenant", "label": "Multi-Tenant"},
              {"value": "owner_occupied", "label": "Owner Occupied"}
            ],
            "helpText": "Current occupancy status of the property"
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
              {"value": "power_of_attorney", "label": "Power of Attorney"},
              {"value": "cooperative", "label": "Cooperative Society"}
            ]
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
          "name": "encumbrance_free",
          "label": "Encumbrance Free",
          "type": "boolean",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "helpText": "Is the land free from any encumbrances?"
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
          "name": "property_tax_paid",
          "label": "Property Tax Paid Upto",
          "type": "date",
          "required": false,
          "ui_config": {
            "helpText": "Date upto which property tax has been paid"
          }
        },
        {
          "name": "building_approval",
          "label": "Building Approval",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Does the building have proper construction approvals?"
          }
        },
        {
          "name": "fire_safety_certificate",
          "label": "Fire Safety Certificate",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Is fire safety certificate available?"
          }
        },
        {
          "name": "occupancy_certificate",
          "label": "Occupancy Certificate",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Is occupancy certificate available?"
          }
        },
        {
          "name": "rera_registered",
          "label": "RERA Registered",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Is the property RERA registered?"
          }
        },
        {
          "name": "approved_plan_available",
          "label": "Approved Plan Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Is the approved development plan available?"
          }
        },
        {
          "name": "available_documents",
          "label": "Available Documents",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "sale_deed", "label": "Sale Deed"},
              {"value": "property_tax_receipt", "label": "Property Tax Receipt"},
              {"value": "building_approval", "label": "Building Approval"},
              {"value": "fire_safety_cert", "label": "Fire Safety Certificate"},
              {"value": "occupancy_cert", "label": "Occupancy Certificate"},
              {"value": "encumbrance_cert", "label": "Encumbrance Certificate"},
              {"value": "approved_plan", "label": "Approved Development Plan"},
              {"value": "khata_certificate", "label": "Khata Certificate"},
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
      "description": "Property photographs, floor plans, and media",
      "is_collapsible": true,
      "fields": [
        {
          "name": "property_images",
          "label": "Property Images",
          "type": "file",
          "required": true,
          "validation": ["required", "file_types:image/jpeg,image/png,image/webp", "max_files:25", "max_file_size:5MB"],
          "ui_config": {
            "multiple": true,
            "helpText": "Upload high-quality images of the property (minimum 5 images required)",
            "acceptedTypes": "image/*",
            "maxFiles": 25
          }
        },
        {
          "name": "floor_plan",
          "label": "Floor Plan/Layout",
          "type": "file",
          "required": false,
          "validation": ["file_types:image/jpeg,image/png,image/webp,application/pdf", "max_files:5", "max_file_size:10MB"],
          "ui_config": {
            "multiple": true,
            "helpText": "Upload floor plan, layout plan, or space configuration",
            "acceptedTypes": "image/*,.pdf"
          }
        },
        {
          "name": "location_map",
          "label": "Location Map",
          "type": "file",
          "required": false,
          "validation": ["file_types:image/jpeg,image/png,image/webp", "max_files:3", "max_file_size:5MB"],
          "ui_config": {
            "multiple": true,
            "helpText": "Upload maps showing property location and surroundings",
            "acceptedTypes": "image/*"
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
        },
        {
          "name": "brochure",
          "label": "Property Brochure",
          "type": "file",
          "required": false,
          "validation": ["file_types:application/pdf", "max_files:1", "max_file_size:10MB"],
          "ui_config": {
            "helpText": "Upload detailed property brochure or information document",
            "acceptedTypes": ".pdf"
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
            "placeholder": "e.g., Property Developer, Real Estate Agent"
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
            "placeholder": "e.g., ABC Commercial Properties Pvt Ltd"
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
          "name": "available_for_site_visit",
          "label": "Available for Site Visit",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Can arrange property visits and site inspections?"
          }
        },
        {
          "name": "negotiation_possible",
          "label": "Open to Negotiation",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Is the owner/agent open to price negotiation?"
          }
        }
      ]
    },
    {
      "title": "Additional Information",
      "order": 9,
      "description": "Additional property details and investment information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "property_description",
          "label": "Property Description",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:50", "max_length:2000"],
          "ui_config": {
            "placeholder": "Detailed description of the commercial property, its features, business potential, and unique selling points...",
            "rows": 6,
            "helpText": "Provide a compelling description highlighting investment advantages"
          }
        },
        {
          "name": "investment_potential",
          "label": "Investment Potential",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Describe investment potential, appreciation prospects, rental yield, and ROI expectations",
            "rows": 3
          }
        },
        {
          "name": "nearby_businesses",
          "label": "Nearby Businesses",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "Mention anchor stores, complementary businesses, and footfall drivers",
            "rows": 2
          }
        },
        {
          "name": "market_analysis",
          "label": "Market Analysis",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Brief market analysis, price trends, and future prospects",
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
            "placeholder": "Any special features like prime location, high visibility, parking, etc.",
            "rows": 3
          }
        },
        {
          "name": "terms_conditions",
          "label": "Additional Terms & Conditions",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Any additional terms, conditions, or special requirements",
            "rows": 4
          }
        },
        {
          "name": "possession_date",
          "label": "Possession Date",
          "type": "date",
          "required": false,
          "ui_config": {
            "helpText": "Expected date of possession/handover"
          }
        },
        {
          "name": "maintenance_cost",
          "label": "Annual Maintenance Cost (₹)",
          "type": "number",
          "required": false,
          "validation": ["min:0", "max:1000000"],
          "ui_config": {
            "placeholder": "e.g., 50000",
            "helpText": "Estimated annual maintenance and society charges"
          }
        }
      ]
    }
  ]
}
```

## Template Features

### Industry-Specific Fields
- **Commercial Property Types**: Retail shops, offices, showrooms, warehouses, industrial spaces
- **Sales Economics**: Sale price, per sq ft pricing, booking amounts, negotiation options
- **Investment Metrics**: ROI calculations, rental yield, current rental income
- **Business Suitability**: Operating hours, business restrictions, tenancy status
- **Legal Compliance**: Clear title, encumbrance certificates, RERA registration

### Validation Rules
- **Area Calculations**: Carpet, built-up, and super area validations
- **Pricing Validations**: Industry-standard commercial property pricing ranges
- **Investment Metrics**: ROI and rental yield percentage validations
- **Legal Requirements**: Mandatory clear title and encumbrance-free certifications
- **Business Compliance**: Operating hours and business type validations

### UI/UX Enhancements
- **Progressive Disclosure**: Collapsible sections for better user experience
- **Smart Calculations**: Automatic price per sq ft and ROI calculations
- **Investment Analytics**: Rental yield and ROI percentage displays
- **Rich Media Support**: Multiple images, floor plans, location maps, virtual tours
- **Business Filtering**: Suitable business types and tenancy status options

### API Integration Points
- **Car Management API**: Integration with location services for business area data
- **Schema Template System**: Dynamic form generation with validation rules
- **File Upload Service**: Firebase integration for property images and documents
- **Analytics Integration**: Property view tracking and investment lead generation

### Compliance & Standards
- **Commercial Property Sales**: Compliance with property sale regulations
- **Investment Disclosure**: ROI and rental yield transparency requirements
- **Legal Documentation**: Clear title verification and encumbrance certificates
- **RERA Compliance**: Real estate regulatory authority registration
- **Business Licensing**: Operating hours and business type compliance

## Usage Instructions

1. **Template Assignment**: Assign this template to shops & offices sale category via `/api/v1/schema-templates/{id}/assign-category`
2. **Form Generation**: Use `GET /api/v1/catalog/categories/{id}/schema` to retrieve complete form structure
3. **Validation**: Implement client-side validation using provided validation rules
4. **Image Upload**: Use Firebase storage for property images with automatic optimization
5. **GPS Integration**: Enable location services for precise commercial property mapping
6. **Investment Calculations**: Implement automatic ROI and rental yield calculations
7. **Business Filtering**: Enable filters for business type suitability and investment metrics

## Implementation Notes

- **Database Storage**: Template stored as JSONB in PostgreSQL for flexible querying
- **Performance**: Optimized with proper indexing on frequently queried fields
- **Scalability**: Supports unlimited custom fields through JSONB structure
- **Version Control**: Template versioning for backward compatibility
- **Audit Trail**: Complete change tracking for compliance requirements

This template provides a comprehensive, industry-standard solution for commercial property sales on the eBidPortal marketplace, ensuring professional presentation and regulatory compliance for commercial real estate transactions.