# Office Furniture Template

```json
{
  "name": "Office Furniture Template",
  "description": "Industry-level template for office furniture including desks, chairs, storage units, and meeting room solutions with comprehensive ergonomic and commercial specifications.",
  "category_type": "office_furniture",
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
            "placeholder": "Enter product title (e.g., Ergonomic Executive Office Chair with Lumbar Support)",
            "help_text": "Provide a clear, descriptive title including type and key features"
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
            "placeholder": "Enter brand name (e.g., Herman Miller, IKEA, Godrej)",
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
            "placeholder": "Enter model number (e.g., OFC-2024-001)",
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
              "Office Chair",
              "Executive Chair",
              "Task Chair",
              "Conference Chair",
              "Visitor Chair",
              "Desk",
              "Executive Desk",
              "Computer Desk",
              "Standing Desk",
              "Height Adjustable Desk",
              "L-Shaped Desk",
              "U-Shaped Desk",
              "Filing Cabinet",
              "Storage Cabinet",
              "Bookcase",
              "Lateral File",
              "Pedestal",
              "Credenza",
              "Conference Table",
              "Meeting Table",
              "Boardroom Table",
              "Training Table",
              "Workstation",
              "Cubicle Panel",
              "Reception Desk",
              "Waiting Room Furniture",
              "Break Room Furniture",
              "Mailroom Furniture",
              "Computer Cart",
              "Printer Stand",
              "Monitor Arm",
              "Keyboard Tray",
              "CPU Holder"
            ]
          },
          "ui_config": {
            "placeholder": "Select product type",
            "help_text": "Primary category of office furniture"
          }
        },
        {
          "name": "subcategory",
          "label": "Subcategory",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Ergonomic Chair",
              "Mid-Back Chair",
              "High-Back Chair",
              "Low-Back Chair",
              "Drafting Chair",
              "Stool",
              "Bench",
              "Recliner Chair",
              "Gaming Chair",
              "Corner Desk",
              "Writing Desk",
              "Secretary Desk",
              "Roll Top Desk",
              "Glass Top Desk",
              "Metal Desk",
              "Wood Desk",
              "Mobile Pedestal",
              "Fixed Pedestal",
              "Open Shelf Unit",
              "Closed Cabinet",
              "Modular Storage",
              "Round Conference Table",
              "Rectangular Table",
              "Square Table",
              "Oval Table",
              "Boat Shaped Table",
              "Training Room Tables",
              "Modular Workstation",
              "Call Center Station",
              "Executive Workstation",
              "Hot Desk",
              "Touchdown Station"
            ]
          },
          "ui_config": {
            "placeholder": "Select subcategory if applicable",
            "help_text": "More specific product classification"
          }
        },
        {
          "name": "office_environment",
          "label": "Suitable Office Environment",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Corporate Office",
              "Home Office",
              "Small Business",
              "Large Corporation",
              "Government Office",
              "Educational Institution",
              "Healthcare Facility",
              "Call Center",
              "Creative Studio",
              "Tech Startup",
              "Legal Office",
              "Accounting Firm",
              "Reception Area",
              "Conference Room",
              "Training Room",
              "Break Room",
              "Executive Suite",
              "Open Office",
              "Cubicle Office",
              "Private Office"
            ]
          },
          "ui_config": {
            "help_text": "Select all suitable office environments"
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
            "placeholder": "Provide detailed product description including ergonomics, dimensions, and features",
            "help_text": "Include key features, construction details, and office suitability"
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
              "Steel",
              "Aluminum",
              "Plastic",
              "Laminate",
              "Glass",
              "Fabric",
              "Leather",
              "Synthetic Leather",
              "Mesh",
              "Wood Veneer",
              "MDF",
              "Plywood",
              "Particle Board",
              "Engineered Wood",
              "Bamboo",
              "Recycled Materials",
              "Sustainable Materials"
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
              "Polished",
              "Matt",
              "Glossy",
              "Textured",
              "Natural Wood",
              "Stained",
              "Painted",
              "Laminated",
              "Melamine",
              "Veneer",
              "Chrome",
              "Brushed Nickel",
              "Powder Coated",
              "Anodized",
              "Electroplated",
              "Epoxy Coated"
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
            "placeholder": "e.g., 120 x 60 x 75 cm",
            "help_text": "Overall dimensions in centimeters or inches"
          }
        },
        {
          "name": "weight_capacity",
          "label": "Weight Capacity (kg)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 50,
            "max": 300
          },
          "ui_config": {
            "placeholder": "Enter weight capacity in kg",
            "help_text": "Maximum weight the furniture can safely support"
          }
        },
        {
          "name": "desk_surface_area",
          "label": "Desk Surface Area (sq ft)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 50
          },
          "ui_config": {
            "placeholder": "Enter surface area in square feet",
            "help_text": "Total usable surface area of the desk"
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
            "help_text": "Number of people the table or furniture can accommodate"
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
            "placeholder": "e.g., 4 drawers, 2 file drawers, 3 shelves",
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
          "name": "adjustable_features",
          "label": "Adjustable Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Height Adjustable",
              "Seat Height Adjustment",
              "Backrest Angle Adjustment",
              "Armrest Height Adjustment",
              "Armrest Width Adjustment",
              "Lumbar Support Adjustment",
              "Headrest Adjustment",
              "Tilt Tension Adjustment",
              "Tilt Lock",
              "Forward Tilt",
              "Backward Tilt",
              "Seat Depth Adjustment",
              "Desk Height Adjustment",
              "Monitor Arm Adjustment",
              "Keyboard Tray Adjustment",
              "Footrest Adjustment",
              "Recline Adjustment",
              "Tension Control",
              "Lockable Tilt",
              "Seat Slider",
              "Backrest Height Adjustment",
              "Armrest Angle Adjustment"
            ]
          },
          "ui_config": {
            "help_text": "Select all adjustable features"
          }
        },
        {
          "name": "ergonomic_features",
          "label": "Ergonomic Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Lumbar Support",
              "Headrest",
              "Armrests",
              "Footrest",
              "Contoured Seat",
              "Waterfall Seat Edge",
              "Breathable Mesh",
              "Adjustable Backrest",
              "Synchronized Tilt",
              "Multi-Lock Positions",
              "Seat Angle Adjustment",
              "Back Angle Adjustment",
              "Tension Control",
              "Height Adjustment",
              "Depth Adjustment",
              "Width Adjustment",
              "Posture Support",
              "Spine Alignment",
              "Pressure Relief",
              "Anti-Fatigue",
              "Circulation Support",
              "Temperature Control",
              "Moisture Wicking",
              "Anti-Static",
              "ESD Safe",
              "Keyboard Support",
              "Mouse Support",
              "Document Holder",
              "Monitor Riser",
              "Cable Management",
              "Under-Desk Storage",
              "Foot Space",
              "Knee Space",
              "Elbow Room"
            ]
          },
          "ui_config": {
            "help_text": "Select all ergonomic features"
          }
        },
        {
          "name": "chair_mechanism",
          "label": "Chair Mechanism",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Synchronous Tilt",
              "Asynchronous Tilt",
              "Multi-Lock Tilt",
              "Free Float",
              "Kneeling Chair",
              "Ball Chair",
              "Wobble Stool",
              "Saddle Seat",
              "Fixed Height",
              "Manual Adjustment",
              "Pneumatic Adjustment",
              "Electric Adjustment",
              "No Mechanism"
            ]
          },
          "ui_config": {
            "help_text": "Type of chair adjustment mechanism"
          }
        },
        {
          "name": "base_type",
          "label": "Base Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "5-Star Base",
              "4-Star Base",
              "Sled Base",
              "Cantilever Base",
              "Wishbone Base",
              "Four Leg Base",
              "Trestle Base",
              "Cabriole Base",
              "H-Frame Base",
              "Fixed Base",
              "Mobile Base",
              "Swivel Base",
              "Locking Casters",
              "Glides",
              "Leveling Glides"
            ]
          },
          "ui_config": {
            "help_text": "Type of furniture base or frame"
          }
        },
        {
          "name": "caster_type",
          "label": "Caster Type",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Hard Floor Casters",
              "Carpet Casters",
              "Dual Wheel Casters",
              "Soft Wheel Casters",
              "Locking Casters",
              "Brake Casters",
              "No Casters",
              "Glides",
              "Leveling Feet",
              "Fixed Feet"
            ]
          },
          "ui_config": {
            "help_text": "Type of casters or feet on the furniture"
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
          "name": "commercial_grade",
          "label": "Commercial Grade",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if designed for commercial/office use"
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
            "placeholder": "e.g., 5 years, 10 years",
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
            "min": 1000,
            "max": 1000000
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
            "min": 1000,
            "max": 1000000
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
            "max": 100
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
              "Office Furniture Store",
              "Online Retailer",
              "Corporate Supplier",
              "Interior Designer",
              "Facility Manager",
              "Wholesale Supplier",
              "Showroom",
              "Online Marketplace",
              "Government Contractor",
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
          "name": "office_setup_expertise",
          "label": "Office Setup Expertise",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if seller provides office setup and installation services"
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
              "Office Installation",
              "Room of Choice Delivery",
              "Assembly Service",
              "Third-party Logistics",
              "Local Pickup Only",
              "Curbside Delivery",
              "In-office Delivery"
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
            "placeholder": "e.g., 7-14 business days, 2-4 weeks",
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
              "Ergonomic Design",
              "Height Adjustable",
              "Swivel Mechanism",
              "Tilt Mechanism",
              "Locking Casters",
              "Brake System",
              "360° Rotation",
              "Reclining Feature",
              "Lumbar Support",
              "Headrest",
              "Armrests",
              "Footrest",
              "Massage Function",
              "Heating Function",
              "Cooling Function",
              "USB Charging Port",
              "Wireless Charging",
              "Cable Management",
              "Modular Design",
              "Expandable",
              "Stackable",
              "Foldable",
              "Portable",
              "Lockable Drawers",
              "File Drawers",
              "Hanging File Rails",
              "Keyboard Tray",
              "Mouse Platform",
              "CPU Holder",
              "Monitor Arm",
              "Document Holder",
              "Printer Shelf",
              "Cord Organizer",
              "Power Strip Holder",
              "Under-Desk Storage",
              "Overhead Storage",
              "Glass Doors",
              "Frosted Glass",
              "Adjustable Shelves",
              "Pull-Out Shelves",
              "Tambour Doors",
              "Sliding Doors",
              "Pocket Doors",
              "Bi-Fold Doors",
              "Hinged Doors",
              "Soft Close Doors",
              "Magnetic Latches",
              "Key Lock",
              "Electronic Lock",
              "Biometric Lock",
              "RFID Lock",
              "Combination Lock",
              "Master Key System",
              "Color Options",
              "Custom Upholstery",
              "Custom Dimensions",
              "Custom Branding",
              "Eco-Friendly Materials",
              "Sustainable Sourcing",
              "Recycled Materials",
              "Energy Efficient",
              "Low VOC",
              "Anti-Static",
              "ESD Safe",
              "Fire Resistant",
              "Water Resistant",
              "Stain Resistant",
              "Scratch Resistant",
              "Fade Resistant",
              "Noise Dampening",
              "Sound Absorption",
              "Privacy Panels",
              "Light Filtering",
              "UV Protection",
              "Thermal Insulation",
              "Acoustic Panels",
              "Magnetic Surfaces",
              "Writable Surfaces",
              "Tackable Surfaces",
              "Height Adjustable Desk",
              "Standing Desk Converter",
              "Sit-Stand Desk",
              "Electric Height Adjustment",
              "Memory Positions",
              "Collision Detection",
              "Anti-Collision Sensors",
              "Cable Management Tray",
              "Integrated Power",
              "Data Ports",
              "USB Hubs",
              "Wireless Charging Surface",
              "Smart Features",
              "App Control",
              "Usage Tracking",
              "Health Monitoring",
              "Posture Alerts",
              "Usage Analytics",
              "Maintenance Reminders",
              "Warranty Tracking"
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
              "Extra Casters",
              "Casters",
              "Glides",
              "Leveling Feet",
              "Cable Clips",
              "Cable Ties",
              "Power Cord",
              "USB Cable",
              "Extension Cord",
              "Power Strip",
              "Surge Protector",
              "Keyboard Tray",
              "Mouse Pad",
              "Wrist Rest",
              "Footrest",
              "Lumbar Cushion",
              "Head Cushion",
              "Seat Cushion",
              "Armrest Pads",
              "Monitor Arm",
              "Document Holder",
              "Printer Stand",
              "CPU Stand",
              "Cable Management Kit",
              "Drawer Organizers",
              "File Folders",
              "Hanging Files",
              "Shelf Dividers",
              "Door Keys",
              "Lock Keys",
              "Master Keys",
              "Replacement Parts",
              "Extra Shelves",
              "Glass Panels",
              "Fabric Panels",
              "Acoustic Panels",
              "Light Panels",
              "Magnetic Strips",
              "Tacks",
              "Push Pins",
              "Cleaning Kit",
              "Polishing Cloth",
              "Stain Remover",
              "Repair Kit",
              "Setup Tools",
              "Installation Guide",
              "Configuration Software",
              "Mobile App",
              "Remote Control",
              "Batteries",
              "Adapters",
              "Converters"
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
              "Silver",
              "Chrome",
              "Brown",
              "Beige",
              "Blue",
              "Navy",
              "Red",
              "Burgundy",
              "Green",
              "Forest Green",
              "Yellow",
              "Orange",
              "Purple",
              "Cherry",
              "Walnut",
              "Oak",
              "Maple",
              "Mahogany",
              "Espresso",
              "Custom Color",
              "Fabric Options",
              "Leather Options",
              "Mesh Options",
              "Laminate Options",
              "Wood Veneer Options",
              "Metal Finish Options",
              "Glass Options",
              "Plastic Options"
            ]
          },
          "ui_config": {
            "help_text": "Select all available color and finish options"
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
              "BIFMA Certified",
              "ANSI/BIFMA Standards",
              "Greenguard Certified",
              "Greenguard Gold",
              "Energy Star",
              "UL Listed",
              "CSA Certified",
              "TUV Certified",
              "ISO 9001",
              "ISO 14001",
              "FSC Certified",
              "EPEAT Certified",
              "Ergonomics Certified",
              "ADA Compliant",
              "ANSI/HFES 100",
              "EN 1335",
              "EN 527",
              "EN 16139",
              "NFPA 701",
              "ASTM E84",
              "CAL 117",
              "TB 133",
              "Boston Fire Code",
              "NYC Fire Code",
              "REACH Compliant",
              "RoHS Compliant",
              "WEEE Compliant",
              "Prop 65 Compliant",
              "CARB Compliant",
              "SCS Certified",
              "LEED Certified",
              "WELL Certified",
              "Fitwel Certified",
              "Living Building Challenge",
              "Cradle to Cradle",
              "Fair Trade",
              "BLUESIGN Certified",
              "OEKO-TEX",
              "GOTS Certified"
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
              "BIFMA Certified",
              "ANSI/BIFMA Standards",
              "Greenguard Certified",
              "UL Listed",
              "CSA Certified",
              "TUV Certified",
              "ADA Compliant",
              "ANSI/HFES 100",
              "EN 1335",
              "EN 527",
              "NFPA 701",
              "CAL 117",
              "TB 133"
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
              "Flame Retardant",
              "NFPA 701 Compliant",
              "CAL 117 Compliant",
              "TB 133 Compliant"
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
          "name": "ergonomic_certification",
          "label": "Ergonomic Certification",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "ANSI/HFES 100 Certified",
              "EN 1335 Certified",
              "BIFMA G1 Ergonomics",
              "Ergonomics Certified",
              "Posture Support Certified",
              "Back Care Certified",
              "Neck Support Certified",
              "Wrist Support Certified"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable ergonomic certifications"
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
            "help_text": "Upload warranty cards, certificates, specifications, or other relevant documents"
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