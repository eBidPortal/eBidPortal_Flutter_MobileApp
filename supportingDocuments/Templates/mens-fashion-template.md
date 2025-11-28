# Men's Fashion Template

```json
{
  "name": "Men's Fashion",
  "description": "Industry-level template for men's fashion including clothing, footwear, and accessories with comprehensive specifications, sizing standards, material composition, care instructions, and brand authenticity verification.",
  "category_type": "mens_fashion",
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
            "placeholder": "Enter product title (e.g., Men's Slim Fit Cotton Shirt)",
            "help_text": "Clear, descriptive title including brand, style, and key features"
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
            "help_text": "Designer or brand name"
          }
        },
        {
          "name": "designer",
          "label": "Designer",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "Enter designer name",
            "help_text": "Designer or creative director (if different from brand)"
          }
        },
        {
          "name": "model_number",
          "label": "Style/Model Number",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 50
          },
          "ui_config": {
            "placeholder": "Enter style/model number",
            "help_text": "Brand's style or model number"
          }
        },
        {
          "name": "product_category",
          "label": "Product Category",
          "type": "select",
          "required": true,
          "validation": {},
          "ui_config": {
            "options": [
              "Clothing",
              "Footwear",
              "Accessories & Watches"
            ],
            "help_text": "Primary product category"
          }
        },
        {
          "name": "subcategory",
          "label": "Subcategory",
          "type": "select",
          "required": true,
          "validation": {},
          "ui_config": {
            "options": [
              "T-Shirts & Polo Shirts",
              "Shirts",
              "Sweaters & Hoodies",
              "Jackets & Coats",
              "Pants & Trousers",
              "Jeans",
              "Shorts",
              "Suits & Blazers",
              "Underwear & Socks",
              "Swimwear",
              "Activewear",
              "Sleepwear",
              "Sneakers",
              "Dress Shoes",
              "Boots",
              "Sandals",
              "Loafers",
              "Casual Shoes",
              "Watches",
              "Belts",
              "Wallets",
              "Ties & Bow Ties",
              "Hats & Caps",
              "Sunglasses",
              "Jewelry",
              "Cufflinks",
              "Bags & Backpacks",
              "Scarves",
              "Gloves"
            ],
            "help_text": "Specific subcategory within the main category"
          }
        },
        {
          "name": "season",
          "label": "Season/Collection",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Spring/Summer",
              "Fall/Winter",
              "All Season",
              "Resort",
              "Cruise",
              "Pre-Fall",
              "Holiday",
              "Capsule Collection",
              "Limited Edition",
              "Archive/Reissue"
            ],
            "help_text": "Season or collection the product belongs to"
          }
        }
      ]
    },
    {
      "title": "Product Specifications",
      "order": 2,
      "description": "Detailed specifications including materials, sizing, and construction",
      "is_collapsible": true,
      "fields": [
        {
          "name": "size",
          "label": "Size",
          "type": "select",
          "required": true,
          "validation": {},
          "ui_config": {
            "options": [
              "XXS",
              "XS",
              "S",
              "M",
              "L",
              "XL",
              "XXL",
              "XXXL",
              "4XL",
              "5XL",
              "30",
              "32",
              "34",
              "36",
              "38",
              "40",
              "42",
              "44",
              "46",
              "48",
              "50",
              "52",
              "6",
              "6.5",
              "7",
              "7.5",
              "8",
              "8.5",
              "9",
              "9.5",
              "10",
              "10.5",
              "11",
              "11.5",
              "12",
              "12.5",
              "13",
              "13.5",
              "14",
              "14.5",
              "15",
              "One Size"
            ],
            "help_text": "Product size (clothing sizes, shoe sizes, etc.)"
          }
        },
        {
          "name": "size_system",
          "label": "Size System",
          "type": "select",
          "required": true,
          "validation": {},
          "ui_config": {
            "options": [
              "US",
              "UK",
              "EU",
              "IT",
              "FR",
              "DE",
              "JP",
              "CN",
              "KR",
              "AU",
              "CA"
            ],
            "help_text": "Sizing system used (US, EU, UK, etc.)"
          }
        },
        {
          "name": "color",
          "label": "Color",
          "type": "text",
          "required": true,
          "validation": {
            "min_length": 2,
            "max_length": 50
          },
          "ui_config": {
            "placeholder": "Enter primary color",
            "help_text": "Primary color of the product"
          }
        },
        {
          "name": "secondary_colors",
          "label": "Secondary Colors",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "Enter secondary colors",
            "help_text": "Additional colors or patterns"
          }
        },
        {
          "name": "material_composition",
          "label": "Material Composition",
          "type": "textarea",
          "required": true,
          "validation": {
            "min_length": 10,
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "Describe materials (e.g., 100% Cotton, Leather upper with rubber sole)",
            "help_text": "Detailed material composition and percentages"
          }
        },
        {
          "name": "primary_material",
          "label": "Primary Material",
          "type": "select",
          "required": true,
          "validation": {},
          "ui_config": {
            "options": [
              "Cotton",
              "Wool",
              "Silk",
              "Linen",
              "Polyester",
              "Nylon",
              "Rayon",
              "Acrylic",
              "Spandex",
              "Leather",
              "Suede",
              "Patent Leather",
              "Canvas",
              "Denim",
              "Corduroy",
              "Tweed",
              "Cashmere",
              "Mohair",
              "Alpaca",
              "Viscose",
              "Modal",
              "Tencel",
              "Bamboo",
              "Hemp",
              "Rubber",
              "Synthetic Leather",
              "Metal",
              "Plastic",
              "Ceramic",
              "Wood",
              "Stone",
              "Glass"
            ],
            "help_text": "Primary material used in construction"
          }
        },
        {
          "name": "lining_material",
          "label": "Lining Material",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "None",
              "Cotton",
              "Polyester",
              "Silk",
              "Satin",
              "Viscose",
              "Acetate",
              "Leather",
              "Synthetic Leather",
              "Fleece",
              "Mesh"
            ],
            "help_text": "Material used for lining/interior"
          }
        },
        {
          "name": "construction_type",
          "label": "Construction Type",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Sewn",
              "Glued",
              "Welded",
              "Riveted",
              "Handcrafted",
              "Machine Made",
              "Knitted",
              "Woven",
              "Bonded",
              "Laminated",
              "Embroidered",
              "Printed",
              "Laser Cut",
              "3D Printed"
            ],
            "help_text": "How the product is constructed"
          }
        },
        {
          "name": "fit_type",
          "label": "Fit Type",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Slim Fit",
              "Regular Fit",
              "Loose Fit",
              "Oversized",
              "Tailored",
              "Relaxed",
              "Athletic Fit",
              "Skinny",
              "Straight",
              "Bootcut",
              "Wide Leg",
              "Tapered",
              "Baggy",
              "Custom Fit"
            ],
            "help_text": "Fit and silhouette of the garment"
          }
        },
        {
          "name": "closure_type",
          "label": "Closure Type",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Button",
              "Zipper",
              "Hook and Eye",
              "Velcro",
              "Snap",
              "Buckle",
              "Tie",
              "Elastic",
              "Drawstring",
              "Magnetic",
              "None",
              "Pull-on",
              "Slip-on"
            ],
            "help_text": "Type of closure or fastening"
          }
        },
        {
          "name": "heel_height",
          "label": "Heel Height (inches)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 6
          },
          "ui_config": {
            "placeholder": "Enter heel height",
            "help_text": "Heel height for shoes (in inches)"
          }
        },
        {
          "name": "sole_type",
          "label": "Sole Type",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Rubber",
              "Leather",
              "Synthetic",
              "Wood",
              "Cork",
              "EVA",
              "PU",
              "TPU",
              "Vulcanized",
              "Cemented",
              "Goodyear Welt",
              "Blake Stitch",
              "Platform",
              "Wedge"
            ],
            "help_text": "Type of shoe sole construction"
          }
        },
        {
          "name": "watch_movement",
          "label": "Watch Movement",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Quartz",
              "Automatic",
              "Manual Wind",
              "Kinetic",
              "Solar",
              "Digital",
              "Smartwatch",
              "Hybrid"
            ],
            "help_text": "Type of watch movement/mechanism"
          }
        },
        {
          "name": "water_resistance",
          "label": "Water Resistance",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Not Water Resistant",
              "Splash Resistant",
              "Water Resistant (30m)",
              "Water Resistant (50m)",
              "Water Resistant (100m)",
              "Water Resistant (200m)",
              "Diver's (300m+)",
              "Not Applicable"
            ],
            "help_text": "Water resistance rating"
          }
        }
      ]
    },
    {
      "title": "Measurements & Dimensions",
      "order": 3,
      "description": "Size measurements and dimensional specifications",
      "is_collapsible": true,
      "fields": [
        {
          "name": "chest_bust",
          "label": "Chest/Bust (inches)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 20,
            "max": 80
          },
          "ui_config": {
            "placeholder": "Enter chest measurement",
            "help_text": "Chest or bust circumference in inches"
          }
        },
        {
          "name": "waist",
          "label": "Waist (inches)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 20,
            "max": 70
          },
          "ui_config": {
            "placeholder": "Enter waist measurement",
            "help_text": "Waist circumference in inches"
          }
        },
        {
          "name": "hips",
          "label": "Hips (inches)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 20,
            "max": 80
          },
          "ui_config": {
            "placeholder": "Enter hip measurement",
            "help_text": "Hip circumference in inches"
          }
        },
        {
          "name": "inseam",
          "label": "Inseam (inches)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 20,
            "max": 50
          },
          "ui_config": {
            "placeholder": "Enter inseam length",
            "help_text": "Inseam length from crotch to ankle"
          }
        },
        {
          "name": "shoulder_width",
          "label": "Shoulder Width (inches)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 10,
            "max": 30
          },
          "ui_config": {
            "placeholder": "Enter shoulder width",
            "help_text": "Shoulder width measurement"
          }
        },
        {
          "name": "sleeve_length",
          "label": "Sleeve Length (inches)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 10,
            "max": 40
          },
          "ui_config": {
            "placeholder": "Enter sleeve length",
            "help_text": "Sleeve length from shoulder to cuff"
          }
        },
        {
          "name": "total_length",
          "label": "Total Length (inches)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 10,
            "max": 80
          },
          "ui_config": {
            "placeholder": "Enter total length",
            "help_text": "Total length of the garment"
          }
        },
        {
          "name": "shoe_size_us",
          "label": "US Shoe Size",
          "type": "number",
          "required": false,
          "validation": {
            "min": 5,
            "max": 16
          },
          "ui_config": {
            "placeholder": "Enter US shoe size",
            "help_text": "US shoe size (men's sizing)"
          }
        },
        {
          "name": "shoe_width",
          "label": "Shoe Width",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Narrow (B)",
              "Medium (D)",
              "Wide (E)",
              "Extra Wide (EE)",
              "Extra Extra Wide (EEE)"
            ],
            "help_text": "Shoe width fitting"
          }
        },
        {
          "name": "watch_case_diameter",
          "label": "Case Diameter (mm)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 20,
            "max": 60
          },
          "ui_config": {
            "placeholder": "Enter case diameter",
            "help_text": "Watch case diameter in millimeters"
          }
        },
        {
          "name": "watch_case_thickness",
          "label": "Case Thickness (mm)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 5,
            "max": 25
          },
          "ui_config": {
            "placeholder": "Enter case thickness",
            "help_text": "Watch case thickness in millimeters"
          }
        },
        {
          "name": "strap_width",
          "label": "Strap/Bracelet Width (mm)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 10,
            "max": 30
          },
          "ui_config": {
            "placeholder": "Enter strap width",
            "help_text": "Watch strap or bracelet width in millimeters"
          }
        }
      ]
    },
    {
      "title": "Condition & Authenticity",
      "order": 4,
      "description": "Product condition, authenticity verification, and certifications",
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
              "New with Tags",
              "New without Tags",
              "Excellent - Like New",
              "Very Good",
              "Good",
              "Fair",
              "Poor",
              "Deadstock",
              "Vintage",
              "Antique"
            ],
            "help_text": "Current condition of the fashion item"
          }
        },
        {
          "name": "authenticity",
          "label": "Authenticity Status",
          "type": "select",
          "required": true,
          "validation": {},
          "ui_config": {
            "options": [
              "100% Authentic - Verified",
              "100% Authentic - Seller Confirmed",
              "Likely Authentic",
              "Questionable Authenticity",
              "Counterfeit",
              "Replica"
            ],
            "help_text": "Authenticity verification status"
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
              "GIA Certified (Diamonds)",
              "AGS Certified",
              "EGL Certified",
              "Real Time 4D",
              "Leather Working Group",
              "Responsible Wool Standard",
              "Fair Trade Certified",
              "GOTS Certified",
              "OEKO-TEX Standard 100",
              "Bluesign Approved",
              "REACH Compliant",
              "Prop 65 Compliant",
              "CE Marked",
              "UL Listed"
            ],
            "help_text": "Quality and safety certifications"
          }
        },
        {
          "name": "provenance",
          "label": "Provenance/Origin",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 1000
          },
          "ui_config": {
            "placeholder": "Describe ownership history or origin",
            "help_text": "Ownership history, previous owners, or origin details"
          }
        },
        {
          "name": "defects_flaws",
          "label": "Defects or Flaws",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "Describe any defects, stains, or flaws",
            "help_text": "Any imperfections, damage, or wear"
          }
        },
        {
          "name": "alterations",
          "label": "Alterations Made",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "Describe any alterations or modifications",
            "help_text": "Tailoring, repairs, or modifications made"
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
            "placeholder": "Describe proper care and cleaning instructions",
            "help_text": "How to care for and maintain the item"
          }
        },
        {
          "name": "storage_requirements",
          "label": "Storage Requirements",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 300
          },
          "ui_config": {
            "placeholder": "Describe storage requirements",
            "help_text": "Special storage conditions needed"
          }
        }
      ]
    },
    {
      "title": "Pricing & Value",
      "order": 5,
      "description": "Pricing information and market value assessment",
      "is_collapsible": true,
      "fields": [
        {
          "name": "price",
          "label": "Selling Price (USD)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 0.01,
            "max": 1000000
          },
          "ui_config": {
            "placeholder": "Enter selling price",
            "help_text": "Current asking price in USD"
          }
        },
        {
          "name": "original_retail_price",
          "label": "Original Retail Price (USD)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.01,
            "max": 1000000
          },
          "ui_config": {
            "placeholder": "Enter original retail price",
            "help_text": "Original price when new"
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
          "name": "price_type",
          "label": "Price Type",
          "type": "select",
          "required": true,
          "validation": {},
          "ui_config": {
            "options": [
              "Fixed Price",
              "Best Offer",
              "Auction",
              "Make Offer",
              "Trade/Swap",
              "Price Upon Request"
            ],
            "help_text": "Type of pricing/selling method"
          }
        },
        {
          "name": "market_value",
          "label": "Estimated Market Value (USD)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.01,
            "max": 1000000
          },
          "ui_config": {
            "placeholder": "Enter estimated market value",
            "help_text": "Current market value estimate"
          }
        },
        {
          "name": "appraisal_value",
          "label": "Appraised Value (USD)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.01,
            "max": 1000000
          },
          "ui_config": {
            "placeholder": "Enter appraised value",
            "help_text": "Professional appraisal value"
          }
        },
        {
          "name": "trade_in_value",
          "label": "Trade-in Value (USD)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.01,
            "max": 1000000
          },
          "ui_config": {
            "placeholder": "Enter trade-in value",
            "help_text": "Value for trade-in purposes"
          }
        }
      ]
    },
    {
      "title": "Seller Information",
      "order": 6,
      "description": "Information about the seller and business credentials",
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
              "Individual Seller",
              "Boutique Owner",
              "Fashion Retailer",
              "Department Store",
              "Online Fashion Store",
              "Consignment Shop",
              "Vintage Dealer",
              "Luxury Reseller",
              "Fashion Stylist",
              "Personal Shopper",
              "Estate Liquidator",
              "Brand Representative",
              "Authorized Dealer"
            ],
            "help_text": "Type of seller offering this item"
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
            "help_text": "Name of the selling business or shop"
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
          "name": "years_experience",
          "label": "Years of Fashion Experience",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 50
          },
          "ui_config": {
            "placeholder": "Enter years of experience",
            "help_text": "Years of experience in fashion industry"
          }
        },
        {
          "name": "specializations",
          "label": "Specializations",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "High Fashion",
              "Streetwear",
              "Vintage Fashion",
              "Luxury Brands",
              "Designer Labels",
              "Contemporary Fashion",
              "Athletic Wear",
              "Business Attire",
              "Casual Wear",
              "Accessories",
              "Footwear",
              "Watches",
              "Jewelry",
              "Menswear",
              "Tailoring",
              "Alterations"
            ],
            "help_text": "Areas of fashion expertise"
          }
        },
        {
          "name": "certifications_credentials",
          "label": "Certifications & Credentials",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Certified Personal Stylist",
              "Fashion Institute Graduate",
              "Antique Textile Appraiser",
              "Jewelry Appraiser",
              "Watch Expert",
              "Leather Goods Specialist",
              "Vintage Fashion Expert",
              "Color Analysis Certified",
              "Image Consultant",
              "Fashion Buyer",
              "Retail Management",
              "E-commerce Specialist"
            ],
            "help_text": "Professional certifications and credentials"
          }
        },
        {
          "name": "return_policy",
          "label": "Return Policy",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "14-Day Returns",
              "30-Day Returns",
              "60-Day Returns",
              "No Returns",
              "Store Credit Only",
              "Exchange Only",
              "Final Sale",
              "As Is - No Returns"
            ],
            "help_text": "Seller's return policy"
          }
        }
      ]
    },
    {
      "title": "Shipping & Handling",
      "order": 7,
      "description": "Shipping options, packaging, and delivery information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "shipping_weight",
          "label": "Shipping Weight (pounds)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 0.01,
            "max": 50
          },
          "ui_config": {
            "placeholder": "Enter shipping weight",
            "help_text": "Weight for shipping calculations"
          }
        },
        {
          "name": "package_dimensions_length",
          "label": "Package Length (inches)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 1,
            "max": 50
          },
          "ui_config": {
            "placeholder": "Enter package length",
            "help_text": "Length of shipping package"
          }
        },
        {
          "name": "package_dimensions_width",
          "label": "Package Width (inches)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 1,
            "max": 50
          },
          "ui_config": {
            "placeholder": "Enter package width",
            "help_text": "Width of shipping package"
          }
        },
        {
          "name": "package_dimensions_height",
          "label": "Package Height (inches)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 1,
            "max": 50
          },
          "ui_config": {
            "placeholder": "Enter package height",
            "help_text": "Height of shipping package"
          }
        },
        {
          "name": "shipping_cost",
          "label": "Shipping Cost (USD)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 500
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
              "Priority Mail",
              "First Class Mail",
              "International First Class",
              "EMS",
              "DHL Express",
              "FedEx",
              "UPS",
              "Local Pickup",
              "White Glove Service",
              "Luxury Packaging"
            ],
            "help_text": "Available shipping methods"
          }
        },
        {
          "name": "packaging_type",
          "label": "Packaging Type",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Standard Box",
              "Luxury Box",
              "Dust Bag",
              "Garment Bag",
              "Shoe Box",
              "Jewelry Box",
              "Watch Box",
              "Padded Envelope",
              "Bubble Wrap",
              "Tissue Paper",
              "Authentic Box",
              "Custom Packaging"
            ],
            "help_text": "Type of packaging used for shipping"
          }
        },
        {
          "name": "insurance_included",
          "label": "Shipping Insurance Included",
          "type": "boolean",
          "required": false,
          "validation": {},
          "ui_config": {
            "help_text": "Is shipping insurance included"
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
        }
      ]
    },
    {
      "title": "Additional Features",
      "order": 8,
      "description": "Special features, technology, and additional product capabilities",
      "is_collapsible": true,
      "fields": [
        {
          "name": "special_features",
          "label": "Special Features",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Water Resistant",
              "Wrinkle Resistant",
              "Stain Resistant",
              "UV Protection",
              "Moisture Wicking",
              "Temperature Regulating",
              "Anti-Odor",
              "Anti-Microbial",
              "Breathable Fabric",
              "Quick Dry",
              "Compression Fit",
              "Reflective Elements",
              "LED Lights",
              "Heated Elements",
              "Massage Function",
              "Adjustable Fit",
              "Convertible Design",
              "Modular Components",
              "Hidden Pockets",
              "RFID Blocking",
              "GPS Tracking",
              "Smart Technology",
              "App Connectivity",
              "Solar Powered",
              "Self-Cleaning",
              "Self-Healing Fabric",
              "Color Changing",
              "Scented",
              "Magnetic Closures",
              "Locking Mechanism"
            ],
            "help_text": "Special features and technologies"
          }
        },
        {
          "name": "sustainability_features",
          "label": "Sustainability Features",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Organic Materials",
              "Recycled Materials",
              "Vegan Materials",
              "Fair Trade Certified",
              "Cruelty Free",
              "Carbon Neutral",
              "Biodegradable",
              "Upcycled",
              "Locally Sourced",
              "Sustainable Packaging",
              "Zero Waste",
              "Water Saving",
              "Energy Efficient Production",
              "Long Lasting Design",
              "Repairable Design",
              "Recyclable Components"
            ],
            "help_text": "Environmentally friendly features"
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
              "Dust Bag",
              "Garment Bag",
              "Shoe Horn",
              "Shoe Trees",
              "Polishing Cloth",
              "Extra Laces",
              "Spare Battery",
              "Charging Cable",
              "User Manual",
              "Warranty Card",
              "Authenticity Certificate",
              "Care Instructions",
              "Extra Buttons",
              "Thread",
              "Replacement Parts",
              "Cleaning Kit",
              "Storage Box",
              "Hang Tags",
              "Price Tags"
            ],
            "help_text": "Accessories included with the purchase"
          }
        },
        {
          "name": "compatibility",
          "label": "Compatibility/Integration",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "iOS Compatible",
              "Android Compatible",
              "Apple Watch",
              "Samsung Galaxy",
              "Google Fit",
              "Fitbit",
              "Garmin",
              "Nike+",
              "Under Armour",
              "Lululemon",
              "Patagonia",
              "YKK Zippers",
              "Gor-Tex",
              "Polartec",
              "Cordura",
              "Bluetooth Enabled",
              "NFC Enabled",
              "WiFi Enabled"
            ],
            "help_text": "Compatible apps, devices, or technologies"
          }
        },
        {
          "name": "occasion_suitability",
          "label": "Occasion Suitability",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Casual Wear",
              "Business Casual",
              "Business Formal",
              "Black Tie",
              "White Tie",
              "Cocktail",
              "Wedding",
              "Funeral",
              "Interview",
              "Date Night",
              "Party",
              "Beach",
              "Sports",
              "Gym",
              "Travel",
              "Office",
              "Weekend",
              "Evening Out",
              "Formal Event",
              "Casual Friday",
              "Summer",
              "Winter",
              "All Seasons"
            ],
            "help_text": "Suitable occasions for wearing this item"
          }
        }
      ]
    },
    {
      "title": "Compliance & Documentation",
      "order": 9,
      "description": "Regulatory compliance, documentation, and legal information",
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
              "CPSIA Compliant",
              "CE Marked",
              "REACH Compliant",
              "Prop 65 Compliant",
              "California Compliant",
              "EU Standards",
              "US Standards",
              "ASTM Standards",
              "ISO Standards",
              "SAE Standards",
              "UL Listed",
              "CSA Certified",
              "FCC Compliant",
              "CPSC Compliant"
            ],
            "help_text": "Safety and regulatory compliance standards"
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
          "name": "manufacture_date",
          "label": "Manufacture Date",
          "type": "date",
          "required": false,
          "validation": {},
          "ui_config": {
            "help_text": "Date the product was manufactured"
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
          "name": "documentation_included",
          "label": "Documentation Included",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Authenticity Certificate",
              "Warranty Card",
              "Care Instructions",
              "User Manual",
              "Receipt",
              "Appraisal Certificate",
              "Quality Certificate",
              "Origin Certificate",
              "Material Certificate",
              "Cleaning Instructions",
              "Size Guide",
              "Style Guide",
              "Brand Book",
              "Collection Catalog"
            ],
            "help_text": "Documentation and certificates provided"
          }
        },
        {
          "name": "serial_numbers",
          "label": "Serial Numbers/Identification",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "Enter serial numbers, engraving, or identification marks",
            "help_text": "Serial numbers, engravings, or other identification marks"
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