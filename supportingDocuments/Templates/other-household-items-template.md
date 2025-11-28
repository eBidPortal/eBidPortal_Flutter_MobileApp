# Other Household Items Template

```json
{
  "name": "Other Household Items",
  "description": "Industry-level template for miscellaneous household products including cleaning supplies, kitchen gadgets, bathroom accessories, storage solutions, maintenance items, and other household essentials with comprehensive specifications and safety information.",
  "category_type": "other_household_items",
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
            "placeholder": "Enter product title (e.g., Multi-Purpose Cleaning Spray)",
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
          "required": false,
          "validation": {
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
          "name": "product_category",
          "label": "Product Category",
          "type": "select",
          "required": true,
          "validation": {},
          "ui_config": {
            "options": [
              "Cleaning Supplies",
              "Kitchen Tools & Gadgets",
              "Bathroom Accessories",
              "Laundry Supplies",
              "Storage & Organization",
              "Maintenance & Repair",
              "Pest Control",
              "Air Fresheners & Odor Control",
              "Batteries & Power",
              "Extension Cords & Adapters",
              "Small Appliances",
              "Home Decor Accessories",
              "Seasonal Items",
              "Emergency Supplies",
              "Pet Supplies",
              "Health & Personal Care",
              "Office Supplies",
              "Miscellaneous"
            ],
            "help_text": "Primary category of household item"
          }
        },
        {
          "name": "subcategory",
          "label": "Subcategory",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "All-Purpose Cleaners",
              "Dish Soap",
              "Laundry Detergent",
              "Floor Cleaners",
              "Bathroom Cleaners",
              "Kitchen Cleaners",
              "Furniture Polish",
              "Glass Cleaners",
              "Drain Cleaners",
              "Oven Cleaners",
              "Measuring Tools",
              "Kitchen Gadgets",
              "Utensil Sets",
              "Food Storage",
              "Bathroom Hardware",
              "Shower Accessories",
              "Towel Racks",
              "Laundry Baskets",
              "Hampers",
              "Storage Bins",
              "Shelving Units",
              "Closet Organizers",
              "Tools & Hardware",
              "Plumbing Supplies",
              "Electrical Supplies",
              "Insect Repellents",
              "Rodent Control",
              "Air Fresheners",
              "Candles",
              "Room Sprays",
              "AA Batteries",
              "AAA Batteries",
              "Power Adapters",
              "Extension Cords",
              "Coffee Makers",
              "Toasters",
              "Blenders",
              "Mixers",
              "Decorative Pillows",
              "Vases",
              "Picture Frames",
              "Candles & Holders",
              "Holiday Decorations",
              "First Aid Kits",
              "Flashlights",
              "Fire Extinguishers",
              "Pet Bowls",
              "Pet Toys",
              "Pet Cleaning Supplies",
              "Vitamins & Supplements",
              "First Aid Supplies",
              "Notebooks",
              "Pens & Pencils",
              "Desk Organizers",
              "Other"
            ],
            "help_text": "Specific subcategory within the main category"
          }
        },
        {
          "name": "product_type",
          "label": "Product Type",
          "type": "select",
          "required": true,
          "validation": {},
          "ui_config": {
            "options": [
              "Liquid",
              "Spray",
              "Powder",
              "Gel",
              "Wipes",
              "Tablets",
              "Capsules",
              "Aerosol",
              "Cream",
              "Paste",
              "Foam",
              "Solid",
              "Granular",
              "Concentrate",
              "Ready-to-Use",
              "Refill",
              "Disposable",
              "Reusable",
              "Battery Operated",
              "Manual",
              "Electric",
              "Cordless"
            ],
            "help_text": "Physical form or operation type of the product"
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
          "name": "net_weight",
          "label": "Net Weight",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.01,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter net weight",
            "help_text": "Net weight of the product contents"
          }
        },
        {
          "name": "net_volume",
          "label": "Net Volume",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.01,
            "max": 10000
          },
          "ui_config": {
            "placeholder": "Enter net volume",
            "help_text": "Net volume of liquid or capacity"
          }
        },
        {
          "name": "volume_unit",
          "label": "Volume Unit",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Fluid Ounces (fl oz)",
              "Milliliters (ml)",
              "Liters (L)",
              "Gallons (gal)",
              "Cubic Inches (cu in)",
              "Cubic Feet (cu ft)",
              "Ounces (oz)",
              "Pounds (lb)",
              "Grams (g)",
              "Kilograms (kg)"
            ],
            "help_text": "Unit of measurement for volume/weight"
          }
        },
        {
          "name": "power_source",
          "label": "Power Source",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Manual Operation",
              "Battery Powered",
              "AC Power",
              "DC Power",
              "Solar",
              "USB",
              "Rechargeable Battery",
              "Disposable Battery"
            ],
            "help_text": "How the product is powered (if applicable)"
          }
        },
        {
          "name": "battery_type",
          "label": "Battery Type",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "AA",
              "AAA",
              "9V",
              "C",
              "D",
              "CR123A",
              "CR2032",
              "Lithium Ion",
              "Nickel Metal Hydride",
              "Alkaline",
              "Rechargeable",
              "Lithium",
              "Zinc Carbon"
            ],
            "help_text": "Type of batteries required or included"
          }
        },
        {
          "name": "battery_quantity",
          "label": "Battery Quantity",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 100
          },
          "ui_config": {
            "placeholder": "Enter number of batteries",
            "help_text": "Number of batteries included or required"
          }
        },
        {
          "name": "voltage_rating",
          "label": "Voltage Rating",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "1.5V",
              "3V",
              "6V",
              "9V",
              "12V",
              "24V",
              "120V AC",
              "220V AC",
              "Universal Voltage"
            ],
            "help_text": "Electrical voltage specifications"
          }
        },
        {
          "name": "amperage_rating",
          "label": "Amperage Rating",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.001,
            "max": 100
          },
          "ui_config": {
            "placeholder": "Enter amperage",
            "help_text": "Current rating in amperes"
          }
        },
        {
          "name": "wattage_rating",
          "label": "Wattage Rating",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.1,
            "max": 10000
          },
          "ui_config": {
            "placeholder": "Enter wattage",
            "help_text": "Power rating in watts"
          }
        },
        {
          "name": "material_composition",
          "label": "Material Composition",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "Describe materials used",
            "help_text": "Materials and composition of the product"
          }
        },
        {
          "name": "active_ingredients",
          "label": "Active Ingredients",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 1000
          },
          "ui_config": {
            "placeholder": "List active ingredients",
            "help_text": "Active chemical ingredients (for cleaners, pesticides, etc.)"
          }
        },
        {
          "name": "concentration",
          "label": "Concentration/Strength",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "e.g., 10% solution, 5x concentrated",
            "help_text": "Product concentration or strength level"
          }
        },
        {
          "name": "ph_level",
          "label": "pH Level",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 14
          },
          "ui_config": {
            "placeholder": "Enter pH level",
            "help_text": "Acidity/alkalinity level (for cleaners)"
          }
        },
        {
          "name": "scent_fragrance",
          "label": "Scent/Fragrance",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Unscented",
              "Fresh Linen",
              "Lavender",
              "Lemon",
              "Citrus",
              "Ocean Breeze",
              "Floral",
              "Vanilla",
              "Pine",
              "Clean Cotton",
              "Baby Powder",
              "Spice",
              "Herbal",
              "Fruit",
              "Mint",
              "Other"
            ],
            "help_text": "Scent or fragrance type"
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
          "name": "package_dimensions_length",
          "label": "Package Length (inches)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 0.1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter package length",
            "help_text": "Length of the packaged product"
          }
        },
        {
          "name": "package_dimensions_width",
          "label": "Package Width (inches)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 0.1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter package width",
            "help_text": "Width of the packaged product"
          }
        },
        {
          "name": "package_dimensions_height",
          "label": "Package Height (inches)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 0.1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter package height",
            "help_text": "Height of the packaged product"
          }
        },
        {
          "name": "package_weight",
          "label": "Package Weight (pounds)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 0.01,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter package weight",
            "help_text": "Weight of the packaged product"
          }
        },
        {
          "name": "product_dimensions_length",
          "label": "Product Length (inches)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter product length",
            "help_text": "Length of the actual product (unpacked)"
          }
        },
        {
          "name": "product_dimensions_width",
          "label": "Product Width (inches)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter product width",
            "help_text": "Width of the actual product (unpacked)"
          }
        },
        {
          "name": "product_dimensions_height",
          "label": "Product Height (inches)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter product height",
            "help_text": "Height of the actual product (unpacked)"
          }
        },
        {
          "name": "pack_size",
          "label": "Pack Size/Count",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 10000
          },
          "ui_config": {
            "placeholder": "Enter pack size",
            "help_text": "Number of individual items in the package"
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
              "Bottle",
              "Spray Bottle",
              "Can",
              "Aerosol Can",
              "Box",
              "Bag",
              "Jar",
              "Tube",
              "Packet",
              "Refill Pouch",
              "Bulk Container",
              "Blister Pack",
              "Carded",
              "Hanging Pack",
              "Other"
            ],
            "help_text": "Type of packaging/container"
          }
        }
      ]
    },
    {
      "title": "Condition & Safety",
      "order": 4,
      "description": "Product condition, safety information, and usage guidelines",
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
              "Expired",
              "Damaged Packaging",
              "For Parts"
            ],
            "help_text": "Current condition of the product"
          }
        },
        {
          "name": "expiration_date",
          "label": "Expiration Date",
          "type": "date",
          "required": false,
          "validation": {},
          "ui_config": {
            "help_text": "Product expiration date (if applicable)"
          }
        },
        {
          "name": "shelf_life",
          "label": "Shelf Life",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "e.g., 2 years from manufacture",
            "help_text": "Expected shelf life when stored properly"
          }
        },
        {
          "name": "safety_warnings",
          "label": "Safety Warnings",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 1000
          },
          "ui_config": {
            "placeholder": "List important safety warnings",
            "help_text": "Safety warnings and precautions"
          }
        },
        {
          "name": "usage_instructions",
          "label": "Usage Instructions",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 1000
          },
          "ui_config": {
            "placeholder": "Describe how to use the product",
            "help_text": "Instructions for proper usage"
          }
        },
        {
          "name": "storage_instructions",
          "label": "Storage Instructions",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "Describe proper storage conditions",
            "help_text": "How and where to store the product"
          }
        },
        {
          "name": "child_safety",
          "label": "Child Safety Features",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Child-Resistant Packaging",
              "Child-Safe Design",
              "Locking Mechanism",
              "Safety Cap",
              "Tamper-Evident Seal",
              "Not for Children Under 3",
              "Keep Out of Reach of Children"
            ],
            "help_text": "Child safety features and warnings"
          }
        },
        {
          "name": "hazard_classification",
          "label": "Hazard Classification",
          "type": "select",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Non-Hazardous",
              "Corrosive",
              "Flammable",
              "Toxic",
              "Irritant",
              "Environmental Hazard",
              "Health Hazard",
              "Caution",
              "Warning",
              "Danger"
            ],
            "help_text": "Hazard classification for safety labeling"
          }
        },
        {
          "name": "eco_friendly",
          "label": "Eco-Friendly Features",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Biodegradable",
              "Recyclable Packaging",
              "Plant-Based Ingredients",
              "Non-Toxic",
              "Cruelty-Free",
              "Sustainable Sourcing",
              "Carbon Neutral",
              "Energy Efficient",
              "Water Saving",
              "Refillable"
            ],
            "help_text": "Environmentally friendly features"
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
            "max": 100000
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
            "max": 10000
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
        },
        {
          "name": "price_per_unit",
          "label": "Price Per Unit",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.001,
            "max": 10000
          },
          "ui_config": {
            "placeholder": "Enter price per unit",
            "help_text": "Price per individual unit (for multi-packs)"
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
              "Wholesaler",
              "Retailer",
              "Distributor",
              "Online Seller",
              "Home Goods Store",
              "Discount Store",
              "Specialty Store",
              "Department Store",
              "Hardware Store",
              "Pharmacy",
              "Grocery Store",
              "Individual Seller",
              "Liquidator"
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
          "name": "authorized_distributor",
          "label": "Authorized Distributor",
          "type": "boolean",
          "required": false,
          "validation": {},
          "ui_config": {
            "help_text": "Is the seller an authorized distributor for this brand"
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
              "30-Day Return",
              "14-Day Return",
              "7-Day Return",
              "No Returns",
              "Store Credit Only",
              "Exchange Only",
              "Final Sale"
            ],
            "help_text": "Seller's return policy"
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
            "min": 0.01,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter shipping weight",
            "help_text": "Weight for shipping calculations"
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
          "name": "free_shipping_threshold",
          "label": "Free Shipping Threshold (USD)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 100000
          },
          "ui_config": {
            "placeholder": "Enter threshold amount",
            "help_text": "Minimum order value for free shipping"
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
              "Local Delivery",
              "White Glove Service",
              "Freight Shipping"
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
        },
        {
          "name": "shipping_restrictions",
          "label": "Shipping Restrictions",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "List any shipping restrictions",
            "help_text": "Restrictions on shipping (hazmat, oversized, etc.)"
          }
        },
        {
          "name": "handling_fee",
          "label": "Handling Fee (USD)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "Enter handling fee",
            "help_text": "Additional handling or processing fee"
          }
        }
      ]
    },
    {
      "title": "Additional Features",
      "order": 8,
      "description": "Special features, certifications, and additional product information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "certifications",
          "label": "Certifications",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "EPA Registered",
              "FDA Approved",
              "USDA Organic",
              "Green Seal Certified",
              "ECOLOGO Certified",
              "Energy Star",
              "UL Listed",
              "CSA Certified",
              "NSF Certified",
              "GREENGUARD Certified",
              "Fair Trade",
              "Cruelty Free",
              "Vegan",
              "Kosher",
              "Halal"
            ],
            "help_text": "Product certifications and approvals"
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
              "Concentrated Formula",
              "Biodegradable",
              "Non-Toxic",
              "Hypoallergenic",
              "Scent-Free",
              "Dye-Free",
              "Phosphate-Free",
              "Triclosan-Free",
              "Paraben-Free",
              "Sulfate-Free",
              "Alcohol-Free",
              "Pet-Safe",
              "Child-Safe",
              "Septic Safe",
              "HE Compatible",
              "Dishwasher Safe",
              "Microwave Safe",
              "Oven Safe",
              "Freezer Safe",
              "Leak-Proof",
              "Spill-Proof",
              "Easy-Pour",
              "Spray Nozzle",
              "Trigger Spray",
              "Foaming Action",
              "Thick Formula",
              "Quick-Dissolving",
              "Long-Lasting",
              "Multi-Surface",
              "Multi-Purpose"
            ],
            "help_text": "Special features and benefits"
          }
        },
        {
          "name": "usage_applications",
          "label": "Usage Applications",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Household Cleaning",
              "Kitchen Cleaning",
              "Bathroom Cleaning",
              "Floor Cleaning",
              "Appliance Cleaning",
              "Laundry",
              "Dishwashing",
              "Carpet Cleaning",
              "Window Cleaning",
              "Metal Polishing",
              "Wood Cleaning",
              "Fabric Care",
              "Leather Care",
              "Stain Removal",
              "Odor Elimination",
              "Disinfection",
              "Sanitization",
              "Degreasing",
              "Descaling",
              "Rust Removal",
              "Mold/Mildew Removal",
              "Pest Control",
              "Air Freshening",
              "Fabric Softening",
              "Water Softening",
              "Drain Cleaning",
              "Garbage Disposal",
              "Pet Stain/Odor",
              "Outdoor Cleaning"
            ],
            "help_text": "Recommended usage applications"
          }
        },
        {
          "name": "compatible_surfaces",
          "label": "Compatible Surfaces",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Hardwood Floors",
              "Tile Floors",
              "Laminate Floors",
              "Vinyl Floors",
              "Ceramic",
              "Porcelain",
              "Granite",
              "Marble",
              "Quartz",
              "Stainless Steel",
              "Chrome",
              "Brass",
              "Copper",
              "Aluminum",
              "Glass",
              "Mirrors",
              "Plastic",
              "Formica",
              "Corian",
              "Fabric",
              "Upholstery",
              "Carpet",
              "Leather",
              "Wood",
              "Painted Surfaces",
              "Sealed Surfaces",
              "Unsealed Surfaces"
            ],
            "help_text": "Surfaces the product can be safely used on"
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
              "Spray Bottle",
              "Trigger Sprayer",
              "Foam Dispenser",
              "Scrub Brush",
              "Microfiber Cloth",
              "Sponge",
              "Scouring Pad",
              "Measuring Cup",
              "Funnel",
              "Extension Wand",
              "Replacement Heads",
              "Storage Case",
              "User Manual",
              "Safety Data Sheet",
              "Warranty Card"
            ],
            "help_text": "Accessories included with the product"
          }
        },
        {
          "name": "scent_options",
          "label": "Available Scents",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Fresh Linen",
              "Lavender",
              "Lemon",
              "Citrus",
              "Ocean Breeze",
              "Floral",
              "Vanilla",
              "Pine",
              "Clean Cotton",
              "Baby Powder",
              "Spice",
              "Herbal",
              "Fruit",
              "Mint",
              "Unscented",
              "Custom Scent"
            ],
            "help_text": "Available scent or fragrance options"
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
              "OSHA Compliant",
              "EPA Approved",
              "FDA Regulated",
              "FIFRA Compliant",
              "TSCA Compliant",
              "CPSIA Compliant",
              "Proposition 65 Compliant",
              "REACH Compliant",
              "CLP Regulation",
              "GHS Labeling",
              "DOT Regulated",
              "IATA Regulated",
              "IMDG Code",
              "WHMIS Compliant"
            ],
            "help_text": "Safety and regulatory compliance standards"
          }
        },
        {
          "name": "environmental_compliance",
          "label": "Environmental Compliance",
          "type": "checkbox",
          "required": false,
          "validation": {},
          "ui_config": {
            "options": [
              "Biodegradable",
              "Non-Biodegradable",
              "Recyclable",
              "Compostable",
              "Ocean Safe",
              "Septic Safe",
              "Graywater Safe",
              "Low VOC",
              "Zero VOC",
              "Low Phosphorous",
              "Phosphate Free",
              "Sulfate Free",
              "Paraben Free",
              "Triclosan Free",
              "BPA Free",
              "PVC Free",
              "PFAS Free"
            ],
            "help_text": "Environmental and sustainability compliance"
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
              "Product Label",
              "Safety Data Sheet (SDS)",
              "Material Safety Data Sheet (MSDS)",
              "User Manual",
              "Installation Guide",
              "Warranty Information",
              "Care Instructions",
              "Usage Instructions",
              "Storage Instructions",
              "Recycling Instructions",
              "Emergency Contact Info",
              "Ingredient List",
              "Nutritional Facts",
              "Allergen Information",
              "Country of Origin",
              "Manufacturing Date",
              "Expiration Date",
              "Batch/Lot Number"
            ],
            "help_text": "Documentation and information provided with the product"
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