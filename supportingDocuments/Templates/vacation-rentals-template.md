# Professional Vacation Rentals Template for eBidPortal

**Template Name:** Vacation Rentals Template
**Version:** 1.0
**Category Type:** vacation_rentals
**Created:** November 21, 2025
**Industry Standards:** Based on vacation rental industry standards (hospitality regulations, tourism compliance, short-term rental standards)

## Template JSON Structure

```json
{
  "name": "Vacation Rentals Template",
  "description": "Comprehensive template for vacation rentals, holiday homes, and short-term accommodations. Includes property specifications, booking management, regulatory compliance, and hospitality industry standards.",
  "category_type": "vacation_rentals",
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
            "placeholder": "e.g., Luxury Beachfront Villa - 4BR with Ocean Views",
            "help_text": "Create an attractive title highlighting unique features and location"
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
              {"value": "apartment", "label": "Apartment"},
              {"value": "house", "label": "House"},
              {"value": "villa", "label": "Villa"},
              {"value": "cottage", "label": "Cottage"},
              {"value": "cabin", "label": "Cabin"},
              {"value": "condo", "label": "Condominium"},
              {"value": "townhouse", "label": "Townhouse"},
              {"value": "bungalow", "label": "Bungalow"},
              {"value": "chalet", "label": "Chalet"},
              {"value": "farmhouse", "label": "Farmhouse"}
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
            "placeholder": "Official property name (e.g., Ocean View Paradise)"
          }
        },
        {
          "name": "max_guests",
          "label": "Maximum Guests",
          "type": "number",
          "required": true,
          "validation": ["required", "min:1", "max:50"],
          "ui_config": {
            "placeholder": "Maximum number of guests allowed",
            "suffix": "guests"
          }
        },
        {
          "name": "bedrooms",
          "label": "Number of Bedrooms",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0", "max:20"],
          "ui_config": {
            "placeholder": "Total bedrooms in the property",
            "suffix": "bedrooms"
          }
        },
        {
          "name": "bathrooms",
          "label": "Number of Bathrooms",
          "type": "number",
          "required": true,
          "validation": ["required", "min:1", "max:15"],
          "ui_config": {
            "placeholder": "Total bathrooms (full and half)",
            "suffix": "bathrooms"
          }
        },
        {
          "name": "property_area",
          "label": "Property Area",
          "type": "number",
          "required": true,
          "validation": ["required", "min:100", "max:10000"],
          "ui_config": {
            "placeholder": "Total area in square feet",
            "suffix": "sq ft"
          }
        },
        {
          "name": "year_built",
          "label": "Year Built/Renovated",
          "type": "number",
          "required": false,
          "validation": ["min:1800", "max:2025"],
          "ui_config": {
            "placeholder": "Year property was built or last renovated"
          }
        }
      ]
    },
    {
      "title": "Location & Accessibility",
      "order": 2,
      "description": "Property location and transportation access",
      "is_collapsible": false,
      "fields": [
        {
          "name": "address_line_1",
          "label": "Address Line 1",
          "type": "textarea",
          "required": true,
          "validation": ["required", "max_length:200"],
          "ui_config": {
            "placeholder": "Street address, building name, etc.",
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
            "placeholder": "Floor, tower, landmark"
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
          "name": "nearby_attractions",
          "label": "Nearby Attractions",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Beaches, parks, restaurants, shopping (one per line)",
            "rows": 3
          }
        },
        {
          "name": "distance_to_airport",
          "label": "Distance to Airport",
          "type": "number",
          "required": false,
          "validation": ["min:0", "max:200"],
          "ui_config": {
            "placeholder": "Distance in kilometers",
            "suffix": "km"
          }
        },
        {
          "name": "public_transport",
          "label": "Public Transport Access",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "airport", "label": "Airport Access"},
              {"value": "bus_station", "label": "Bus Station"},
              {"value": "railway", "label": "Railway Station"},
              {"value": "metro", "label": "Metro Station"},
              {"value": "taxi_stand", "label": "Taxi Stand"}
            ]
          }
        }
      ]
    },
    {
      "title": "Accommodations & Amenities",
      "order": 3,
      "description": "Property accommodations and available amenities",
      "is_collapsible": false,
      "fields": [
        {
          "name": "bedroom_details",
          "label": "Bedroom Details",
          "type": "object",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "fields": [
              {"key": "king_beds", "label": "King Size Beds", "type": "number", "min": 0, "max": 10},
              {"key": "queen_beds", "label": "Queen Size Beds", "type": "number", "min": 0, "max": 10},
              {"key": "double_beds", "label": "Double Beds", "type": "number", "min": 0, "max": 10},
              {"key": "single_beds", "label": "Single Beds", "type": "number", "min": 0, "max": 10},
              {"key": "sofa_beds", "label": "Sofa Beds", "type": "number", "min": 0, "max": 10}
            ]
          }
        },
        {
          "name": "kitchen_facilities",
          "label": "Kitchen Facilities",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "fully_equipped", "label": "Fully Equipped Kitchen"},
              {"value": "microwave", "label": "Microwave"},
              {"value": "oven", "label": "Oven"},
              {"value": "dishwasher", "label": "Dishwasher"},
              {"value": "coffee_maker", "label": "Coffee Maker"},
              {"value": "toaster", "label": "Toaster"},
              {"value": "refrigerator", "label": "Refrigerator"},
              {"value": "cooking_basics", "label": "Cooking Basics (pots, pans, utensils)"}
            ]
          }
        },
        {
          "name": "basic_amenities",
          "label": "Basic Amenities",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "wifi", "label": "High-Speed WiFi"},
              {"value": "air_conditioning", "label": "Air Conditioning"},
              {"value": "heating", "label": "Heating"},
              {"value": "hot_water", "label": "Hot Water"},
              {"value": "washing_machine", "label": "Washing Machine"},
              {"value": "dryer", "label": "Dryer"},
              {"value": "tv", "label": "Television"},
              {"value": "iron", "label": "Iron & Ironing Board"}
            ]
          }
        },
        {
          "name": "outdoor_features",
          "label": "Outdoor Features",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "private_pool", "label": "Private Pool"},
              {"value": "shared_pool", "label": "Shared Pool"},
              {"value": "garden", "label": "Garden/Patio"},
              {"value": "balcony", "label": "Balcony/Terrace"},
              {"value": "bbq_grill", "label": "BBQ Grill"},
              {"value": "outdoor_furniture", "label": "Outdoor Furniture"},
              {"value": "parking", "label": "Parking Space"}
            ]
          }
        },
        {
          "name": "entertainment",
          "label": "Entertainment & Leisure",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "streaming_services", "label": "Streaming Services"},
              {"value": "board_games", "label": "Board Games"},
              {"value": "books", "label": "Books & Magazines"},
              {"value": "music_system", "label": "Music System"},
              {"value": "game_console", "label": "Game Console"},
              {"value": "pool_table", "label": "Pool Table"},
              {"value": "fitness_equipment", "label": "Fitness Equipment"}
            ]
          }
        },
        {
          "name": "safety_features",
          "label": "Safety & Security Features",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "smoke_detector", "label": "Smoke Detector"},
              {"value": "carbon_monoxide_detector", "label": "Carbon Monoxide Detector"},
              {"value": "fire_extinguisher", "label": "Fire Extinguisher"},
              {"value": "first_aid_kit", "label": "First Aid Kit"},
              {"value": "security_system", "label": "Security System"},
              {"value": "safe", "label": "Safe for Valuables"},
              {"value": "emergency_contacts", "label": "Emergency Contact Information"}
            ]
          }
        },
        {
          "name": "accessibility_features",
          "label": "Accessibility Features",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "wheelchair_accessible", "label": "Wheelchair Accessible"},
              {"value": "elevator", "label": "Elevator Access"},
              {"value": "ground_floor", "label": "Ground Floor Access"},
              {"value": "wide_doorways", "label": "Wide Doorways"},
              {"value": "accessible_bathroom", "label": "Accessible Bathroom"},
              {"value": "grab_bars", "label": "Grab Bars"}
            ]
          }
        }
      ]
    },
    {
      "title": "Booking & Pricing",
      "order": 4,
      "description": "Booking availability and pricing structure",
      "is_collapsible": false,
      "fields": [
        {
          "name": "base_nightly_rate",
          "label": "Base Nightly Rate (₹)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:500", "max:100000"],
          "ui_config": {
            "placeholder": "Base rate per night",
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
          "name": "minimum_stay",
          "label": "Minimum Stay (Nights)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:1", "max:365"],
          "ui_config": {
            "placeholder": "Minimum number of nights required",
            "suffix": "nights"
          }
        },
        {
          "name": "maximum_stay",
          "label": "Maximum Stay (Nights)",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:365"],
          "ui_config": {
            "placeholder": "Maximum number of nights allowed (optional)",
            "suffix": "nights"
          }
        },
        {
          "name": "seasonal_pricing",
          "label": "Seasonal Pricing",
          "type": "object",
          "required": false,
          "validation": [],
          "ui_config": {
            "fields": [
              {"key": "peak_season_rate", "label": "Peak Season Rate (₹)", "type": "number", "min": 1000, "prefix": "₹"},
              {"key": "off_season_rate", "label": "Off Season Rate (₹)", "type": "number", "min": 500, "prefix": "₹"},
              {"key": "weekend_rate", "label": "Weekend Rate (₹)", "type": "number", "min": 500, "prefix": "₹"}
            ]
          }
        },
        {
          "name": "extra_fees",
          "label": "Extra Fees",
          "type": "object",
          "required": false,
          "validation": [],
          "ui_config": {
            "fields": [
              {"key": "cleaning_fee", "label": "Cleaning Fee (₹)", "type": "number", "min": 0, "prefix": "₹"},
              {"key": "security_deposit", "label": "Security Deposit (₹)", "type": "number", "min": 0, "prefix": "₹"},
              {"key": "pet_fee", "label": "Pet Fee (₹)", "type": "number", "min": 0, "prefix": "₹"},
              {"key": "extra_guest_fee", "label": "Extra Guest Fee per Night (₹)", "type": "number", "min": 0, "prefix": "₹"}
            ]
          }
        },
        {
          "name": "booking_availability",
          "label": "Booking Availability",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "instant_booking", "label": "Instant Booking"},
              {"value": "request_booking", "label": "Request to Book"},
              {"value": "manual_approval", "label": "Manual Approval Required"}
            ]
          }
        },
        {
          "name": "check_in_time",
          "label": "Check-in Time",
          "type": "text",
          "required": true,
          "validation": ["required", "pattern:^\\d{1,2}:\\d{2}\\s*(AM|PM|am|pm)$"],
          "ui_config": {
            "placeholder": "e.g., 3:00 PM"
          }
        },
        {
          "name": "check_out_time",
          "label": "Check-out Time",
          "type": "text",
          "required": true,
          "validation": ["required", "pattern:^\\d{1,2}:\\d{2}\\s*(AM|PM|am|pm)$"],
          "ui_config": {
            "placeholder": "e.g., 11:00 AM"
          }
        }
      ]
    },
    {
      "title": "Policies & Rules",
      "order": 5,
      "description": "Property policies and guest rules",
      "is_collapsible": true,
      "fields": [
        {
          "name": "smoking_policy",
          "label": "Smoking Policy",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "no_smoking", "label": "No Smoking"},
              {"value": "designated_areas", "label": "Smoking in Designated Areas Only"},
              {"value": "outdoor_only", "label": "Outdoor Smoking Only"},
              {"value": "allowed", "label": "Smoking Allowed"}
            ]
          }
        },
        {
          "name": "pet_policy",
          "label": "Pet Policy",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "no_pets", "label": "No Pets Allowed"},
              {"value": "small_pets", "label": "Small Pets Allowed"},
              {"value": "pets_allowed", "label": "Pets Allowed"},
              {"value": "case_by_case", "label": "Case by Case"}
            ]
          }
        },
        {
          "name": "party_events_policy",
          "label": "Party/Events Policy",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "no_parties", "label": "No Parties or Events"},
              {"value": "small_gatherings", "label": "Small Gatherings Allowed"},
              {"value": "quiet_events", "label": "Quiet Events Allowed"},
              {"value": "with_permission", "label": "Events Allowed with Permission"}
            ]
          }
        },
        {
          "name": "cancellation_policy",
          "label": "Cancellation Policy",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "flexible", "label": "Flexible (Free cancellation up to 24 hours)"},
              {"value": "moderate", "label": "Moderate (Free cancellation up to 5 days)"},
              {"value": "strict", "label": "Strict (Free cancellation up to 30 days)"},
              {"value": "super_strict", "label": "Super Strict (No free cancellation)"}
            ]
          }
        },
        {
          "name": "house_rules",
          "label": "House Rules",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Additional house rules and guidelines for guests",
            "rows": 4
          }
        },
        {
          "name": "age_restrictions",
          "label": "Age Restrictions",
          "type": "object",
          "required": false,
          "validation": [],
          "ui_config": {
            "fields": [
              {"key": "minimum_age", "label": "Minimum Age to Book", "type": "number", "min": 18, "max": 25},
              {"key": "children_allowed", "label": "Children Allowed", "type": "boolean", "default": true},
              {"key": "infants_allowed", "label": "Infants Allowed", "type": "boolean", "default": true}
            ]
          }
        },
        {
          "name": "additional_policies",
          "label": "Additional Policies",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Any additional policies or special requirements",
            "rows": 3
          }
        }
      ]
    },
    {
      "title": "Contact Information",
      "order": 6,
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
            "placeholder": "Owner, Manager, Property Manager, etc."
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
          "name": "whatsapp_number",
          "label": "WhatsApp Number",
          "type": "phone",
          "required": false,
          "validation": ["phone"],
          "ui_config": {
            "placeholder": "WhatsApp contact number"
          }
        },
        {
          "name": "website",
          "label": "Property Website",
          "type": "url",
          "required": false,
          "validation": ["url"],
          "ui_config": {
            "placeholder": "Official property website URL"
          }
        },
        {
          "name": "emergency_contact",
          "label": "Emergency Contact",
          "type": "phone",
          "required": false,
          "validation": ["phone"],
          "ui_config": {
            "placeholder": "Emergency contact number for guests"
          }
        }
      ]
    },
    {
      "title": "Images & Media",
      "order": 7,
      "description": "Property photos and media content",
      "is_collapsible": true,
      "fields": [
        {
          "name": "property_images",
          "label": "Property Images",
          "type": "file",
          "required": true,
          "validation": ["required", "file_type:image", "max_files:30"],
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "max_size": "5MB",
            "help_text": "Upload high-quality images of the property, including exterior, interior, bedrooms, bathrooms, and common areas"
          }
        },
        {
          "name": "living_area_images",
          "label": "Living Area Images",
          "type": "file",
          "required": false,
          "validation": ["file_type:image", "max_files:10"],
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "max_size": "5MB",
            "help_text": "Upload images of living room, dining area, and common spaces"
          }
        },
        {
          "name": "bedroom_images",
          "label": "Bedroom Images",
          "type": "file",
          "required": false,
          "validation": ["file_type:image", "max_files:15"],
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "max_size": "5MB",
            "help_text": "Upload images of each bedroom and sleeping areas"
          }
        },
        {
          "name": "bathroom_images",
          "label": "Bathroom Images",
          "type": "file",
          "required": false,
          "validation": ["file_type:image", "max_files:10"],
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "max_size": "5MB",
            "help_text": "Upload images of bathrooms and toilet facilities"
          }
        },
        {
          "name": "kitchen_images",
          "label": "Kitchen Images",
          "type": "file",
          "required": false,
          "validation": ["file_type:image", "max_files:8"],
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "max_size": "5MB",
            "help_text": "Upload images of kitchen and cooking facilities"
          }
        },
        {
          "name": "outdoor_images",
          "label": "Outdoor Images",
          "type": "file",
          "required": false,
          "validation": ["file_type:image", "max_files:10"],
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "max_size": "5MB",
            "help_text": "Upload images of garden, pool, balcony, and outdoor spaces"
          }
        },
        {
          "name": "virtual_tour",
          "label": "Virtual Tour",
          "type": "url",
          "required": false,
          "validation": ["url"],
          "ui_config": {
            "placeholder": "YouTube/Vimeo link to virtual tour video"
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
            "help_text": "Upload floor plan or layout diagram (PDF or image)"
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
            "help_text": "Upload detailed property brochure (PDF format)"
          }
        }
      ]
    },
    {
      "title": "Additional Services",
      "order": 8,
      "description": "Extra services and value-added offerings",
      "is_collapsible": true,
      "fields": [
        {
          "name": "cleaning_services",
          "label": "Cleaning Services",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "daily_cleaning", "label": "Daily Cleaning Service"},
              {"value": "checkout_cleaning", "label": "Checkout Cleaning Included"},
              {"value": "linen_service", "label": "Linen Change Service"},
              {"value": "towel_service", "label": "Towel Service"}
            ]
          }
        },
        {
          "name": "concierge_services",
          "label": "Concierge Services",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "local_guide", "label": "Local Area Guide"},
              {"value": "restaurant_reservations", "label": "Restaurant Reservations"},
              {"value": "transport_arrangements", "label": "Transport Arrangements"},
              {"value": "activity_bookings", "label": "Activity Bookings"},
              {"value": "24_hour_support", "label": "24/7 Guest Support"}
            ]
          }
        },
        {
          "name": "transportation_services",
          "label": "Transportation Services",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "airport_pickup", "label": "Airport Pickup/Drop-off"},
              {"value": "car_rental", "label": "Car Rental Assistance"},
              {"value": "local_transport", "label": "Local Transport Booking"},
              {"value": "parking_assistance", "label": "Parking Assistance"}
            ]
          }
        },
        {
          "name": "local_experiences",
          "label": "Local Experiences & Activities",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Describe available local experiences, tours, or activities",
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
            "placeholder": "Any special features or unique selling points",
            "rows": 3
          }
        },
        {
          "name": "certifications_awards",
          "label": "Certifications & Awards",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "Safety certifications, hospitality awards, eco-certifications",
            "rows": 2
          }
        },
        {
          "name": "sustainability_features",
          "label": "Sustainability Features",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "eco_friendly", "label": "Eco-friendly Practices"},
              {"value": "solar_power", "label": "Solar Power"},
              {"value": "water_conservation", "label": "Water Conservation"},
              {"value": "recycling_program", "label": "Recycling Program"},
              {"value": "local_products", "label": "Local/Organic Products"}
            ]
          }
        }
      ]
    },
    {
      "title": "Regulatory Compliance",
      "order": 9,
      "description": "Legal and regulatory compliance information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "registration_number",
          "label": "Property Registration Number",
          "type": "text",
          "required": false,
          "validation": ["max_length:50"],
          "ui_config": {
            "placeholder": "Local tourism/hospitality registration number"
          }
        },
        {
          "name": "business_license",
          "label": "Business License Number",
          "type": "text",
          "required": false,
          "validation": ["max_length:50"],
          "ui_config": {
            "placeholder": "Business registration/license number"
          }
        },
        {
          "name": "insurance_coverage",
          "label": "Insurance Coverage",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "property_insurance", "label": "Property Insurance"},
              {"value": "liability_insurance", "label": "Liability Insurance"},
              {"value": "guest_insurance", "label": "Guest Property Insurance"},
              {"value": "business_interruption", "label": "Business Interruption Insurance"}
            ]
          }
        },
        {
          "name": "compliance_certificates",
          "label": "Compliance Certificates",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "List relevant compliance certificates and permits",
            "rows": 3
          }
        },
        {
          "name": "tax_information",
          "label": "Tax Information",
          "type": "object",
          "required": false,
          "validation": [],
          "ui_config": {
            "fields": [
              {"key": "gst_registered", "label": "GST Registered", "type": "boolean", "default": false},
              {"key": "gst_number", "label": "GST Number", "type": "text", "max_length": 15},
              {"key": "tax_collection", "label": "Responsible for Tax Collection", "type": "boolean", "default": true}
            ]
          }
        }
      ]
    }
  ]
}
```

## Template Features

### Industry-Specific Fields
- **Property Classification**: Comprehensive property types (villa, apartment, cottage, cabin, etc.)
- **Accommodation Details**: Detailed bedroom/bathroom configurations and sleeping arrangements
- **Hospitality Standards**: Industry-standard amenities, safety features, and accessibility options
- **Booking Management**: Flexible pricing, seasonal rates, and booking policies
- **Regulatory Compliance**: Tourism registration, business licenses, and tax information

### Validation Rules
- **Property Information**: Required fields for accurate property classification and capacity
- **Location Data**: GPS coordinates for precise mapping and distance calculations
- **Pricing Validation**: Industry-standard pricing ranges with seasonal variations
- **Contact Verification**: Valid phone numbers and email addresses for guest communication
- **Image Requirements**: Comprehensive photo requirements for different property areas

### UI/UX Enhancements
- **Progressive Disclosure**: Collapsible sections for better user experience
- **Smart Pricing**: Dynamic pricing structure with seasonal and weekend rates
- **Conditional Fields**: Dynamic field visibility based on property type and services
- **Rich Media Support**: Multiple image uploads with virtual tours and floor plans
- **Location Mapping**: GPS coordinate integration for precise property mapping

### API Integration Points
- **Car Management API**: Integration with location services for transportation data
- **Schema Template System**: Dynamic form generation with validation rules
- **File Upload Service**: Firebase integration for property images and documents
- **Analytics Integration**: Booking analytics and occupancy tracking
- **Payment Integration**: Secure payment processing for bookings

### Compliance & Standards
- **Hospitality Regulations**: Compliance with tourism and hospitality industry standards
- **Safety Standards**: Fire safety, emergency protocols, and guest security
- **Accessibility Compliance**: ADA and international accessibility standards
- **Data Privacy**: GDPR/CCPA compliant guest data handling
- **Industry Standards**: Alignment with Airbnb, Booking.com, and hospitality best practices
- **Tax Compliance**: GST and local tax collection requirements

## Usage Instructions

1. **Template Assignment**: Assign this template to vacation_rentals category via `/api/v1/schema-templates/{id}/assign-category`
2. **Form Generation**: Use `GET /api/v1/catalog/categories/{id}/schema` to retrieve complete form structure
3. **Validation**: Implement client-side validation using provided validation rules
4. **Image Upload**: Use Firebase storage for property images with automatic optimization
5. **GPS Integration**: Enable location services for precise property mapping
6. **Booking Management**: Integrate calendar management and availability systems

## Implementation Notes

- **Database Storage**: Template stored as JSONB in PostgreSQL for flexible querying
- **Performance**: Optimized with proper indexing on frequently queried fields
- **Scalability**: Supports unlimited custom fields through JSONB structure
- **Version Control**: Template versioning for backward compatibility
- **Audit Trail**: Complete change tracking for compliance requirements

This template provides a comprehensive, industry-standard solution for vacation rental listings on the eBidPortal marketplace, ensuring professional presentation and regulatory compliance for property owners and managers.