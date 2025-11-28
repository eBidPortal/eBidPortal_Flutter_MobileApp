# Games & Consoles Template

```json
{
  "name": "Games & Consoles Template",
  "description": "Industry-level template for gaming consoles, video games, and gaming accessories with comprehensive specifications and validation rules.",
  "category_type": "games_consoles",
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
            "placeholder": "Enter product title (e.g., PlayStation 5 Console)",
            "help_text": "Provide a clear, descriptive title including brand and model"
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
            "placeholder": "Enter brand name (e.g., Sony, Microsoft, Nintendo)",
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
            "placeholder": "Enter model number (e.g., CFI-1215A)",
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
              "Gaming Console",
              "Handheld Console",
              "Video Game",
              "Gaming Accessory",
              "Controller",
              "Headset",
              "Gaming Chair",
              "Gaming Monitor",
              "VR Headset",
              "Gaming Keyboard",
              "Gaming Mouse",
              "Console Bundle",
              "Digital Game Code",
              "Collectible",
              "Other"
            ]
          },
          "ui_config": {
            "placeholder": "Select product type",
            "help_text": "Primary category of the gaming product"
          }
        },
        {
          "name": "platform",
          "label": "Gaming Platform",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "PlayStation 5",
              "PlayStation 4",
              "PlayStation 3",
              "PlayStation Vita",
              "PlayStation Portable",
              "Xbox Series X/S",
              "Xbox One",
              "Xbox 360",
              "Xbox",
              "Nintendo Switch",
              "Nintendo Switch OLED",
              "Nintendo Switch Lite",
              "Nintendo 3DS",
              "Nintendo DS",
              "Nintendo Wii U",
              "Nintendo Wii",
              "PC",
              "Mac",
              "Mobile",
              "Universal"
            ]
          },
          "ui_config": {
            "placeholder": "Select gaming platform",
            "help_text": "Compatible gaming platform or console"
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
            "placeholder": "Provide detailed product description including features and specifications",
            "help_text": "Include key features, gameplay details, and use cases"
          }
        }
      ]
    },
    {
      "title": "Technical Specifications",
      "order": 2,
      "description": "Detailed technical specifications based on product type",
      "is_collapsible": true,
      "fields": [
        {
          "name": "storage_capacity",
          "label": "Storage Capacity",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*(GB|TB|MB)$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 825GB, 1TB",
            "help_text": "Internal storage capacity for consoles or games"
          }
        },
        {
          "name": "processor",
          "label": "Processor/CPU",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "e.g., AMD Zen 2, Custom AMD Ryzen",
            "help_text": "Processor specifications for consoles"
          }
        },
        {
          "name": "graphics",
          "label": "Graphics/GPU",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "e.g., AMD RDNA 2, Custom AMD Radeon",
            "help_text": "Graphics processing unit specifications"
          }
        },
        {
          "name": "ram_memory",
          "label": "RAM/Memory",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+\\s*GB$",
            "max_length": 20
          },
          "ui_config": {
            "placeholder": "e.g., 16GB GDDR6",
            "help_text": "System memory specifications"
          }
        },
        {
          "name": "display_resolution",
          "label": "Display Resolution",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "4K UHD (3840x2160)",
              "Full HD (1920x1080)",
              "HD (1280x720)",
              "720x480",
              "480x270",
              "OLED Display",
              "LCD Display",
              "Touch Screen"
            ]
          },
          "ui_config": {
            "help_text": "Maximum display resolution supported"
          }
        },
        {
          "name": "game_genre",
          "label": "Game Genre",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Action",
              "Adventure",
              "RPG",
              "Strategy",
              "Simulation",
              "Sports",
              "Racing",
              "Fighting",
              "Puzzle",
              "Platformer",
              "Shooter",
              "Horror",
              "MMORPG",
              "Battle Royale",
              "Sandbox",
              "Educational",
              "Music/Rhythm",
              "Party Game",
              "Other"
            ]
          },
          "ui_config": {
            "help_text": "Primary game genre or category"
          }
        },
        {
          "name": "player_count",
          "label": "Player Count",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Single Player",
              "Multiplayer (2-4 players)",
              "Multiplayer (5-8 players)",
              "Multiplayer (9+ players)",
              "Online Multiplayer",
              "Co-op",
              "Versus",
              "Massively Multiplayer"
            ]
          },
          "ui_config": {
            "help_text": "Supported number of players"
          }
        },
        {
          "name": "connectivity",
          "label": "Connectivity Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Wi-Fi",
              "Ethernet",
              "Bluetooth",
              "USB",
              "HDMI",
              "Optical Audio",
              "NFC",
              "Online Gaming",
              "Cross-Platform Play",
              "Cloud Gaming"
            ]
          },
          "ui_config": {
            "help_text": "Select all connectivity features"
          }
        },
        {
          "name": "dimensions",
          "label": "Dimensions (L x W x H)",
          "type": "text",
          "required": false,
          "validation": {
            "pattern": "^\\d+(\\.\\d+)?\\s*x\\s*\\d+(\\.\\d+)?\\s*x\\s*\\d+(\\.\\d+)?\\s*(mm|cm|inches?|in)$",
            "max_length": 50
          },
          "ui_config": {
            "placeholder": "e.g., 390 x 260 x 104 mm",
            "help_text": "Physical dimensions in millimeters or inches"
          }
        },
        {
          "name": "weight",
          "label": "Weight",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.01,
            "max": 50000
          },
          "ui_config": {
            "placeholder": "Enter weight in grams",
            "help_text": "Weight in grams (for portability assessment)"
          }
        },
        {
          "name": "power_requirements",
          "label": "Power Requirements",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "e.g., 220W Power Supply, 100-240V",
            "help_text": "Power input specifications and requirements"
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
            "help_text": "Include frame rate, load times, or other relevant specs"
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
              "For Parts",
              "Digital Code"
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
              "Digital Product (No Warranty)"
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
            "placeholder": "e.g., 1 year, 12 months",
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
        },
        {
          "name": "game_condition",
          "label": "Game/Media Condition",
          "type": "radio",
          "required": false,
          "validation": {
            "options": [
              "Mint Condition",
              "Near Mint",
              "Very Good",
              "Good",
              "Acceptable",
              "Poor",
              "Digital Code"
            ]
          },
          "ui_config": {
            "help_text": "Condition of game disc, case, and manual"
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
            "min": 1,
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
            "min": 1,
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
            "max": 10000
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
            "max": 1000
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
              "Gaming Store",
              "Digital Seller"
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
          "name": "gaming_expertise",
          "label": "Gaming Expertise",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if seller has gaming expertise for technical support"
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
              "Courier Service",
              "Registered Post",
              "Local Pickup Only",
              "Third-party Logistics",
              "Digital Delivery"
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
            "placeholder": "e.g., 2-3 business days, Instant (Digital)",
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
          "required": false,
          "ui_config": {
            "help_text": "Check if item requires special handling"
          }
        },
        {
          "name": "digital_delivery",
          "label": "Digital Delivery",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if this is a digital product (codes, downloads)"
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
              "4K Gaming",
              "HDR Support",
              "Ray Tracing",
              "120 FPS",
              "Backward Compatibility",
              "VR Ready",
              "Wireless Controller",
              "Haptic Feedback",
              "Adaptive Triggers",
              "Share Play",
              "Remote Play",
              "Cross-Platform",
              "Online Multiplayer",
              "DLC Included",
              "Season Pass",
              "Collector's Edition",
              "Steelbook Case",
              "Soundtrack Included"
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
              "Console Unit",
              "Controller",
              "Power Cable",
              "HDMI Cable",
              "USB Cable",
              "User Manual",
              "Quick Start Guide",
              "Game Disc",
              "Digital Code",
              "Carrying Case",
              "Headset",
              "Memory Card",
              "Extra Controllers",
              "Charging Dock"
            ]
          },
          "ui_config": {
            "help_text": "Select all items included with the product"
          }
        },
        {
          "name": "software_included",
          "label": "Software Included",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 300
          },
          "ui_config": {
            "placeholder": "List any included software or digital content",
            "help_text": "Games, apps, or digital content that come with the product"
          }
        },
        {
          "name": "certifications",
          "label": "Certifications & Standards",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "ESRB Rating",
              "PEGI Rating",
              "CERO Rating",
              "USK Rating",
              "BIS Certified",
              "CE Marked",
              "FCC Certified",
              "RoHS Compliant",
              "Energy Star"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable certifications and ratings"
          }
        },
        {
          "name": "age_rating",
          "label": "Age Rating",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Everyone (E)",
              "Everyone 10+ (E10+)",
              "Teen (T)",
              "Mature (M)",
              "Adults Only (AO)",
              "Rating Pending",
              "Not Rated"
            ]
          },
          "ui_config": {
            "help_text": "ESRB or equivalent age rating for games"
          }
        },
        {
          "name": "multiplayer_features",
          "label": "Multiplayer Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Local Multiplayer",
              "Online Multiplayer",
              "Co-op Mode",
              "Versus Mode",
              "Split Screen",
              "Cross-Platform Play",
              "Voice Chat",
              "Party System",
              "Tournaments",
              "Leaderboards"
            ]
          },
          "ui_config": {
            "help_text": "Select all multiplayer features available"
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
              "UL Certified",
              "FCC Compliant",
              "RoHS Compliant",
              "WEEE Compliant",
              "IP Rated",
              "Fire Resistant",
              "Child Safe"
            ]
          },
          "ui_config": {
            "help_text": "Select all applicable safety certifications"
          }
        },
        {
          "name": "content_rating",
          "label": "Content Rating Details",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 300
          },
          "ui_config": {
            "placeholder": "Describe content rating details and restrictions",
            "help_text": "Details about ESRB/PEGI rating content descriptors"
          }
        },
        {
          "name": "hazardous_materials",
          "label": "Contains Hazardous Materials",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "help_text": "Check if product contains batteries or hazardous materials"
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
              "Region Free",
              "Licensed Product"
            ]
          },
          "ui_config": {
            "help_text": "Legal and regulatory compliance information"
          }
        },
        {
          "name": "region_lock",
          "label": "Region Lock Status",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Region Free",
              "NTSC-U/C (Americas)",
              "PAL (Europe/Australia)",
              "NTSC-J (Japan)",
              "Region Locked",
              "Digital (No Region Lock)"
            ]
          },
          "ui_config": {
            "help_text": "Regional compatibility and lock status"
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
            "max_files": 10,
            "max_file_size": 5242880
          },
          "ui_config": {
            "help_text": "Upload high-quality images from multiple angles (max 10 images, 5MB each)"
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
            "help_text": "Upload gameplay video or product demonstration (optional, max 100MB)"
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
            "help_text": "Upload user manual, quick start guide, or technical documentation"
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
            "help_text": "Upload warranty cards, certificates, game ratings, or other relevant documents"
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
            "help_text": "Link to gameplay video or product review on YouTube"
          }
        },
        {
          "name": "gameplay_screenshots",
          "label": "Gameplay Screenshots",
          "type": "file",
          "required": false,
          "validation": {
            "file_types": ["image/jpeg", "image/png", "image/webp"],
            "max_files": 5,
            "max_file_size": 5242880
          },
          "ui_config": {
            "help_text": "Upload gameplay screenshots (optional, max 5 images)"
          }
        }
      ]
    }
  ]
}
```