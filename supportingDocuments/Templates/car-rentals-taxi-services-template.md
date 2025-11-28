# Professional Car Rentals & Taxi Services Template for eBidPortal

**Template Name:** Car Rentals & Taxi Services Template
**Version:** 1.0
**Category Type:** transportation
**Created:** November 20, 2025
**Industry Standards:** Based on transportation industry standards (IATA, local tourism boards, ride-sharing regulations)

## Template JSON Structure

```json
{
  "name": "Car Rentals & Taxi Services Template",
  "description": "Comprehensive template for car rental companies, taxi services, chauffeur services, and transportation providers. Includes vehicle fleet management, pricing structures, booking systems, and regulatory compliance features.",
  "category_type": "transportation",
  "is_active": true,
  "sections": [
    {
      "title": "Service Information",
      "order": 1,
      "description": "Basic service details and business information",
      "is_collapsible": false,
      "fields": [
        {
          "name": "service_title",
          "label": "Service Title",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:10", "max_length:100"],
          "ui_config": {
            "placeholder": "e.g., Premium Car Rental Services in Mumbai - Luxury Fleet Available",
            "helpText": "Create an attractive title that highlights your service offerings"
          }
        },
        {
          "name": "service_type",
          "label": "Service Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "car_rental", "label": "Car Rental"},
              {"value": "taxi_service", "label": "Taxi Service"},
              {"value": "chauffeur_service", "label": "Chauffeur Service"},
              {"value": "limousine_service", "label": "Limousine Service"},
              {"value": "airport_transfer", "label": "Airport Transfer"},
              {"value": "tour_transport", "label": "Tour Transportation"},
              {"value": "corporate_transport", "label": "Corporate Transportation"},
              {"value": "wedding_transport", "label": "Wedding Car Service"},
              {"value": "event_transport", "label": "Event Transportation"},
              {"value": "medical_transport", "label": "Medical Transportation"}
            ],
            "placeholder": "Select your primary service type"
          }
        },
        {
          "name": "business_type",
          "label": "Business Structure",
          "type": "radio",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "individual", "label": "Individual Operator"},
              {"value": "small_business", "label": "Small Business (1-10 vehicles)"},
              {"value": "medium_business", "label": "Medium Business (11-50 vehicles)"},
              {"value": "large_fleet", "label": "Large Fleet (50+ vehicles)"},
              {"value": "franchise", "label": "Franchise/Chain"},
              {"value": "cooperative", "label": "Transport Cooperative"}
            ]
          }
        },
        {
          "name": "service_area",
          "label": "Service Area",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "local_city", "label": "Local City"},
              {"value": "metropolitan", "label": "Metropolitan Area"},
              {"value": "state_wide", "label": "State-wide"},
              {"value": "multi_state", "label": "Multi-state"},
              {"value": "national", "label": "National Coverage"},
              {"value": "international", "label": "International"}
            ],
            "placeholder": "Select your service coverage area"
          }
        },
        {
          "name": "operating_hours",
          "label": "Operating Hours",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "24_7", "label": "24/7 Service"},
              {"value": "business_hours", "label": "Business Hours (9 AM - 6 PM)"},
              {"value": "extended_hours", "label": "Extended Hours (6 AM - 10 PM)"},
              {"value": "peak_hours", "label": "Peak Hours Only"},
              {"value": "on_demand", "label": "On-demand/Booking Only"}
            ]
          }
        }
      ]
    },
    {
      "title": "Vehicle Fleet Information",
      "order": 2,
      "description": "Details about vehicles available for service",
      "is_collapsible": false,
      "fields": [
        {
          "name": "primary_vehicle_brand",
          "label": "Primary Vehicle Brand",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "maruti_suzuki", "label": "Maruti Suzuki"},
              {"value": "hyundai", "label": "Hyundai"},
              {"value": "tata", "label": "Tata"},
              {"value": "mahindra", "label": "Mahindra"},
              {"value": "toyota", "label": "Toyota"},
              {"value": "honda", "label": "Honda"},
              {"value": "ford", "label": "Ford"},
              {"value": "volkswagen", "label": "Volkswagen"},
              {"value": "renault", "label": "Renault"},
              {"value": "nissan", "label": "Nissan"},
              {"value": "skoda", "label": "Skoda"},
              {"value": "kia", "label": "Kia"},
              {"value": "mg", "label": "MG Motor"},
              {"value": "jeep", "label": "Jeep"},
              {"value": "bmw", "label": "BMW"},
              {"value": "mercedes_benz", "label": "Mercedes-Benz"},
              {"value": "audi", "label": "Audi"},
              {"value": "volvo", "label": "Volvo"},
              {"value": "land_rover", "label": "Land Rover"},
              {"value": "jaguar", "label": "Jaguar"},
              {"value": "porsche", "label": "Porsche"},
              {"value": "tesla", "label": "Tesla"},
              {"value": "other", "label": "Other/Multiple Brands"}
            ],
            "placeholder": "Select primary vehicle brand in your fleet",
            "helpText": "Choose the main brand or 'Multiple Brands' if you have a diverse fleet"
          }
        },
        {
          "name": "fleet_size",
          "label": "Fleet Size",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "1_5", "label": "1-5 vehicles"},
              {"value": "6_10", "label": "6-10 vehicles"},
              {"value": "11_25", "label": "11-25 vehicles"},
              {"value": "26_50", "label": "26-50 vehicles"},
              {"value": "51_100", "label": "51-100 vehicles"},
              {"value": "100_plus", "label": "100+ vehicles"}
            ]
          }
        },
        {
          "name": "vehicle_types_offered",
          "label": "Vehicle Types Offered",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "compact", "label": "Compact Cars"},
              {"value": "sedan", "label": "Sedans"},
              {"value": "suv", "label": "SUVs"},
              {"value": "luxury", "label": "Luxury Cars"},
              {"value": "van", "label": "Vans/Minivans"},
              {"value": "bus", "label": "Buses"},
              {"value": "limousine", "label": "Limousines"},
              {"value": "motorcycle", "label": "Motorcycles/Scooters"},
              {"value": "electric", "label": "Electric Vehicles"},
              {"value": "hybrid", "label": "Hybrid Vehicles"}
            ],
            "helpText": "Select all vehicle types available in your fleet"
          }
        },
        {
          "name": "vehicle_age_preference",
          "label": "Vehicle Age Preference",
          "type": "radio",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "brand_new", "label": "Brand New (0-1 year)"},
              {"value": "recent", "label": "Recent Models (1-3 years)"},
              {"value": "mixed", "label": "Mixed Age Fleet"},
              {"value": "well_maintained", "label": "Well-maintained regardless of age"}
            ]
          }
        },
        {
          "name": "fuel_types",
          "label": "Fuel Types Available",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "petrol", "label": "Petrol"},
              {"value": "diesel", "label": "Diesel"},
              {"value": "cng", "label": "CNG"},
              {"value": "electric", "label": "Electric"},
              {"value": "hybrid", "label": "Hybrid"},
              {"value": "hydrogen", "label": "Hydrogen"}
            ]
          }
        }
      ]
    },
    {
      "title": "Pricing Structure",
      "order": 3,
      "description": "Comprehensive pricing information for different services",
      "is_collapsible": false,
      "fields": [
        {
          "name": "pricing_model",
          "label": "Pricing Model",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "hourly", "label": "Hourly Rates"},
              {"value": "daily", "label": "Daily Rates"},
              {"value": "package", "label": "Package Deals"},
              {"value": "distance", "label": "Per Kilometer/Mile"},
              {"value": "fixed", "label": "Fixed Price Routes"},
              {"value": "negotiable", "label": "Negotiable Pricing"}
            ],
            "placeholder": "Select your primary pricing model"
          }
        },
        {
          "name": "base_hourly_rate",
          "label": "Base Hourly Rate (INR)",
          "type": "number",
          "required": false,
          "validation": ["min:100", "max:50000"],
          "ui_config": {
            "step": 50,
            "prefix": "₹",
            "suffix": "per hour",
            "helpText": "Minimum hourly rate for basic services"
          }
        },
        {
          "name": "base_daily_rate",
          "label": "Base Daily Rate (INR)",
          "type": "number",
          "required": false,
          "validation": ["min:1000", "max:100000"],
          "ui_config": {
            "step": 500,
            "prefix": "₹",
            "suffix": "per day",
            "helpText": "Base daily rental rate (24 hours)"
          }
        },
        {
          "name": "minimum_booking_hours",
          "label": "Minimum Booking Hours",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:72"],
          "ui_config": {
            "suffix": "hours",
            "helpText": "Minimum hours required for booking"
          }
        },
        {
          "name": "minimum_booking_days",
          "label": "Minimum Booking Days",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:365"],
          "ui_config": {
            "suffix": "days",
            "helpText": "Minimum days required for rental booking"
          }
        },
        {
          "name": "extra_km_rate",
          "label": "Extra Kilometer Rate (INR)",
          "type": "number",
          "required": false,
          "validation": ["min:5", "max:500"],
          "ui_config": {
            "step": 5,
            "prefix": "₹",
            "suffix": "per km",
            "helpText": "Additional charges for kilometers beyond included limit"
          }
        },
        {
          "name": "included_kms_per_day",
          "label": "Included Kilometers per Day",
          "type": "number",
          "required": false,
          "validation": ["min:50", "max:1000"],
          "ui_config": {
            "suffix": "km",
            "helpText": "Free kilometers included in daily rate"
          }
        },
        {
          "name": "fuel_policy",
          "label": "Fuel Policy",
          "type": "radio",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "full_to_full", "label": "Full to Full"},
              {"value": "return_same_level", "label": "Return at same fuel level"},
              {"value": "fuel_included", "label": "Fuel included in rate"},
              {"value": "customer_pays", "label": "Customer pays for fuel used"}
            ]
          }
        },
        {
          "name": "driver_charges",
          "label": "Driver Charges (INR)",
          "type": "number",
          "required": false,
          "validation": ["min:0", "max:10000"],
          "ui_config": {
            "step": 100,
            "prefix": "₹",
            "suffix": "per day",
            "helpText": "Additional driver charges if applicable"
          }
        },
        {
          "name": "night_charges",
          "label": "Night Charges (INR)",
          "type": "number",
          "required": false,
          "validation": ["min:0", "max:5000"],
          "ui_config": {
            "step": 50,
            "prefix": "₹",
            "suffix": "per hour",
            "helpText": "Additional charges for night time service (10 PM - 6 AM)"
          }
        }
      ]
    },
    {
      "title": "Location & Availability",
      "order": 4,
      "description": "Service locations, pickup points, and availability information",
      "is_collapsible": false,
      "fields": [
        {
          "name": "service_locations",
          "label": "Service Locations",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:10", "max_length:1000"],
          "ui_config": {
            "placeholder": "List all cities/areas where you provide service (e.g., Mumbai, Delhi, Bangalore, Pune)",
            "rows": 3,
            "helpText": "Specify all locations where your service is available"
          }
        },
        {
          "name": "pickup_points",
          "label": "Pickup/Drop-off Points",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Major pickup points: Airports, Railway Stations, Hotels, etc.",
            "rows": 3,
            "helpText": "List major pickup and drop-off locations"
          }
        },
        {
          "name": "airport_service",
          "label": "Airport Transfer Service",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "defaultValue": false,
            "helpText": "Check if you provide airport pickup/drop-off services"
          }
        },
        {
          "name": "railway_service",
          "label": "Railway Station Service",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "defaultValue": false,
            "helpText": "Check if you provide railway station pickup/drop-off services"
          }
        },
        {
          "name": "intercity_service",
          "label": "Inter-city Travel",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "defaultValue": false,
            "helpText": "Check if you provide inter-city or outstation travel services"
          }
        },
        {
          "name": "advance_booking_required",
          "label": "Advance Booking Required",
          "type": "radio",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "no", "label": "No advance booking required"},
              {"value": "same_day", "label": "Same day booking accepted"},
              {"value": "24_hours", "label": "24 hours advance required"},
              {"value": "48_hours", "label": "48 hours advance required"},
              {"value": "week", "label": "1 week advance required"}
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
              {"value": "flexible", "label": "Flexible (free cancellation up to 24 hours)"},
              {"value": "moderate", "label": "Moderate (50% charge within 24 hours)"},
              {"value": "strict", "label": "Strict (no refunds for cancellations)"},
              {"value": "custom", "label": "Custom policy (specify in description)"}
            ]
          }
        }
      ]
    },
    {
      "title": "Service Features & Amenities",
      "order": 5,
      "description": "Additional services and amenities offered",
      "is_collapsible": true,
      "fields": [
        {
          "name": "amenities",
          "label": "Vehicle Amenities",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "ac", "label": "Air Conditioning"},
              {"value": "music_system", "label": "Music System"},
              {"value": "gps", "label": "GPS Navigation"},
              {"value": "wifi", "label": "WiFi"},
              {"value": "usb_charging", "label": "USB Charging Ports"},
              {"value": "child_seat", "label": "Child Safety Seats"},
              {"value": "roof_rack", "label": "Roof Rack"},
              {"value": "sunroof", "label": "Sunroof"},
              {"value": "leather_seats", "label": "Leather Seats"},
              {"value": "tinted_glass", "label": "Tinted Glass"}
            ],
            "helpText": "Select amenities available in your vehicles"
          }
        },
        {
          "name": "additional_services",
          "label": "Additional Services",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "driver_provided", "label": "Driver Provided"},
              {"value": "fuel_surcharge_waived", "label": "Fuel Surcharge Waived"},
              {"value": "maintenance_included", "label": "Maintenance Included"},
              {"value": "roadside_assistance", "label": "24/7 Roadside Assistance"},
              {"value": "toll_charges_included", "label": "Toll Charges Included"},
              {"value": "parking_fees_included", "label": "Parking Fees Included"},
              {"value": "delivery_pickup", "label": "Door-to-Door Delivery"},
              {"value": "concierge_service", "label": "Concierge Service"},
              {"value": "tour_guide", "label": "Tour Guide Available"},
              {"value": "interpreter", "label": "Interpreter Services"}
            ]
          }
        },
        {
          "name": "payment_methods",
          "label": "Accepted Payment Methods",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "cash", "label": "Cash"},
              {"value": "card", "label": "Credit/Debit Cards"},
              {"value": "upi", "label": "UPI"},
              {"value": "net_banking", "label": "Net Banking"},
              {"value": "wallet", "label": "Digital Wallets"},
              {"value": "cheque", "label": "Cheque"},
              {"value": "bank_transfer", "label": "Bank Transfer"}
            ]
          }
        },
        {
          "name": "languages_supported",
          "label": "Languages Supported",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "english", "label": "English"},
              {"value": "hindi", "label": "Hindi"},
              {"value": "marathi", "label": "Marathi"},
              {"value": "gujarati", "label": "Gujarati"},
              {"value": "tamil", "label": "Tamil"},
              {"value": "telugu", "label": "Telugu"},
              {"value": "kannada", "label": "Kannada"},
              {"value": "malayalam", "label": "Malayalam"},
              {"value": "bengali", "label": "Bengali"},
              {"value": "punjabi", "label": "Punjabi"},
              {"value": "other", "label": "Other (specify in description)"}
            ]
          }
        }
      ]
    },
    {
      "title": "Driver & Safety Information",
      "order": 6,
      "description": "Driver qualifications, licensing, and safety measures",
      "is_collapsible": true,
      "fields": [
        {
          "name": "driver_provided",
          "label": "Driver Provided with Vehicle",
          "type": "boolean",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "defaultValue": true,
            "helpText": "Do you provide trained drivers with your vehicles?"
          }
        },
        {
          "name": "driver_qualification",
          "label": "Driver Qualifications",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "licensed", "label": "Valid Commercial License"},
              {"value": "experienced", "label": "5+ years experience"},
              {"value": "background_verified", "label": "Background Verified"},
              {"value": "english_speaking", "label": "English Speaking"},
              {"value": "local_knowledge", "label": "Local Area Knowledge"},
              {"value": "first_aid_trained", "label": "First Aid Trained"},
              {"value": "defensive_driving", "label": "Defensive Driving Certified"}
            ]
          }
        },
        {
          "name": "vehicle_insurance",
          "label": "Vehicle Insurance Coverage",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "comprehensive", "label": "Comprehensive Insurance"},
              {"value": "third_party", "label": "Third Party Insurance"},
              {"value": "passenger_liability", "label": "Passenger Liability"},
              {"value": "personal_accident", "label": "Personal Accident Cover"},
              {"value": "zero_deductible", "label": "Zero Deductible"},
              {"value": "roadside_assistance", "label": "24/7 Roadside Assistance"}
            ],
            "helpText": "Select all insurance coverage provided"
          }
        },
        {
          "name": "safety_features",
          "label": "Safety Features",
          "type": "checkbox",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "seatbelts", "label": "Seat Belts for All Passengers"},
              {"value": "airbags", "label": "Airbags"},
              {"value": "abs_brakes", "label": "ABS Brakes"},
              {"value": "emergency_kit", "label": "Emergency Kit"},
              {"value": "fire_extinguisher", "label": "Fire Extinguisher"},
              {"value": "first_aid_kit", "label": "First Aid Kit"},
              {"value": "gps_tracking", "label": "GPS Tracking"},
              {"value": "panic_button", "label": "Panic Button"},
              {"value": "speed_governor", "label": "Speed Governor"},
              {"value": "cctv_camera", "label": "CCTV Camera"}
            ]
          }
        },
        {
          "name": "vehicle_maintenance",
          "label": "Vehicle Maintenance Schedule",
          "type": "radio",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "daily", "label": "Daily inspections"},
              {"value": "weekly", "label": "Weekly maintenance"},
              {"value": "monthly", "label": "Monthly servicing"},
              {"value": "as_needed", "label": "Maintenance as needed"}
            ]
          }
        }
      ]
    },
    {
      "title": "Business Information & Compliance",
      "order": 7,
      "description": "Legal and business compliance information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "business_registration",
          "label": "Business Registration Type",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "proprietorship", "label": "Proprietorship"},
              {"value": "partnership", "label": "Partnership"},
              {"value": "private_limited", "label": "Private Limited Company"},
              {"value": "llp", "label": "Limited Liability Partnership"},
              {"value": "cooperative", "label": "Cooperative Society"},
              {"value": "unregistered", "label": "Unregistered Business"}
            ]
          }
        },
        {
          "name": "licenses_permits",
          "label": "Licenses & Permits",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "commercial_license", "label": "Commercial Vehicle License"},
              {"value": "transport_permit", "label": "Transport Permit"},
              {"value": "tour_operator", "label": "Tour Operator License"},
              {"value": "rto_registration", "label": "RTO Registration"},
              {"value": "police_clearance", "label": "Police Clearance Certificate"},
              {"value": "gst_registered", "label": "GST Registered"},
              {"value": "iso_certified", "label": "ISO Certified"}
            ],
            "helpText": "Select all applicable licenses and permits"
          }
        },
        {
          "name": "years_in_business",
          "label": "Years in Business",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "0_1", "label": "Less than 1 year"},
              {"value": "1_3", "label": "1-3 years"},
              {"value": "3_5", "label": "3-5 years"},
              {"value": "5_10", "label": "5-10 years"},
              {"value": "10_plus", "label": "10+ years"}
            ]
          }
        },
        {
          "name": "customer_reviews_rating",
          "label": "Average Customer Rating",
          "type": "rating",
          "required": false,
          "ui_config": {
            "maxRating": 5,
            "allowHalf": true,
            "helpText": "Your average rating from customer reviews"
          }
        },
        {
          "name": "total_customers_served",
          "label": "Total Customers Served",
          "type": "select",
          "required": false,
          "ui_config": {
            "options": [
              {"value": "0_100", "label": "0-100 customers"},
              {"value": "100_500", "label": "100-500 customers"},
              {"value": "500_1000", "label": "500-1,000 customers"},
              {"value": "1000_5000", "label": "1,000-5,000 customers"},
              {"value": "5000_plus", "label": "5,000+ customers"}
            ]
          }
        }
      ]
    },
    {
      "title": "Contact & Booking Information",
      "order": 8,
      "description": "Contact details and booking procedures",
      "is_collapsible": false,
      "fields": [
        {
          "name": "contact_number",
          "label": "Primary Contact Number",
          "type": "phone",
          "required": true,
          "validation": ["required", "phone"],
          "ui_config": {
            "placeholder": "+91-9876543210",
            "helpText": "Primary contact number for bookings"
          }
        },
        {
          "name": "alternate_contact",
          "label": "Alternate Contact Number",
          "type": "phone",
          "required": false,
          "validation": ["phone"],
          "ui_config": {
            "placeholder": "+91-9876543210"
          }
        },
        {
          "name": "whatsapp_number",
          "label": "WhatsApp Business Number",
          "type": "phone",
          "required": false,
          "validation": ["phone"],
          "ui_config": {
            "placeholder": "+91-9876543210",
            "helpText": "WhatsApp number for instant booking"
          }
        },
        {
          "name": "email_address",
          "label": "Business Email",
          "type": "email",
          "required": true,
          "validation": ["required", "email"],
          "ui_config": {
            "placeholder": "bookings@company.com"
          }
        },
        {
          "name": "website_url",
          "label": "Website URL",
          "type": "url",
          "required": false,
          "validation": ["url"],
          "ui_config": {
            "placeholder": "https://www.company.com"
          }
        },
        {
          "name": "booking_methods",
          "label": "Booking Methods Available",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "phone", "label": "Phone Call"},
              {"value": "whatsapp", "label": "WhatsApp"},
              {"value": "email", "label": "Email"},
              {"value": "website", "label": "Online Website"},
              {"value": "app", "label": "Mobile App"},
              {"value": "walk_in", "label": "Walk-in"},
              {"value": "third_party", "label": "Third-party Platforms"}
            ]
          }
        },
        {
          "name": "emergency_contact",
          "label": "Emergency Contact Number",
          "type": "phone",
          "required": true,
          "validation": ["required", "phone"],
          "ui_config": {
            "placeholder": "+91-9876543210",
            "helpText": "24/7 emergency contact for breakdowns or issues"
          }
        }
      ]
    },
    {
      "title": "Additional Information & Terms",
      "order": 9,
      "description": "Additional service details and terms & conditions",
      "is_collapsible": true,
      "fields": [
        {
          "name": "service_description",
          "label": "Detailed Service Description",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:50", "max_length:2000"],
          "ui_config": {
            "placeholder": "Provide detailed information about your services, unique selling points, and what makes your service special...",
            "rows": 6,
            "helpText": "Describe your services in detail to help customers understand what you offer"
          }
        },
        {
          "name": "terms_conditions",
          "label": "Terms & Conditions",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:100", "max_length:5000"],
          "ui_config": {
            "placeholder": "Enter your complete terms and conditions including cancellation policy, liability, payment terms, etc...",
            "rows": 8,
            "helpText": "Complete terms and conditions that customers agree to when booking"
          }
        },
        {
          "name": "special_offers",
          "label": "Current Special Offers",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "List any current promotions, discounts, or special packages...",
            "rows": 4
          }
        },
        {
          "name": "service_images",
          "label": "Service Images",
          "type": "file",
          "required": false,
          "validation": ["fileType:image", "fileSize:5000000"],
          "ui_config": {
            "accept": "image/*",
            "multiple": true,
            "maxFiles": 10,
            "helpText": "Upload images of your vehicles, service locations, and facilities (max 10 images, 5MB each)"
          }
        },
        {
          "name": "service_videos",
          "label": "Service Videos",
          "type": "file",
          "required": false,
          "validation": ["fileType:video", "fileSize:50000000"],
          "ui_config": {
            "accept": "video/*",
            "multiple": true,
            "maxFiles": 3,
            "helpText": "Upload videos showcasing your services (max 3 videos, 50MB each)"
          }
        }
      ]
    }
  ]
}
```

## Template Features

### **🎯 Service Type Coverage**
- **Car Rental Services**: Self-drive and chauffeur-driven rentals
- **Taxi Services**: Point-to-point transportation
- **Chauffeur Services**: Premium executive transportation
- **Limousine Services**: Luxury and special occasion transport
- **Airport Transfers**: Airport pickup/drop-off services
- **Tour Transportation**: Group and individual tour services
- **Corporate Transportation**: Business travel solutions
- **Event Transportation**: Weddings, parties, corporate events
- **Medical Transportation**: Ambulance and medical transport
- **Specialized Services**: Custom transportation solutions

### **🚗 Vehicle Fleet Integration**
- **API Integration**: Uses `/api/v1/cars/brands` for brand selection
- **Dynamic Models**: Integrates with `/api/v1/cars/models` for model selection
- **Variant Support**: Uses `/api/v1/cars/variants` for specific vehicle details
- **Fleet Management**: Comprehensive fleet size and composition tracking
- **Fuel Types**: Support for all fuel types including electric and hybrid

### **💰 Advanced Pricing Structure**
- **Multiple Pricing Models**: Hourly, daily, package, distance-based, fixed rates
- **Dynamic Pricing**: Extra kilometer charges, night charges, driver fees
- **Fuel Policies**: Full-to-full, same-level return, included fuel options
- **Minimum Bookings**: Configurable minimum hours/days requirements
- **Transparent Pricing**: Clear cost breakdown for customers

### **📍 Location & Availability Management**
- **Multi-location Support**: City-wide, state-wide, national coverage
- **Pickup Points**: Airports, railway stations, hotels, custom locations
- **Advance Booking**: Flexible booking requirements from same-day to 1 week
- **Service Hours**: 24/7, business hours, extended hours options
- **Geographic Coverage**: Local to international service areas

### **🛡️ Safety & Compliance**
- **Driver Qualifications**: Licensed, experienced, background-verified drivers
- **Vehicle Insurance**: Comprehensive coverage options
- **Safety Features**: Modern safety equipment and emergency preparedness
- **Regulatory Compliance**: Transport permits, RTO registration, police clearance
- **Business Licensing**: Complete business registration and certification tracking

### **📱 Digital Integration**
- **Multi-channel Booking**: Phone, WhatsApp, email, website, mobile app
- **Payment Methods**: Cash, cards, UPI, digital wallets, bank transfers
- **GPS Tracking**: Real-time vehicle location and tracking
- **Emergency Support**: 24/7 emergency contact and roadside assistance
- **Customer Communication**: Multi-language support and concierge services

### **📊 Business Intelligence**
- **Performance Tracking**: Years in business, customer ratings, total customers served
- **Service Analytics**: Fleet utilization, revenue tracking, customer satisfaction
- **Quality Metrics**: Maintenance schedules, vehicle condition tracking
- **Market Positioning**: Competitive pricing and service differentiation

## API Integration Points

### **Car Management APIs Used:**
```javascript
// Get available car brands for fleet selection
GET /api/v1/cars/brands?limit=100

// Get models for specific brand
GET /api/v1/cars/brands/{brandId}/models

// Get variants for specific model
GET /api/v1/cars/models/{modelId}/variants
```

### **Schema Template APIs:**
```javascript
// Create the transportation template
POST /api/v1/schema-templates

// Assign template to transportation category
POST /api/v1/templates/{id}/assign-category

// Get dynamic form for category
GET /api/v1/catalog/categories/{id}/schema
```

## Implementation Notes

### **Field Validation Rules:**
- **Required Fields**: Service title, type, pricing model, contact information
- **Conditional Logic**: Pricing fields shown based on selected pricing model
- **File Uploads**: Image and video validation with size and type restrictions
- **Phone/Email**: Format validation for contact information
- **Numeric Ranges**: Realistic limits for pricing and fleet size

### **Frontend Integration:**
- **Dynamic Forms**: Template renders as dynamic form with conditional sections
- **Progressive Disclosure**: Optional sections collapsed by default
- **Real-time Validation**: Client-side validation with server-side verification
- **Multi-step Process**: Logical flow from basic info to detailed specifications

### **Business Logic:**
- **Pricing Transparency**: Clear cost breakdown prevents misunderstandings
- **Compliance Tracking**: Regulatory requirements clearly documented
- **Quality Assurance**: Safety and maintenance standards enforced
- **Customer Protection**: Comprehensive insurance and liability coverage

## Usage Examples

### **Car Rental Company:**
- Service Type: "Car Rental"
- Fleet Size: "26-50 vehicles"
- Pricing Model: "Daily Rates"
- Base Daily Rate: ₹2,500
- Included KMs: 200 km/day
- Extra KM Rate: ₹15/km

### **Premium Chauffeur Service:**
- Service Type: "Chauffeur Service"
- Vehicle Types: Luxury Cars, SUVs
- Pricing Model: "Hourly Rates"
- Base Hourly Rate: ₹800
- Minimum Hours: 4
- Driver Provided: Yes

### **Airport Transfer Service:**
- Service Type: "Airport Transfer"
- Service Area: "Metropolitan Area"
- Pricing Model: "Fixed Price Routes"
- Airport Service: Yes
- Advance Booking: "24 hours advance required"

This template provides a comprehensive framework for transportation service providers to list their services on eBidPortal with industry-standard specifications, regulatory compliance, and customer protection features.</content>
<parameter name="filePath">/Volumes/ManishData/ManishPersonal/eBidPortal_2/eBidPortal_Apis/Docs/Templates/car-rentals-taxi-services-template.md