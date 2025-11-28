# Professional Lands & Plots For Sale Template for eBidPortal

**Template Name:** Lands & Plots For Sale Template
**Version:** 1.0
**Category Type:** real_estate_land
**Created:** November 21, 2025
**Industry Standards:** Based on land and real estate development industry standards (land records, zoning regulations, development approvals)

## Template JSON Structure

```json
{
  "name": "Lands & Plots For Sale Template",
  "description": "Comprehensive template for land and plot sales including residential plots, commercial land, agricultural land, industrial plots, and development sites. Includes land specifications, legal documentation, development approvals, and professional marketing features.",
  "category_type": "real_estate_land",
  "is_active": true,
  "sections": [
    {
      "title": "Land/Plot Information",
      "order": 1,
      "description": "Basic land or plot details and specifications",
      "is_collapsible": false,
      "fields": [
        {
          "name": "property_title",
          "label": "Property Title",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:15", "max_length:120"],
          "ui_config": {
            "placeholder": "e.g., Prime Residential Plot in Mumbai Suburban - 2000 Sq Yds - DTCP Approved",
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
              {"value": "residential_plot", "label": "Residential Plot"},
              {"value": "commercial_land", "label": "Commercial Land"},
              {"value": "industrial_plot", "label": "Industrial Plot"},
              {"value": "agricultural_land", "label": "Agricultural Land"},
              {"value": "mixed_use_land", "label": "Mixed Use Land"},
              {"value": "institutional_land", "label": "Institutional Land"},
              {"value": "recreational_land", "label": "Recreational Land"},
              {"value": "development_site", "label": "Development Site"},
              {"value": "farm_land", "label": "Farm Land"},
              {"value": "plantation_land", "label": "Plantation Land"}
            ],
            "placeholder": "Select the property type"
          }
        },
        {
          "name": "land_status",
          "label": "Land Status",
          "type": "radio",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "approved_plot", "label": "Approved Plot"},
              {"value": "dtcp_approved", "label": "DTCP/TCP Approved"},
              {"value": "bda_approved", "label": "BDA/KMDA Approved"},
              {"value": "conversion_pending", "label": "Conversion Pending"},
              {"value": "agricultural_land", "label": "Agricultural Land"},
              {"value": "na_plot", "label": "NA Plot"}
            ]
          }
        },
        {
          "name": "zoning_type",
          "label": "Zoning Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "residential", "label": "Residential"},
              {"value": "commercial", "label": "Commercial"},
              {"value": "industrial", "label": "Industrial"},
              {"value": "mixed_use", "label": "Mixed Use"},
              {"value": "agricultural", "label": "Agricultural"},
              {"value": "green_belt", "label": "Green Belt"},
              {"value": "special_economic_zone", "label": "Special Economic Zone"},
              {"value": "institutional", "label": "Institutional"}
            ],
            "helpText": "Current zoning classification of the land"
          }
        },
        {
          "name": "development_status",
          "label": "Development Status",
          "type": "radio",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "developed", "label": "Developed"},
              {"value": "semi_developed", "label": "Semi-Developed"},
              {"value": "undeveloped", "label": "Undeveloped"},
              {"value": "corner_plot", "label": "Corner Plot"},
              {"value": "road_facing", "label": "Road Facing"}
            ]
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
            "placeholder": "Complete property address including landmark and survey numbers",
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
            "placeholder": "e.g., Bangalore"
          }
        },
        {
          "name": "locality",
          "label": "Locality/Area",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:50"],
          "ui_config": {
            "placeholder": "e.g., Whitefield"
          }
        },
        {
          "name": "pincode",
          "label": "Pincode",
          "type": "text",
          "required": true,
          "validation": ["required", "pattern:^[0-9]{6}$"],
          "ui_config": {
            "placeholder": "e.g., 560066"
          }
        },
        {
          "name": "survey_number",
          "label": "Survey Number",
          "type": "text",
          "required": false,
          "validation": ["max_length:50"],
          "ui_config": {
            "placeholder": "e.g., 123/1, 456/2A",
            "helpText": "Official survey number of the land"
          }
        },
        {
          "name": "landmark",
          "label": "Nearby Landmark",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "e.g., Near ITPL, Whitefield Main Road"
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
          "name": "road_access",
          "label": "Road Access",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "national_highway", "label": "National Highway"},
              {"value": "state_highway", "label": "State Highway"},
              {"value": "main_road", "label": "Main Road"},
              {"value": "service_road", "label": "Service Road"},
              {"value": "village_road", "label": "Village Road"},
              {"value": "tarred_road", "label": "Tarred Road"},
              {"value": "concrete_road", "label": "Concrete Road"}
            ],
            "multiple": true,
            "helpText": "Type of road access available"
          }
        }
      ]
    },
    {
      "title": "Land Specifications",
      "order": 3,
      "description": "Detailed land measurements and specifications",
      "is_collapsible": false,
      "fields": [
        {
          "name": "plot_area",
          "label": "Plot Area (Sq Yds)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:100", "max:100000"],
          "ui_config": {
            "placeholder": "e.g., 2400",
            "helpText": "Total plot area in square yards"
          }
        },
        {
          "name": "plot_area_sqft",
          "label": "Plot Area (Sq Ft)",
          "type": "number",
          "required": false,
          "validation": ["min:1000", "max:10000000"],
          "ui_config": {
            "placeholder": "e.g., 21600",
            "helpText": "Automatically calculated from square yards"
          }
        },
        {
          "name": "plot_area_sqmt",
          "label": "Plot Area (Sq Mt)",
          "type": "number",
          "required": false,
          "validation": ["min:100", "max:1000000"],
          "ui_config": {
            "placeholder": "e.g., 2007",
            "helpText": "Automatically calculated from square yards"
          }
        },
        {
          "name": "plot_dimensions",
          "label": "Plot Dimensions (Length x Width)",
          "type": "text",
          "required": false,
          "validation": ["max_length:50"],
          "ui_config": {
            "placeholder": "e.g., 120 ft x 180 ft",
            "helpText": "Dimensions in feet or meters"
          }
        },
        {
          "name": "frontage_feet",
          "label": "Frontage (Feet)",
          "type": "number",
          "required": false,
          "validation": ["min:10", "max:1000"],
          "ui_config": {
            "placeholder": "e.g., 120",
            "helpText": "Road frontage in feet"
          }
        },
        {
          "name": "depth_feet",
          "label": "Depth (Feet)",
          "type": "number",
          "required": false,
          "validation": ["min:10", "max:1000"],
          "ui_config": {
            "placeholder": "e.g., 180",
            "helpText": "Plot depth in feet"
          }
        },
        {
          "name": "topography",
          "label": "Topography",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "flat", "label": "Flat"},
              {"value": "sloping", "label": "Sloping"},
              {"value": "hilly", "label": "Hilly"},
              {"value": "undulating", "label": "Undulating"},
              {"value": "rocky", "label": "Rocky"},
              {"value": "waterfront", "label": "Waterfront"}
            ],
            "helpText": "Terrain characteristics of the land"
          }
        },
        {
          "name": "soil_type",
          "label": "Soil Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "red_soil", "label": "Red Soil"},
              {"value": "black_soil", "label": "Black Soil"},
              {"value": "laterite_soil", "label": "Laterite Soil"},
              {"value": "alluvial_soil", "label": "Alluvial Soil"},
              {"value": "sandy_soil", "label": "Sandy Soil"},
              {"value": "clay_soil", "label": "Clay Soil"},
              {"value": "mixed_soil", "label": "Mixed Soil"}
            ],
            "helpText": "Type of soil (relevant for agricultural land)"
          }
        },
        {
          "name": "water_source",
          "label": "Water Source",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "borewell", "label": "Borewell"},
              {"value": "well", "label": "Open Well"},
              {"value": "river", "label": "River/Canal"},
              {"value": "lake", "label": "Lake/Pond"},
              {"value": "municipal_water", "label": "Municipal Water"},
              {"value": "rainwater_harvesting", "label": "Rainwater Harvesting"}
            ],
            "multiple": true,
            "helpText": "Available water sources on or near the property"
          }
        },
        {
          "name": "boundaries",
          "label": "Boundary Status",
          "type": "radio",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "fenced", "label": "Fenced"},
              {"value": "compound_wall", "label": "Compound Wall"},
              {"value": "marked_boundaries", "label": "Marked Boundaries"},
              {"value": "no_boundaries", "label": "No Clear Boundaries"}
            ]
          }
        }
      ]
    },
    {
      "title": "Development & Infrastructure",
      "order": 4,
      "description": "Development status and infrastructure availability",
      "is_collapsible": true,
      "fields": [
        {
          "name": "utilities_available",
          "label": "Utilities Available",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "electricity", "label": "Electricity"},
              {"value": "water_connection", "label": "Water Connection"},
              {"value": "sewage_connection", "label": "Sewage Connection"},
              {"value": "gas_pipeline", "label": "Gas Pipeline"},
              {"value": "telephone_line", "label": "Telephone Line"},
              {"value": "internet_cable", "label": "Internet/Cable"},
              {"value": "street_lighting", "label": "Street Lighting"}
            ],
            "multiple": true,
            "helpText": "Utilities and services available or connected"
          }
        },
        {
          "name": "nearby_facilities",
          "label": "Nearby Facilities",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "school", "label": "School"},
              {"value": "hospital", "label": "Hospital"},
              {"value": "shopping_center", "label": "Shopping Center"},
              {"value": "bank_atm", "label": "Bank/ATM"},
              {"value": "petrol_pump", "label": "Petrol Pump"},
              {"value": "police_station", "label": "Police Station"},
              {"value": "fire_station", "label": "Fire Station"},
              {"value": "post_office", "label": "Post Office"},
              {"value": "railway_station", "label": "Railway Station"},
              {"value": "airport", "label": "Airport"},
              {"value": "highway", "label": "Highway"},
              {"value": "industrial_area", "label": "Industrial Area"}
            ],
            "multiple": true,
            "helpText": "Facilities and amenities within 5-10 km radius"
          }
        },
        {
          "name": "approved_layout",
          "label": "Approved Layout",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Does the land have approved layout plan?"
          }
        },
        {
          "name": "building_permission",
          "label": "Building Permission",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Is building permission available?"
          }
        },
        {
          "name": "construction_allowed",
          "label": "Construction Allowed",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Is construction allowed on this land?"
          }
        },
        {
          "name": "floors_allowed",
          "label": "Floors Allowed",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:50"],
          "ui_config": {
            "placeholder": "e.g., 4",
            "helpText": "Maximum number of floors permitted"
          }
        },
        {
          "name": "setback_requirements",
          "label": "Setback Requirements",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "e.g., Front: 15ft, Side: 10ft, Rear: 15ft",
            "helpText": "Building setback requirements from boundaries"
          }
        },
        {
          "name": "permissible_fsi",
          "label": "Permissible FSI/FAR",
          "type": "number",
          "required": false,
          "validation": ["min:0.1", "max:10"],
          "ui_config": {
            "step": "0.1",
            "placeholder": "e.g., 2.5",
            "helpText": "Floor Space Index/Floor Area Ratio allowed"
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
          "name": "total_price",
          "label": "Total Price (₹)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:100000", "max:10000000000"],
          "ui_config": {
            "placeholder": "e.g., 24000000",
            "helpText": "Total sale price in Indian Rupees"
          }
        },
        {
          "name": "price_per_sqyd",
          "label": "Price per Sq Yd (₹)",
          "type": "number",
          "required": false,
          "validation": ["min:100", "max:100000"],
          "ui_config": {
            "placeholder": "e.g., 10000",
            "helpText": "Automatically calculated from total price and area"
          }
        },
        {
          "name": "price_per_sqft",
          "label": "Price per Sq Ft (₹)",
          "type": "number",
          "required": false,
          "validation": ["min:50", "max:50000"],
          "ui_config": {
            "placeholder": "e.g., 926",
            "helpText": "Automatically calculated from total price and area"
          }
        },
        {
          "name": "booking_amount",
          "label": "Booking Amount (₹)",
          "type": "number",
          "required": false,
          "validation": ["min:10000", "max:10000000"],
          "ui_config": {
            "placeholder": "e.g., 500000",
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
              {"value": "government_land", "label": "Government Land"},
              {"value": "cooperative", "label": "Cooperative Society"},
              {"value": "power_of_attorney", "label": "Power of Attorney"}
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
          "name": "approved_plan_available",
          "label": "Approved Plan Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Is the approved development plan available?"
          }
        },
        {
          "name": "patta_chitta_available",
          "label": "Patta/Chitta Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Are Patta/Chitta documents available?"
          }
        },
        {
          "name": "tax_paid_upto",
          "label": "Property Tax Paid Upto",
          "type": "date",
          "required": false,
          "ui_config": {
            "helpText": "Date upto which property tax has been paid"
          }
        },
        {
          "name": "land_conversion_done",
          "label": "Land Conversion Done",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Has land use conversion been completed?"
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
              {"value": "patta_chitta", "label": "Patta/Chitta"},
              {"value": "encumbrance_certificate", "label": "Encumbrance Certificate"},
              {"value": "tax_receipt", "label": "Property Tax Receipt"},
              {"value": "approved_plan", "label": "Approved Development Plan"},
              {"value": "conversion_order", "label": "Conversion Order"},
              {"value": "survey_sketch", "label": "Survey Sketch"},
              {"value": "fmb_sketch", "label": "FMB Sketch"},
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
      "description": "Property photographs, maps, and site plans",
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
            "helpText": "Upload high-quality images of the land/plot (minimum 3 images required)",
            "acceptedTypes": "image/*",
            "maxFiles": 20
          }
        },
        {
          "name": "site_plan",
          "label": "Site Plan/Layout Plan",
          "type": "file",
          "required": false,
          "validation": ["file_types:image/jpeg,image/png,image/webp,application/pdf", "max_files:5", "max_file_size:10MB"],
          "ui_config": {
            "multiple": true,
            "helpText": "Upload site plan, layout plan, or development plan",
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
          "name": "survey_map",
          "label": "Survey Map",
          "type": "file",
          "required": false,
          "validation": ["file_types:image/jpeg,image/png,image/webp,application/pdf", "max_files:3", "max_file_size:10MB"],
          "ui_config": {
            "multiple": true,
            "helpText": "Upload survey maps and boundary sketches",
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
          "name": "available_for_site_visit",
          "label": "Available for Site Visit",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Can arrange property visits and site inspections?"
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
            "placeholder": "Detailed description of the land/plot, its features, surrounding development, and unique selling points...",
            "rows": 6,
            "helpText": "Provide a compelling description highlighting the property's best features"
          }
        },
        {
          "name": "development_potential",
          "label": "Development Potential",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Describe development potential, permissible construction, future prospects",
            "rows": 3
          }
        },
        {
          "name": "nearby_developments",
          "label": "Nearby Developments",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Mention upcoming projects, infrastructure developments, and growth drivers",
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
            "placeholder": "Describe rental potential, appreciation prospects, and ROI expectations",
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
            "placeholder": "Any special features like waterfront, hill view, heritage value, etc.",
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
- **Land Specifications**: Comprehensive area measurements, dimensions, topography, soil types
- **Development Approvals**: DTCP/TCP approvals, zoning, building permissions, FSI/FAR
- **Legal Documentation**: Patta/Chitta, survey numbers, encumbrance certificates, conversion orders
- **Infrastructure**: Utilities, road access, nearby facilities, development potential
- **Investment Metrics**: Price per sq yd/ft calculations, development potential analysis

### Validation Rules
- **Area Calculations**: Automatic conversions between sq yd, sq ft, and sq mt
- **Price Validations**: Industry-standard pricing ranges with per unit calculations
- **Legal Requirements**: Mandatory clear title and encumbrance-free certifications
- **Development Compliance**: Zoning and approval status validations

### UI/UX Enhancements
- **Progressive Disclosure**: Collapsible sections for better user experience
- **Smart Calculations**: Automatic price per unit calculations
- **Conditional Fields**: Dynamic field visibility based on land type and development status
- **Rich Media Support**: Multiple image uploads with maps, site plans, and survey documents
- **Location Mapping**: GPS coordinate integration for precise land mapping

### API Integration Points
- **Car Management API**: Integration with location services for neighborhood data
- **Schema Template System**: Dynamic form generation with validation rules
- **File Upload Service**: Firebase integration for property images and documents
- **Analytics Integration**: Property view tracking and lead generation analytics

### Compliance & Standards
- **Land Records**: Compliance with survey numbers, patta/chitta documentation
- **Development Regulations**: DTCP/TCP approvals, zoning compliance, building permissions
- **Legal Requirements**: Clear title verification, encumbrance certificates, conversion orders
- **Industry Standards**: Alignment with real estate development and land sales best practices
- **Regulatory Compliance**: RERA agent registration and land transaction regulations

## Usage Instructions

1. **Template Assignment**: Assign this template to land/plots category via `/api/v1/schema-templates/{id}/assign-category`
2. **Form Generation**: Use `GET /api/v1/catalog/categories/{id}/schema` to retrieve complete form structure
3. **Validation**: Implement client-side validation using provided validation rules
4. **Image Upload**: Use Firebase storage for property images with automatic optimization
5. **GPS Integration**: Enable location services for precise land mapping
6. **Document Verification**: Implement legal document validation against official records
7. **Area Calculations**: Auto-calculate price per sq yd/ft and area conversions

## Implementation Notes

- **Database Storage**: Template stored as JSONB in PostgreSQL for flexible querying
- **Performance**: Optimized with proper indexing on frequently queried fields
- **Scalability**: Supports unlimited custom fields through JSONB structure
- **Version Control**: Template versioning for backward compatibility
- **Audit Trail**: Complete change tracking for compliance requirements

This template provides a comprehensive, industry-standard solution for land and plot sales on the eBidPortal marketplace, ensuring professional presentation and regulatory compliance for land transactions.