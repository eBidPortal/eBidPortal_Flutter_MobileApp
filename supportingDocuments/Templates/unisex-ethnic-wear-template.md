# Unisex & Ethnic Wear Template

**File:** `unisex-ethnic-wear-template.md`
**Purpose:** Industry-level template for Unisex & Ethnic Wear products category in eBidPortal marketplace
**Created:** November 21, 2025
**Last Updated:** November 21, 2025
**Category:** Unisex & Ethnic Wear
**Subcategories:** Traditional Clothing, Ethnic Accessories, Cultural Items, Regional Wear

---

## 📋 Unisex & Ethnic Wear Template Overview

This template provides a comprehensive, industry-standard structure for Unisex & Ethnic Wear products in the eBidPortal marketplace. It covers traditional clothing, ethnic accessories, cultural items, and regional wear with professional specifications, authenticity verification, material certifications, and cultural heritage documentation.

### Key Features
- **Cultural Authenticity**: Traditional craftsmanship and regional style specifications
- **Material Certifications**: GOTS, Fair Trade, and sustainable textile standards
- **Size & Fit Systems**: Regional sizing standards and unisex measurements
- **Handmade Quality**: Artisan craftsmanship and traditional techniques
- **Heritage Documentation**: Cultural significance and traditional value
- **Sustainability Standards**: Eco-friendly materials and ethical production
- **Business Terms**: Wholesale pricing, MOQ, and cultural export requirements

### Template Structure
- **5 Main Sections**: Product Information, Specifications, Safety & Quality, Business & Pricing, Contact & Documentation
- **50+ Fields**: Comprehensive coverage of ethnic wear industry requirements
- **Validation Rules**: Cultural authenticity and material compliance checks
- **UI Configuration**: User-friendly forms with regional and cultural guidance

---

## 🔧 Template JSON Structure

```json
{
  "name": "Unisex & Ethnic Wear Template",
  "description": "Comprehensive template for unisex and ethnic wear products including traditional clothing, accessories, and cultural items with authenticity verification, material certifications, and heritage documentation",
  "category_type": "unisex_ethnic_wear",
  "is_active": true,
  "sections": [
    {
      "title": "Product Information",
      "order": 1,
      "description": "Basic product identification and cultural classification",
      "is_collapsible": false,
      "fields": [
        {
          "name": "product_name",
          "label": "Product Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3", "max_length:100"],
          "ui_config": {
            "placeholder": "Enter product name (e.g., Handwoven Cotton Kurta)",
            "helpText": "Clear, descriptive name including cultural style and key materials"
          }
        },
        {
          "name": "cultural_region",
          "label": "Cultural Region/Origin",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "placeholder": "Select cultural region of origin",
            "options": [
              {"value": "indian", "label": "Indian Subcontinent"},
              {"value": "middle_eastern", "label": "Middle Eastern"},
              {"value": "african", "label": "African"},
              {"value": "southeast_asian", "label": "Southeast Asian"},
              {"value": "central_asian", "label": "Central Asian"},
              {"value": "european_folk", "label": "European Folk"},
              {"value": "american_native", "label": "Native American"},
              {"value": "other", "label": "Other"}
            ],
            "helpText": "Geographic and cultural region where this style originates"
          }
        },
        {
          "name": "traditional_style",
          "label": "Traditional Style",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:50"],
          "ui_config": {
            "placeholder": "e.g., Kurta, Kaftan, Dashiki, Sari",
            "helpText": "Specific traditional garment or accessory name"
          }
        },
        {
          "name": "brand",
          "label": "Brand/Artisan",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:50"],
          "ui_config": {
            "placeholder": "Brand or artisan cooperative name",
            "helpText": "Manufacturer, brand, or artisan group name"
          }
        },
        {
          "name": "artisan_name",
          "label": "Artisan/Craftsman Name",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "Individual artisan or master craftsman name",
            "helpText": "For handmade items: name of the skilled artisan"
          }
        },
        {
          "name": "model_number",
          "label": "Style/Model Number",
          "type": "text",
          "required": false,
          "validation": ["max_length:50"],
          "ui_config": {
            "placeholder": "SKU or style reference number",
            "helpText": "Optional SKU or catalog reference"
          }
        },
        {
          "name": "description",
          "label": "Description",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:50", "max_length:2000"],
          "ui_config": {
            "placeholder": "Detailed description including cultural significance, materials, and craftsmanship",
            "helpText": "Comprehensive description covering cultural context, materials, and traditional techniques"
          }
        },
        {
          "name": "unisex_suitable",
          "label": "Unisex Suitable",
          "type": "boolean",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "helpText": "Is this product designed to be suitable for both men and women?"
          }
        },
        {
          "name": "gender_focus",
          "label": "Gender Focus",
          "type": "select",
          "required": false,
          "ui_config": {
            "placeholder": "Select primary gender focus if not unisex",
            "options": [
              {"value": "mens", "label": "Men's"},
              {"value": "womens", "label": "Women's"},
              {"value": "unisex", "label": "Unisex"}
            ],
            "helpText": "Primary gender demographic for this traditional style"
          }
        }
      ]
    },
    {
      "title": "Specifications",
      "order": 2,
      "description": "Technical specifications and material details",
      "is_collapsible": false,
      "fields": [
        {
          "name": "primary_material",
          "label": "Primary Material",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "placeholder": "Select primary fabric/material",
            "options": [
              {"value": "cotton", "label": "Cotton"},
              {"value": "silk", "label": "Silk"},
              {"value": "wool", "label": "Wool"},
              {"value": "linen", "label": "Linen"},
              {"value": "synthetic", "label": "Synthetic Blend"},
              {"value": "bamboo", "label": "Bamboo"},
              {"value": "hemp", "label": "Hemp"},
              {"value": "cashmere", "label": "Cashmere"},
              {"value": "other", "label": "Other"}
            ],
            "helpText": "Main material used in construction"
          }
        },
        {
          "name": "material_composition",
          "label": "Material Composition",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:10", "max_length:500"],
          "ui_config": {
            "placeholder": "Detailed material breakdown (e.g., 100% Handwoven Cotton, Silk-Cotton Blend 70/30)",
            "helpText": "Complete material composition with percentages"
          }
        },
        {
          "name": "weave_technique",
          "label": "Weave/Construction Technique",
          "type": "select",
          "required": false,
          "ui_config": {
            "placeholder": "Select traditional weaving/construction method",
            "options": [
              {"value": "handwoven", "label": "Handwoven"},
              {"value": "hand_embroidered", "label": "Hand Embroidered"},
              {"value": "block_printed", "label": "Block Printed"},
              {"value": "tie_dye", "label": "Tie & Dye"},
              {"value": "ikat", "label": "Ikat"},
              {"value": "batik", "label": "Batik"},
              {"value": "machine_woven", "label": "Machine Woven"},
              {"value": "other", "label": "Other"}
            ],
            "helpText": "Traditional crafting technique used"
          }
        },
        {
          "name": "color",
          "label": "Color/Pattern",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3", "max_length:100"],
          "ui_config": {
            "placeholder": "Primary colors and pattern description",
            "helpText": "Color palette and traditional patterns"
          }
        },
        {
          "name": "size_system",
          "label": "Size System",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "placeholder": "Select sizing standard used",
            "options": [
              {"value": "xs_s_m_l_xl", "label": "XS/S/M/L/XL"},
              {"value": "uk_sizes", "label": "UK Sizes (6-20)"},
              {"value": "us_sizes", "label": "US Sizes (0-16)"},
              {"value": "eu_sizes", "label": "EU Sizes (32-52)"},
              {"value": "regional_traditional", "label": "Regional Traditional Sizing"},
              {"value": "one_size", "label": "One Size Fits All"},
              {"value": "custom", "label": "Custom Sizing"}
            ],
            "helpText": "Sizing system used for this garment"
          }
        },
        {
          "name": "measurements",
          "label": "Key Measurements",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:20", "max_length:1000"],
          "ui_config": {
            "placeholder": "Chest: 40\", Length: 28\", Sleeve: 24\" (provide in inches)",
            "helpText": "Critical measurements for fit (chest, length, waist, etc.)"
          }
        },
        {
          "name": "care_instructions",
          "label": "Care Instructions",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:20", "max_length:500"],
          "ui_config": {
            "placeholder": "Hand wash in cold water, air dry, low iron",
            "helpText": "Proper care instructions for traditional fabrics"
          }
        },
        {
          "name": "handmade",
          "label": "Handmade/Artisanal",
          "type": "boolean",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "helpText": "Is this product handmade by skilled artisans?"
          }
        },
        {
          "name": "production_time",
          "label": "Production Time",
          "type": "select",
          "required": false,
          "ui_config": {
            "placeholder": "Typical production time",
            "options": [
              {"value": "ready_stock", "label": "Ready Stock"},
              {"value": "1_week", "label": "1 Week"},
              {"value": "2_weeks", "label": "2 Weeks"},
              {"value": "3_weeks", "label": "3 Weeks"},
              {"value": "1_month", "label": "1 Month"},
              {"value": "custom_order", "label": "Custom Order (Varies)"}
            ],
            "helpText": "Time required to produce this item"
          }
        }
      ]
    },
    {
      "title": "Safety & Quality",
      "order": 3,
      "description": "Quality certifications and safety standards",
      "is_collapsible": false,
      "fields": [
        {
          "name": "certifications",
          "label": "Quality Certifications",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "multiple": true,
            "options": [
              {"value": "gots", "label": "GOTS (Global Organic Textile Standard)"},
              {"value": "fair_trade", "label": "Fair Trade Certified"},
              {"value": "oe100", "label": "Oeko-Tex Standard 100"},
              {"value": "iso_9001", "label": "ISO 9001 Quality Management"},
              {"value": "reach", "label": "REACH Compliance"},
              {"value": "bluesign", "label": "Bluesign Approved"},
              {"value": "handloom_mark", "label": "Handloom Mark (India)"},
              {"value": "geographical_indication", "label": "Geographical Indication Protected"}
            ],
            "helpText": "Select all applicable quality and sustainability certifications"
          }
        },
        {
          "name": "cultural_authenticity",
          "label": "Cultural Authenticity Verified",
          "type": "boolean",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "helpText": "Has the cultural authenticity of this traditional item been verified?"
          }
        },
        {
          "name": "heritage_significance",
          "label": "Cultural Heritage Significance",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Describe the cultural or historical significance of this traditional item",
            "helpText": "Cultural importance, traditional ceremonies, or historical context"
          }
        },
        {
          "name": "dye_type",
          "label": "Dye Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "placeholder": "Type of dyes used",
            "options": [
              {"value": "natural_vegetable", "label": "Natural Vegetable Dyes"},
              {"value": "natural_mineral", "label": "Natural Mineral Dyes"},
              {"value": "azo_free", "label": "Azo-Free Synthetic"},
              {"value": "low_impact", "label": "Low Impact Synthetic"},
              {"value": "unknown", "label": "Unknown"}
            ],
            "helpText": "Type of dyes used in coloring the fabric"
          }
        },
        {
          "name": "allergen_free",
          "label": "Allergen-Free",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Is this product free from common allergens?"
          }
        },
        {
          "name": "skin_safe",
          "label": "Skin-Safe Certified",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Has this product been tested for skin safety?"
          }
        },
        {
          "name": "certification_documents",
          "label": "Certification Documents",
          "type": "file",
          "required": false,
          "validation": ["fileType:pdf,jpeg,png", "fileSize:10485760"],
          "ui_config": {
            "multiple": true,
            "accept": ".pdf,image/*",
            "maxFiles": 10,
            "helpText": "Upload certification documents, authenticity certificates, and quality reports"
          }
        }
      ]
    },
    {
      "title": "Business & Pricing",
      "order": 4,
      "description": "Commercial terms and pricing information",
      "is_collapsible": false,
      "fields": [
        {
          "name": "unit_price",
          "label": "Unit Price (USD)",
          "type": "number",
          "required": true,
          "validation": ["required", "min:1", "max:5000"],
          "ui_config": {
            "prefix": "$",
            "step": 0.01,
            "helpText": "Price per unit in USD"
          }
        },
        {
          "name": "wholesale_price",
          "label": "Wholesale Price (USD)",
          "type": "number",
          "required": false,
          "validation": ["min:0.5", "max:2500"],
          "ui_config": {
            "prefix": "$",
            "step": 0.01,
            "helpText": "Bulk pricing for wholesale orders"
          }
        },
        {
          "name": "minimum_order_quantity",
          "label": "Minimum Order Quantity",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:1000"],
          "ui_config": {
            "suffix": "units",
            "helpText": "Minimum quantity for custom or wholesale orders"
          }
        },
        {
          "name": "bulk_discount_available",
          "label": "Bulk Discount Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Are bulk discounts available for larger orders?"
          }
        },
        {
          "name": "currency",
          "label": "Preferred Currency",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "usd", "label": "USD ($)"},
              {"value": "eur", "label": "EUR (€)"},
              {"value": "gbp", "label": "GBP (£)"},
              {"value": "inr", "label": "INR (₹)"},
              {"value": "local", "label": "Local Currency"}
            ],
            "helpText": "Primary currency for transactions"
          }
        },
        {
          "name": "shipping_included",
          "label": "Shipping Included",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Is shipping included in the listed price?"
          }
        },
        {
          "name": "custom_orders",
          "label": "Custom Orders Accepted",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Do you accept custom orders with modifications?"
          }
        },
        {
          "name": "sample_available",
          "label": "Sample Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Are product samples available for inspection?"
          }
        }
      ]
    },
    {
      "title": "Contact & Documentation",
      "order": 5,
      "description": "Contact information and additional documentation",
      "is_collapsible": false,
      "fields": [
        {
          "name": "manufacturer_contact",
          "label": "Manufacturer Contact",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:5", "max_length:100"],
          "ui_config": {
            "placeholder": "Manufacturer or artisan cooperative contact name",
            "helpText": "Primary contact person for business inquiries"
          }
        },
        {
          "name": "manufacturer_email",
          "label": "Manufacturer Email",
          "type": "email",
          "required": true,
          "validation": ["required", "email"],
          "ui_config": {
            "placeholder": "contact@manufacturer.com",
            "helpText": "Business email for manufacturer or representative"
          }
        },
        {
          "name": "manufacturer_phone",
          "label": "Manufacturer Phone",
          "type": "phone",
          "required": false,
          "validation": ["phone"],
          "ui_config": {
            "placeholder": "+1-555-0123",
            "helpText": "Business phone number with country code"
          }
        },
        {
          "name": "manufacturer_address",
          "label": "Manufacturer Address",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:10", "max_length:300"],
          "ui_config": {
            "placeholder": "Full manufacturing address including country",
            "helpText": "Complete business address for shipping and legal purposes"
          }
        },
        {
          "name": "artisan_stories",
          "label": "Artisan Stories/Documentation",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:2000"],
          "ui_config": {
            "placeholder": "Share stories about the artisans, their techniques, and cultural significance",
            "helpText": "Background stories about the craftsmen and traditional techniques"
          }
        },
        {
          "name": "additional_images",
          "label": "Additional Images",
          "type": "file",
          "required": false,
          "validation": ["fileType:jpeg,png,jpg", "fileSize:5242880"],
          "ui_config": {
            "multiple": true,
            "accept": "image/*",
            "maxFiles": 10,
            "helpText": "Upload additional product photos, artisan photos, or cultural documentation"
          }
        },
        {
          "name": "brochures_catalogs",
          "label": "Brochures/Catalogs",
          "type": "file",
          "required": false,
          "validation": ["fileType:pdf", "fileSize:10485760"],
          "ui_config": {
            "multiple": true,
            "accept": ".pdf",
            "maxFiles": 5,
            "helpText": "Upload product catalogs, style guides, or cultural documentation"
          }
        },
        {
          "name": "terms_conditions",
          "label": "Terms & Conditions",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Any special terms for international shipping, customs, or cultural items",
            "helpText": "Special terms for export, shipping, or cultural item handling"
          }
        }
      ]
    }
  ]
}
```

---

## 📋 Template Usage Guide

### For Sellers
1. **Cultural Accuracy**: Ensure all cultural references and traditional techniques are accurately represented
2. **Certification Verification**: Only claim certifications you can provide documentation for
3. **Authenticity Claims**: Cultural authenticity should be backed by verifiable heritage documentation
4. **Material Transparency**: Provide complete material composition and sourcing information
5. **Size Accuracy**: Include detailed measurements and fit information for traditional sizing

### For Buyers
1. **Cultural Respect**: Research the cultural significance of items before purchasing
2. **Certification Verification**: Request documentation for claimed certifications
3. **Size Guidance**: Use provided measurements and regional sizing guides
4. **Care Instructions**: Follow traditional care methods for longevity
5. **Ethical Considerations**: Consider the artisan and cultural impact of your purchase

### Industry Standards Covered
- **GOTS**: Global Organic Textile Standard for organic materials
- **Fair Trade**: Ethical production and artisan fair compensation
- **Oeko-Tex**: Human-ecological safety for textiles
- **Geographical Indications**: Protected traditional products
- **Cultural Heritage**: UNESCO-recognized traditional crafts
- **Sustainable Textiles**: Eco-friendly production standards

### API Integration

This template integrates with the eBidPortal dynamic schema system:

```javascript
// Assign template to category
POST /api/v1/templates/{template_id}/assign-category
{
  "category_id": "unisex-ethnic-wear-category-id",
  "is_default": true
}

// Retrieve form schema for frontend
GET /api/v1/catalog/categories/{category_id}/schema
```

---

## 🔍 Validation Rules Reference

| Rule | Description | Example |
|------|-------------|---------|
| `required` | Field must be filled | `["required"]` |
| `min_length:N` | Minimum character length | `["min_length:3"]` |
| `max_length:N` | Maximum character length | `["max_length:100"]` |
| `min:N` | Minimum numeric value | `["min:1"]` |
| `max:N` | Maximum numeric value | `["max:5000"]` |
| `email` | Valid email format | `["email"]` |
| `phone` | Valid phone format | `["phone"]` |
| `fileType:ext1,ext2` | Allowed file extensions | `["fileType:pdf,jpeg,png"]` |
| `fileSize:N` | Maximum file size in bytes | `["fileSize:10485760"]` |

---

## 📞 Support & Documentation

For questions about this template or eBidPortal integration:
- **API Documentation**: `/Docs/eBidPortalApis.md`
- **Template Guidelines**: This document
- **Support**: Contact eBidPortal development team

**Remember this template for future use in eBidPortal marketplace implementations.**