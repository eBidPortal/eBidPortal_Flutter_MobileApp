# Beds & Wardrobes Template

```json
{
  "name": "Beds & Wardrobes Template",
  "description": "Industry-level template for beds, mattresses, wardrobes, dressers, and bedroom furniture with comprehensive specifications and validation rules.",
  "category_type": "beds_wardrobes",
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
            "placeholder": "Enter product title (e.g., King Size Wooden Bed with Storage)",
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
            "placeholder": "Enter model number (e.g., BRIMNES-002)",
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
              "Bed Frame",
              "Mattress",
              "Bedroom Set",
              "Wardrobe",
              "Dresser",
              "Chest of Drawers",
              "Nightstand",
              "Bedside Table",
              "Vanity Table",
              "Dressing Table",
              "Mirror",
              "Bedroom Bench",
              "Headboard",
              "Footboard",
              "Bed Storage",
              "Mattress Protector",
              "Bedding Set"
            ]
          },
          "ui_config": {
            "placeholder": "Select product type",
            "help_text": "Primary category of the bedroom furniture"
          }
        },
        {
          "name": "subcategory",
          "label": "Subcategory",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Single Bed",
              "Double Bed",
              "Queen Size Bed",
              "King Size Bed",
              "California King Bed",
              "Custom Size Bed",
              "Platform Bed",
              "Storage Bed",
              "Upholstered Bed",
              "Canopy Bed",
              "Bunk Bed",
              "Loft Bed",
              "Murphy Bed",
              "Water Bed",
              "Memory Foam Mattress",
              "Latex Mattress",
              "Hybrid Mattress",
              "Innerspring Mattress",
              "2 Door Wardrobe",
              "3 Door Wardrobe",
              "4 Door Wardrobe",
              "Sliding Door Wardrobe",
              "Walk-in Wardrobe",
              "Corner Wardrobe"
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
            "help_text": "Include key features, storage capacity, material details, and use cases"
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
              "Foam",
              "Memory Foam",
              "Latex",
              "Innerspring",
              "Hybrid",
              "Composite",
              "Engineered Wood"
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
          "name": "mattress_type",
          "label": "Mattress Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Memory Foam",
              "Latex",
              "Hybrid",
              "Innerspring",
              "Pocket Spring",
              "Bonnel Spring",
              "Air Bed",
              "Water Bed",
              "Futon",
              "Adjustable Air",
              "Gel Infused",
              "Natural Fiber"
            ]
          },
          "ui_config": {
            "help_text": "Type of mattress construction"
          }
        },
        {
          "name": "mattress_thickness",
          "label": "Mattress Thickness",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*(cm|mm|inches?|in)$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 25 cm, 10 inches",
            "help_text": "Thickness of the mattress"
          }
        },
        {
          "name": "mattress_firmness",
          "label": "Mattress Firmness",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Extra Soft",
              "Soft",
              "Medium Soft",
              "Medium",
              "Medium Firm",
              "Firm",
              "Extra Firm",
              "Adjustable"
            ]
          },
          "ui_config": {
            "help_text": "Firmness level of the mattress"
          }
        },
        {
          "name": "bed_size",
          "label": "Bed Size",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Single (90x190 cm)",
              "Double (135x190 cm)",
              "Queen (152x203 cm)",
              "King (183x203 cm)",
              "California King (183x213 cm)",
              "Custom Size",
              "Twin (99x190 cm)",
              "Full (135x190 cm)",
              "Super King (203x203 cm)"
            ]
          },
          "ui_config": {
            "help_text": "Standard bed size dimensions"
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
            "placeholder": "e.g., 200 x 160 x 85 cm",
            "help_text": "Overall dimensions in centimeters or inches"
          }
        },
        {
          "name": "mattress_dimensions",
          "label": "Mattress Dimensions",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*x\\s*\\d+(\\.\\d+)?\\s*x\\s*\\d+(\\.\\d+)?\\s*(cm|mm|inches?|in)$",
            "max_length": 50
          },
          "ui_config": {
            "placeholder": "e.g., 183 x 203 x 25 cm",
            "help_text": "Dimensions of the mattress (if separate from bed frame)"
          }
        },
        {
          "name": "storage_capacity",
          "label": "Storage Capacity",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "e.g., 2 large drawers, under-bed storage",
            "help_text": "Storage features and capacity details"
          }
        },
        {
          "name": "weight_capacity",
          "label": "Weight Capacity (kg)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 50,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter weight capacity in kg",
            "help_text": "Maximum weight the bed/mattress can support"
          }
        },
        {
          "name": "door_count",
          "label": "Number of Doors",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 10
          },
          "ui_config": {
            "placeholder": "Enter number of doors",
            "help_text": "Number of doors in wardrobe or dresser"
          }
        },
        {
          "name": "drawer_count",
          "label": "Number of Drawers",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 20
          },
          "ui_config": {
            "placeholder": "Enter number of drawers",
            "help_text": "Number of drawers in dresser or chest"
          }
        },
        {
          "name": "shelf_count",
          "label": "Number of Shelves",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 20
          },
          "ui_config": {
            "placeholder": "Enter number of shelves",
            "help_text": "Number of shelves in wardrobe or bookshelf"
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
            "max": 2000
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
              "Oiled"
            ]
          },
          "ui_config": {
            "help_text": "Surface finish and treatment"
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
          "name": "mattress_condition",
          "label": "Mattress Condition",
          "type": "radio",
          "required": false,
          "validation": {
            "options": [
              "New",
              "Like New",
              "Good",
              "Fair",
              "Needs Replacement",
              "Not Applicable"
            ]
          },
          "ui_config": {
            "help_text": "Condition of mattress (if included)"
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
              "Showroom"
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
              "Curbside Delivery"
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
              "Storage Drawers",
              "Hydraulic Storage",
              "Headboard Storage",
              "Under-Bed Storage",
              "Mirror Doors",
              "Sliding Doors",
              "Hanging Rods",
              "Shelves",
              "Adjustable Shelves",
              "Internal Lights",
              "Cedar Lining",
              "Anti-Moth Treatment",
              "Lockable Doors",
              "Soft Close Doors",
              "Soft Close Drawers",
              "Push-to-Open",
              "Gas Lift Mechanism",
              "Adjustable Height",
              "Memory Foam Topper",
              "Cooling Gel",
              "Anti-Allergen",
              "Hypoallergenic",
              "Pressure Relief",
              "Motion Isolation",
              "Edge Support",
              "CertiPUR-US Certified",
              "OEKO-TEX Certified",
              "Zero Gravity Position",
              "Wall Hugging Design",
              "Platform Bed",
              "Canopy Frame",
              "Bookcase Headboard",
              "Upholstered Headboard",
              "Tufted Design",
              "Button Tufting",
              "Quilted Surface",
              "Removable Cover",
              "Machine Washable",
              "Stain Resistant",
              "Pet Friendly",
              "Eco-Friendly Materials"
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
              "Mattress",
              "Bedding Set",
              "Pillows",
              "Mattress Protector",
              "Bed Skirt",
              "Headboard",
              "Footboard",
              "Side Rails",
              "Storage Drawers",
              "Assembly Hardware",
              "Allen Keys",
              "Screwdriver",
              "User Manual",
              "Care Instructions",
              "Warranty Card",
              "Extra Fabric",
              "Replacement Parts",
              "Hanging Rods",
              "Shelves",
              "Drawer Organizers",
              "Mirror",
              "Stool",
              "Bench"
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
              "Custom Color"
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
              "Transitional"
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
              "Master Bedroom",
              "Guest Bedroom",
              "Kids Bedroom",
              "Teen Bedroom",
              "Dormitory",
              "Hotel Room",
              "Apartment",
              "Condo",
              "House",
              "Studio Apartment",
              "Loft",
              "Basement",
              "Attic"
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
              "CertiPUR-US",
              "OEKO-TEX",
              "GREENGUARD Gold",
              "Energy Star",
              "Fire Resistant",
              "Child Safe",
              "Anti-Bacterial"
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
              "CertiPUR-US Certified",
              "OEKO-TEX Certified",
              "GREENGUARD Gold",
              "Fire Resistant",
              "Child Safe",
              "Anti-Tip Device",
              "Stability Tested",
              "Load Bearing Certified"
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
          "name": "mattress_care",
          "label": "Mattress Care Instructions",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 300
          },
          "ui_config": {
            "placeholder": "Provide specific mattress care instructions",
            "help_text": "Rotation schedule, cleaning methods, and maintenance tips"
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
              "Trademark Compliant"
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