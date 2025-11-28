# Kids Products Template

**File:** `kids-template.md`
**Purpose:** Industry-level template for Kids products category in eBidPortal marketplace
**Created:** November 21, 2025
**Last Updated:** November 21, 2025
**Category:** Kids
**Subcategories:** Clothing, Footwear, Toys & Accessories

---

## 📋 Kids Products Template Overview

This template provides a comprehensive, industry-standard structure for Kids products in the eBidPortal marketplace. It covers essential subcategories including Clothing, Footwear, Toys & Accessories with professional specifications, safety standards, age-appropriate features, and business requirements.

### Key Features
- **Age-Appropriate Design**: Comprehensive age range specifications (0-16 years)
- **Safety Standards**: Industry compliance with CPSIA, ASTM, EN standards
- **Material Specifications**: Detailed fabric, material, and component information
- **Educational Value**: Learning and development features for toys and accessories
- **Size & Fit Systems**: Standardized sizing for clothing and footwear
- **Quality Certifications**: Safety testing and quality assurance documentation
- **Business Terms**: Wholesale pricing, MOQ, lead times for B2B transactions

### Template Structure
- **6 Main Sections**: Product Info, Specifications, Safety & Quality, Business & Pricing, Contact & Documentation
- **50+ Fields**: Comprehensive coverage of all industry requirements
- **Validation Rules**: Age-appropriate restrictions and safety compliance
- **UI Configuration**: User-friendly forms with contextual help and validation

---

## 🔧 Template JSON Structure

```json
{
  "name": "Kids Products Template",
  "description": "Comprehensive template for children's products including clothing, footwear, toys, and accessories with industry-standard specifications, safety compliance, and professional features",
  "category_type": "kids",
  "is_active": true,
  "sections": [
    {
      "title": "Product Information",
      "order": 1,
      "description": "Basic product identification and classification",
      "is_collapsible": false,
      "fields": [
        {
          "name": "product_name",
          "label": "Product Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3", "max_length:100"],
          "ui_config": {
            "placeholder": "Enter product name (e.g., Baby Cotton Onesie)",
            "helpText": "Clear, descriptive name including key features"
          }
        },
        {
          "name": "subcategory",
          "label": "Subcategory",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "placeholder": "Select product subcategory",
            "options": [
              {"value": "clothing", "label": "Clothing"},
              {"value": "footwear", "label": "Footwear"},
              {"value": "toys", "label": "Toys"},
              {"value": "accessories", "label": "Accessories"}
            ]
          }
        },
        {
          "name": "brand",
          "label": "Brand",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:50"],
          "ui_config": {
            "placeholder": "Brand name",
            "helpText": "Manufacturer or brand name"
          }
        },
        {
          "name": "model_number",
          "label": "Model Number",
          "type": "text",
          "required": false,
          "validation": ["max_length:50"],
          "ui_config": {
            "placeholder": "SKU or model number",
            "helpText": "Optional SKU or model identifier"
          }
        },
        {
          "name": "description",
          "label": "Description",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:50", "max_length:2000"],
          "ui_config": {
            "placeholder": "Detailed product description including features and benefits",
            "helpText": "Comprehensive description highlighting safety features and benefits"
          }
        },
        {
          "name": "product_images",
          "label": "Product Images",
          "type": "file",
          "required": true,
          "validation": ["required", "fileType:image", "fileSize:5242880"],
          "ui_config": {
            "multiple": true,
            "accept": "image/*",
            "maxFiles": 10,
            "helpText": "Upload high-quality images showing product from multiple angles"
          }
        }
      ]
    },
    {
      "title": "Specifications",
      "order": 2,
      "description": "Technical specifications and product details",
      "is_collapsible": false,
      "fields": [
        {
          "name": "age_range",
          "label": "Age Range",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "placeholder": "Select appropriate age range",
            "options": [
              {"value": "0-3m", "label": "0-3 Months"},
              {"value": "3-6m", "label": "3-6 Months"},
              {"value": "6-12m", "label": "6-12 Months"},
              {"value": "1-2y", "label": "1-2 Years"},
              {"value": "2-3y", "label": "2-3 Years"},
              {"value": "3-5y", "label": "3-5 Years"},
              {"value": "5-8y", "label": "5-8 Years"},
              {"value": "8-12y", "label": "8-12 Years"},
              {"value": "12-16y", "label": "12-16 Years"}
            ],
            "helpText": "Select the primary age range for this product"
          }
        },
        {
          "name": "gender",
          "label": "Gender",
          "type": "radio",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "options": [
              {"value": "unisex", "label": "Unisex"},
              {"value": "boys", "label": "Boys"},
              {"value": "girls", "label": "Girls"}
            ]
          }
        },
        {
          "name": "size",
          "label": "Size",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "placeholder": "Select size",
            "options": [
              {"value": "newborn", "label": "Newborn"},
              {"value": "0-3m", "label": "0-3M"},
              {"value": "3-6m", "label": "3-6M"},
              {"value": "6-12m", "label": "6-12M"},
              {"value": "12-18m", "label": "12-18M"},
              {"value": "18-24m", "label": "18-24M"},
              {"value": "2t", "label": "2T"},
              {"value": "3t", "label": "3T"},
              {"value": "4t", "label": "4T"},
              {"value": "5t", "label": "5T"},
              {"value": "6", "label": "Size 6"},
              {"value": "7", "label": "Size 7"},
              {"value": "8", "label": "Size 8"},
              {"value": "9", "label": "Size 9"},
              {"value": "10", "label": "Size 10"},
              {"value": "11", "label": "Size 11"},
              {"value": "12", "label": "Size 12"},
              {"value": "13", "label": "Size 13"},
              {"value": "14", "label": "Size 14"},
              {"value": "16", "label": "Size 16"}
            ],
            "helpText": "Standard sizing for clothing and footwear"
          }
        },
        {
          "name": "material",
          "label": "Material",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:10", "max_length:500"],
          "ui_config": {
            "placeholder": "List all materials used (e.g., 100% Organic Cotton, Polyester Blend)",
            "helpText": "Detailed material composition including percentages"
          }
        },
        {
          "name": "color",
          "label": "Color",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:3", "max_length:50"],
          "ui_config": {
            "placeholder": "Primary color(s)",
            "helpText": "Main color or color options available"
          }
        },
        {
          "name": "dimensions",
          "label": "Dimensions",
          "type": "text",
          "required": false,
          "validation": ["max_length:100"],
          "ui_config": {
            "placeholder": "Length x Width x Height (inches/cm)",
            "helpText": "Product dimensions when applicable"
          }
        },
        {
          "name": "weight",
          "label": "Weight",
          "type": "number",
          "required": false,
          "validation": ["min:0.01", "max:50"],
          "ui_config": {
            "suffix": "lbs",
            "step": 0.01,
            "helpText": "Product weight in pounds"
          }
        },
        {
          "name": "educational_features",
          "label": "Educational Features",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Describe any educational or developmental benefits",
            "helpText": "For toys and accessories: learning outcomes, skills developed"
          }
        },
        {
          "name": "battery_required",
          "label": "Battery Required",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Does this product require batteries?"
          }
        },
        {
          "name": "battery_type",
          "label": "Battery Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "placeholder": "Select battery type if applicable",
            "options": [
              {"value": "aa", "label": "AA"},
              {"value": "aaa", "label": "AAA"},
              {"value": "c", "label": "C"},
              {"value": "d", "label": "D"},
              {"value": "9v", "label": "9V"},
              {"value": "button", "label": "Button Cell"},
              {"value": "lithium", "label": "Lithium"},
              {"value": "rechargeable", "label": "Rechargeable"}
            ],
            "helpText": "Battery specifications for electronic toys"
          }
        }
      ]
    },
    {
      "title": "Safety & Quality",
      "order": 3,
      "description": "Safety standards and quality certifications",
      "is_collapsible": false,
      "fields": [
        {
          "name": "safety_standards",
          "label": "Safety Standards",
          "type": "checkbox",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "multiple": true,
            "options": [
              {"value": "cpsia", "label": "CPSIA (Consumer Product Safety Improvement Act)"},
              {"value": "astm", "label": "ASTM International Standards"},
              {"value": "en71", "label": "EN 71 (European Toy Safety)"},
              {"value": "iso8124", "label": "ISO 8124 (Toy Safety)"},
              {"value": "fcc", "label": "FCC Certification (Electronics)"},
              {"value": "reach", "label": "REACH Compliance"},
              {"value": "prop65", "label": "California Prop 65"},
              {"value": "ce", "label": "CE Marking"}
            ],
            "helpText": "Select all applicable safety standards and certifications"
          }
        },
        {
          "name": "choking_hazard",
          "label": "Choking Hazard",
          "type": "boolean",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "helpText": "Does this product present a choking hazard for children under 3?"
          }
        },
        {
          "name": "small_parts",
          "label": "Contains Small Parts",
          "type": "boolean",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "helpText": "Does this product contain small parts that could be swallowed?"
          }
        },
        {
          "name": "washable",
          "label": "Machine Washable",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "helpText": "Can this product be machine washed?"
          }
        },
        {
          "name": "care_instructions",
          "label": "Care Instructions",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Washing, drying, and care instructions",
            "helpText": "Detailed care and maintenance instructions"
          }
        },
        {
          "name": "warranty",
          "label": "Warranty",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:500"],
          "ui_config": {
            "placeholder": "Warranty terms and conditions",
            "helpText": "Manufacturer warranty information"
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
            "maxFiles": 5,
            "helpText": "Upload safety certificates, test reports, and compliance documents"
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
          "label": "Unit Price",
          "type": "number",
          "required": true,
          "validation": ["required", "min:0.01", "max:10000"],
          "ui_config": {
            "prefix": "$",
            "step": 0.01,
            "helpText": "Price per unit in USD"
          }
        },
        {
          "name": "wholesale_price",
          "label": "Wholesale Price",
          "type": "number",
          "required": false,
          "validation": ["min:0.01", "max:10000"],
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
          "validation": ["min:1", "max:10000"],
          "ui_config": {
            "suffix": "units",
            "helpText": "Minimum quantity for bulk orders"
          }
        },
        {
          "name": "lead_time",
          "label": "Lead Time",
          "type": "number",
          "required": false,
          "validation": ["min:1", "max:365"],
          "ui_config": {
            "suffix": "days",
            "helpText": "Production and delivery lead time in days"
          }
        },
        {
          "name": "shipping_weight",
          "label": "Shipping Weight",
          "type": "number",
          "required": false,
          "validation": ["min:0.01", "max:100"],
          "ui_config": {
            "suffix": "lbs",
            "step": 0.01,
            "helpText": "Weight for shipping calculations"
          }
        },
        {
          "name": "packaging_type",
          "label": "Packaging Type",
          "type": "select",
          "required": false,
          "ui_config": {
            "placeholder": "Select packaging type",
            "options": [
              {"value": "retail", "label": "Retail Packaging"},
              {"value": "bulk", "label": "Bulk Packaging"},
              {"value": "eco_friendly", "label": "Eco-Friendly Packaging"},
              {"value": "gift_box", "label": "Gift Box"},
              {"value": "plain", "label": "Plain Packaging"}
            ]
          }
        },
        {
          "name": "availability",
          "label": "Availability",
          "type": "select",
          "required": true,
          "validation": ["required"],
          "ui_config": {
            "placeholder": "Current availability status",
            "options": [
              {"value": "in_stock", "label": "In Stock"},
              {"value": "limited_stock", "label": "Limited Stock"},
              {"value": "out_of_stock", "label": "Out of Stock"},
              {"value": "discontinued", "label": "Discontinued"},
              {"value": "pre_order", "label": "Pre-Order"}
            ]
          }
        }
      ]
    },
    {
      "title": "Contact & Documentation",
      "order": 5,
      "description": "Contact information and supporting documentation",
      "is_collapsible": false,
      "fields": [
        {
          "name": "manufacturer_name",
          "label": "Manufacturer Name",
          "type": "text",
          "required": true,
          "validation": ["required", "min_length:2", "max_length:100"],
          "ui_config": {
            "placeholder": "Full manufacturer or company name",
            "helpText": "Official manufacturer name"
          }
        },
        {
          "name": "manufacturer_address",
          "label": "Manufacturer Address",
          "type": "textarea",
          "required": true,
          "validation": ["required", "min_length:10", "max_length:300"],
          "ui_config": {
            "placeholder": "Complete manufacturing address",
            "helpText": "Full address including country"
          }
        },
        {
          "name": "contact_email",
          "label": "Contact Email",
          "type": "email",
          "required": true,
          "validation": ["required", "email"],
          "ui_config": {
            "placeholder": "business@email.com",
            "helpText": "Primary business contact email"
          }
        },
        {
          "name": "contact_phone",
          "label": "Contact Phone",
          "type": "phone",
          "required": true,
          "validation": ["required", "phone"],
          "ui_config": {
            "placeholder": "+1 (555) 123-4567",
            "helpText": "Business contact phone number"
          }
        },
        {
          "name": "website",
          "label": "Website",
          "type": "url",
          "required": false,
          "validation": ["url"],
          "ui_config": {
            "placeholder": "https://www.company.com",
            "helpText": "Official company website"
          }
        },
        {
          "name": "product_manual",
          "label": "Product Manual/Documentation",
          "type": "file",
          "required": false,
          "validation": ["fileType:pdf", "fileSize:10485760"],
          "ui_config": {
            "multiple": true,
            "accept": ".pdf",
            "maxFiles": 3,
            "helpText": "Upload user manuals, assembly instructions, and product guides"
          }
        },
        {
          "name": "additional_notes",
          "label": "Additional Notes",
          "type": "textarea",
          "required": false,
          "validation": ["max_length:1000"],
          "ui_config": {
            "placeholder": "Any additional information or special requirements",
            "helpText": "Extra details for buyers or special handling instructions"
          }
        }
      ]
    }
  ]
}
```

---

## 🎯 Features Summary

### Core Capabilities
- **Comprehensive Age Coverage**: From newborn (0-3 months) to teenagers (12-16 years)
- **Multi-Subcategory Support**: Unified template for Clothing, Footwear, Toys & Accessories
- **Safety-First Design**: Mandatory safety standard declarations and choking hazard warnings
- **Material Transparency**: Detailed material composition with percentage breakdowns
- **Quality Assurance**: Certification upload support for compliance documentation
- **Business Ready**: Wholesale pricing, MOQ, and lead time specifications for B2B transactions

### Industry Standards Compliance
- **CPSIA Certification**: Consumer Product Safety Improvement Act compliance
- **ASTM Standards**: American Society for Testing and Materials specifications
- **EN 71 Safety**: European toy safety standards
- **ISO 8124**: International toy safety standards
- **REACH Compliance**: European chemical regulations
- **CE Marking**: European conformity marking

### Technical Features
- **Dynamic Validation**: Age-appropriate field requirements and conditional logic
- **File Upload Support**: Images, certificates, manuals with size and type validation
- **Multi-select Options**: Flexible selection for materials, standards, and features
- **Responsive UI**: Mobile-optimized form layouts with contextual help
- **Data Integrity**: Comprehensive validation rules for all field types

---

## 🔗 API Integration Points

### Template Assignment
```javascript
// Assign Kids template to category
POST /api/v1/templates/{template_id}/assign-category
{
  "category_id": "kids_category_uuid",
  "is_default": true
}
```

### Dynamic Form Generation
```javascript
// Get Kids product schema for frontend rendering
GET /api/v1/catalog/categories/{kids_category_id}/schema
// Returns complete template JSON for dynamic form building
```

### Product Creation with Template
```javascript
// Create product using Kids template
POST /api/v1/products
{
  "category_id": "kids_category_uuid",
  "template_data": {
    "product_name": "Organic Cotton Baby Romper",
    "subcategory": "clothing",
    "age_range": "3-6m",
    "safety_standards": ["cpsia", "astm"],
    // ... all template fields
  }
}
```

### Validation Integration
```javascript
// Server-side validation using template rules
POST /api/v1/products/validate
{
  "category_id": "kids_category_uuid",
  "data": { /* product data */ }
}
// Returns validation results with field-specific errors
```

---

## 📋 Implementation Notes

### Frontend Integration
1. **Dynamic Form Builder**: Use the template JSON to generate forms with appropriate field types
2. **Conditional Logic**: Implement age-based field visibility (e.g., battery fields only for older kids)
3. **File Upload Handling**: Configure Firebase Storage for image and document uploads
4. **Validation Feedback**: Display real-time validation messages using template rules

### Backend Considerations
1. **Template Storage**: Store template JSON in PostgreSQL JSONB field
2. **Version Control**: Implement template versioning for schema updates
3. **Category Association**: Link templates to categories for automatic form generation
4. **Validation Engine**: Use AJV or similar for JSON Schema validation
5. **Audit Logging**: Track template changes and product validations

### Business Logic
1. **Age Restrictions**: Enforce age-appropriate content and features
2. **Safety Compliance**: Require mandatory safety certifications for certain products
3. **Bulk Operations**: Support wholesale pricing and MOQ for business accounts
4. **Quality Control**: Automated checks for required certifications and documentation

---

## 🔍 Usage Examples

### Creating a Baby Clothing Product
```json
{
  "product_name": "Organic Cotton Baby Onesie",
  "subcategory": "clothing",
  "brand": "BabySoft",
  "age_range": "0-3m",
  "gender": "unisex",
  "size": "newborn",
  "material": "100% Organic Cotton, GOTS Certified",
  "safety_standards": ["cpsia", "astm", "reach"],
  "washable": true,
  "unit_price": 24.99,
  "wholesale_price": 18.99,
  "minimum_order_quantity": 50
}
```

### Creating an Educational Toy
```json
{
  "product_name": "Interactive Learning Tablet",
  "subcategory": "toys",
  "brand": "EduTech Kids",
  "age_range": "3-5y",
  "educational_features": "Teaches letters, numbers, shapes, and basic math through interactive games",
  "battery_required": true,
  "battery_type": "rechargeable",
  "safety_standards": ["cpsia", "en71", "iso8124", "fcc"],
  "choking_hazard": false,
  "small_parts": false
}
```

### Creating Kids Footwear
```json
{
  "product_name": "Waterproof Kids Hiking Boots",
  "subcategory": "footwear",
  "brand": "Adventure Kids",
  "age_range": "5-8y",
  "size": "11",
  "material": "Synthetic leather upper, rubber sole, waterproof membrane",
  "safety_standards": ["cpsia", "astm"],
  "care_instructions": "Machine washable, air dry, apply waterproofing spray every 6 months"
}
```

---

## ✅ Validation Rules & Business Logic

### Age-Based Validation
- **0-3 Months**: Mandatory choking hazard and small parts declarations
- **3-5 Years**: Educational features encouraged for toys
- **8-12 Years**: Battery-operated products allowed
- **12-16 Years**: Advanced features and specifications

### Safety Requirements
- **Mandatory Standards**: CPSIA required for all US-marketed products
- **Hazard Declarations**: Required for products with potential safety risks
- **Certification Upload**: Mandatory for electronic toys and certain materials

### Business Rules
- **Wholesale Pricing**: Must be lower than retail when specified
- **MOQ Logic**: Minimum order quantities for bulk pricing
- **Lead Time**: Realistic production timelines based on product complexity

### Data Integrity
- **Material Composition**: Percentage totals should sum to 100%
- **Size Consistency**: Age range and size selections must be compatible
- **File Validation**: Document types and sizes enforced at upload

---

**Note:** This Kids Products template provides a comprehensive foundation for children's product listings in the eBidPortal marketplace. It ensures safety compliance, industry standards adherence, and professional presentation for B2B transactions. The template is designed to be extensible and can be customized for specific subcategories or regional requirements.