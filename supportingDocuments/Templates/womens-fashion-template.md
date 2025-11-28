# Women's Fashion Template

```json
{
  "name": "Women's Fashion",
  "description": "Industry-level template for women's fashion including clothing, footwear, jewelry & accessories, and beauty & makeup products with comprehensive specifications, sizing standards, material composition, and authenticity verification.",
  "category_type": "womens_fashion",
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
            "placeholder": "Enter product title (e.g., Designer Silk Evening Gown)",
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
              "Jewellery & Accessories",
              "Beauty & Makeup"
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
              "Dresses",
              "Tops & Blouses",
              "Skirts",
              "Pants & Trousers",
              "Jeans",
              "Jackets & Coats",
              "Sweaters & Cardigans",
              "Suits & Blazers",
              "Lingerie & Sleepwear",
              "Swimwear",
              "Activewear",
              "Outerwear",
              "Heels",
              "Flats",
              "Boots",
              "Sandals",
              "Sneakers",
              "Wedges",
              "Earrings",
              "Necklaces",
              "Bracelets",
              "Rings",
              "Brooches",
              "Hair Accessories",
              "Belts",
              "Scarves",
              "Hats",
              "Sunglasses",
              "Handbags",
              "Clutches",
              "Wallets",
              "Foundation",
              "Concealer",
              "Lipstick",
              "Mascara",
              "Eyeshadow",
              "Blush",
              "Highlighter",
              "Bronzer",
              "Setting Powder",
              "Skincare",
              "Fragrance",
              "Hair Care",
              "Nail Polish",
              "Tools & Brushes"
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
              "Resort",
              "Cruise",
              "Pre-Fall",
              "Holiday",
              "Bridal",
              "Capsule Collection",
              "Limited Edition",
              "Archive/Reissue",
              "Couture",
              "Ready-to-Wear",
              "Haute Couture"
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
              "0",
              "2",
              "4",
              "6",
              "8",
              "10",
              "12",
              "14",
              "16",
              "18",
              "20",
              "22",
              "24",
              "26",
              "28",
              "30",
              "5",
              "5.5",
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
          "name": "finish",
          "label": "Finish/Texture",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Matte",
              "Glossy",
              "Satin",
              "Metallic",
              "Pearl",
              "Shimmer",
              "Iridescent",
              "Holographic",
              "Velvet",
              "Suede",
              "Patent",
              "Nude",
              "Sheer",
              "Embroidered",
              "Beaded",
              "Lace",
              "Chiffon",
              "Organza",
              "Tulle",
              "Crepe",
              "Faille",
              "Taffeta",
              "Brocade",
              "Damask",
              "Floral",
              "Geometric",
              "Abstract",
              "Animal Print",
              "Polka Dot",
              "Stripe",
              "Plaid",
              "Solid"
            ],
            "help_text": "Finish, texture, or pattern of the product"
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
            "placeholder": "Describe materials (e.g., 100% Silk, Leather upper with satin lining)",
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
              "Silk",
              "Satin",
              "Chiffon",
              "Lace",
              "Tulle",
              "Organza",
              "Velvet",
              "Brocade",
              "Leather",
              "Suede",
              "Patent Leather",
              "Cotton",
              "Linen",
              "Wool",
              "Cashmere",
              "Mohair",
              "Alpaca",
              "Viscose",
              "Modal",
              "Tencel",
              "Polyester",
              "Nylon",
              "Spandex",
              "Acrylic",
              "Rayon",
              "Denim",
              "Canvas",
              "Metal",
              "Gold",
              "Silver",
              "Platinum",
              "Diamond",
              "Pearl",
              "Crystal",
              "Gemstone",
              "Cubic Zirconia",
              "Glass",
              "Ceramic",
              "Wood",
              "Horn",
              "Tortoise Shell",
              "Ivory",
              "Coral"
            ],
            "help_text": "Primary material used in construction"
          }
        },
        {
          "name": "gemstones",
          "label": "Gemstones/Metals Used",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "List gemstones, metals, and carat weights",
            "help_text": "Gemstones, precious metals, and specifications for jewelry"
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
              "Silk",
              "Satin",
              "Cotton",
              "Polyester",
              "Viscose",
              "Leather",
              "Synthetic Leather",
              "Tulle",
              "Chiffon",
              "Mesh",
              "Jersey",
              "Fleece"
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
              "Beaded",
              "Appliquéd",
              "Pleated",
              "Ruched",
              "Gathered",
              "Draped",
              "Tailored",
              "Structured",
              "Flowy",
              "Asymmetrical",
              "Layered",
              "Wrapped",
              "Tied",
              "Buttoned",
              "Zippered",
              "Snapped",
              "Hooked",
              "Magnetic",
              "Elasticized"
            ],
            "help_text": "How the product is constructed or designed"
          }
        },
        {
          "name": "fit_type",
          "label": "Fit/Silhouette",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Bodycon",
              "Sheath",
              "A-Line",
              "Empire",
              "Mermaid",
              "Ball Gown",
              "Shift",
              "Wrap",
              "Tunic",
              "Peplum",
              "Asymmetrical",
              "Off-Shoulder",
              "One-Shoulder",
              "Halter",
              "Strapless",
              "Spaghetti Strap",
              "Sweetheart",
              "V-Neck",
              "Square Neck",
              "Boat Neck",
              "Turtleneck",
              "Mock Neck",
              "Cowl Neck",
              "Scoop Neck",
              "Crew Neck",
              "V-Neck",
              "Deep V",
              "Plunge",
              "Illusion",
              "High-Low",
              "Asymmetrical Hem",
              "Ruffled",
              "Tiered",
              "Smocked",
              "Elastic Waist",
              "Drawstring",
              "Belted",
              "Corseted",
              "Structured",
              "Tailored",
              "Relaxed",
              "Oversized",
              "Cropped",
              "Midi",
              "Maxi",
              "Mini",
              "Micro"
            ],
            "help_text": "Fit and silhouette of the garment"
          }
        },
        {
          "name": "closure_type",
          "label": "Closure/Fastening",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Zipper",
              "Button",
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
              "Slip-on",
              "Wrap Tie",
              "Sarong Tie",
              "Knot",
              "Bow",
              "Ribbon",
              "Lace-up",
              "Buckle Strap",
              "Ankle Strap",
              "T-Strap",
              "Mary Jane",
              "Mule",
              "Slingback",
              "Platform",
              "Wedge",
              "Block Heel",
              "Stiletto",
              "Cone Heel",
              "Kitten Heel",
              "Chunky Heel",
              "Flatform"
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
            "max": 8
          },
          "ui_config": {
            "placeholder": "Enter heel height",
            "help_text": "Heel height for shoes (in inches)"
          }
        },
        {
          "name": "platform_height",
          "label": "Platform Height (inches)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 4
          },
          "ui_config": {
            "placeholder": "Enter platform height",
            "help_text": "Platform height for platform shoes"
          }
        },
        {
          "name": "jewelry_setting",
          "label": "Jewelry Setting",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Prong",
              "Bezel",
              "Channel",
              "Pave",
              "Invisible",
              "Tension",
              "Bar",
              "Flush",
              "Gypsy",
              "Three Stone",
              "Halo",
              "Vintage",
              "Antique",
              "Modern",
              "Bypass",
              "Eternity",
              "Stackable",
              "Hoop",
              "Stud",
              "Drop",
              "Pendant",
              "Lariat",
              "Choker",
              "Collar",
              "Princess",
              "Matinee",
              "Opera",
              "Rope"
            ],
            "help_text": "Type of jewelry setting or style"
          }
        },
        {
          "name": "makeup_finish",
          "label": "Makeup Finish",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Matte",
              "Satin",
              "Glossy",
              "Shimmery",
              "Metallic",
              "Pearl",
              "Iridescent",
              "Holographic",
              "Dewy",
              "Natural",
              "Radiant",
              "Luminous",
              "Velvet",
              "Creamy",
              "Powdery",
              "Liquid",
              "Gel",
              "Balm",
              "Butter",
              "Mousse",
              "Foam",
              "Sheer",
              "Medium",
              "Full",
              "Buildable"
            ],
            "help_text": "Finish or texture of makeup product"
          }
        },
        {
          "name": "skin_type",
          "label": "Suitable Skin Types",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "All Skin Types",
              "Dry Skin",
              "Oily Skin",
              "Combination Skin",
              "Sensitive Skin",
              "Mature Skin",
              "Acne-Prone",
              "Normal Skin"
            ],
            "help_text": "Suitable skin types for beauty products"
          }
        },
        {
          "name": "coverage_level",
          "label": "Coverage Level",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Sheer",
              "Light",
              "Medium",
              "Full",
              "Buildable",
              "HD",
              "Photo Ready",
              "Natural",
              "Flawless",
              "Dramatic"
            ],
            "help_text": "Coverage level for makeup products"
          }
        },
        {
          "name": "spf_rating",
          "label": "SPF Rating",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 100
          },
          "ui_config": {
            "placeholder": "Enter SPF rating",
            "help_text": "Sun Protection Factor rating"
          }
        },
        {
          "name": "pa_rating",
          "label": "PA Rating",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": ["PA+", "PA++", "PA+++", "PA++++"],
            "help_text": "Protection Grade of UVA (PA) rating"
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
          "name": "bust_chest",
          "label": "Bust/Chest (inches)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 20,
            "max": 80
          },
          "ui_config": {
            "placeholder": "Enter bust/chest measurement",
            "help_text": "Bust or chest circumference in inches"
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
            "help_text": "Total length of the garment from shoulder to hem"
          }
        },
        {
          "name": "shoe_size_us",
          "label": "US Shoe Size",
          "type": "number",
          "required": false,
          "validation": {
            "min": 4,
            "max": 16
          },
          "ui_config": {
            "placeholder": "Enter US shoe size",
            "help_text": "US shoe size (women's sizing)"
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
              "Narrow (AA)",
              "Narrow (A)",
              "Medium (B)",
              "Wide (C)",
              "Wide (D)",
              "Extra Wide (E)",
              "Extra Extra Wide (EE)"
            ],
            "help_text": "Shoe width fitting"
          }
        },
        {
          "name": "jewelry_dimensions",
          "label": "Jewelry Dimensions",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "e.g., 18\" chain, 2\" pendant drop",
            "help_text": "Dimensions of jewelry pieces"
          }
        },
        {
          "name": "ring_size",
          "label": "Ring Size",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5",
              "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12", "12.5", "13"
            ],
            "help_text": "Ring size (US sizing)"
          }
        },
        {
          "name": "necklace_length",
          "label": "Necklace Length",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "14\" (Choker)",
              "16\" (Collar)",
              "18\" (Princess)",
              "20\" (Matinee)",
              "24\" (Opera)",
              "30\" (Rope)",
              "36\"+ (Lariat)",
              "Adjustable"
            ],
            "help_text": "Standard necklace lengths"
          }
        },
        {
          "name": "bracelet_length",
          "label": "Bracelet Length (inches)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 5,
            "max": 10
          },
          "ui_config": {
            "placeholder": "Enter bracelet length",
            "help_text": "Bracelet length in inches"
          }
        },
        {
          "name": "bag_dimensions",
          "label": "Bag Dimensions (L x W x H inches)",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 50
          },
          "ui_config": {
            "placeholder": "e.g., 12 x 5 x 10",
            "help_text": "Bag dimensions in inches (Length x Width x Height)"
          }
        },
        {
          "name": "product_weight",
          "label": "Product Weight (ounces)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.1,
            "max": 100
          },
          "ui_config": {
            "placeholder": "Enter product weight",
            "help_text": "Weight of the product in ounces"
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
              "Antique",
              "Pre-Owned",
              "Gently Used",
              "Sample/Swatch",
              "Display Model",
              "Floor Sample"
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
              "Replica",
              "Inspired By",
              "Duplicate"
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
              "SSEF Certified",
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
              "FDA Approved (Beauty)",
              "Cruelty Free",
              "Vegan",
              "Halal Certified",
              "Kosher Certified",
              "Paraben Free",
              "Sulfate Free",
              "Hypoallergenic",
              "Dermatologist Tested",
              "Ophthalmologist Tested",
              "Non-Comedogenic"
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
        },
        {
          "name": "expiration_date",
          "label": "Expiration Date",
          "type": "date",
          "required": false,
          "validation": {},
          "ui_config": {
            "help_text": "Expiration date (for beauty products)"
          }
        },
        {
          "name": "period_after_opening",
          "label": "Period After Opening (PAO)",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "6 months",
              "12 months",
              "18 months",
              "24 months",
              "36 months",
              "No PAO"
            ],
            "help_text": "Period After Opening symbol for cosmetics"
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
            "max": 10000000
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
            "max": 10000000
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
            "max": 10000000
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
            "max": 10000000
          },
          "ui_config": {
            "placeholder": "Enter appraised value",
            "help_text": "Professional appraisal value"
          }
        },
        {
          "name": "insurance_value",
          "label": "Insurance Value (USD)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.01,
            "max": 10000000
          },
          "ui_config": {
            "placeholder": "Enter insurance value",
            "help_text": "Value for insurance purposes"
          }
        },
        {
          "name": "trade_in_value",
          "label": "Trade-in Value (USD)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.01,
            "max": 10000000
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
              "Authorized Dealer",
              "Beauty Consultant",
              "Makeup Artist",
              "Spa Owner",
              "Salon Owner"
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
            "help_text": "Years of experience in fashion/beauty industry"
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
              "Ready-to-Wear",
              "Couture",
              "Bridal",
              "Evening Wear",
              "Casual Wear",
              "Business Attire",
              "Streetwear",
              "Vintage Fashion",
              "Luxury Brands",
              "Designer Labels",
              "Contemporary Fashion",
              "Athletic Wear",
              "Swimwear",
              "Lingerie",
              "Accessories",
              "Footwear",
              "Jewelry",
              "Handbags",
              "Watches",
              "Skincare",
              "Makeup",
              "Hair Care",
              "Fragrance",
              "Nail Care",
              "Spa Treatments",
              "Anti-Aging",
              "Organic Beauty",
              "Clean Beauty",
              "Vegan Beauty",
              "Cruelty-Free",
              "Natural Products",
              "Professional Makeup",
              "Bridal Makeup",
              "Special Effects",
              "Color Analysis",
              "Personal Styling",
              "Fashion Consulting",
              "Image Consulting"
            ],
            "help_text": "Areas of fashion/beauty expertise"
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
              "Gemologist",
              "Watch Expert",
              "Leather Goods Specialist",
              "Vintage Fashion Expert",
              "Color Analysis Certified",
              "Image Consultant",
              "Makeup Artist Certified",
              "Esthetician Licensed",
              "Cosmetologist Licensed",
              "Spa Therapist",
              "Aromatherapist",
              "Herbalist",
              "Nutritionist",
              "Dermatology Nurse",
              "Aesthetician",
              "Permanent Makeup Artist",
              "Microblading Certified",
              "Eyelash Extension Specialist",
              "Nail Technician",
              "Hair Stylist",
              "Colorist",
              "Fashion Buyer",
              "Retail Management",
              "E-commerce Specialist",
              "Social Media Influencer",
              "Fashion Blogger",
              "Beauty Influencer"
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
              "90-Day Returns",
              "No Returns",
              "Store Credit Only",
              "Exchange Only",
              "Final Sale",
              "As Is - No Returns",
              "Beauty Products - No Returns"
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
              "Luxury Packaging",
              "Fragile Handling",
              "Temperature Controlled",
              "Tracked Shipping",
              "Signature Required"
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
              "Cosmetic Case",
              "Padded Envelope",
              "Bubble Wrap",
              "Tissue Paper",
              "Authentic Box",
              "Custom Packaging",
              "Eco-Friendly Packaging",
              "Recycled Materials",
              "Biodegradable Packaging"
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
        },
        {
          "name": "special_handling",
          "label": "Special Handling Requirements",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Fragile",
              "Temperature Sensitive",
              "Keep Upright",
              "This Side Up",
              "Do Not Bend",
              "Handle with Care",
              "Liquid Contents",
              "Perishable",
              "Hazardous Materials",
              "Oversized Package",
              "Heavy Package",
              "Luxury Item",
              "High Value Item"
            ],
            "help_text": "Special handling instructions for shipping"
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
              "Anti-Static",
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
              "Locking Mechanism",
              "Expandable",
              "Collapsible",
              "Reversible",
              "Detachable Parts",
              "Interchangeable Components",
              "Customizable",
              "Personalized",
              "Monogrammed",
              "Engraved",
              "Embossed",
              "Embroidered",
              "Beaded",
              "Sequined",
              "Feathered",
              "Fur Trim",
              "Leather Trim",
              "Metal Hardware",
              "Crystal Embellishments",
              "Pearl Embellishments",
              "Gemstone Embellishments"
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
              "Recyclable Components",
              "Renewable Energy Production",
              "Low Impact Dyes",
              "Natural Dyes",
              "Regenerative Agriculture",
              "Biodynamic Farming",
              "Wildcrafted",
              "Foraged Materials",
              "Handcrafted",
              "Artisan Made",
              "Small Batch Production",
              "Ethical Manufacturing",
              "Living Wage Certified",
              "Transparent Supply Chain"
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
              "Price Tags",
              "Jewelry Box",
              "Watch Box",
              "Earring Backs",
              "Ring Sizer",
              "Necklace Extender",
              "Bracelet Extender",
              "Cleaning Cloth",
              "Jewelry Case",
              "Makeup Bag",
              "Cosmetic Case",
              "Applicators",
              "Sponges",
              "Brushes",
              "Tweezers",
              "Scissors",
              "Mirror",
              "Sharpening Tool",
              "Replacement Heads",
              "Batteries",
              "Charging Dock",
              "Travel Case",
              "Display Stand"
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
              "WiFi Enabled",
              "USB Compatible",
              "Wireless Charging",
              "Magnetic Charging",
              "Solar Charging",
              "App Controlled",
              "Voice Activated",
              "Gesture Control",
              "Touch Sensitive",
              "Pressure Sensitive",
              "Motion Activated",
              "Light Activated",
              "Sound Activated",
              "Timer Function",
              "Programmable",
              "Customizable Settings",
              "Multi-Device Sync",
              "Cloud Connected",
              "Data Tracking",
              "Health Monitoring",
              "Fitness Tracking",
              "Sleep Tracking",
              "Stress Monitoring",
              "Hydration Tracking",
              "Period Tracking",
              "Fertility Tracking"
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
              "Brunch",
              "Lunch",
              "Dinner",
              "Theater",
              "Concert",
              "Festival",
              "Vacation",
              "Resort",
              "Cruise",
              "Garden Party",
              "Tea Party",
              "Picnic",
              "Barbecue",
              "Pool Party",
              "House Party",
              "Birthday Party",
              "Anniversary",
              "Graduation",
              "Prom",
              "Homecoming",
              "Sweet Sixteen",
              "Quinceañera",
              "Bar Mitzvah",
              "Bat Mitzvah",
              "Christening",
              "Communion",
              "Confirmation",
              "Bridal Shower",
              "Baby Shower",
              "Engagement Party",
              "Rehearsal Dinner",
              "Bachelor Party",
              "Bachelorette Party",
              "Holiday Party",
              "New Year's Eve",
              "Valentine's Day",
              "St. Patrick's Day",
              "Easter",
              "Mother's Day",
              "Father's Day",
              "Fourth of July",
              "Halloween",
              "Thanksgiving",
              "Christmas",
              "Hanukkah",
              "Kwanzaa",
              "All Seasons",
              "Transitional",
              "Layering Piece"
            ],
            "help_text": "Suitable occasions for wearing this item"
          }
        },
        {
          "name": "skin_tone_suitability",
          "label": "Skin Tone Suitability",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Fair Skin",
              "Light Skin",
              "Medium Skin",
              "Tan Skin",
              "Deep Skin",
              "Ebony Skin",
              "Universal",
              "Warm Undertones",
              "Cool Undertones",
              "Neutral Undertones",
              "Olive Skin",
              "Golden Skin",
              "Porcelain Skin",
              "Ivory Skin",
              "Beige Skin",
              "Caramel Skin",
              "Cocoa Skin",
              "Espresso Skin"
            ],
            "help_text": "Suitable skin tones for makeup and beauty products"
          }
        },
        {
          "name": "hair_type_suitability",
          "label": "Hair Type Suitability",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Fine Hair",
              "Medium Hair",
              "Thick Hair",
              "Straight Hair",
              "Wavy Hair",
              "Curly Hair",
              "Coily Hair",
              "Fine Straight",
              "Fine Wavy",
              "Fine Curly",
              "Fine Coily",
              "Medium Straight",
              "Medium Wavy",
              "Medium Curly",
              "Medium Coily",
              "Thick Straight",
              "Thick Wavy",
              "Thick Curly",
              "Thick Coily",
              "Color-Treated Hair",
              "Damaged Hair",
              "Chemically Processed",
              "Relaxed Hair",
              "Natural Hair",
              "Transitioning Hair",
              "Gray Hair",
              "Blonde Hair",
              "Brunette Hair",
              "Black Hair",
              "Red Hair",
              "Auburn Hair",
              "Strawberry Blonde",
              "Ash Blonde",
              "Golden Blonde",
              "Dirty Blonde",
              "Light Brown",
              "Medium Brown",
              "Dark Brown",
              "Chestnut Brown",
              "Auburn Brown",
              "Jet Black",
              "Off Black",
              "Soft Black"
            ],
            "help_text": "Suitable hair types for hair care products"
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
              "FDA Approved",
              "Cosmetic Ingredient Review",
              "CTFA Standards",
              "ISO Standards",
              "GMP Certified",
              "UL Listed",
              "CSA Certified",
              "FCC Compliant",
              "CPSC Compliant",
              "FTC Compliant",
              "EPA Registered",
              "FIFRA Compliant",
              "TSCA Compliant",
              "DSL Listed",
              "NDSL Listed",
              "IEC Standards",
              "ASTM Standards",
              "SAE Standards",
              "ADA Compliant",
              "Section 508 Compliant"
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
          "name": "batch_lot_number",
          "label": "Batch/Lot Number",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 50
          },
          "ui_config": {
            "placeholder": "Enter batch/lot number",
            "help_text": "Manufacturing batch or lot number for traceability"
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
              "Collection Catalog",
              "Ingredient List",
              "Allergen Information",
              "Usage Instructions",
              "Storage Instructions",
              "Safety Data Sheet",
              "Material Safety Data Sheet",
              "Certificate of Authenticity",
              "Gemological Certificate",
              "Appraisal Report",
              "Insurance Certificate",
              "Provenance Letter",
              "Condition Report",
              "Maintenance Record",
              "Service History",
              "Ownership History",
              "Exhibition History",
              "Publication History",
              "Patent Information",
              "Trademark Information",
              "Copyright Information",
              "Serial Numbers",
              "Engravings",
              "Hallmarks",
              "Maker's Marks",
              "Date Codes",
              "Quality Marks",
              "Assay Marks",
              "Purity Marks",
              "Karats",
              "Fineness",
              "Millimeters",
              "Carats",
              "Points",
              "Grams",
              "Ounces",
              "Troy Ounces"
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