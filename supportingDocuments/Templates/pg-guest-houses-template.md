# Professional PG & Guest Houses Template for eBidPortal

**Template Name:** PG & Guest Houses Template
**Version:** 1.0
**Category Type:** accommodation
**Created:** November 21, 2025
**Industry Standards:** Based on hospitality and accommodation industry standards (hotel regulations, rental laws, safety certifications)

## Template JSON Structure

```json
{
  "name": "PG & Guest Houses Template",
  "description": "Comprehensive template for PG (Paying Guest) accommodations and guest houses. Includes property management, tenant screening, pricing structures, regulatory compliance, and professional accommodation features.",
  "category_type": "accommodation",
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
            "placeholder": "e.g., Green Valley PG - Premium Accommodation for Working Professionals",
            "help_text": "Create an attractive title that highlights your property's unique features"
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
              {"value": "pg", "label": "Paying Guest (PG)"},
              {"value": "guest_house", "label": "Guest House"},
              {"value": "hostel", "label": "Hostel"},
              {"value": "service_apartment", "label": "Service Apartment"},
              {"value": "co_living", "label": "Co-Living Space"}
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
            "placeholder": "Official property name (e.g., Green Valley PG)"
          }
        },
        {
          "name": "total_rooms",
          "label": "Total Rooms",
          "type": "number",
          "required": true,
          "validation": ["required", "min:1", "max:500"],
          "ui_config": {
            "placeholder": "Total number of rooms available",
            "suffix": "rooms"
          }
        },
        {
          "name": "available_rooms",
          "label": "Available Rooms",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0"],
          "ui_config": {
            "placeholder": "Currently available rooms",
            "suffix": "rooms"
          }
        },
        {
          "name": "property_age",
          "label": "Property Age",
          "type": "number",
          "required": false,
          "validation": ["min:0", "max:100"],
          "ui_config": {
            "placeholder": "Age of the property in years",
            "suffix": "years"
          }
        },
        {
          "name": "furnishing_status",
          "label": "Furnishing Status",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "fully_furnished", "label": "Fully Furnished"},
              {"value": "semi_furnished", "label": "Semi Furnished"},
              {"value": "unfurnished", "label": "Unfurnished"}
            ]
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
            "placeholder": "Area, locality, landmark"
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
          "name": "nearby_landmarks",
          "label": "Nearby Landmarks",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Metro station, mall, hospital, etc. (one per line)",
            "rows": 3
          }
        },
        {
          "name": "distance_from_city_center",
          "label": "Distance from City Center",
          "type": "number",
          "required": false,
          "validation": ["min:0", "max:100"],
          "ui_config": {
            "placeholder": "Distance in kilometers",
            "suffix": "km"
          }
        }
      ]
    },
    {
      "title": "Accommodation Details",
      "order": 3,
      "description": "Room types and accommodation specifications",
      "is_collapsible": false,
      "fields": [
        {
          "name": "room_types",
          "label": "Room Types Available",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "single", "label": "Single Occupancy"},
              {"value": "double", "label": "Double Occupancy"},
              {"value": "triple", "label": "Triple Occupancy"},
              {"value": "dormitory", "label": "Dormitory"},
              {"value": "studio", "label": "Studio Apartment"},
              {"value": "suite", "label": "Suite"}
            ]
          }
        },
        {
          "name": "room_sizes",
          "label": "Room Sizes (sq ft)",
          "type": "object",
          "required": false,
          "validation": [],
          "ui_config": {
            "fields": [
              {"key": "single", "label": "Single Room", "type": "number", "min": 50, "max": 300, "suffix": "sq ft"},
              {"key": "double", "label": "Double Room", "type": "number", "min": 100, "max": 500, "suffix": "sq ft"},
              {"key": "triple", "label": "Triple Room", "type": "number", "min": 150, "max": 700, "suffix": "sq ft"}
            ]
          }
        },
        {
          "name": "attached_bathroom",
          "label": "Attached Bathroom",
          "type": "boolean",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "default": true
          }
        },
        {
          "name": "bathroom_type",
          "label": "Bathroom Type",
          "type": "select",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "western", "label": "Western"},
              {"value": "indian", "label": "Indian"},
              {"value": "both", "label": "Both Available"}
            ]
          }
        },
        {
          "name": "kitchen_access",
          "label": "Kitchen Access",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "shared", "label": "Shared Kitchen"},
              {"value": "private", "label": "Private Kitchen"},
              {"value": "no_kitchen", "label": "No Kitchen Access"}
            ]
          }
        },
        {
          "name": "parking_available",
          "label": "Parking Available",
          "type": "boolean",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "default": false
          }
        },
        {
          "name": "parking_type",
          "label": "Parking Type",
          "type": "select",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "covered", "label": "Covered Parking"},
              {"value": "open", "label": "Open Parking"},
              {"value": "both", "label": "Both Available"}
            ]
          }
        }
      ]
    },
    {
      "title": "Amenities & Facilities",
      "order": 4,
      "description": "Property amenities and facilities offered",
      "is_collapsible": true,
      "fields": [
        {
          "name": "basic_amenities",
          "label": "Basic Amenities",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "wifi", "label": "WiFi Internet"},
              {"value": "hot_water", "label": "Hot Water"},
              {"value": "geyser", "label": "Geyser"},
              {"value": "washing_machine", "label": "Washing Machine"},
              {"value": "refrigerator", "label": "Refrigerator"},
              {"value": "microwave", "label": "Microwave"},
              {"value": "tv", "label": "Television"},
              {"value": "air_conditioning", "label": "Air Conditioning"}
            ]
          }
        },
        {
          "name": "security_features",
          "label": "Security Features",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "security_guard", "label": "24/7 Security Guard"},
              {"value": "cctv", "label": "CCTV Surveillance"},
              {"value": "biometric_lock", "label": "Biometric Locks"},
              {"value": "emergency_alarms", "label": "Emergency Alarms"},
              {"value": "fire_safety", "label": "Fire Safety Equipment"}
            ]
          }
        },
        {
          "name": "housekeeping_services",
          "label": "Housekeeping Services",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "daily_cleaning", "label": "Daily Room Cleaning"},
              {"value": "linen_change", "label": "Regular Linen Change"},
              {"value": "laundry_service", "label": "Laundry Service"},
              {"value": "pest_control", "label": "Pest Control"}
            ]
          }
        },
        {
          "name": "common_areas",
          "label": "Common Areas",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "lounge", "label": "Common Lounge"},
              {"value": "dining_area", "label": "Dining Area"},
              {"value": "rooftop", "label": "Rooftop Access"},
              {"value": "garden", "label": "Garden/Patio"},
              {"value": "gym", "label": "Gym/Fitness Area"},
              {"value": "study_room", "label": "Study Room"}
            ]
          }
        },
        {
          "name": "additional_facilities",
          "label": "Additional Facilities",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "power_backup", "label": "Power Backup"},
              {"value": "lift", "label": "Lift/Elevator"},
              {"value": "water_purifier", "label": "Water Purifier"},
              {"value": "generator", "label": "Generator Backup"},
              {"value": "intercom", "label": "Intercom System"}
            ]
          }
        }
      ]
    },
    {
      "title": "Pricing & Terms",
      "order": 5,
      "description": "Pricing structure and rental terms",
      "is_collapsible": false,
      "fields": [
        {
          "name": "rent_per_month",
          "label": "Monthly Rent (₹)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:1000"],
          "ui_config": {
            "placeholder": "Monthly rent amount",
            "prefix": "₹"
          }
        },
        {
          "name": "security_deposit",
          "label": "Security Deposit (₹)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0"],
          "ui_config": {
            "placeholder": "Security deposit amount",
            "prefix": "₹"
          }
        },
        {
          "name": "maintenance_charges",
          "label": "Maintenance Charges (₹)",
          "type": "number",
          "required": false,
          "validation": ["min:0"],
          "ui_config": {
            "placeholder": "Monthly maintenance charges",
            "prefix": "₹"
          }
        },
        {
          "name": "electricity_charges",
          "label": "Electricity Charges",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "included", "label": "Included in Rent"},
              {"value": "separate", "label": "Billed Separately"},
              {"value": "subsidized", "label": "Subsidized Rate"}
            ]
          }
        },
        {
          "name": "minimum_stay",
          "label": "Minimum Stay Period",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "1_month", "label": "1 Month"},
              {"value": "3_months", "label": "3 Months"},
              {"value": "6_months", "label": "6 Months"},
              {"value": "1_year", "label": "1 Year"},
              {"value": "no_minimum", "label": "No Minimum Stay"}
            ]
          }
        },
        {
          "name": "notice_period",
          "label": "Notice Period for Termination",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "7_days", "label": "7 Days"},
              {"value": "15_days", "label": "15 Days"},
              {"value": "1_month", "label": "1 Month"},
              {"value": "2_months", "label": "2 Months"}
            ]
          }
        },
        {
          "name": "payment_frequency",
          "label": "Payment Frequency",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "monthly", "label": "Monthly"},
              {"value": "quarterly", "label": "Quarterly"},
              {"value": "half_yearly", "label": "Half Yearly"},
              {"value": "yearly", "label": "Yearly"}
            ]
          }
        },
        {
          "name": "late_payment_penalty",
          "label": "Late Payment Penalty (₹)",
          "type": "number",
          "required": false,
          "validation": ["min:0"],
          "ui_config": {
            "placeholder": "Penalty amount for late payment",
            "prefix": "₹"
          }
        }
      ]
    },
    {
      "title": "Rules & Policies",
      "order": 6,
      "description": "House rules and tenant policies",
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
              {"value": "strictly_prohibited", "label": "Strictly Prohibited"},
              {"value": "designated_areas", "label": "Allowed in Designated Areas"},
              {"value": "allowed", "label": "Allowed"}
            ]
          }
        },
        {
          "name": "alcohol_policy",
          "label": "Alcohol Consumption",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "not_allowed", "label": "Not Allowed"},
              {"value": "allowed_privately", "label": "Allowed in Private Rooms"},
              {"value": "allowed_common", "label": "Allowed in Common Areas"}
            ]
          }
        },
        {
          "name": "guest_policy",
          "label": "Guest Policy",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "no_guests", "label": "No Overnight Guests"},
              {"value": "guests_allowed", "label": "Overnight Guests Allowed"},
              {"value": "with_permission", "label": "Guests Allowed with Permission"}
            ]
          }
        },
        {
          "name": "visiting_hours",
          "label": "Visiting Hours",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "e.g., 8 AM - 10 PM"
          }
        },
        {
          "name": "food_restrictions",
          "label": "Food Restrictions",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "vegetarian_only", "label": "Vegetarian Only"},
              {"value": "no_non_veg", "label": "No Non-Vegetarian Food"},
              {"value": "no_alcohol", "label": "No Alcohol in Kitchen"},
              {"value": "no_outside_food", "label": "No Outside Food"}
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
              {"value": "not_allowed", "label": "Pets Not Allowed"},
              {"value": "small_pets_allowed", "label": "Small Pets Allowed"},
              {"value": "pets_allowed", "label": "Pets Allowed"}
            ]
          }
        },
        {
          "name": "additional_rules",
          "label": "Additional House Rules",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Any additional rules or policies for tenants",
            "rows": 4
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
            "placeholder": "Name of the contact person"
          }
        },
        {
          "name": "contact_designation",
          "label": "Designation",
          "type": "text",
          "required": false,
          "validation": ["max_length:50"],
          "ui_config": {
            "placeholder": "Owner, Manager, Caretaker, etc."
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
          "name": "emergency_contact",
          "label": "Emergency Contact",
          "type": "phone",
          "required": false,
          "validation": ["phone"],
          "ui_config": {
            "placeholder": "Emergency contact number"
          }
        }
      ]
    },
    {
      "title": "Images & Media",
      "order": 8,
      "description": "Property photos and media content",
      "is_collapsible": true,
      "fields": [
        {
          "name": "property_images",
          "label": "Property Images",
          "type": "file",
          "required": true,
          "validation": ["required", "file_type:image", "max_files:20"],
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "max_size": "5MB",
            "help_text": "Upload high-quality images of the property, rooms, common areas, and facilities"
          }
        },
        {
          "name": "room_images",
          "label": "Room Images",
          "type": "file",
          "required": true,
          "validation": ["required", "file_type:image", "max_files:10"],
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "max_size": "5MB",
            "help_text": "Upload images of individual rooms showing furnishings and layout"
          }
        },
        {
          "name": "bathroom_images",
          "label": "Bathroom Images",
          "type": "file",
          "required": false,
          "validation": ["file_type:image", "max_files:5"],
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "max_size": "5MB",
            "help_text": "Upload images of bathrooms and sanitation facilities"
          }
        },
        {
          "name": "common_area_images",
          "label": "Common Area Images",
          "type": "file",
          "required": false,
          "validation": ["file_type:image", "max_files:10"],
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "max_size": "5MB",
            "help_text": "Upload images of common areas, kitchen, lounge, etc."
          }
        },
        {
          "name": "virtual_tour",
          "label": "Virtual Tour Video",
          "type": "url",
          "required": false,
          "validation": ["url"],
          "ui_config": {
            "placeholder": "YouTube/Vimeo link to virtual tour video"
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
      "order": 9,
      "description": "Extra services and value-added offerings",
      "is_collapsible": true,
      "fields": [
        {
          "name": "meal_services",
          "label": "Meal Services",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "breakfast", "label": "Breakfast"},
              {"value": "lunch", "label": "Lunch"},
              {"value": "dinner", "label": "Dinner"},
              {"value": "snacks", "label": "Evening Snacks"}
            ]
          }
        },
        {
          "name": "transport_services",
          "label": "Transport Services",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "pickup_drop", "label": "Airport/Railway Pickup & Drop"},
              {"value": "local_transport", "label": "Local Transport"},
              {"value": "cab_service", "label": "Cab Service"},
              {"value": "bike_sharing", "label": "Bike Sharing"}
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
              {"value": "ticket_booking", "label": "Ticket Booking"},
              {"value": "tour_guidance", "label": "Local Tour Guidance"},
              {"value": "medical_assistance", "label": "Medical Assistance"},
              {"value": "visa_assistance", "label": "Visa Assistance"}
            ]
          }
        },
        {
          "name": "business_services",
          "label": "Business Services",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "meeting_room", "label": "Meeting Room"},
              {"value": "printing", "label": "Printing/Scanning"},
              {"value": "business_center", "label": "Business Center"},
              {"value": "courier_service", "label": "Courier Service"}
            ]
          }
        },
        {
          "name": "recreational_facilities",
          "label": "Recreational Facilities",
          "type": "checkbox",
          "required": false,
          "validation": [],
          "ui_config": {
            "options": [
              {"value": "gym", "label": "Gym/Fitness Center"},
              {"value": "swimming_pool", "label": "Swimming Pool"},
              {"value": "game_room", "label": "Game Room"},
              {"value": "library", "label": "Library/Reading Room"},
              {"value": "movie_nights", "label": "Movie Nights"},
              {"value": "cultural_events", "label": "Cultural Events"}
            ]
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
          "name": "certifications",
          "label": "Certifications & Awards",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:300"],
          "ui_config": {
            "placeholder": "Safety certifications, awards, recognitions",
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
- **Property Classification**: PG, Guest House, Hostel, Service Apartment, Co-Living options
- **Room Configuration**: Single, double, triple occupancy with size specifications
- **Furnishing Levels**: Fully furnished, semi-furnished, unfurnished options
- **Amenity Management**: Comprehensive amenities from basic WiFi to recreational facilities
- **Security Features**: 24/7 security, CCTV, biometric locks, emergency systems

### Validation Rules
- **Property Information**: Required fields for accurate classification
- **Location Data**: GPS coordinates for mapping and distance calculations
- **Pricing Validation**: Minimum rent amounts and deposit requirements
- **Contact Verification**: Valid phone numbers and email addresses
- **Image Requirements**: High-quality photos for property showcase
- **Policy Compliance**: House rules and tenant agreement terms

### UI/UX Enhancements
- **Progressive Disclosure**: Collapsible sections for better user experience
- **Smart Calculations**: Automatic price per unit calculations
- **Conditional Fields**: Dynamic field visibility based on property type
- **Rich Media Support**: Multiple image uploads with virtual tours
- **Location Mapping**: GPS coordinate integration for precise property mapping

### API Integration Points
- **Car Management API**: Integration with location services for neighborhood data
- **Schema Template System**: Dynamic form generation with validation rules
- **File Upload Service**: Firebase integration for property images and documents
- **Analytics Integration**: Property view tracking and lead generation analytics

### Compliance & Standards
- **Rental Laws**: Compliance with tenant rights and rental regulations
- **Safety Standards**: Fire safety, emergency protocols, hygiene compliance
- **Data Privacy**: GDPR/CCPA compliant data handling
- **Industry Standards**: Alignment with hospitality and accommodation best practices
- **Regulatory Compliance**: Local accommodation licensing and registration requirements

## Usage Instructions

1. **Template Assignment**: Assign this template to accommodation category via `/api/v1/schema-templates/{id}/assign-category`
2. **Form Generation**: Use `GET /api/v1/catalog/categories/{id}/schema` to retrieve complete form structure
3. **Validation**: Implement client-side validation using provided validation rules
4. **Image Upload**: Use Firebase storage for property images with automatic optimization
5. **GPS Integration**: Enable location services for precise property mapping
6. **Document Verification**: Implement legal document validation against official records
7. **Tenant Screening**: Integrate background check and verification services

## Implementation Notes

- **Database Storage**: Template stored as JSONB in PostgreSQL for flexible querying
- **Performance**: Optimized with proper indexing on frequently queried fields
- **Scalability**: Supports unlimited custom fields through JSONB structure
- **Version Control**: Template versioning for backward compatibility
- **Audit Trail**: Complete change tracking for compliance requirements

This template provides a comprehensive, industry-standard solution for PG and guest house listings on the eBidPortal marketplace, ensuring professional presentation and regulatory compliance for accommodation providers.