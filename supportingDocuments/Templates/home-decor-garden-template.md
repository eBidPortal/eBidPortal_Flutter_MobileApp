# Home Decor & Garden Template

```json
{
  "name": "Home Decor & Garden Template",
  "description": "Industry-level template for home decor, garden supplies, outdoor furniture, and landscaping products with comprehensive specifications and validation rules.",
  "category_type": "home_decor_garden",
  "is_active": true,
  "sections": [
    {
      "title": "Basic Information",
      "order": 1,
      "description": "Essential product identification and categorization details",
      "is_collapsible": false,
      "fields": [
        {
          "name": "product_title",
          "label": "Product Title",
          "type": "text",
          "required": true,
          "validation": {
            "min_length": 10,
            "max_length": 200,
            "pattern": "^[a-zA-Z0-9\\s\\-\\_\\(\\)\\[\\]\\+\\&\\,\\.]+$"
          },
          "ui_config": {
            "placeholder": "Enter product title (e.g., Modern Ceramic Vase Collection)",
            "help_text": "Provide a clear, descriptive title including material and style"
          }
        },
        {
          "name": "brand",
          "label": "Brand",
          "type": "text",
          "required": true,
          "validation": {
            "min_length": 2,
            "max_length": 100,
            "pattern": "^[a-zA-Z0-9\\s\\-\\_\\&\\.]+$"
          },
          "ui_config": {
            "placeholder": "Enter brand name (e.g., IKEA, Home Centre, Local Crafts)",
            "help_text": "Official brand name as recognized in the market"
          }
        },
        {
          "name": "model_number",
          "label": "Model Number",
          "type": "text",
          "required": true,
          "validation": {
            "min_length": 3,
            "max_length": 50,
            "pattern": "^[a-zA-Z0-9\\-\\_\\.]+$"
          },
          "ui_config": {
            "placeholder": "Enter model number (e.g., DEC-2024-001)",
            "help_text": "Manufacturer's model or part number"
          }
        },
        {
          "name": "product_type",
          "label": "Product Type",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "Wall Art",
              "Decorative Accessories",
              "Lighting",
              "Rugs & Carpets",
              "Curtains & Blinds",
              "Cushions & Throws",
              "Mirrors",
              "Clocks",
              "Vases & Planters",
              "Candles & Fragrances",
              "Garden Tools",
              "Outdoor Furniture",
              "Garden Decor",
              "Plants & Seeds",
              "Water Features",
              "Garden Structures",
              "Patio & Deck",
              "Landscaping Supplies",
              "Seasonal Decor",
              "Home Textiles"
            ]
          },
          "ui_config": {
            "placeholder": "Select product type",
            "help_text": "Primary category of the home decor or garden product"
          }
        },
        {
          "name": "subcategory",
          "label": "Subcategory",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Paintings",
              "Photographs",
              "Posters",
              "Wall Hangings",
              "Sculptures",
              "Figurines",
              "Table Lamps",
              "Floor Lamps",
              "Pendant Lights",
              "Chandeliers",
              "String Lights",
              "Wall Sconces",
              "Area Rugs",
              "Runner Rugs",
              "Door Mats",
              "Carpet Tiles",
              "Sheer Curtains",
              "Blackout Curtains",
              "Blinds",
              "Shades",
              "Throw Pillows",
              "Decorative Cushions",
              "Blankets",
              "Throws",
              "Wall Mirrors",
              "Floor Mirrors",
              "Decorative Mirrors",
              "Wall Clocks",
              "Table Clocks",
              "Mantel Clocks",
              "Floor Vases",
              "Table Vases",
              "Wall Planters",
              "Hanging Planters",
              "Scented Candles",
              "Unscented Candles",
              "Essential Oil Diffusers",
              "Room Sprays",
              "Pruning Tools",
              "Gardening Gloves",
              "Watering Cans",
              "Garden Hoses",
              "Lawn Mowers",
              "Outdoor Chairs",
              "Outdoor Tables",
              "Garden Benches",
              "Hammocks",
              "Outdoor Lighting",
              "Garden Statues",
              "Bird Baths",
              "Garden Fountains",
              "Wind Chimes",
              "Flower Seeds",
              "Vegetable Seeds",
              "Herb Seeds",
              "Potted Plants",
              "Bird Feeders",
              "Garden Sheds",
              "Greenhouses",
              "Pergolas",
              "Garden Arbors",
              "Paving Stones",
              "Garden Soil",
              "Fertilizers",
              "Mulch",
              "Christmas Decor",
              "Diwali Decor",
              "Halloween Decor",
              "Thanksgiving Decor",
              "Bedding Sets",
              "Table Linens",
              "Bath Towels",
              "Kitchen Textiles"
            ]
          },
          "ui_config": {
            "placeholder": "Select subcategory if applicable",
            "help_text": "More specific product classification"
          }
        },
        {
          "name": "product_description",
          "label": "Product Description",
          "type": "textarea",
          "required": true,
          "validation": {
            "min_length": 50,
            "max_length": 2000
          },
          "ui_config": {
            "placeholder": "Provide detailed product description including dimensions, materials, and features",
            "help_text": "Include key features, care instructions, and use cases"
          }
        }
      ]
    },
    {
      "title": "Technical Specifications",
      "order": 2,
      "description": "Detailed technical specifications including dimensions and construction",
      "is_collapsible": true,
      "fields": [
        {
          "name": "primary_material",
          "label": "Primary Material",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "Wood",
              "Metal",
              "Glass",
              "Ceramic",
              "Porcelain",
              "Crystal",
              "Fabric",
              "Leather",
              "Plastic",
              "Bamboo",
              "Rattan",
              "Wicker",
              "Stone",
              "Marble",
              "Concrete",
              "Resin",
              "Polyresin",
              "Fiberglass",
              "Aluminum",
              "Iron",
              "Steel",
              "Brass",
              "Copper",
              "Paper",
              "Canvas",
              "Cotton",
              "Silk",
              "Wool",
              "Jute",
              "Synthetic",
              "Natural Fiber"
            ]
          },
          "ui_config": {
            "help_text": "Main material used in construction"
          }
        },
        {
          "name": "secondary_material",
          "label": "Secondary Material",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Wood",
              "Metal",
              "Glass",
              "Ceramic",
              "Fabric",
              "Plastic",
              "Stone",
              "Synthetic",
              "None"
            ]
          },
          "ui_config": {
            "help_text": "Secondary or accent material"
          }
        },
        {
          "name": "finish_type",
          "label": "Finish Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Polished",
              "Matt",
              "Glossy",
              "Textured",
              "Natural",
              "Painted",
              "Stained",
              "Lacquered",
              "Oiled",
              "Waxed",
              "Antique",
              "Distressed",
              "Rustic",
              "Vintage",
              "Modern",
              "Metallic",
              "Chrome",
              "Brass",
              "Copper",
              "Gold",
              "Silver",
              "Black",
              "White",
              "Wood Stain",
              "Clear Coat"
            ]
          },
          "ui_config": {
            "help_text": "Surface finish and treatment"
          }
        },
        {
          "name": "dimensions",
          "label": "Dimensions (L x W x H)",
          "type": "text",
          "required": true,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*x\\s*\\d+(\\.\\d+)?\\s*x\\s*\\d+(\\.\\d+)?\\s*(cm|mm|inches?|in|feet|ft)$",
            "max_length": 50
          },
          "ui_config": {
            "placeholder": "e.g., 30 x 20 x 45 cm",
            "help_text": "Overall dimensions in centimeters or inches"
          }
        },
        {
          "name": "weight",
          "label": "Product Weight (kg)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.1,
            "max": 500
          },
          "ui_config": {
            "placeholder": "Enter total weight in kg",
            "help_text": "Total weight of the product"
          }
        },
        {
          "name": "bulb_type",
          "label": "Bulb Type (for Lighting)",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "LED",
              "Incandescent",
              "Halogen",
              "CFL",
              "Fluorescent",
              "Not Applicable"
            ]
          },
          "ui_config": {
            "help_text": "Type of light bulb required"
          }
        },
        {
          "name": "bulb_count",
          "label": "Number of Bulbs",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 20
          },
          "ui_config": {
            "placeholder": "Enter number of bulbs required",
            "help_text": "Number of light bulbs included or required"
          }
        },
        {
          "name": "power_source",
          "label": "Power Source",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Electric",
              "Battery",
              "Solar",
              "USB",
              "Manual",
              "None"
            ]
          },
          "ui_config": {
            "help_text": "How the product is powered"
          }
        },
        {
          "name": "voltage",
          "label": "Voltage (V)",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*V$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 220V, 110V",
            "help_text": "Electrical voltage requirement"
          }
        },
        {
          "name": "wattage",
          "label": "Wattage (W)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter wattage in watts",
            "help_text": "Power consumption in watts"
          }
        },
        {
          "name": "cord_length",
          "label": "Cord Length (m)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.5,
            "max": 10
          },
          "ui_config": {
            "placeholder": "Enter cord length in meters",
            "help_text": "Length of electrical cord"
          }
        },
        {
          "name": "assembly_required",
          "label": "Assembly Required",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if the product requires assembly"
          }
        },
        {
          "name": "water_resistant",
          "label": "Water Resistant",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if suitable for outdoor or wet environments"
          }
        },
        {
          "name": "uv_resistant",
          "label": "UV Resistant",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if resistant to UV light fading"
          }
        },
        {
          "name": "plant_type",
          "label": "Plant Type (for Plants)",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Flowering Plant",
              "Foliage Plant",
              "Succulent",
              "Cactus",
              "Herb",
              "Vegetable",
              "Fruit Plant",
              "Tree",
              "Shrub",
              "Climber",
              "Aquatic Plant",
              "Not Applicable"
            ]
          },
          "ui_config": {
            "help_text": "Type of plant or seed"
          }
        },
        {
          "name": "plant_size",
          "label": "Plant Size",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Seed",
              "Seedling",
              "Small (up to 30cm)",
              "Medium (30-100cm)",
              "Large (100-200cm)",
              "Extra Large (over 200cm)",
              "Not Applicable"
            ]
          },
          "ui_config": {
            "help_text": "Current size of the plant"
          }
        },
        {
          "name": "care_instructions",
          "label": "Care Instructions",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "Provide care and maintenance instructions",
            "help_text": "Cleaning methods, light requirements, watering instructions"
          }
        },
        {
          "name": "additional_specs",
          "label": "Additional Specifications",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 1000
          },
          "ui_config": {
            "placeholder": "Enter any additional technical specifications",
            "help_text": "Include special features, construction details, or other specs"
          }
        }
      ]
    },
    {
      "title": "Condition & Warranty",
      "order": 3,
      "description": "Product condition assessment and warranty information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "condition",
          "label": "Condition",
          "type": "radio",
          "required": true,
          "validation": {
            "options": [
              "New",
              "Sealed",
              "Open Box",
              "Used - Like New",
              "Used - Good",
              "Used - Fair",
              "Refurbished",
              "Display Model"
            ]
          },
          "ui_config": {
            "help_text": "Current physical and functional condition of the product"
          }
        },
        {
          "name": "warranty_status",
          "label": "Warranty Status",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "Under Warranty",
              "Expired Warranty",
              "No Warranty",
              "Extended Warranty Available",
              "Manufacturer Warranty",
              "Seller Warranty",
              "Limited Warranty"
            ]
          },
          "ui_config": {
            "help_text": "Current warranty coverage status"
          }
        },
        {
          "name": "warranty_period",
          "label": "Warranty Period",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+\\s+(year|month|day|week)s?$",
            "max_length": 50
          },
          "ui_config": {
            "placeholder": "e.g., 1 year, 6 months",
            "help_text": "Duration of warranty coverage"
          }
        },
        {
          "name": "packaging_condition",
          "label": "Packaging Condition",
          "type": "radio",
          "required": false,
          "validation": {
            "options": [
              "Original Packaging",
              "Sealed Packaging",
              "Generic Packaging",
              "No Packaging",
              "Damaged Packaging"
            ]
          },
          "ui_config": {
            "help_text": "Condition of the original or replacement packaging"
          }
        },
        {
          "name": "fabric_condition",
          "label": "Fabric Condition",
          "type": "radio",
          "required": false,
          "validation": {
            "options": [
              "Excellent",
              "Good",
              "Fair",
              "Worn",
              "Stained",
              "Torn",
              "Faded",
              "No Fabric"
            ]
          },
          "ui_config": {
            "help_text": "Condition of fabric materials if applicable"
          }
        },
        {
          "name": "structural_integrity",
          "label": "Structural Integrity",
          "type": "radio",
          "required": false,
          "validation": {
            "options": [
              "Excellent",
              "Good",
              "Fair",
              "Needs Repair",
              "Damaged",
              "Broken Parts"
            ]
          },
          "ui_config": {
            "help_text": "Overall structural condition and stability"
          }
        },
        {
          "name": "defects_issues",
          "label": "Known Defects or Issues",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "Describe any known defects, scratches, or functional issues",
            "help_text": "Be transparent about any imperfections or malfunctions"
          }
        }
      ]
    },
    {
      "title": "Pricing & Availability",
      "order": 4,
      "description": "Pricing information and stock availability",
      "is_collapsible": true,
      "fields": [
        {
          "name": "price",
          "label": "Price (INR)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 50,
            "max": 500000
          },
          "ui_config": {
            "placeholder": "Enter price in Indian Rupees",
            "help_text": "Current selling price including any applicable taxes"
          }
        },
        {
          "name": "original_price",
          "label": "Original Price (INR)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 50,
            "max": 500000
          },
          "ui_config": {
            "placeholder": "Enter original MRP if different",
            "help_text": "Manufacturer's suggested retail price"
          }
        },
        {
          "name": "quantity_available",
          "label": "Quantity Available",
          "type": "number",
          "required": true,
          "validation": {
            "min": 1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter available stock quantity",
            "help_text": "Number of units currently available for sale"
          }
        },
        {
          "name": "price_negotiable",
          "label": "Price Negotiable",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if willing to negotiate on the listed price"
          }
        },
        {
          "name": "bulk_discount_available",
          "label": "Bulk Discount Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if discounts available for bulk purchases"
          }
        },
        {
          "name": "minimum_order_quantity",
          "label": "Minimum Order Quantity",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 50
          },
          "ui_config": {
            "placeholder": "Enter MOQ if applicable",
            "help_text": "Minimum quantity required for purchase"
          }
        }
      ]
    },
    {
      "title": "Seller Information",
      "order": 5,
      "description": "Seller details and contact information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "seller_type",
          "label": "Seller Type",
          "type": "radio",
          "required": true,
          "validation": {
            "options": [
              "Individual",
              "Business/Reseller",
              "Manufacturer",
              "Authorized Dealer",
              "Online Retailer",
              "Home Decor Store",
              "Garden Center",
              "Interior Designer",
              "Artisan/Craftsman",
              "Wholesale Supplier",
              "Showroom",
              "Online Marketplace",
              "Import/Export Company"
            ]
          },
          "ui_config": {
            "help_text": "Type of seller offering this product"
          }
        },
        {
          "name": "seller_location",
          "label": "Seller Location",
          "type": "text",
          "required": true,
          "validation": {
            "min_length": 3,
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "Enter city and state (e.g., Mumbai, Maharashtra)",
            "help_text": "Location where the seller is based"
          }
        },
        {
          "name": "business_name",
          "label": "Business Name",
          "type": "text",
          "required": false,
          "validation": {
            "min_length": 2,
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "Enter business or store name",
            "help_text": "Required for business sellers"
          }
        },
        {
          "name": "contact_number",
          "label": "Contact Number",
          "type": "phone",
          "required": true,
          "validation": {
            "pattern": "^(\\+91|0)?[6-9]\\d{9}$"
          },
          "ui_config": {
            "placeholder": "Enter 10-digit mobile number",
            "help_text": "Primary contact number for inquiries"
          }
        },
        {
          "name": "preferred_contact_method",
          "label": "Preferred Contact Method",
          "type": "radio",
          "required": false,
          "validation": {
            "options": [
              "Phone Call",
              "WhatsApp",
              "SMS",
              "Email",
              "Platform Messages"
            ]
          },
          "ui_config": {
            "help_text": "Preferred way to contact the seller"
          }
        },
        {
          "name": "specialization",
          "label": "Specialization",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Home Decor",
              "Garden & Landscaping",
              "Lighting",
              "Textiles",
              "Art & Paintings",
              "Antiques",
              "Modern Design",
              "Traditional Design",
              "Custom Orders",
              "Bulk Supplies",
              "Seasonal Decor"
            ]
          },
          "ui_config": {
            "help_text": "Seller's area of specialization"
          }
        }
      ]
    },
    {
      "title": "Shipping & Delivery",
      "order": 6,
      "description": "Shipping options and delivery information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "shipping_available",
          "label": "Shipping Available",
          "type": "boolean",
          "required": true,
          "ui_config": {
            "help_text": "Check if willing to ship the product"
          }
        },
        {
          "name": "shipping_cost",
          "label": "Shipping Cost (INR)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 50000
          },
          "ui_config": {
            "placeholder": "Enter shipping cost or 0 for free shipping",
            "help_text": "Cost of shipping within India"
          }
        },
        {
          "name": "free_shipping",
          "label": "Free Shipping",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if shipping is free"
          }
        },
        {
          "name": "shipping_method",
          "label": "Shipping Method",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Standard Delivery",
              "Express Delivery",
              "White Glove Service",
              "Fragile Item Handling",
              "Art Shipping",
              "Plant Shipping",
              "Third-party Logistics",
              "Local Pickup Only",
              "Curbside Delivery",
              "In-store Pickup"
            ]
          },
          "ui_config": {
            "help_text": "Available shipping methods"
          }
        },
        {
          "name": "delivery_time",
          "label": "Estimated Delivery Time",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "e.g., 3-7 business days, 1-2 weeks",
            "help_text": "Expected time for delivery after purchase"
          }
        },
        {
          "name": "international_shipping",
          "label": "International Shipping",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if willing to ship internationally"
          }
        },
        {
          "name": "fragile_item",
          "label": "Fragile Item",
          "type": "boolean",
          "required": true,
          "ui_config": {
            "help_text": "Check if this is a fragile item requiring special handling"
          }
        },
        {
          "name": "large_item",
          "label": "Large/Bulky Item",
          "type": "boolean",
          "required": true,
          "ui_config": {
            "help_text": "Check if this is a large or bulky item"
          }
        },
        {
          "name": "return_policy",
          "label": "Return Policy",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "Describe return and exchange policy",
            "help_text": "Terms for returns, exchanges, and refunds"
          }
        }
      ]
    },
    {
      "title": "Additional Features",
      "order": 7,
      "description": "Special features and additional product capabilities",
      "is_collapsible": true,
      "fields": [
        {
          "name": "special_features",
          "label": "Special Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Handcrafted",
              "Custom Made",
              "Limited Edition",
              "Designer Collection",
              "Eco-Friendly",
              "Sustainable Materials",
              "Recycled Materials",
              "Fair Trade",
              "Artisan Made",
              "Vintage",
              "Antique",
              "Collectible",
              "One-of-a-Kind",
              "Set of Multiple Pieces",
              "Modular Design",
              "Expandable",
              "Multi-functional",
              "Space Saving",
              "Easy to Clean",
              "Stain Resistant",
              "Fade Resistant",
              "Scratch Resistant",
              "Weather Resistant",
              "Indoor Use Only",
              "Outdoor Use",
              "Seasonal Item",
              "Holiday Decor",
              "Themed Design",
              "Color Changing",
              "Light-Up Features",
              "Sound Features",
              "Motion Sensor",
              "Timer Function",
              "Remote Control",
              "Smart Features",
              "App Controlled",
              "Energy Efficient",
              "Low Voltage",
              "Solar Powered",
              "Battery Operated",
              "USB Powered",
              "Cordless",
              "Rechargeable",
              "Dimmable",
              "Color Temperature Adjustable",
              "Height Adjustable",
              "Angle Adjustable",
              "Rotating",
              "Swinging",
              "Hanging",
              "Wall Mounted",
              "Floor Standing",
              "Table Top",
              "Ceiling Mounted",
              "Portable",
              "Foldable",
              "Collapsible",
              "Stackable",
              "Wall Art",
              "Gallery Quality",
              "Framed",
              "Unframed",
              "Ready to Hang",
              "Mattress Included",
              "Cushions Included",
              "Throws Included",
              "Coordinating Items Available",
              "Matching Set Available"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable special features"
          }
        },
        {
          "name": "included_accessories",
          "label": "Included Accessories",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Assembly Hardware",
              "Allen Keys",
              "Screwdriver",
              "User Manual",
              "Care Instructions",
              "Warranty Card",
              "Extra Bulbs",
              "Extension Cord",
              "Batteries",
              "Remote Control",
              "Wall Mounting Kit",
              "Hanging Hardware",
              "Cleaning Kit",
              "Protective Packaging",
              "Gift Box",
              "Coordinating Items",
              "Replacement Parts",
              "Seeds",
              "Soil",
              "Fertilizer",
              "Plant Food",
              "Watering Can",
              "Gardening Tools",
              "Gloves",
              "Potting Mix",
              "Drainage Materials",
              "Plant Labels",
              "Trellis",
              "Stakes",
              "Decorative Stones",
              "Mulch",
              "Compost",
              "Pest Control",
              "Plant Protectant"
            ]
          },
          "ui_config": {
            "help_text": "Select all items included with the product"
          }
        },
        {
          "name": "color_options",
          "label": "Available Colors",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "White",
              "Black",
              "Gray",
              "Silver",
              "Gold",
              "Copper",
              "Bronze",
              "Red",
              "Blue",
              "Green",
              "Yellow",
              "Orange",
              "Purple",
              "Pink",
              "Brown",
              "Beige",
              "Cream",
              "Navy",
              "Teal",
              "Turquoise",
              "Coral",
              "Rose",
              "Lavender",
              "Sage",
              "Mint",
              "Olive",
              "Rust",
              "Terracotta",
              "Natural Wood",
              "Dark Wood",
              "Light Wood",
              "Cherry Wood",
              "Walnut Wood",
              "Oak Wood",
              "Mahogany Wood",
              "Bamboo",
              "Rattan",
              "Wicker",
              "Metal Finish",
              "Chrome",
              "Brass",
              "Antique Brass",
              "Oil Rubbed Bronze",
              "Matte Black",
              "Satin Nickel",
              "Polished Nickel",
              "Custom Color",
              "Multi-Color",
              "Patterned",
              "Textured",
              "Glossy",
              "Matt",
              "Metallic",
              "Pearlescent"
            ]
          },
          "ui_config": {
            "help_text": "Select all available color options"
          }
        },
        {
          "name": "style_design",
          "label": "Style/Design",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Modern",
              "Contemporary",
              "Traditional",
              "Classic",
              "Vintage",
              "Rustic",
              "Industrial",
              "Minimalist",
              "Scandinavian",
              "Mid-Century Modern",
              "Art Deco",
              "Colonial",
              "Farmhouse",
              "Bohemian",
              "Eclectic",
              "Transitional",
              "Asian Inspired",
              "Mediterranean",
              "French Country",
              "Shabby Chic",
              "Gothic",
              "Victorian",
              "Edwardian",
              "Art Nouveau",
              "Tropical",
              "Coastal",
              "Desert",
              "Mountain",
              "Urban",
              "Zen",
              "Boho Chic",
              "Hollywood Glam",
              "Moroccan",
              "Turkish",
              "Indian Traditional",
              "Abstract",
              "Geometric",
              "Floral",
              "Nature Inspired",
              "Animal Print",
              "Striped",
              "Plaid",
              "Polka Dot",
              "Chevron",
              "Damask",
              "Ikat",
              "Tribal",
              "Ethnic",
              "Handcrafted",
              "Artisan"
            ]
          },
          "ui_config": {
            "help_text": "Design style or aesthetic of the product"
          }
        },
        {
          "name": "room_type",
          "label": "Suitable Room Types",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Living Room",
              "Dining Room",
              "Bedroom",
              "Kitchen",
              "Bathroom",
              "Home Office",
              "Hallway",
              "Entryway",
              "Staircase",
              "Basement",
              "Attic",
              "Patio",
              "Deck",
              "Garden",
              "Balcony",
              "Porch",
              "Terrace",
              "Lawn",
              "Driveway",
              "Walkway",
              "Pool Area",
              "Spa Area",
              "Outdoor Kitchen",
              "Conservatory",
              "Sunroom",
              "Library",
              "Study",
              "Game Room",
              "Media Room",
              "Laundry Room",
              "Mudroom",
              "Pantry",
              "Closet",
              "Nursery",
              "Kids Room",
              "Teen Room",
              "Guest Room",
              "Master Suite",
              "Hotel Lobby",
              "Restaurant",
              "Cafe",
              "Office",
              "Retail Store",
              "Showroom",
              "Gallery",
              "Museum",
              "Church",
              "School",
              "Hospital",
              "Commercial Space"
            ]
          },
          "ui_config": {
            "help_text": "Select all suitable room types for this product"
          }
        },
        {
          "name": "season_occasion",
          "label": "Season/Occasion",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Spring",
              "Summer",
              "Fall/Autumn",
              "Winter",
              "Christmas",
              "New Year",
              "Valentine's Day",
              "Easter",
              "Mother's Day",
              "Father's Day",
              "Independence Day",
              "Thanksgiving",
              "Halloween",
              "Diwali",
              "Holi",
              "Eid",
              "Wedding",
              "Birthday",
              "Anniversary",
              "Graduation",
              "Housewarming",
              "Baby Shower",
              "Engagement",
              "Retirement",
              "Year-round",
              "Seasonal",
              "Holiday",
              "Festive",
              "Casual",
              "Formal",
              "Everyday Use"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable seasons or occasions"
          }
        },
        {
          "name": "certifications",
          "label": "Certifications & Standards",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "BIS Certified",
              "ISI Marked",
              "CE Marked",
              "FSC Certified",
              "Green Guard Certified",
              "OEKO-TEX",
              "REACH Compliant",
              "RoHS Compliant",
              "Energy Star",
              "UL Listed",
              "CSA Certified",
              "IP Rated",
              "Waterproof",
              "Fire Resistant",
              "Child Safe",
              "Pet Friendly",
              "Eco-Friendly",
              "Sustainable",
              "Fair Trade",
              "Handmade",
              "Artisan Certified",
              "Gallery Quality",
              "Museum Quality",
              "Conservation Standard"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable certifications and standards"
          }
        }
      ]
    },
    {
      "title": "Compliance & Safety",
      "order": 8,
      "description": "Regulatory compliance and safety information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "safety_certifications",
          "label": "Safety Certifications",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "BIS Certified",
              "ISI Marked",
              "CE Marked",
              "UL Listed",
              "CSA Certified",
              "IP Rated",
              "Fire Resistant",
              "Child Safe",
              "Pet Safe",
              "Non-Toxic",
              "Lead Free",
              "Cadmium Free",
              "Phthalate Free",
              "BPA Free",
              "PVC Free"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable safety certifications"
          }
        },
        {
          "name": "hazardous_materials",
          "label": "Contains Hazardous Materials",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if product contains hazardous materials or chemicals"
          }
        },
        {
          "name": "age_restriction",
          "label": "Age Restriction",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "No Restriction",
              "3+ Years",
              "6+ Years",
              "12+ Years",
              "15+ Years",
              "18+ Years",
              "Adult Use Only"
            ]
          },
          "ui_config": {
            "help_text": "Minimum age recommendation for safe use"
          }
        },
        {
          "name": "flammability_rating",
          "label": "Flammability Rating",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Class A (Low Flammability)",
              "Class B (Moderate Flammability)",
              "Class C (High Flammability)",
              "Not Rated",
              "Fire Resistant",
              "Flame Retardant"
            ]
          },
          "ui_config": {
            "help_text": "Flammability classification for fabrics and materials"
          }
        },
        {
          "name": "care_instructions",
          "label": "Care Instructions",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "Provide care and maintenance instructions",
            "help_text": "Cleaning methods, maintenance requirements, and usage guidelines"
          }
        },
        {
          "name": "plant_care",
          "label": "Plant Care Instructions",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 300
          },
          "ui_config": {
            "placeholder": "Provide specific plant care instructions",
            "help_text": "Light requirements, watering schedule, soil type, temperature preferences"
          }
        },
        {
          "name": "recycling_info",
          "label": "Recycling Information",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 300
          },
          "ui_config": {
            "placeholder": "Provide recycling or disposal information",
            "help_text": "Information about proper disposal or recycling"
          }
        },
        {
          "name": "legal_compliance",
          "label": "Legal Compliance",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Import Duty Paid",
              "GST Compliant",
              "Customs Cleared",
              "Original Purchase",
              "Authorized Import",
              "Licensed Product",
              "Patent Compliant",
              "Trademark Compliant",
              "Design Patent",
              "Copyright Compliant"
            ]
          },
          "ui_config": {
            "help_text": "Legal and regulatory compliance information"
          }
        },
        {
          "name": "warranty_terms",
          "label": "Warranty Terms & Conditions",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "Describe warranty terms, conditions, and exclusions",
            "help_text": "Detailed warranty coverage and limitations"
          }
        }
      ]
    },
    {
      "title": "Media & Documentation",
      "order": 9,
      "description": "Product images, videos, and documentation",
      "is_collapsible": true,
      "fields": [
        {
          "name": "product_images",
          "label": "Product Images",
          "type": "file",
          "required": true,
          "validation": {
            "file_types": ["image/jpeg", "image/png", "image/webp"],
            "max_files": 15,
            "max_file_size": 5242880
          },
          "ui_config": {
            "help_text": "Upload high-quality images from multiple angles (max 15 images, 5MB each)"
          }
        },
        {
          "name": "product_video",
          "label": "Product Video",
          "type": "file",
          "required": false,
          "validation": {
            "file_types": ["video/mp4", "video/avi", "video/mov"],
            "max_files": 1,
            "max_file_size": 104857600
          },
          "ui_config": {
            "help_text": "Upload product demonstration or unboxing video (optional, max 100MB)"
          }
        },
        {
          "name": "user_manual",
          "label": "User Manual/Documentation",
          "type": "file",
          "required": false,
          "validation": {
            "file_types": ["application/pdf", "text/plain", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document"],
            "max_files": 3,
            "max_file_size": 10485760
          },
          "ui_config": {
            "help_text": "Upload user manual, assembly instructions, or care guide"
          }
        },
        {
          "name": "additional_documents",
          "label": "Additional Documents",
          "type": "file",
          "required": false,
          "validation": {
            "file_types": ["application/pdf", "image/jpeg", "image/png"],
            "max_files": 5,
            "max_file_size": 5242880
          },
          "ui_config": {
            "help_text": "Upload warranty cards, certificates, material specifications, or other relevant documents"
          }
        },
        {
          "name": "youtube_video_url",
          "label": "YouTube Video URL",
          "type": "url",
          "required": false,
          "validation": {
            "pattern": "^https?://(www\\.)?(youtube\\.com/watch\\?v=|youtu\\.be/)[a-zA-Z0-9_-]{11}"
          },
          "ui_config": {
            "placeholder": "https://www.youtube.com/watch?v=...",
            "help_text": "Link to product review or demonstration video on YouTube"
          }
        },
        {
          "name": "assembly_instructions",
          "label": "Assembly Instructions",
          "type": "file",
          "required": false,
          "validation": {
            "file_types": ["application/pdf", "image/jpeg", "image/png"],
            "max_files": 1,
            "max_file_size": 10485760
          },
          "ui_config": {
            "help_text": "Upload detailed assembly instructions or diagram"
          }
        }
      ]
    }
  ]
}
```