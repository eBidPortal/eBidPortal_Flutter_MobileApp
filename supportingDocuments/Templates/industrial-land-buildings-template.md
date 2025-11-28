# Professional Industrial Land & Buildings Template for eBidPortal

**Template Name:** Industrial Land & Buildings Template
**Version:** 1.0
**Category Type:** industrial_land_buildings
**Created:** November 21, 2025
**Industry Standards:** Based on industrial real estate standards (zoning regulations, environmental compliance, commercial leasing standards)

## Template JSON Structure

```json
{
  "name": "Industrial Land & Buildings Template",
  "description": "Comprehensive template for industrial land and buildings. Includes property specifications, zoning compliance, environmental factors, building infrastructure, and commercial real estate standards.",
  "category_type": "industrial_land_buildings",
  "is_active": true,
  "sections": [
    {
      "title": "Property Information",
      "order": 1,
      "description": "Basic property details and classification",
      "is_collapsible": false,
      "fields": [
        {
          "name": "property_title",
          "label": "Property Title",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:15", "max_length:120"],
          "ui_config": {
            "placeholder": "e.g., Prime Industrial Warehouse - 50,000 sq ft with Rail Access",
            "help_text": "Create an attractive title highlighting key features and location advantages"
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
              {"value": "industrial_warehouse", "label": "Industrial Warehouse"},
              {"value": "manufacturing_facility", "label": "Manufacturing Facility"},
              {"value": "distribution_center", "label": "Distribution Center"},
              {"value": "cold_storage", "label": "Cold Storage Facility"},
              {"value": "flex_industrial", "label": "Flex Industrial Space"},
              {"value": "industrial_land", "label": "Industrial Land"},
              {"value": "industrial_condo", "label": "Industrial Condominium"},
              {"value": "research_development", "label": "R&D Facility"}
            ]
          }
        },
        {
          "name": "property_name",
          "label": "Property Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3", "max_length:100"],
          "ui_config": {
            "placeholder": "Official property name (e.g., Metro Industrial Park Unit A)"
          }
        },
        {
          "name": "total_building_area",
          "label": "Total Building Area",
          "type": "number",
          "required": true,
          "validation": ["required", "min:500", "max:1000000"],
          "ui_config": {
            "placeholder": "Total building area in square feet",
            "suffix": "sq ft"
          }
        },
        {
          "name": "land_area",
          "label": "Land Area",
          "type": "number",
          "required": true,
          "validation": ["required", "min:1000", "max:10000000"],
          "ui_config": {
            "placeholder": "Total land area in square feet",
            "suffix": "sq ft"
          }
        },
        {
          "name": "zoning_classification",
          "label": "Zoning Classification",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "i1", "label": "I-1 (Light Industrial)"},
              {"value": "i2", "label": "I-2 (Heavy Industrial)"},
              {"value": "i3", "label": "I-3 (General Industrial)"},
              {"value": "m1", "label": "M-1 (Light Manufacturing)"},
              {"value": "m2", "label": "M-2 (Heavy Manufacturing)"},
              {"value": "m3", "label": "M-3 (Specialized Manufacturing)"},
              {"value": "pd", "label": "PD (Planned Development)"},
              {"value": "mixed_use", "label": "Mixed Use Industrial"}
            ]
          }
        },
        {
          "name": "year_built",
          "label": "Year Built",
          "type": "number",
          "required": false,
          "validation": ["min:1900", "max:2025"],
          "ui_config": {
            "placeholder": "Year the building was constructed"
          }
        },
        {
          "name": "last_renovated",
          "label": "Last Renovated",
          "type": "number",
          "required": false,
          "validation": ["min:1900", "max:2025"],
          "ui_config": {
            "placeholder": "Year of last major renovation"
          }
        }
      ]
    },
    {
      "title": "Location & Accessibility",
      "order": 2,
      "description": "Property location and transportation infrastructure",
      "is_collapsible": false,
      "fields": [
        {
          "name": "address_line_1",
          "label": "Address Line 1",
          "type": "textarea",
          "required": true,
          "validation": ["required", "max_length:200"],
          "ui_config": {
            "placeholder": "Street address, building name, industrial park name",
            "rows": 2
          }
        },
        {
          "name": "address_line_2",
          "label": "Address Line 2",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "Suite, unit, or additional location details"
          }
        },
        {
          "name": "city",
          "label": "City",
          "type": "text",
          "required": true,
          "validation": ["required", "max_length:50"],
          "ui_config": {
            "placeholder": "City name"
          }
        },
        {
          "name": "state",
          "label": "State",
          "type": "text",
          "required": true,
          "validation": ["required", "max_length:50"],
          "ui_config": {
            "placeholder": "State name"
          }
        },
        {
          "name": "pincode",
          "label": "Pincode",
          "type": "text",
          "required": true,
          "validation": ["required", "pattern:^\\d{6}$"],
          "ui_config": {
            "placeholder": "6-digit pincode"
          }
        },
        {
          "name": "gps_coordinates",
          "label": "GPS Coordinates",
          "type": "text",
          "required": false,
          "validation": ["pattern:^-?\\d{1,3}\\.\\d+,-?\\d{1,3}\\.\\d+$"],
          "ui_config": {
            "placeholder": "Latitude,Longitude (e.g., 19.0760,72.8777)",
            "help_text": "GPS coordinates for precise location mapping"
          }
        },
        {
          "name": "transportation_access",
          "label": "Transportation Access",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "highway_access", "label": "Highway/Major Road Access"},
              {"value": "rail_access", "label": "Rail Access"},
              {"value": "port_access", "label": "Port Access"},
              {"value": "airport_access", "label": "Airport Access"},
              {"value": "truck_routes", "label": "Major Truck Routes"},
              {"value": "public_transport", "label": "Public Transport Access"}
            ]
          }
        },
        {
          "name": "distance_to_highway",
          "label": "Distance to Highway",
          "type": "number",
          "required": false,
          "validation": ["min:0", "max:50"],
          "ui_config": {
            "placeholder": "Distance in kilometers",
            "suffix": "km"
          }
        },
        {
          "name": "nearest_rail_station",
          "label": "Nearest Rail Station",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "Name of nearest rail station or siding"
          }
        },
        {
          "name": "nearest_port",
          "label": "Nearest Port",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "Name of nearest port facility"
          }
        }
      ]
    },
    {
      "title": "Building Specifications",
      "order": 3,
      "description": "Detailed building construction and infrastructure specifications",
      "is_collapsible": false,
      "fields": [
        {
          "name": "building_structure",
          "label": "Building Structure",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "steel_frame", "label": "Steel Frame Construction"},
              {"value": "concrete_frame", "label": "Concrete Frame Construction"},
              {"value": "pre_engineered", "label": "Pre-Engineered Metal Building"},
              {"value": "masonry", "label": "Masonry Construction"},
              {"value": "tilt_up_concrete", "label": "Tilt-Up Concrete Panels"}
            ]
          }
        },
        {
          "name": "roof_type",
          "label": "Roof Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "gable", "label": "Gable Roof"},
              {"value": "flat", "label": "Flat Roof"},
              {"value": "sawtooth", "label": "Sawtooth Roof"},
              {"value": "monitor", "label": "Monitor Roof"},
              {"value": "mansard", "label": "Mansard Roof"}
            ]
          }
        },
        {
          "name": "ceiling_height",
          "label": "Clear Ceiling Height",
          "type": "number",
          "required": true,
          "validation": ["required", "min:8", "max:50"],
          "ui_config": {
            "placeholder": "Clear height from floor to ceiling in feet",
            "suffix": "ft"
          }
        },
        {
          "name": "floor_load_capacity",
          "label": "Floor Load Capacity",
          "type": "number",
          "required": true,
          "validation": ["required", "min:50", "max:1000"],
          "ui_config": {
            "placeholder": "Floor load capacity in pounds per square foot",
            "suffix": "psf"
          }
        },
        {
          "name": "loading_docks",
          "label": "Loading Facilities",
          "type": "object",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "fields": [
              {"key": "dock_high_doors", "label": "Dock-High Doors", "type": "number", "min": 0, "max": 20},
              {"key": "grade_level_doors", "label": "Grade-Level Doors", "type": "number", "min": 0, "max": 20},
              {"key": "drive_in_doors", "label": "Drive-In Doors", "type": "number", "min": 0, "max": 10}
            ]
          }
        },
        {
          "name": "utilities_available",
          "label": "Utilities Available",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "electricity", "label": "Electricity (3-Phase)"},
              {"value": "natural_gas", "label": "Natural Gas"},
              {"value": "water", "label": "Water Supply"},
              {"value": "sewer", "label": "Sewer Connection"},
              {"value": "internet", "label": "High-Speed Internet"},
              {"value": "telecom", "label": "Telecommunications"},
              {"value": "compressed_air", "label": "Compressed Air"},
              {"value": "steam", "label": "Steam Service"}
            ]
          }
        },
        {
          "name": "power_capacity",
          "label": "Power Capacity",
          "type": "number",
          "required": false,
          "validation": ["min:10", "max:10000"],
          "ui_config": {
            "placeholder": "Electrical service capacity in amps",
            "suffix": "amps"
          }
        },
        {
          "name": "sprinkler_system",
          "label": "Sprinkler System",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "wet_pipe", "label": "Wet Pipe System"},
              {"value": "dry_pipe", "label": "Dry Pipe System"},
              {"value": "pre_action", "label": "Pre-Action System"},
              {"value": "foam", "label": "Foam Suppression System"},
              {"value": "none", "label": "No Sprinkler System"}
            ]
          }
        },
        {
          "name": "hvac_system",
          "label": "HVAC System",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "central_air", "label": "Central Air Conditioning"},
              {"value": "unit_heaters", "label": "Unit Heaters"},
              {"value": "radiant_heat", "label": "Radiant Heating"},
              {"value": "evaporative_cooling", "label": "Evaporative Cooling"},
              {"value": "none", "label": "No HVAC System"}
            ]
          }
        },
        {
          "name": "office_space",
          "label": "Office Space",
          "type": "object",
          "required": false,
          "validation": [],
          "ui_config": {
            "fields": [
              {"key": "office_area", "label": "Office Area (sq ft)", "type": "number", "min": 0, "suffix": "sq ft"},
              {"key": "office_count", "label": "Number of Offices", "type": "number", "min": 0, "max": 50}
            ]
          }
        }
      ]
    },
    {
      "title": "Land & Site Details",
      "order": 4,
      "description": "Land characteristics and site-specific information",
      "is_collapsible": false,
      "fields": [
        {
          "name": "topography",
          "label": "Topography",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "level", "label": "Level/Smooth"},
              {"value": "gently_sloping", "label": "Gently Sloping"},
              {"value": "moderately_sloping", "label": "Moderately Sloping"},
              {"value": "steep", "label": "Steep Terrain"},
              {"value": "irregular", "label": "Irregular Terrain"}
            ]
          }
        },
        {
          "name": "soil_type",
          "label": "Soil Type",
          "type": "select",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "clay", "label": "Clay Soil"},
              {"value": "sandy", "label": "Sandy Soil"},
              {"value": "loam", "label": "Loam Soil"},
              {"value": "gravel", "label": "Gravel/Stone"},
              {"value": "fill", "label": "Fill Material"},
              {"value": "unknown", "label": "Unknown"}
            ]
          }
        },
        {
          "name": "environmental_factors",
          "label": "Environmental Factors",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "flood_zone", "label": "Located in Flood Zone"},
              {"value": "wetlands", "label": "Adjacent to Wetlands"},
              {"value": "brownfield", "label": "Brownfield Site"},
              {"value": "contaminated", "label": "Known Contamination"},
              {"value": "protected_species", "label": "Protected Species Habitat"},
              {"value": "historic_district", "label": "Historic District"}
            ]
          }
        },
        {
          "name": "site_improvements",
          "label": "Site Improvements",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "paved_parking", "label": "Paved Parking Areas"},
              {"value": "fencing", "label": "Perimeter Fencing"},
              {"value": "lighting", "label": "Exterior Lighting"},
              {"value": "landscaping", "label": "Landscaping"},
              {"value": "rail_siding", "label": "Rail Siding"},
              {"value": "truck_courts", "label": "Truck Courts"}
            ]
          }
        },
        {
          "name": "expansion_potential",
          "label": "Expansion Potential",
          "type": "select",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "high", "label": "High - Significant Expansion Space"},
              {"value": "moderate", "label": "Moderate - Some Expansion Possible"},
              {"value": "limited", "label": "Limited - Minimal Expansion Space"},
              {"value": "none", "label": "None - Fully Developed Site"}
            ]
          }
        },
        {
          "name": "adjacent_properties",
          "label": "Adjacent Properties",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "Description of adjacent property uses (residential, commercial, industrial, vacant)",
            "rows": 2
          }
        }
      ]
    },
    {
      "title": "Pricing & Lease Terms",
      "order": 5,
      "description": "Pricing structure and lease/rental terms",
      "is_collapsible": false,
      "fields": [
        {
          "name": "listing_type",
          "label": "Listing Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "lease", "label": "For Lease"},
              {"value": "sale", "label": "For Sale"},
              {"value": "lease_sale", "label": "Lease or Sale"}
            ]
          }
        },
        {
          "name": "lease_rate",
          "label": "Lease Rate (₹ per sq ft per year)",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:100"],
          "ui_config": {
            "placeholder": "Annual lease rate per square foot",
            "prefix": "₹"
          }
        },
        {
          "name": "sale_price",
          "label": "Sale Price (₹)",
          "type": "number",
          "required": false,
          "validation": ["min:100000", "max:1000000000"],
          "ui_config": {
            "placeholder": "Total sale price",
            "prefix": "₹"
          }
        },
        {
          "name": "currency",
          "label": "Currency",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "INR", "label": "Indian Rupee (₹)"},
              {"value": "USD", "label": "US Dollar ($)"},
              {"value": "EUR", "label": "Euro (€)"},
              {"value": "GBP", "label": "British Pound (£)"}
            ]
          }
        },
        {
          "name": "lease_term",
          "label": "Lease Term Options",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "month_to_month", "label": "Month-to-Month"},
              {"value": "1_year", "label": "1 Year"},
              {"value": "2_3_years", "label": "2-3 Years"},
              {"value": "5_years_plus", "label": "5+ Years"},
              {"value": "long_term", "label": "Long-term (10+ Years)"}
            ]
          }
        },
        {
          "name": "utilities_included",
          "label": "Utilities Included in Lease",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "electricity", "label": "Electricity"},
              {"value": "water", "label": "Water"},
              {"value": "gas", "label": "Gas"},
              {"value": "internet", "label": "Internet"},
              {"value": "trash", "label": "Trash Removal"},
              {"value": "maintenance", "label": "Basic Maintenance"}
            ]
          }
        },
        {
          "name": "additional_charges",
          "label": "Additional Charges",
          "type": "object",
          "required": false,
          "validation": [],
          "ui_config": {
            "fields": [
              {"key": "cam_charges", "label": "CAM Charges (₹/sq ft/year)", "type": "number", "min": 0, "prefix": "₹"},
              {"key": "property_tax", "label": "Property Tax (₹/sq ft/year)", "type": "number", "min": 0, "prefix": "₹"},
              {"key": "insurance", "label": "Insurance (₹/sq ft/year)", "type": "number", "min": 0, "prefix": "₹"}
            ]
          }
        },
        {
          "name": "minimum_lease_term",
          "label": "Minimum Lease Term",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:120"],
          "ui_config": {
            "placeholder": "Minimum lease commitment in months",
            "suffix": "months"
          }
        },
        {
          "name": "availability_date",
          "label": "Available Date",
          "type": "date",
          "required": false,
          "validation": [],
          "ui_config": {
            "placeholder": "Date when property becomes available"
          }
        }
      ]
    },
    {
      "title": "Policies & Regulations",
      "order": 6,
      "description": "Zoning regulations and usage policies",
      "is_collapsible": true,
      "fields": [
        {
          "name": "permitted_uses",
          "label": "Permitted Uses",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "manufacturing", "label": "Manufacturing"},
              {"value": "warehousing", "label": "Warehousing"},
              {"value": "distribution", "label": "Distribution"},
              {"value": "assembly", "label": "Light Assembly"},
              {"value": "research_lab", "label": "Research & Development"},
              {"value": "data_center", "label": "Data Center"},
              {"value": "cold_storage", "label": "Cold Storage"},
              {"value": "automotive", "label": "Automotive Services"}
            ]
          }
        },
        {
          "name": "restricted_uses",
          "label": "Restricted Uses",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "residential", "label": "Residential Use"},
              {"value": "retail", "label": "Retail Sales"},
              {"value": "hazardous_materials", "label": "Hazardous Materials"},
              {"value": "food_processing", "label": "Food Processing"},
              {"value": "chemical_processing", "label": "Chemical Processing"},
              {"value": "waste_disposal", "label": "Waste Disposal"}
            ]
          }
        },
        {
          "name": "environmental_compliance",
          "label": "Environmental Compliance",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "phase1_esa", "label": "Phase 1 ESA Completed"},
              {"value": "phase2_esa", "label": "Phase 2 ESA Completed"},
              {"value": "remediation", "label": "Environmental Remediation Completed"},
              {"value": "monitoring_wells", "label": "Groundwater Monitoring"},
              {"value": "spill_prevention", "label": "SPCC Plan"},
              {"value": "storm_water", "label": "Storm Water Management"}
            ]
          }
        },
        {
          "name": "building_codes",
          "label": "Building Code Compliance",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "ada_accessible", "label": "ADA Accessible"},
              {"value": "fire_code", "label": "Fire Code Compliant"},
              {"value": "building_code", "label": "Building Code Compliant"},
              {"value": "energy_code", "label": "Energy Code Compliant"},
              {"value": "seismic", "label": "Seismic Standards Met"}
            ]
          }
        },
        {
          "name": "special_permits",
          "label": "Special Permits & Licenses",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "List any special permits, variances, or licenses required/obtained",
            "rows": 3
          }
        },
        {
          "name": "lease_restrictions",
          "label": "Lease Restrictions",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "Any restrictions on subleasing, assignments, or use modifications",
            "rows": 2
          }
        }
      ]
    },
    {
      "title": "Contact Information",
      "order": 7,
      "description": "Property owner/manager contact details",
      "is_collapsible": false,
      "fields": [
        {
          "name": "contact_person",
          "label": "Contact Person",
          "type": "text",
          "required": true,
          "validation": ["required", "max_length:100"],
          "ui_config": {
            "placeholder": "Name of the primary contact person"
          }
        },
        {
          "name": "contact_designation",
          "label": "Designation",
          "type": "text",
          "required": false,
          "validation": ["max_length:50"],
          "ui_config": {
            "placeholder": "Property Manager, Owner, Leasing Agent, etc."
          }
        },
        {
          "name": "company_name",
          "label": "Company Name",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "Real estate company or property management firm"
          }
        },
        {
          "name": "primary_phone",
          "label": "Primary Phone Number",
          "type": "phone",
          "required": true,
          "validation": ["required", "phone"],
          "ui_config": {
            "placeholder": "Primary contact number"
          }
        },
        {
          "name": "secondary_phone",
          "label": "Secondary Phone Number",
          "type": "phone",
          "required": false,
          "validation": ["phone"],
          "ui_config": {
            "placeholder": "Alternative contact number"
          }
        },
        {
          "name": "email",
          "label": "Email Address",
          "type": "email",
          "required": true,
          "validation": ["required", "email"],
          "ui_config": {
            "placeholder": "Contact email address"
          }
        },
        {
          "name": "website",
          "label": "Company Website",
          "type": "url",
          "required": false,
          "validation": ["url"],
          "ui_config": {
            "placeholder": "Company or property website URL"
          }
        },
        {
          "name": "emergency_contact",
          "label": "Emergency Contact",
          "type": "phone",
          "required": false,
          "validation": ["phone"],
          "ui_config": {
            "placeholder": "Emergency contact number for property issues"
          }
        }
      ]
    },
    {
      "title": "Images & Documentation",
      "order": 8,
      "description": "Property photos and supporting documentation",
      "is_collapsible": true,
      "fields": [
        {
          "name": "exterior_images",
          "label": "Exterior Images",
          "type": "file",
          "required": true,
          "validation": ["required", "file_type:image", "max_files:15"],
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "max_size": "5MB",
            "help_text": "Upload exterior photos showing building facade, parking, and site"
          }
        },
        {
          "name": "interior_images",
          "label": "Interior Images",
          "type": "file",
          "required": false,
          "validation": ["file_type:image", "max_files:20"],
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "max_size": "5MB",
            "help_text": "Upload interior photos of warehouse space, offices, and facilities"
          }
        },
        {
          "name": "loading_dock_images",
          "label": "Loading Dock Images",
          "type": "file",
          "required": false,
          "validation": ["file_type:image", "max_files:10"],
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "max_size": "5MB",
            "help_text": "Upload images of loading docks, truck courts, and shipping areas"
          }
        },
        {
          "name": "site_plan",
          "label": "Site Plan",
          "type": "file",
          "required": false,
          "validation": ["file_type:image,pdf", "max_size:10MB"],
          "ui_config": {
            "accept": "image/*,.pdf",
            "help_text": "Upload site plan showing building layout and land use"
          }
        },
        {
          "name": "floor_plan",
          "label": "Floor Plan",
          "type": "file",
          "required": false,
          "validation": ["file_type:image,pdf", "max_size:10MB"],
          "ui_config": {
            "accept": "image/*,.pdf",
            "help_text": "Upload detailed floor plan with dimensions"
          }
        },
        {
          "name": "zoning_documents",
          "label": "Zoning Documents",
          "type": "file",
          "required": false,
          "validation": ["file_type:pdf", "max_files:5", "max_size:10MB"],
          "ui_config": {
            "accept": ".pdf",
            "multiple": true,
            "help_text": "Upload zoning certificates, permits, and compliance documents"
          }
        },
        {
          "name": "environmental_reports",
          "label": "Environmental Reports",
          "type": "file",
          "required": false,
          "validation": ["file_type:pdf", "max_files:3", "max_size:15MB"],
          "ui_config": {
            "accept": ".pdf",
            "multiple": true,
            "help_text": "Upload Phase 1 ESA, environmental assessments, and remediation reports"
          }
        },
        {
          "name": "property_brochure",
          "label": "Property Brochure",
          "type": "file",
          "required": false,
          "validation": ["file_type:pdf", "max_size:10MB"],
          "ui_config": {
            "accept": ".pdf",
            "help_text": "Upload professional property brochure or marketing materials"
          }
        }
      ]
    },
    {
      "title": "Additional Services & Features",
      "order": 9,
      "description": "Extra services and value-added features",
      "is_collapsible": true,
      "fields": [
        {
          "name": "security_features",
          "label": "Security Features",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "24_7_security", "label": "24/7 Security Guard"},
              {"value": "cctv", "label": "CCTV Surveillance"},
              {"value": "alarm_system", "label": "Alarm System"},
              {"value": "access_control", "label": "Access Control System"},
              {"value": "fencing", "label": "Perimeter Fencing"},
              {"value": "lighting", "label": "Security Lighting"}
            ]
          }
        },
        {
          "name": "maintenance_services",
          "label": "Maintenance Services",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "hvac_maintenance", "label": "HVAC Maintenance"},
              {"value": "roof_maintenance", "label": "Roof Maintenance"},
              {"value": "plumbing", "label": "Plumbing Services"},
              {"value": "electrical", "label": "Electrical Services"},
              {"value": "pest_control", "label": "Pest Control"},
              {"value": "landscaping", "label": "Landscaping Services"}
            ]
          }
        },
        {
          "name": "value_added_services",
          "label": "Value-Added Services",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "property_management", "label": "Property Management"},
              {"value": "tenant_improvements", "label": "Tenant Improvement Allowance"},
              {"value": "expansion_options", "label": "Expansion Options"},
              {"value": "rail_service", "label": "Rail Service Coordination"},
              {"value": "customs_bonded", "label": "Customs Bonded Warehouse"},
              {"value": "cross_dock", "label": "Cross-Dock Services"}
            ]
          }
        },
        {
          "name": "certifications",
          "label": "Certifications & Awards",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "LEED certification, energy efficiency awards, industry recognitions",
            "rows": 2
          }
        },
        {
          "name": "special_features",
          "label": "Special Features",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Any unique features or competitive advantages",
            "rows": 3
          }
        },
        {
          "name": "nearby_amenities",
          "label": "Nearby Amenities",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "Hotels, restaurants, shopping, employee amenities within reasonable distance",
            "rows": 2
          }
        }
      ]
    }
  ]
}
```

## Template Features

### Industry-Specific Fields
- **Property Classification**: Comprehensive industrial property types (warehouses, manufacturing facilities, distribution centers)
- **Zoning Compliance**: Detailed zoning classifications and permitted/restricted uses
- **Building Specifications**: Professional construction details, utilities, loading facilities
- **Environmental Factors**: Site assessment, contamination history, remediation status
- **Transportation Access**: Highway, rail, port, and airport proximity
- **Commercial Terms**: Lease rates, CAM charges, expansion potential

### Validation Rules
- **Property Information**: Required fields for accurate zoning and classification
- **Building Specs**: Industry-standard measurements and capacity requirements
- **Location Data**: GPS coordinates for logistics planning and accessibility
- **Pricing Validation**: Commercial real estate pricing ranges and lease structures
- **Documentation**: File upload limits for permits, environmental reports, and plans

### UI/UX Enhancements
- **Progressive Disclosure**: Collapsible sections for better user experience
- **Industry Standards**: Pre-defined options for zoning, construction types, and utilities
- **Conditional Fields**: Dynamic field visibility based on property type and listing type
- **Rich Documentation**: Multiple file uploads for plans, permits, and environmental reports
- **Location Mapping**: GPS coordinate integration for logistics and transportation planning

### API Integration Points
- **Car Management API**: Integration with transportation and logistics data
- **Schema Template System**: Dynamic form generation with validation rules
- **File Upload Service**: Firebase integration for property documents and images
- **Analytics Integration**: Occupancy tracking and market analysis
- **GIS Integration**: Location-based services for industrial zoning and transportation

### Compliance & Standards
- **Zoning Regulations**: Local and state zoning compliance requirements
- **Environmental Standards**: Phase 1/2 ESA, remediation, and monitoring requirements
- **Building Codes**: ADA accessibility, fire codes, and construction standards
- **Commercial Leasing**: Industry-standard lease terms and CAM charges
- **Safety Standards**: Industrial safety requirements and emergency protocols
- **Industry Standards**: Alignment with commercial real estate and industrial property standards

## Usage Instructions

1. **Template Assignment**: Assign this template to industrial_land_buildings category via `/api/v1/schema-templates/{id}/assign-category`
2. **Form Generation**: Use `GET /api/v1/catalog/categories/{id}/schema` to retrieve complete form structure
3. **Validation**: Implement client-side validation using provided validation rules
4. **Image Upload**: Use Firebase storage for property images with automatic optimization
5. **GPS Integration**: Enable location services for precise property mapping and logistics
6. **Document Management**: Integrate with document management systems for permits and reports

## Implementation Notes

- **Database Storage**: Template stored as JSONB in PostgreSQL for flexible querying
- **Performance**: Optimized with proper indexing on frequently queried fields
- **Scalability**: Supports unlimited custom fields through JSONB structure
- **Version Control**: Template versioning for backward compatibility
- **Audit Trail**: Complete change tracking for compliance requirements

This template provides a comprehensive, industry-standard solution for industrial land and buildings listings on the eBidPortal marketplace, ensuring professional presentation and regulatory compliance for commercial real estate transactions.