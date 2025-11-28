# Kids Furniture Template

```json
{
  "name": "Kids Furniture Template",
  "description": "Industry-level template for children's furniture including beds, desks, chairs, storage, and play furniture with comprehensive safety and developmental specifications.",
  "category_type": "kids_furniture",
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
            "placeholder": "Enter product title (e.g., Convertible Toddler Bed with Storage)",
            "help_text": "Provide a clear, descriptive title including age range and type"
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
            "placeholder": "Enter brand name (e.g., IKEA, KidKraft, Little Tikes)",
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
            "placeholder": "Enter model number (e.g., KID-2024-001)",
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
              "Toddler Bed",
              "Kids Bed",
              "Bunk Bed",
              "Loft Bed",
              "Study Desk",
              "Kids Chair",
              "Rocking Chair",
              "Step Stool",
              "Bookshelf",
              "Storage Unit",
              "Toy Box",
              "Dresser",
              "Nightstand",
              "Wardrobe",
              "Play Table",
              "Activity Table",
              "Crib",
              "Changing Table",
              "High Chair",
              "Booster Seat",
              "Play Kitchen",
              "Play House",
              "Climbing Structure",
              "Swing Set",
              "Sandbox",
              "Playground Equipment",
              "Bean Bag Chair",
              "Floor Cushion",
              "Tent",
              "Play Mat"
            ]
          },
          "ui_config": {
            "placeholder": "Select product type",
            "help_text": "Primary category of children's furniture"
          }
        },
        {
          "name": "subcategory",
          "label": "Subcategory",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Newborn (0-6 months)",
              "Infant (6-12 months)",
              "Toddler (1-3 years)",
              "Preschool (3-5 years)",
              "Early Childhood (5-8 years)",
              "Middle Childhood (8-12 years)",
              "Pre-Teen (12-15 years)",
              "Teen (15+ years)",
              "Multi-Age",
              "Convertible",
              "Adjustable",
              "Stackable",
              "Modular",
              "Educational",
              "Themed",
              "Gender Neutral",
              "Eco-Friendly",
              "Special Needs"
            ]
          },
          "ui_config": {
            "placeholder": "Select subcategory if applicable",
            "help_text": "More specific product classification"
          }
        },
        {
          "name": "age_range",
          "label": "Recommended Age Range",
          "type": "text",
          "required": true,
          "validation": {
            "pattern": "^\\d+\\s*[-\\s]*\\d*\\s*(months?|years?|yrs?)$",
            "max_length": 50
          },
          "ui_config": {
            "placeholder": "e.g., 3-8 years, 6 months-3 years",
            "help_text": "Recommended age range for safe use"
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
            "placeholder": "Provide detailed product description including safety features, dimensions, and developmental benefits",
            "help_text": "Include key features, safety standards, and educational value"
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
              "MDF",
              "Plywood",
              "Plastic",
              "Metal",
              "Fabric",
              "Foam",
              "Memory Foam",
              "Latex",
              "Cotton",
              "Polyester",
              "Canvas",
              "Wicker",
              "Bamboo",
              "Cardboard",
              "Recycled Materials",
              "Non-Toxic Paint"
            ]
          },
          "ui_config": {
            "help_text": "Main material used in construction"
          }
        },
        {
          "name": "finish_type",
          "label": "Finish Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Natural Wood",
              "Painted",
              "Laminated",
              "Melamine",
              "PVC Coated",
              "Water-Based Paint",
              "Non-Toxic Varnish",
              "Waxed",
              "Oiled",
              "Distressed",
              "Textured"
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
            "placeholder": "e.g., 120 x 60 x 80 cm",
            "help_text": "Overall dimensions in centimeters or inches"
          }
        },
        {
          "name": "weight_capacity",
          "label": "Weight Capacity (kg)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 10,
            "max": 150
          },
          "ui_config": {
            "placeholder": "Enter weight capacity in kg",
            "help_text": "Maximum weight the furniture can safely support"
          }
        },
        {
          "name": "bed_size",
          "label": "Bed Size",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Crib (90x45 cm)",
              "Toddler (120x60 cm)",
              "Single (190x90 cm)",
              "Twin (190x90 cm)",
              "Full (135x190 cm)",
              "Custom Size",
              "Convertible",
              "Adjustable"
            ]
          },
          "ui_config": {
            "help_text": "Standard bed size for kids furniture"
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
            "placeholder": "e.g., 3 large drawers, under-bed storage",
            "help_text": "Storage features and capacity details"
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
          "name": "convertible_features",
          "label": "Convertible Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Toddler to Twin Bed",
              "Crib to Toddler Bed",
              "Desk to Changing Table",
              "Chair to Step Stool",
              "Storage to Bed",
              "Multi-Height Adjustable",
              "Removable Sides",
              "Extension Panels",
              "Modular Components"
            ]
          },
          "ui_config": {
            "help_text": "Select all convertible features"
          }
        },
        {
          "name": "safety_features",
          "label": "Built-in Safety Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Rounded Edges",
              "Non-Toxic Materials",
              "Stable Base",
              "Locking Mechanisms",
              "Guard Rails",
              "Soft Bumpers",
              "Finger Pinch Protection",
              "Tip-Over Prevention",
              "Secure Fasteners",
              "Smooth Surfaces",
              "No Small Parts",
              "Choking Hazard Free",
              "Flame Retardant",
              "Lead Free Paint",
              "BPA Free",
              "Phthalate Free"
            ]
          },
          "ui_config": {
            "help_text": "Select all built-in safety features"
          }
        },
        {
          "name": "educational_features",
          "label": "Educational Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Alphabet Letters",
              "Numbers",
              "Shapes",
              "Colors",
              "Interactive Elements",
              "Puzzle Pieces",
              "Building Blocks",
              "Sorting Compartments",
              "Shape Sorters",
              "Stacking Rings",
              "Bead Mazes",
              "Activity Panels",
              "Learning Games",
              "Motor Skills Development",
              "Cognitive Development",
              "Creative Play",
              "Imaginative Play",
              "Role Play Features"
            ]
          },
          "ui_config": {
            "help_text": "Select all educational or developmental features"
          }
        },
        {
          "name": "weight",
          "label": "Product Weight (kg)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 200
          },
          "ui_config": {
            "placeholder": "Enter total weight in kg",
            "help_text": "Total weight of the assembled product"
          }
        },
        {
          "name": "theme_design",
          "label": "Theme/Design",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Superhero",
              "Princess",
              "Dinosaur",
              "Space",
              "Underwater",
              "Safari",
              "Farm",
              "Transportation",
              "Construction",
              "Fantasy",
              "Nature",
              "Educational",
              "Sports",
              "Music",
              "Art",
              "Gender Neutral",
              "Custom Theme",
              "Classic",
              "Modern",
              "Traditional"
            ]
          },
          "ui_config": {
            "help_text": "Theme or design style of the furniture"
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
            "help_text": "Include special construction details or features"
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
            "placeholder": "e.g., 5 years, 24 months",
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
            "max": 200000
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
            "max": 200000
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
              "Kids Store",
              "Toy Store",
              "Baby Store",
              "Furniture Store",
              "Department Store",
              "Wholesale Supplier",
              "Showroom",
              "Online Marketplace",
              "Parent Community",
              "Educational Supplier"
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
          "name": "parent_expertise",
          "label": "Parent/Child Development Expertise",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if seller has expertise in child development or parenting"
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
            "max": 25000
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
            "placeholder": "e.g., 5-10 business days, 2-4 weeks",
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
          "label": "Large Item",
          "type": "boolean",
          "required": true,
          "ui_config": {
            "help_text": "Check if this is a large item requiring special handling"
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
              "Growth Adjustable",
              "Multi-Functional",
              "Easy to Clean",
              "Wipeable Surfaces",
              "Removable Parts",
              "Stackable",
              "Foldable",
              "Portable",
              "Lightweight",
              "Durable Construction",
              "Scratch Resistant",
              "Stain Resistant",
              "UV Resistant",
              "Eco-Friendly Materials",
              "Recycled Materials",
              "Sustainable Sourcing",
              "Customizable",
              "Personalized",
              "Themed Design",
              "Educational Elements",
              "Interactive Features",
              "Sensory Elements",
              "Motor Skills Development",
              "Cognitive Development",
              "Creative Development",
              "Imaginative Play",
              "Role Play Features",
              "Building/Construction",
              "Puzzle Elements",
              "Shape Recognition",
              "Color Learning",
              "Number Learning",
              "Letter Learning",
              "Music Elements",
              "Light-Up Features",
              "Sound Features",
              "Motion Features",
              "Storage Solutions",
              "Organization Features",
              "Safety Locks",
              "Soft Edges",
              "Non-Slip Surfaces",
              "Anti-Tip Design",
              "Stability Features",
              "Easy Assembly",
              "Tool-Free Assembly",
              "Colorful Design",
              "Gender Neutral",
              "Inclusive Design",
              "Special Needs Friendly",
              "Sensory Friendly",
              "Hypoallergenic",
              "Anti-Bacterial",
              "Mold Resistant",
              "Pest Resistant"
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
              "Guard Rails",
              "Storage Drawers",
              "Bookshelf",
              "Desk Organizer",
              "Chair Cushion",
              "Step Stool",
              "Toy Storage",
              "Books",
              "Educational Materials",
              "Assembly Hardware",
              "Allen Keys",
              "Screwdriver",
              "User Manual",
              "Care Instructions",
              "Warranty Card",
              "Extra Parts",
              "Replacement Parts",
              "Cleaning Kit",
              "Wall Anchors",
              "Safety Straps",
              "Extension Panels",
              "Connecting Pieces",
              "Decorative Elements",
              "Themed Accessories",
              "Growth Chart",
              "Name Plate",
              "Storage Bins",
              "Hanging Organizers",
              "Wall Decals",
              "Stickers",
              "Growth Markers"
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
              "Primary Colors",
              "Pastel Colors",
              "Bright Colors",
              "Natural Wood",
              "White",
              "Black",
              "Gray",
              "Blue",
              "Red",
              "Green",
              "Yellow",
              "Orange",
              "Purple",
              "Pink",
              "Brown",
              "Beige",
              "Multi-Color",
              "Custom Color",
              "Themed Colors",
              "Educational Colors"
            ]
          },
          "ui_config": {
            "help_text": "Select all available color options"
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
              "EN 71 Certified",
              "ASTM Certified",
              "CPSC Certified",
              "JPMA Certified",
              "Greenguard Certified",
              "CARB Compliant",
              "CPSIA Compliant",
              "Lead Safe",
              "Non-Toxic",
              "Flame Retardant",
              "Anti-Bacterial",
              "Hypoallergenic",
              "Eco-Friendly",
              "Sustainable",
              "FSC Certified",
              "OEKO-TEX",
              "REACH Compliant"
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
              "EN 71 Certified",
              "ASTM F963",
              "CPSC Certified",
              "JPMA Certified",
              "Greenguard Gold",
              "CARB Compliant",
              "CPSIA Compliant",
              "Lead Safe Certified",
              "Non-Toxic Certified",
              "Flame Retardant",
              "Anti-Tip Certified",
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
          "name": "choking_hazard",
          "label": "Choking Hazard Assessment",
          "type": "radio",
          "required": false,
          "validation": {
            "options": [
              "No Choking Hazard",
              "Small Parts Present",
              "Small Parts with Warnings",
              "Not Applicable"
            ]
          },
          "ui_config": {
            "help_text": "Assessment of potential choking hazards"
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
          "name": "developmental_benefits",
          "label": "Developmental Benefits",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "Describe developmental benefits for children",
            "help_text": "Educational value, skill development, and learning outcomes"
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
              "Child Safety Standards"
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
            "help_text": "Upload warranty cards, certificates, safety standards, or other relevant documents"
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