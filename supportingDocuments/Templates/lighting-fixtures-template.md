# Lighting & Fixtures Template

```json
{
  "name": "Lighting & Fixtures",
  "description": "Industry-level template for lighting fixtures, lamps, bulbs, chandeliers, and lighting accessories with comprehensive specifications, energy ratings, safety certifications, and installation requirements.",
  "category_type": "lighting_fixtures",
  "is_active": true,
  "sections": [
    {
      "title": "Basic Information",
      "order": 1,
      "description": "Essential product identification and basic specifications",
      "is_collapsible": false,
      "fields": [
        {
          "name": "product_title",
          "label": "Product Title",
          "type": "text",
          "required": true,
          "validation": {
            "min_length": 10,
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "Enter product title (e.g., LED Ceiling Light Fixture)",
            "help_text": "Clear, descriptive title including brand and key features"
          }
        },
        {
          "name": "brand",
          "label": "Brand",
          "type": "text",
          "required": true,
          "validation": {
            "min_length": 2,
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "Enter brand name",
            "help_text": "Manufacturer or brand name"
          }
        },
        {
          "name": "model_number",
          "label": "Model Number",
          "type": "text",
          "required": true,
          "validation": {
            "min_length": 2,
            "max_length": 50
          },
          "ui_config": {
            "placeholder": "Enter model/part number",
            "help_text": "Manufacturer's model or part number"
          }
        },
        {
          "name": "sku",
          "label": "SKU",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 50
          },
          "ui_config": {
            "placeholder": "Enter SKU",
            "help_text": "Stock Keeping Unit for inventory management"
          }
        },
        {
          "name": "lighting_type",
          "label": "Lighting Type",
          "type": "select",
          "required": true,
          "validation": {},
          "ui_config": {
            "options": [
              "Indoor Lighting",
              "Outdoor Lighting",
              "Commercial Lighting",
              "Decorative Lighting",
              "Task Lighting",
              "Emergency Lighting",
              "Smart Lighting",
              "LED Lighting",
              "Fluorescent Lighting",
              "Halogen Lighting",
              "Incandescent Lighting",
              "Solar Lighting"
            ],
            "help_text": "Primary category of lighting fixture"
          }
        },
        {
          "name": "fixture_type",
          "label": "Fixture Type",
          "type": "select",
          "required": true,
          "validation": {},
          "ui_config": {
            "options": [
              "Ceiling Light",
              "Pendant Light",
              "Chandelier",
              "Wall Sconce",
              "Floor Lamp",
              "Table Lamp",
              "Track Lighting",
              "Recessed Lighting",
              "Under Cabinet Lighting",
              "Outdoor Wall Light",
              "Outdoor Post Light",
              "Flood Light",
              "Spotlight",
              "Strip Light",
              "Panel Light",
              "Downlight",
              "Uplight",
              "Vanity Light",
              "Bathroom Light",
              "Kitchen Light",
              "Bedroom Light",
              "Living Room Light",
              "Office Light",
              "Emergency Exit Light",
              "Night Light",
              "String Lights",
              "Landscape Lighting",
              "Pool Lighting",
              "Security Lighting"
            ],
            "help_text": "Specific type of lighting fixture"
          }
        }
      ]
    },
    {
      "title": "Technical Specifications",
      "order": 2,
      "description": "Detailed technical specifications and performance characteristics",
      "is_collapsible": true,
      "fields": [
        {
          "name": "power_source",
          "label": "Power Source",
          "type": "select",
          "required": true,
          "validation": {},
          "ui_config": {
            "options": [
              "AC Power",
              "DC Power",
              "Battery",
              "Solar",
              "USB",
              "Wireless",
              "Hardwired"
            ],
            "help_text": "How the fixture receives power"
          }
        },
        {
          "name": "voltage",
          "label": "Voltage",
          "type": "select",
          "required": true,
          "validation": {},
          "ui_config": {
            "options": [
              "12V AC",
              "24V AC",
              "120V AC",
              "220V AC",
              "12V DC",
              "24V DC",
              "Battery Powered",
              "Solar Powered",
              "Universal Voltage"
            ],
            "help_text": "Electrical voltage requirements"
          }
        },
        {
          "name": "wattage",
          "label": "Wattage",
          "type": "number",
          "required": true,
          "validation": {
            "min": 0.1,
            "max": 10000
          },
          "ui_config": {
            "placeholder": "Enter wattage in watts",
            "help_text": "Power consumption in watts"
          }
        },
        {
          "name": "lumens",
          "label": "Luminous Flux (Lumens)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 100000
          },
          "ui_config": {
            "placeholder": "Enter luminous flux",
            "help_text": "Total light output in lumens"
          }
        },
        {
          "name": "color_temperature",
          "label": "Color Temperature (Kelvin)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1500,
            "max": 10000
          },
          "ui_config": {
            "placeholder": "Enter color temperature",
            "help_text": "Light color temperature in Kelvin (2700K = warm, 5000K = daylight)"
          }
        },
        {
          "name": "color_rendering_index",
          "label": "Color Rendering Index (CRI)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 100
          },
          "ui_config": {
            "placeholder": "Enter CRI value",
            "help_text": "How accurately colors appear under the light (higher is better)"
          }
        },
        {
          "name": "beam_angle",
          "label": "Beam Angle (Degrees)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 360
          },
          "ui_config": {
            "placeholder": "Enter beam angle",
            "help_text": "Width of the light beam in degrees"
          }
        },
        {
          "name": "dimmable",
          "label": "Dimmable",
          "type": "boolean",
          "required": false,
          "validation": {},
          "ui_config": {
            "help_text": "Can the light be dimmed"
          }
        },
        {
          "name": "dimming_type",
          "label": "Dimming Type",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Trailing Edge",
              "Leading Edge",
              "0-10V",
              "DALI",
              "DMX",
              "PWM",
              "Phase Control",
              "Smart Dimming"
            ],
            "help_text": "Type of dimming technology supported"
          }
        },
        {
          "name": "bulb_type",
          "label": "Bulb/Lamp Type",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "LED",
              "CFL",
              "Incandescent",
              "Halogen",
              "Fluorescent",
              "HID",
              "Xenon",
              "Neon",
              "Fiber Optic",
              "Integrated LED",
              "Replaceable LED",
              "Smart Bulb"
            ],
            "help_text": "Type of light source"
          }
        },
        {
          "name": "bulb_base",
          "label": "Bulb Base Type",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "E26",
              "E27",
              "E12",
              "E14",
              "GU10",
              "GU24",
              "MR16",
              "PAR20",
              "PAR30",
              "PAR38",
              "R20",
              "R30",
              "R40",
              "BR30",
              "BR40",
              "A19",
              "A21",
              "G9",
              "G4",
              "GX53",
              "Integrated",
              "Other"
            ],
            "help_text": "Light bulb socket/base type"
          }
        },
        {
          "name": "ip_rating",
          "label": "IP Rating",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "IP20",
              "IP21",
              "IP22",
              "IP23",
              "IP33",
              "IP44",
              "IP54",
              "IP55",
              "IP65",
              "IP66",
              "IP67",
              "IP68"
            ],
            "help_text": "Ingress Protection rating for dust and water resistance"
          }
        },
        {
          "name": "energy_rating",
          "label": "Energy Rating",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "A+++",
              "A++",
              "A+",
              "A",
              "B",
              "C",
              "D",
              "E",
              "ENERGY STAR",
              "Green Star",
              "CEE Tier 1",
              "CEE Tier 2",
              "CEE Tier 3"
            ],
            "help_text": "Energy efficiency rating"
          }
        },
        {
          "name": "lifetime_hours",
          "label": "Expected Lifetime (Hours)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 100,
            "max": 100000
          },
          "ui_config": {
            "placeholder": "Enter expected lifetime",
            "help_text": "Rated lifetime in hours"
          }
        },
        {
          "name": "switch_cycles",
          "label": "Switch Cycles",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1000,
            "max": 1000000
          },
          "ui_config": {
            "placeholder": "Enter switch cycles",
            "help_text": "Number of on/off cycles the fixture can handle"
          }
        }
      ]
    },
    {
      "title": "Physical Dimensions",
      "order": 3,
      "description": "Size, weight, and physical characteristics",
      "is_collapsible": true,
      "fields": [
        {
          "name": "dimensions_length",
          "label": "Length (inches)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 0.1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter length",
            "help_text": "Length in inches"
          }
        },
        {
          "name": "dimensions_width",
          "label": "Width (inches)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 0.1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter width",
            "help_text": "Width in inches"
          }
        },
        {
          "name": "dimensions_height",
          "label": "Height (inches)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 0.1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter height",
            "help_text": "Height in inches"
          }
        },
        {
          "name": "weight",
          "label": "Weight (pounds)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 0.1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter weight",
            "help_text": "Weight in pounds"
          }
        },
        {
          "name": "mounting_type",
          "label": "Mounting Type",
          "type": "select",
          "required": true,
          "validation": {},
          "ui_config": {
            "options": [
              "Ceiling Mount",
              "Wall Mount",
              "Floor Standing",
              "Table Top",
              "Pendant Mount",
              "Track Mount",
              "Recessed Mount",
              "Surface Mount",
              "Pole Mount",
              "Ground Stake",
              "Magnetic Mount",
              "Clamp Mount"
            ],
            "help_text": "How the fixture is mounted or installed"
          }
        },
        {
          "name": "mounting_hardware_included",
          "label": "Mounting Hardware Included",
          "type": "boolean",
          "required": false,
          "validation": {},
          "ui_config": {
            "help_text": "Does the package include mounting hardware"
          }
        },
        {
          "name": "cord_length",
          "label": "Cord Length (feet)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.1,
            "max": 100
          },
          "ui_config": {
            "placeholder": "Enter cord length",
            "help_text": "Length of power cord in feet"
          }
        }
      ]
    },
    {
      "title": "Condition & Warranty",
      "order": 4,
      "description": "Product condition, warranty, and certification information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "condition",
          "label": "Condition",
          "type": "select",
          "required": true,
          "validation": {},
          "ui_config": {
            "options": [
              "New",
              "Open Box",
              "Used - Like New",
              "Used - Very Good",
              "Used - Good",
              "Used - Fair",
              "Refurbished",
              "For Parts"
            ],
            "help_text": "Current condition of the lighting fixture"
          }
        },
        {
          "name": "warranty_years",
          "label": "Warranty Period (Years)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 25
          },
          "ui_config": {
            "placeholder": "Enter warranty period",
            "help_text": "Manufacturer warranty period in years"
          }
        },
        {
          "name": "warranty_type",
          "label": "Warranty Type",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Manufacturer Warranty",
              "Extended Warranty",
              "Limited Warranty",
              "Lifetime Warranty",
              "No Warranty"
            ],
            "help_text": "Type of warranty provided"
          }
        },
        {
          "name": "certifications",
          "label": "Certifications",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "UL Listed",
              "ETL Certified",
              "CSA Certified",
              "CE Marked",
              "RoHS Compliant",
              "ENERGY STAR",
              "FCC Compliant",
              "IP Rated",
              "Damp Location Rated",
              "Wet Location Rated",
              "Title 24 Compliant",
              "JA8 Approved",
              "Dark Sky Approved"
            ],
            "help_text": "Safety and performance certifications"
          }
        },
        {
          "name": "testing_standards",
          "label": "Testing Standards Met",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "IEC Standards",
              "ANSI Standards",
              "NEMA Standards",
              "IES Standards",
              "LM-79 Tested",
              "LM-80 Tested",
              "TM-21 Tested",
              "Salt Spray Test",
              "Vibration Test",
              "Thermal Cycling Test"
            ],
            "help_text": "Industry testing standards the product meets"
          }
        }
      ]
    },
    {
      "title": "Pricing & Availability",
      "order": 5,
      "description": "Pricing information and stock availability",
      "is_collapsible": true,
      "fields": [
        {
          "name": "price",
          "label": "Price (USD)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 0.01,
            "max": 100000
          },
          "ui_config": {
            "placeholder": "Enter price",
            "help_text": "Current selling price in USD"
          }
        },
        {
          "name": "original_price",
          "label": "Original Price (USD)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.01,
            "max": 100000
          },
          "ui_config": {
            "placeholder": "Enter original price",
            "help_text": "Original MSRP or list price"
          }
        },
        {
          "name": "currency",
          "label": "Currency",
          "type": "select",
          "required": true,
          "validation": {},
          "ui_config": {
            "options": ["USD", "EUR", "GBP", "CAD", "AUD", "JPY", "INR"],
            "help_text": "Currency for pricing"
          }
        },
        {
          "name": "quantity_available",
          "label": "Quantity Available",
          "type": "number",
          "required": true,
          "validation": {
            "min": 0,
            "max": 10000
          },
          "ui_config": {
            "placeholder": "Enter available quantity",
            "help_text": "Number of units available for sale"
          }
        },
        {
          "name": "minimum_order_quantity",
          "label": "Minimum Order Quantity",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter MOQ",
            "help_text": "Minimum quantity that can be ordered"
          }
        },
        {
          "name": "bulk_pricing_available",
          "label": "Bulk Pricing Available",
          "type": "boolean",
          "required": false,
          "validation": {},
          "ui_config": {
            "help_text": "Are bulk pricing discounts available"
          }
        }
      ]
    },
    {
      "title": "Seller Information",
      "order": 6,
      "description": "Information about the seller and business details",
      "is_collapsible": true,
      "fields": [
        {
          "name": "seller_type",
          "label": "Seller Type",
          "type": "select",
          "required": true,
          "validation": {},
          "ui_config": {
            "options": [
              "Manufacturer",
              "Authorized Dealer",
              "Retailer",
              "Wholesaler",
              "Distributor",
              "Installer",
              "Contractor",
              "Individual Seller",
              "Lighting Specialist",
              "Home Improvement Store"
            ],
            "help_text": "Type of seller offering this product"
          }
        },
        {
          "name": "business_name",
          "label": "Business Name",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "Enter business name",
            "help_text": "Name of the selling business"
          }
        },
        {
          "name": "seller_location",
          "label": "Seller Location",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "City, State/Country",
            "help_text": "Location of the seller"
          }
        },
        {
          "name": "years_in_business",
          "label": "Years in Business",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 100
          },
          "ui_config": {
            "placeholder": "Enter years",
            "help_text": "Number of years the seller has been in business"
          }
        },
        {
          "name": "authorized_dealer",
          "label": "Authorized Dealer",
          "type": "boolean",
          "required": false,
          "validation": {},
          "ui_config": {
            "help_text": "Is the seller an authorized dealer for this brand"
          }
        },
        {
          "name": "installation_services",
          "label": "Installation Services Offered",
          "type": "boolean",
          "required": false,
          "validation": {},
          "ui_config": {
            "help_text": "Does the seller offer installation services"
          }
        }
      ]
    },
    {
      "title": "Shipping & Delivery",
      "order": 7,
      "description": "Shipping options, costs, and delivery information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "shipping_weight",
          "label": "Shipping Weight (pounds)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 0.1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter shipping weight",
            "help_text": "Weight for shipping calculations"
          }
        },
        {
          "name": "shipping_dimensions_length",
          "label": "Shipping Length (inches)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 0.1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter shipping length",
            "help_text": "Shipping package length"
          }
        },
        {
          "name": "shipping_dimensions_width",
          "label": "Shipping Width (inches)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 0.1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter shipping width",
            "help_text": "Shipping package width"
          }
        },
        {
          "name": "shipping_dimensions_height",
          "label": "Shipping Height (inches)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 0.1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter shipping height",
            "help_text": "Shipping package height"
          }
        },
        {
          "name": "shipping_cost",
          "label": "Shipping Cost (USD)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 10000
          },
          "ui_config": {
            "placeholder": "Enter shipping cost",
            "help_text": "Base shipping cost"
          }
        },
        {
          "name": "free_shipping",
          "label": "Free Shipping",
          "type": "boolean",
          "required": false,
          "validation": {},
          "ui_config": {
            "help_text": "Is free shipping offered"
          }
        },
        {
          "name": "shipping_method",
          "label": "Shipping Method",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Standard Ground",
              "Expedited",
              "2-Day Air",
              "Next Day Air",
              "White Glove Service",
              "Freight Shipping",
              "Local Pickup",
              "Curbside Delivery"
            ],
            "help_text": "Available shipping methods"
          }
        },
        {
          "name": "delivery_timeframe",
          "label": "Delivery Timeframe",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "e.g., 3-5 business days",
            "help_text": "Expected delivery timeframe"
          }
        },
        {
          "name": "international_shipping",
          "label": "International Shipping",
          "type": "boolean",
          "required": false,
          "validation": {},
          "ui_config": {
            "help_text": "Is international shipping available"
          }
        }
      ]
    },
    {
      "title": "Additional Features",
      "order": 8,
      "description": "Special features, smart capabilities, and additional functionality",
      "is_collapsible": true,
      "fields": [
        {
          "name": "smart_features",
          "label": "Smart Features",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "WiFi Connected",
              "Bluetooth Enabled",
              "App Control",
              "Voice Control",
              "Motion Sensor",
              "Daylight Sensor",
              "Timer Function",
              "Color Changing",
              "Music Sync",
              "Group Control",
              "Schedule Programming",
              "Energy Monitoring",
              "Remote Access"
            ],
            "help_text": "Smart and connected lighting features"
          }
        },
        {
          "name": "compatibility",
          "label": "Smart Home Compatibility",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Amazon Alexa",
              "Google Assistant",
              "Apple HomeKit",
              "Samsung SmartThings",
              "Philips Hue",
              "Zigbee",
              "Z-Wave",
              "Thread",
              "Matter Protocol",
              "IFTTT",
              "SmartThings",
              "Home Assistant"
            ],
            "help_text": "Compatible smart home platforms and protocols"
          }
        },
        {
          "name": "special_features",
          "label": "Special Features",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Emergency Backup",
              "Battery Backup",
              "Solar Powered",
              "USB Charging Port",
              "Wireless Charging",
              "Color Temperature Adjustment",
              "RGB Color Changing",
              "Tunable White",
              "Anti-Glare Design",
              "Eye Protection",
              "Flicker Free",
              "Instant On",
              "Silent Operation",
              "Vandal Resistant",
              "Weatherproof",
              "Corrosion Resistant"
            ],
            "help_text": "Additional special features and capabilities"
          }
        },
        {
          "name": "included_accessories",
          "label": "Included Accessories",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Remote Control",
              "Dimmer Switch",
              "Extension Cord",
              "Mounting Hardware",
              "Bulbs/Lamps",
              "Diffuser",
              "Lens",
              "Color Filters",
              "Motion Sensor",
              "Photocell",
              "Timer",
              "User Manual",
              "Warranty Card"
            ],
            "help_text": "Accessories included with the purchase"
          }
        },
        {
          "name": "finish_options",
          "label": "Finish/Material Options",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Brushed Nickel",
              "Polished Chrome",
              "Matte Black",
              "Brass",
              "Copper",
              "Bronze",
              "White",
              "Aluminum",
              "Steel",
              "Glass",
              "Crystal",
              "Wood",
              "Plastic",
              "Ceramic",
              "Fabric Shade"
            ],
            "help_text": "Available finish and material options"
          }
        }
      ]
    },
    {
      "title": "Compliance & Documentation",
      "order": 9,
      "description": "Regulatory compliance, documentation, and additional information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "safety_compliance",
          "label": "Safety Compliance",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "UL Listed",
              "ETL Certified",
              "CSA Certified",
              "CE Marked",
              "FCC Compliant",
              "RoHS Compliant",
              "REACH Compliant",
              "Proposition 65 Compliant",
              "ADA Compliant",
              "NFPA Compliant",
              "OSHA Compliant",
              "IEC Standards",
              "ANSI Standards"
            ],
            "help_text": "Safety and regulatory compliance certifications"
          }
        },
        {
          "name": "energy_efficiency_compliance",
          "label": "Energy Efficiency Compliance",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "ENERGY STAR Certified",
              "CEE Qualified",
              "Title 20 Compliant",
              "Title 24 Compliant",
              "ASHRAE Compliant",
              "LEED Certified",
              "Green Building Standards",
              "California Energy Commission Approved"
            ],
            "help_text": "Energy efficiency and environmental compliance"
          }
        },
        {
          "name": "documentation_included",
          "label": "Documentation Included",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Installation Manual",
              "User Guide",
              "Wiring Diagram",
              "Maintenance Instructions",
              "Safety Data Sheet",
              "Energy Guide",
              "Warranty Information",
              "Compliance Certificates",
              "Test Reports",
              "Photometric Data",
              "IES Files",
              "CAD Drawings"
            ],
            "help_text": "Documentation and technical information provided"
          }
        },
        {
          "name": "country_of_origin",
          "label": "Country of Origin",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "Enter country of origin",
            "help_text": "Country where the product was manufactured"
          }
        },
        {
          "name": "import_restrictions",
          "label": "Import Restrictions Apply",
          "type": "boolean",
          "required": false,
          "validation": {},
          "ui_config": {
            "help_text": "Are there import restrictions for this product"
          }
        },
        {
          "name": "customs_duties_apply",
          "label": "Customs Duties May Apply",
          "type": "boolean",
          "required": false,
          "validation": {},
          "ui_config": {
            "help_text": "May customs duties apply to international shipments"
          }
        },
        {
          "name": "additional_notes",
          "label": "Additional Notes",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 2000
          },
          "ui_config": {
            "placeholder": "Enter any additional information about the product",
            "help_text": "Any additional notes or special considerations"
          }
        }
      ]
    }
  ]
}
```