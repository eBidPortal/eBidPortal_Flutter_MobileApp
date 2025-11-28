# Tables & Chairs Template

```json
{
  "name": "Tables & Chairs Template",
  "description": "Industry-level template for tables and chairs including dining sets, office furniture, and seating solutions with comprehensive specifications and validation rules.",
  "category_type": "tables_chairs",
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
            "placeholder": "Enter product title (e.g., 6 Seater Wooden Dining Table Set)",
            "help_text": "Provide a clear, descriptive title including size and material"
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
            "placeholder": "Enter brand name (e.g., IKEA, Godrej, Nilkamal)",
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
            "placeholder": "Enter model number (e.g., DT-2024-001)",
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
              "Dining Table",
              "Dining Chair",
              "Dining Set",
              "Coffee Table",
              "Side Table",
              "End Table",
              "Console Table",
              "Center Table",
              "Study Table",
              "Office Chair",
              "Executive Chair",
              "Visitor Chair",
              "Lounge Chair",
              "Armchair",
              "Recliner Chair",
              "Bar Stool",
              "Counter Stool",
              "Bench",
              "Ottoman",
              "Footstool",
              "Rocking Chair",
              "Folding Chair",
              "Stacking Chair",
              "Gaming Chair",
              "Patio Chair",
              "Outdoor Furniture Set"
            ]
          },
          "ui_config": {
            "placeholder": "Select product type",
            "help_text": "Primary category of the furniture"
          }
        },
        {
          "name": "subcategory",
          "label": "Subcategory",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "4 Seater Dining Set",
              "6 Seater Dining Set",
              "8 Seater Dining Set",
              "Extendable Dining Table",
              "Round Dining Table",
              "Square Dining Table",
              "Rectangular Dining Table",
              "Glass Top Table",
              "Wooden Dining Table",
              "Metal Dining Table",
              "Upholstered Chair",
              "Wooden Chair",
              "Metal Chair",
              "Plastic Chair",
              "Leather Chair",
              "Fabric Chair",
              "High Back Chair",
              "Mid Back Chair",
              "Low Back Chair",
              "Swivel Chair",
              "Fixed Chair",
              "Adjustable Chair",
              "Ergonomic Chair",
              "Casual Chair",
              "Formal Chair"
            ]
          },
          "ui_config": {
            "placeholder": "Select subcategory if applicable",
            "help_text": "More specific product classification"
          }
        },
        {
          "name": "seating_capacity",
          "label": "Seating Capacity",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 20
          },
          "ui_config": {
            "placeholder": "Enter number of seats",
            "help_text": "Number of people the table/chair set can accommodate"
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
            "help_text": "Include key features, construction details, and use cases"
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
              "Wrought Iron",
              "Fabric",
              "Leather",
              "Velvet",
              "Microfiber",
              "Plastic",
              "Glass",
              "Marble",
              "Stone",
              "Bamboo",
              "Rattan",
              "Wicker",
              "Composite",
              "Engineered Wood",
              "Upholstered",
              "Synthetic Leather"
            ]
          },
          "ui_config": {
            "help_text": "Main material used in construction"
          }
        },
        {
          "name": "wood_type",
          "label": "Wood Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Teak",
              "Oak",
              "Pine",
              "Mahogany",
              "Walnut",
              "Maple",
              "Birch",
              "Beech",
              "Ash",
              "Cherry",
              "Rosewood",
              "Ebony",
              "Bamboo",
              "MDF",
              "Plywood",
              "Particle Board",
              "Engineered Wood"
            ]
          },
          "ui_config": {
            "help_text": "Type of wood used in construction"
          }
        },
        {
          "name": "table_shape",
          "label": "Table Shape",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Round",
              "Square",
              "Rectangular",
              "Oval",
              "Hexagonal",
              "Octagonal",
              "Irregular",
              "Custom Shape"
            ]
          },
          "ui_config": {
            "help_text": "Shape of the table top"
          }
        },
        {
          "name": "table_top_material",
          "label": "Table Top Material",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Solid Wood",
              "Wood Veneer",
              "Glass",
              "Tempered Glass",
              "Marble",
              "Granite",
              "Ceramic",
              "Laminate",
              "MDF",
              "Plywood",
              "Metal",
              "Stone",
              "Bamboo",
              "Composite"
            ]
          },
          "ui_config": {
            "help_text": "Material of the table surface"
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
            "placeholder": "e.g., 180 x 90 x 75 cm",
            "help_text": "Overall dimensions in centimeters or inches"
          }
        },
        {
          "name": "table_height",
          "label": "Table Height",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Standard (75-76 cm)",
              "Counter Height (90-92 cm)",
              "Bar Height (105-110 cm)",
              "Adjustable Height",
              "Custom Height"
            ]
          },
          "ui_config": {
            "help_text": "Standard table height category"
          }
        },
        {
          "name": "chair_dimensions",
          "label": "Chair Dimensions (W x D x H)",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*x\\s*\\d+(\\.\\d+)?\\s*x\\s*\\d+(\\.\\d+)?\\s*(cm|mm|inches?|in)$",
            "max_length": 50
          },
          "ui_config": {
            "placeholder": "e.g., 45 x 50 x 85 cm",
            "help_text": "Dimensions of individual chairs (if applicable)"
          }
        },
        {
          "name": "seat_height",
          "label": "Seat Height",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*(cm|mm|inches?|in)$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 45 cm, 18 inches",
            "help_text": "Height from floor to seat surface"
          }
        },
        {
          "name": "weight_capacity",
          "label": "Weight Capacity (kg)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 50,
            "max": 200
          },
          "ui_config": {
            "placeholder": "Enter weight capacity per chair",
            "help_text": "Maximum weight each chair can support"
          }
        },
        {
          "name": "extendable",
          "label": "Extendable Table",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if the table can be extended for more seating"
          }
        },
        {
          "name": "extension_mechanism",
          "label": "Extension Mechanism",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Drop Leaf",
              "Butterfly Leaf",
              "Removable Leaf",
              "Sliding Top",
              "Gate Leg",
              "Draw Leaf",
              "Not Extendable"
            ]
          },
          "ui_config": {
            "help_text": "Type of extension mechanism"
          }
        },
        {
          "name": "assembly_required",
          "label": "Assembly Required",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if the furniture requires assembly"
          }
        },
        {
          "name": "weight",
          "label": "Product Weight (kg)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 500
          },
          "ui_config": {
            "placeholder": "Enter total weight in kg",
            "help_text": "Total weight of the assembled product"
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
              "Natural Wood",
              "Painted",
              "Veneer",
              "Laminated",
              "Melamine",
              "PU Coated",
              "Lacquered",
              "Oiled",
              "Distressed",
              "Antique",
              "Rustic"
            ]
          },
          "ui_config": {
            "help_text": "Surface finish and treatment"
          }
        },
        {
          "name": "upholstery_material",
          "label": "Upholstery Material",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Leather",
              "Synthetic Leather",
              "Fabric",
              "Velvet",
              "Microfiber",
              "Chenille",
              "Linen",
              "Cotton",
              "Polyester",
              "Nylon",
              "No Upholstery"
            ]
          },
          "ui_config": {
            "help_text": "Material used for chair upholstery"
          }
        },
        {
          "name": "chair_base_type",
          "label": "Chair Base Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Four Legs",
              "Three Legs",
              "Five Legs",
              "Sled Base",
              "Cantilever",
              "Wishbone",
              "Swivel Base",
              "Rocking Base",
              "Reclining Base",
              "Stackable Base"
            ]
          },
          "ui_config": {
            "help_text": "Type of chair base or frame construction"
          }
        },
        {
          "name": "armrest_type",
          "label": "Armrest Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Fixed Armrests",
              "Adjustable Armrests",
              "No Armrests",
              "Padded Armrests",
              "Wooden Armrests",
              "Metal Armrests"
            ]
          },
          "ui_config": {
            "help_text": "Type of armrests on the chair"
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
            "help_text": "Include frame construction, joint types, or other relevant specs"
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
            "placeholder": "e.g., 10 years, 120 months",
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
          "label": "Fabric/Upholstery Condition",
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
            "help_text": "Condition of fabric or upholstery materials"
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
            "min": 500,
            "max": 5000000
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
            "min": 500,
            "max": 5000000
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
            "max": 500
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
              "Furniture Store",
              "Interior Designer",
              "Home Decor Store",
              "Wholesale Supplier",
              "Showroom",
              "Office Furniture Supplier",
              "Restaurant Supplier"
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
          "name": "furniture_expertise",
          "label": "Furniture Expertise",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if seller has furniture expertise for technical support"
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
              "Room of Choice Delivery",
              "Assembly Service",
              "Third-party Logistics",
              "Local Pickup Only",
              "Curbside Delivery",
              "Furniture Delivery",
              "Office Delivery"
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
            "placeholder": "e.g., 10-15 business days, 2-4 weeks",
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
          "name": "assembly_service",
          "label": "Assembly Service Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if professional assembly service is offered"
          }
        },
        {
          "name": "large_item",
          "label": "Large/Bulky Item",
          "type": "boolean",
          "required": true,
          "ui_config": {
            "help_text": "Check if this is a large or bulky item requiring special handling"
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
              "Extendable Design",
              "Foldable",
              "Stackable",
              "Swivel Mechanism",
              "Reclining Feature",
              "Rocking Mechanism",
              "Adjustable Height",
              "Adjustable Backrest",
              "Lumbar Support",
              "Headrest",
              "Footrest",
              "Massage Function",
              "Heating Function",
              "USB Charging Port",
              "Cup Holder",
              "Storage Compartment",
              "Removable Cushions",
              "Washable Covers",
              "Stain Resistant",
              "Scratch Resistant",
              "Water Resistant",
              "UV Resistant",
              "Fire Retardant",
              "Anti-Slip Feet",
              "Locking Casters",
              "Brake System",
              "360° Rotation",
              "Tilt Mechanism",
              "Height Adjustable",
              "Armrest Adjustment",
              "Seat Depth Adjustment",
              "Back Angle Adjustment",
              "Memory Foam Seating",
              "Ergonomic Design",
              "Breathable Material",
              "Cooling Gel",
              "Pressure Relief",
              "Spine Support",
              "Posture Correction",
              "Noise Reduction",
              "Cable Management",
              "Modular Design",
              "Customizable",
              "Eco-Friendly Materials",
              "Recyclable Materials",
              "Sustainable Sourcing"
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
              "Chair Cushions",
              "Table Linens",
              "Protective Covers",
              "Assembly Hardware",
              "Allen Keys",
              "Screwdriver",
              "User Manual",
              "Care Instructions",
              "Warranty Card",
              "Extra Fabric",
              "Replacement Parts",
              "Extension Leaves",
              "Table Extensions",
              "Chair Pads",
              "Armrest Covers",
              "Footstool",
              "Side Table",
              "Magazine Rack",
              "Coasters",
              "Table Runner",
              "Placemats",
              "Napkin Rings",
              "Serveware",
              "Glassware",
              "Cutlery Set"
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
              "Black",
              "White",
              "Gray",
              "Brown",
              "Beige",
              "Cream",
              "Red",
              "Blue",
              "Green",
              "Yellow",
              "Orange",
              "Purple",
              "Pink",
              "Multi-Color",
              "Wood Finish",
              "Metal Finish",
              "Custom Color",
              "Natural Wood",
              "Dark Wood",
              "Light Wood",
              "Cherry Wood",
              "Walnut Wood",
              "Oak Wood",
              "Mahogany Wood"
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
              "Art Nouveau"
            ]
          },
          "ui_config": {
            "help_text": "Design style or aesthetic of the furniture"
          }
        },
        {
          "name": "room_type",
          "label": "Suitable Room Types",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Dining Room",
              "Living Room",
              "Bedroom",
              "Home Office",
              "Study Room",
              "Kitchen",
              "Breakfast Nook",
              "Patio",
              "Garden",
              "Balcony",
              "Restaurant",
              "Cafe",
              "Office",
              "Conference Room",
              "Waiting Area",
              "Lobby",
              "Hotel Room",
              "Banquet Hall",
              "Auditorium",
              "Classroom",
              "Library",
              "Game Room",
              "Bar Area",
              "Lounge Area"
            ]
          },
          "ui_config": {
            "help_text": "Select all suitable room types for this furniture"
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
              "BIFMA Certified",
              "ANSI/BIFMA Standards",
              "GREENGUARD Gold",
              "Energy Star",
              "Fire Resistant",
              "Child Safe",
              "Anti-Bacterial",
              "OEKO-TEX",
              "REACH Compliant",
              "RoHS Compliant",
              "ISO 9001",
              "ISO 14001"
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
              "FSC Certified",
              "Green Guard Certified",
              "BIFMA Certified",
              "GREENGUARD Gold",
              "Fire Resistant",
              "Child Safe",
              "Anti-Tip Device",
              "Stability Tested",
              "Load Bearing Certified",
              "Ergonomic Certified",
              "ANSI/BIFMA Standards"
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
          "name": "fabric_care",
          "label": "Fabric/Upholstery Care Instructions",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 300
          },
          "ui_config": {
            "placeholder": "Provide specific fabric care instructions",
            "help_text": "Cleaning methods, stain removal, and maintenance tips"
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
              "Utility Patent"
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