# Category Input Schema System - Complete Guide

## Overview

The **Category Input Schema System** is a dynamic, template-driven form generation system that defines the structure and validation rules for product data within specific categories. This system enables flexible, category-specific product forms without requiring code changes for each new category type.

## What is Input Schema?

The `input_schema` field in categories is a JSONB object that defines:
- **Form Fields**: What fields should appear in product creation/editing forms
- **Field Types**: The type of input control (text, number, select, etc.)
- **Validation Rules**: Client and server-side validation constraints
- **Field Dependencies**: Conditional logic for showing/hiding fields
- **UI Configuration**: Labels, placeholders, help text, and layout options

## Key Differences from Traditional Schema Systems

### 1. **Dynamic Form Generation**
- **Traditional**: Static forms hardcoded in templates
- **Input Schema**: Forms generated dynamically from JSON configuration
- **Benefit**: New product types can be added without developer intervention

### 2. **Category-Specific Validation**
- **Traditional**: Generic validation rules
- **Input Schema**: Validation rules tailored to each category's requirements
- **Benefit**: Ensures data quality specific to product type (e.g., vehicle specs vs. real estate)

### 3. **Template-Based Architecture**
- **Traditional**: One-size-fits-all forms
- **Input Schema**: Reusable templates with category-specific overrides
- **Benefit**: Consistent UX across similar categories with customization where needed

### 4. **Conditional Logic Support**
- **Traditional**: Static field visibility
- **Input Schema**: Dynamic show/hide based on other field values
- **Benefit**: Progressive disclosure and context-aware forms

### 5. **Multi-Vertical Support**
- **Traditional**: Single domain focus
- **Input Schema**: Universal system for Products, Auctions, Jobs, Properties
- **Benefit**: Consistent data modeling across all marketplace verticals

## Schema Structure

```json
{
  "name": "Product Schema Name",
  "version": 1,
  "description": "Schema description",
  "fields": [
    {
      "name": "field_name",
      "type": "field_type",
      "label": "Display Label",
      "required": true,
      "validation": {
        "rule_name": "rule_value"
      },
      "ui": {
        "placeholder": "Enter value...",
        "help_text": "Helpful guidance",
        "order": 1
      }
    }
  ],
  "sections": [
    {
      "title": "Section Name",
      "description": "Section description",
      "fields": ["field_name1", "field_name2"],
      "collapsible": false,
      "default_expanded": true,
      "order": 1
    }
  ]
}
```

## Brand → Model → Variant API Hierarchy

The eBidPortal system includes comprehensive hierarchical APIs for vehicles (cars and bikes) that support the brand → model → variant relationship. This hierarchy is fully integrated with the Input Schema system for dynamic form generation.

### API Structure

#### Car Management APIs
```
GET /api/v1/cars/brands
├── GET /api/v1/cars/brands/{brandId}
├── GET /api/v1/cars/brands/{brandId}/models
│   └── GET /api/v1/cars/models/{modelId}
│       └── GET /api/v1/cars/models/{modelId}/variants
│           └── GET /api/v1/cars/variants/{variantId}
```

#### Bike Management APIs
```
GET /api/v1/bikes/brands
├── GET /api/v1/bikes/brands/{brandId}
├── GET /api/v1/bikes/brands/{brandId}/models
│   └── GET /api/v1/bikes/models/{modelId}
│       └── GET /api/v1/bikes/models/{modelId}/variants
│           └── GET /api/v1/bikes/variants/{variantId}
```

### API Response Examples

#### Brands API Response
```json
{
  "success": true,
  "data": [
    {
      "id": "uuid-1",
      "name": "Toyota",
      "logo_url": "https://...",
      "is_active": true,
      "created_at": "2025-01-01T00:00:00Z"
    },
    {
      "id": "uuid-2",
      "name": "Honda",
      "logo_url": "https://...",
      "is_active": true,
      "created_at": "2025-01-01T00:00:00Z"
    }
  ],
  "count": 2
}
```

#### Models API Response (for specific brand)
```json
{
  "success": true,
  "data": [
    {
      "id": "uuid-3",
      "brand_id": "uuid-1",
      "name": "Camry",
      "year_start": 2018,
      "year_end": 2023,
      "is_active": true,
      "created_at": "2025-01-01T00:00:00Z"
    },
    {
      "id": "uuid-4",
      "brand_id": "uuid-1",
      "name": "Corolla",
      "year_start": 2019,
      "year_end": 2024,
      "is_active": true,
      "created_at": "2025-01-01T00:00:00Z"
    }
  ],
  "count": 2
}
```

#### Variants API Response (for specific model)
```json
{
  "success": true,
  "data": [
    {
      "id": "uuid-5",
      "model_id": "uuid-3",
      "name": "Camry 2.5L Hybrid",
      "engine_type": "Hybrid",
      "fuel_type": "Petrol",
      "transmission": "CVT",
      "seating_capacity": 5,
      "price_range_min": 3500000,
      "price_range_max": 4200000,
      "is_active": true,
      "specifications": {...},
      "created_at": "2025-01-01T00:00:00Z"
    }
  ],
  "count": 1
}
```

### Integration with Input Schema

The hierarchical APIs are designed to work seamlessly with dynamic select fields in the Input Schema system. Here's how to configure cascading dropdowns:

#### Complete Vehicle Selection Schema
```json
{
  "name": "Vehicle Selection Schema",
  "version": 1,
  "fields": [
    {
      "name": "vehicle_type",
      "type": "radio",
      "label": "Vehicle Type",
      "required": true,
      "options": [
        {"value": "car", "label": "Car"},
        {"value": "bike", "label": "Bike"}
      ]
    },
    {
      "name": "brand",
      "type": "select",
      "label": "Brand",
      "required": true,
      "dynamic_options": {
        "api_url": "https://api.ebidportal.com/api/v1/{vehicle_type}s/brands",
        "data_path": "data",
        "label_field": "name",
        "value_field": "id",
        "depends_on": "vehicle_type"
      },
      "visibleIf": {
        "field": "vehicle_type",
        "operator": "not_empty"
      },
      "ui": {
        "placeholder": "Select brand",
        "help_text": "Choose the vehicle manufacturer"
      }
    },
    {
      "name": "model",
      "type": "select",
      "label": "Model",
      "required": true,
      "dynamic_options": {
        "api_url": "https://api.ebidportal.com/api/v1/{vehicle_type}s/brands/{brand}/models",
        "data_path": "data",
        "label_field": "name",
        "value_field": "id",
        "depends_on": "brand"
      },
      "visibleIf": {
        "field": "brand",
        "operator": "not_empty"
      },
      "ui": {
        "placeholder": "Select model",
        "help_text": "Choose the specific model"
      }
    },
    {
      "name": "variant",
      "type": "select",
      "label": "Variant",
      "required": true,
      "dynamic_options": {
        "api_url": "https://api.ebidportal.com/api/v1/{vehicle_type}s/models/{model}/variants",
        "data_path": "data",
        "label_field": "name",
        "value_field": "id",
        "depends_on": "model"
      },
      "visibleIf": {
        "field": "model",
        "operator": "not_empty"
      },
      "ui": {
        "placeholder": "Select variant",
        "help_text": "Choose the specific variant/trim"
      }
    }
  ]
}
```

### Dynamic URL Templates

The system supports URL templates with variable substitution:

- `{vehicle_type}` - Gets replaced with "car" or "bike"
- `{brand}` - Gets replaced with selected brand ID
- `{model}` - Gets replaced with selected model ID

### Frontend Implementation

```javascript
// Example: Loading brands based on vehicle type
async function loadBrands(vehicleType) {
  const url = `https://api.ebidportal.com/api/v1/${vehicleType}s/brands`;
  const response = await fetch(url);
  const data = await response.json();
  
  return data.data.map(brand => ({
    value: brand.id,
    label: brand.name
  }));
}

// Example: Loading models based on brand selection
async function loadModels(vehicleType, brandId) {
  const url = `https://api.ebidportal.com/api/v1/${vehicleType}s/brands/${brandId}/models`;
  const response = await fetch(url);
  const data = await response.json();
  
  return data.data.map(model => ({
    value: model.id,
    label: model.name
  }));
}
```

### Benefits of Hierarchical Structure

1. **Data Integrity**: Ensures only valid combinations exist
2. **Performance**: Reduces data transfer by loading options progressively
3. **User Experience**: Guides users through logical selection process
4. **Maintainability**: Easy to add new brands/models/variants
5. **Scalability**: Supports thousands of combinations efficiently

### Error Handling

The APIs include proper error handling for:
- Invalid brand/model IDs
- Non-existent relationships
- Inactive entities
- Rate limiting
- Authentication requirements

### Caching Strategy

For optimal performance, implement caching:
- Brand lists: Cache for 24 hours
- Model lists: Cache for 12 hours (per brand)
- Variant lists: Cache for 6 hours (per model)
- Use Redis for distributed caching in production

### 1. **Text Field**
```json
{
  "name": "title",
  "type": "text",
  "label": "Product Title",
  "required": true,
  "validation": {
    "minLength": 10,
    "maxLength": 200
  },
  "ui": {
    "placeholder": "Enter product title...",
    "help_text": "Choose a descriptive title that highlights key features"
  }
}
```
**Use Cases**: Product names, headlines, short descriptions
**Validation**: minLength, maxLength, pattern
**UI Features**: Autocomplete, character counter

### 2. **Textarea Field**
```json
{
  "name": "description",
  "type": "textarea",
  "label": "Detailed Description",
  "required": true,
  "validation": {
    "minLength": 50,
    "maxLength": 5000
  },
  "ui": {
    "placeholder": "Provide detailed product description...",
    "help_text": "Include specifications, condition, and any defects",
    "rows": 6
  }
}
```
**Use Cases**: Long descriptions, specifications, terms and conditions
**Validation**: minLength, maxLength, pattern
**UI Features**: Rich text editor option, character counter, auto-resize

### 3. **Number Field**
```json
{
  "name": "price",
  "type": "number",
  "label": "Price (INR)",
  "required": true,
  "validation": {
    "min": 1,
    "max": 10000000,
    "step": 0.01
  },
  "ui": {
    "placeholder": "0.00",
    "help_text": "Enter price in Indian Rupees"
  }
}
```
**Use Cases**: Prices, quantities, measurements, ratings
**Validation**: min, max, step, integer (for whole numbers)
**UI Features**: Currency formatting, calculator input

### 4. **Select Field**
```json
{
  "name": "condition",
  "type": "select",
  "label": "Product Condition",
  "required": true,
  "options": [
    {"value": "new", "label": "New"},
    {"value": "used", "label": "Used"},
    {"value": "refurbished", "label": "Refurbished"},
    {"value": "open_box", "label": "Open Box"}
  ],
  "validation": {
    "options": ["new", "used", "refurbished", "open_box"]
  },
  "ui": {
    "placeholder": "Select condition...",
    "help_text": "Choose the most accurate condition"
  }
}
```
**Use Cases**: Categories, conditions, brands, sizes, colors
**Validation**: options array, custom validation
**UI Features**: Searchable dropdown, multi-select option

#### Dynamic Options Configuration
Select fields can fetch options dynamically from API endpoints:

```json
{
  "name": "brand",
  "type": "select",
  "label": "Brand/Manufacturer",
  "required": true,
  "dynamic_options": {
    "api_url": "https://api.ebidportal.com/api/v1/cars/brands",
    "data_path": "data",
    "label_field": "name",
    "value_field": "id",
    "depends_on": null
  },
  "ui": {
    "placeholder": "Select vehicle brand",
    "help_text": "Choose the vehicle manufacturer"
  }
}
```

**Dynamic Options Properties:**
- `api_url`: API endpoint to fetch options from
- `data_path`: JSON path to extract options array (e.g., "data", "brands")
- `label_field`: Field name for display text
- `value_field`: Field name for option value
- `depends_on`: Field name this depends on (for cascading dropdowns)

#### Cascading Dropdowns (Brand → Model → Variant)
For hierarchical selections, use dependent dynamic options:

```json
{
  "name": "brand",
  "type": "select",
  "label": "Brand",
  "required": true,
  "dynamic_options": {
    "api_url": "https://api.ebidportal.com/api/v1/cars/brands",
    "data_path": "data",
    "label_field": "name",
    "value_field": "id"
  }
},
{
  "name": "model",
  "type": "select",
  "label": "Model",
  "required": true,
  "dynamic_options": {
    "api_url": "https://api.ebidportal.com/api/v1/cars/brands/{brand}/models",
    "data_path": "data",
    "label_field": "name",
    "value_field": "id",
    "depends_on": "brand"
  },
  "visibleIf": {
    "field": "brand",
    "operator": "not_empty"
  }
},
{
  "name": "variant",
  "type": "select",
  "label": "Variant",
  "required": true,
  "dynamic_options": {
    "api_url": "https://api.ebidportal.com/api/v1/cars/models/{model}/variants",
    "data_path": "data",
    "label_field": "name",
    "value_field": "id",
    "depends_on": "model"
  },
  "visibleIf": {
    "field": "model",
    "operator": "not_empty"
  }
}
```

**API Endpoints for Hierarchical Data:**
- `GET /api/v1/cars/brands` - Returns all car brands
- `GET /api/v1/cars/brands/{brandId}/models` - Returns models for specific brand
- `GET /api/v1/cars/models/{modelId}/variants` - Returns variants for specific model

**Bike Hierarchy APIs:**
- `GET /api/v1/bikes/brands` - Returns all bike brands
- `GET /api/v1/bikes/brands/{brandId}/models` - Returns models for specific brand
- `GET /api/v1/bikes/models/{modelId}/variants` - Returns variants for specific model

### 5. **Radio Field**
```json
{
  "name": "fuel_type",
  "type": "radio",
  "label": "Fuel Type",
  "required": true,
  "options": [
    {"value": "petrol", "label": "Petrol"},
    {"value": "diesel", "label": "Diesel"},
    {"value": "electric", "label": "Electric"},
    {"value": "hybrid", "label": "Hybrid"}
  ],
  "ui": {
    "help_text": "Select the primary fuel type"
  }
}
```
**Use Cases**: Single-choice options, mutually exclusive selections
**Validation**: options array
**UI Features**: Custom styling, image options

### 6. **Checkbox Field**
```json
{
  "name": "features",
  "type": "checkbox",
  "label": "Features",
  "required": false,
  "options": [
    {"value": "bluetooth", "label": "Bluetooth"},
    {"value": "wifi", "label": "WiFi"},
    {"value": "gps", "label": "GPS"},
    {"value": "camera", "label": "Camera"}
  ],
  "ui": {
    "help_text": "Select all applicable features"
  }
}
```
**Use Cases**: Multi-select features, amenities, capabilities
**Validation**: minSelections, maxSelections
**UI Features**: "Select All" option, grouped checkboxes

### 7. **Date Field**
```json
{
  "name": "manufacture_date",
  "type": "date",
  "label": "Manufacture Date",
  "required": false,
  "validation": {
    "minDate": "2000-01-01",
    "maxDate": "today"
  },
  "ui": {
    "placeholder": "Select manufacture date...",
    "help_text": "Approximate date when the product was made"
  }
}
```
**Use Cases**: Dates, birthdates, expiry dates, manufacture dates
**Validation**: minDate, maxDate, format
**UI Features**: Date picker, calendar widget, date range

### 8. **File Field**
```json
{
  "name": "images",
  "type": "file",
  "label": "Product Images",
  "required": true,
  "validation": {
    "maxFiles": 20,
    "allowedTypes": ["image/jpeg", "image/png", "image/webp"],
    "maxSize": 5242880
  },
  "ui": {
    "help_text": "Upload up to 20 high-quality images",
    "accept": "image/*",
    "multiple": true
  }
}
```
**Use Cases**: Images, documents, videos, attachments
**Validation**: maxFiles, allowedTypes, maxSize, required
**UI Features**: Drag & drop, preview, progress indicator

### 9. **Boolean Field**
```json
{
  "name": "is_negotiable",
  "type": "boolean",
  "label": "Price Negotiable",
  "required": false,
  "default": false,
  "ui": {
    "help_text": "Check if you're open to offers"
  }
}
```
**Use Cases**: Yes/no questions, toggles, flags
**Validation**: N/A (true/false only)
**UI Features**: Toggle switch, checkbox, radio buttons

### 10. **Email Field**
```json
{
  "name": "contact_email",
  "type": "email",
  "label": "Contact Email",
  "required": false,
  "validation": {
    "pattern": "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
  },
  "ui": {
    "placeholder": "contact@example.com",
    "help_text": "Email for buyer inquiries"
  }
}
```
**Use Cases**: Contact information, registration emails
**Validation**: Built-in email validation, custom pattern
**UI Features**: Email-specific keyboard, validation feedback

### 11. **URL Field**
```json
{
  "name": "website",
  "type": "url",
  "label": "Website",
  "required": false,
  "validation": {
    "pattern": "^https?://.+"
  },
  "ui": {
    "placeholder": "https://example.com",
    "help_text": "Company or product website"
  }
}
```
**Use Cases**: Websites, social media links, external resources
**Validation**: URL format validation, protocol requirements
**UI Features**: URL validation, link preview

### 12. **Phone Field**
```json
{
  "name": "contact_phone",
  "type": "phone",
  "label": "Contact Phone",
  "required": false,
  "validation": {
    "pattern": "^[+]?[1-9][0-9]{9,14}$"
  },
  "ui": {
    "placeholder": "+91 98765 43210",
    "help_text": "Phone number for buyer inquiries"
  }
}
```
**Use Cases**: Contact numbers, business phones
**Validation**: International phone format, country-specific patterns
**UI Features**: Phone keyboard, country code selector

### 13. **Range Field**
```json
{
  "name": "rating",
  "type": "range",
  "label": "Product Rating",
  "required": false,
  "validation": {
    "min": 1,
    "max": 5,
    "step": 0.5
  },
  "ui": {
    "help_text": "Rate this product from 1 to 5 stars",
    "show_value": true
  }
}
```
**Use Cases**: Ratings, sliders, percentage values
**Validation**: min, max, step
**UI Features**: Slider control, value display, step indicators

### 14. **Color Field**
```json
{
  "name": "color",
  "type": "color",
  "label": "Primary Color",
  "required": false,
  "ui": {
    "help_text": "Select the primary color of the product",
    "show_hex": true
  }
}
```
**Use Cases**: Color selection, themes, preferences
**Validation**: Hex color format
**UI Features**: Color picker, palette, hex input

### 15. **Rating Field**
```json
{
  "name": "customer_rating",
  "type": "rating",
  "label": "Customer Rating",
  "required": false,
  "validation": {
    "min": 1,
    "max": 5,
    "allow_half": true
  },
  "ui": {
    "help_text": "Rate your experience",
    "icon": "star",
    "size": "large"
  }
}
```
**Use Cases**: Star ratings, feedback scores
**Validation**: min, max, allow_half
**UI Features**: Star display, hover effects, custom icons

### 16. **Map Field**
```json
{
  "name": "location",
  "type": "map",
  "label": "Location",
  "required": false,
  "validation": {
    "required_bounds": {
      "north": 37.7749,
      "south": 37.7749,
      "east": -122.4194,
      "west": -122.4194
    }
  },
  "ui": {
    "help_text": "Click on the map to set location",
    "default_zoom": 12,
    "allow_search": true
  }
}
```
**Use Cases**: Geographic locations, addresses, coordinates
**Validation**: Bounds checking, required areas
**UI Features**: Interactive map, search, coordinates display

### 17. **Object Field**
```json
{
  "name": "specifications",
  "type": "object",
  "label": "Technical Specifications",
  "required": false,
  "schema": {
    "fields": [
      {
        "name": "processor",
        "type": "text",
        "label": "Processor",
        "required": true
      },
      {
        "name": "ram",
        "type": "number",
        "label": "RAM (GB)",
        "required": true
      }
    ]
  },
  "ui": {
    "help_text": "Enter detailed technical specifications"
  }
}
```
**Use Cases**: Complex nested data, specifications, configurations
**Validation**: Nested schema validation
**UI Features**: Collapsible sections, dynamic sub-forms

### 18. **Array Field**
```json
{
  "name": "features",
  "type": "array",
  "label": "Key Features",
  "required": false,
  "item_schema": {
    "type": "text",
    "validation": {
      "minLength": 5,
      "maxLength": 100
    }
  },
  "validation": {
    "minItems": 1,
    "maxItems": 10
  },
  "ui": {
    "help_text": "Add key features (up to 10)",
    "add_button_text": "Add Feature",
    "allow_reorder": true
  }
}
```
**Use Cases**: Lists, multiple values, dynamic arrays
**Validation**: minItems, maxItems, item validation
**UI Features**: Add/remove items, drag to reorder

## Complete Validation Rules Reference

### 1. **Required**
```json
"validation": {
  "required": true
}
```
**Applies to**: All field types
**Description**: Field must have a value

### 2. **Minimum Length**
```json
"validation": {
  "minLength": 10
}
```
**Applies to**: text, textarea
**Description**: Minimum character count

### 3. **Maximum Length**
```json
"validation": {
  "maxLength": 5000
}
```
**Applies to**: text, textarea
**Description**: Maximum character count

### 4. **Pattern**
```json
"validation": {
  "pattern": "^[A-Z0-9]+$"
}
```
**Applies to**: text, textarea, email, url, phone
**Description**: Regular expression pattern matching

### 5. **Minimum Value**
```json
"validation": {
  "min": 0
}
```
**Applies to**: number, range, date
**Description**: Minimum allowed value

### 6. **Maximum Value**
```json
"validation": {
  "max": 1000000
}
```
**Applies to**: number, range, date
**Description**: Maximum allowed value

### 7. **Step**
```json
"validation": {
  "step": 0.01
}
```
**Applies to**: number, range
**Description**: Allowed increment value

### 8. **Integer Only**
```json
"validation": {
  "integer": true
}
```
**Applies to**: number
**Description**: Whole numbers only

### 9. **Options**
```json
"validation": {
  "options": ["option1", "option2", "option3"]
}
```
**Applies to**: select, radio, checkbox
**Description**: Allowed values list

### 10. **Email**
```json
"validation": {
  "email": true
}
```
**Applies to**: email
**Description**: Valid email format

### 11. **URL**
```json
"validation": {
  "url": true
}
```
**Applies to**: url
**Description**: Valid URL format

### 12. **Phone**
```json
"validation": {
  "phone": true
}
```
**Applies to**: phone
**Description**: Valid phone number format

### 13. **File Types**
```json
"validation": {
  "allowedTypes": ["image/jpeg", "image/png"]
}
```
**Applies to**: file
**Description**: Allowed MIME types

### 14. **File Size**
```json
"validation": {
  "maxSize": 5242880
}
```
**Applies to**: file
**Description**: Maximum file size in bytes

### 15. **Maximum Files**
```json
"validation": {
  "maxFiles": 5
}
```
**Applies to**: file
**Description**: Maximum number of files

### 16. **Minimum Items**
```json
"validation": {
  "minItems": 1
}
```
**Applies to**: array, checkbox
**Description**: Minimum number of selections/items

### 17. **Maximum Items**
```json
"validation": {
  "maxItems": 10
}
```
**Applies to**: array, checkbox
**Description**: Maximum number of selections/items

## Conditional Logic (Advanced Features)

### Visible If
```json
{
  "name": "engine_type",
  "type": "select",
  "visibleIf": {
    "field": "vehicle_type",
    "operator": "equals",
    "value": "car"
  }
}
```
**Description**: Show field only when condition is met

### Disabled If
```json
{
  "name": "price",
  "type": "number",
  "disabledIf": {
    "field": "auction_type",
    "operator": "equals",
    "value": "free"
  }
}
```
**Description**: Disable field when condition is met

### Required If
```json
{
  "name": "license_number",
  "type": "text",
  "requiredIf": {
    "field": "requires_license",
    "operator": "equals",
    "value": true
  }
}
```
**Description**: Make field required when condition is met

### Default Value
```json
{
  "name": "country",
  "type": "select",
  "defaultValue": "IN",
  "defaultValueIf": {
    "field": "region",
    "operator": "equals",
    "value": "asia"
  }
}
```
**Description**: Set default value based on conditions

## Template System Integration

### Schema Templates
Categories can use pre-defined templates:

```json
{
  "template_id": "vehicle-basic",
  "overrides": {
    "fields": {
      "price": {
        "validation": {
          "max": 5000000
        }
      }
    }
  }
}
```

### Template Assignment
```javascript
POST /api/v1/schema-templates/{template_id}/assign-category
{
  "category_id": "category-uuid",
  "overrides": {...}
}
```

## API Endpoints

### Get Category Schema
```http
GET /api/v1/catalog/categories/{id}/schema
```
**Response:**
```json
{
  "success": true,
  "data": {
    "category_id": "uuid",
    "template_id": "uuid",
    "template_name": "Vehicle Template",
    "sections": [...],
    "fields": [...],
    "is_active": true,
    "assigned_at": "2025-11-28T10:00:00Z"
  }
}
```

### Update Category Schema
```http
PUT /api/v1/catalog/categories/{id}/schema
```
**Request:**
```json
{
  "input_schema": {
    "name": "Custom Schema",
    "version": 2,
    "fields": [...]
  }
}
```

## Implementation Examples

### Vehicle Category Schema
```json
{
  "name": "Vehicle Listing Schema",
  "version": 1,
  "fields": [
    {
      "name": "make",
      "type": "select",
      "label": "Make",
      "required": true,
      "options": [
        {"value": "toyota", "label": "Toyota"},
        {"value": "honda", "label": "Honda"},
        {"value": "ford", "label": "Ford"}
      ]
    },
    {
      "name": "model",
      "type": "text",
      "label": "Model",
      "required": true,
      "visibleIf": {
        "field": "make",
        "operator": "not_empty"
      }
    },
    {
      "name": "year",
      "type": "number",
      "label": "Year",
      "required": true,
      "validation": {
        "min": 1900,
        "max": 2025,
        "integer": true
      }
    },
    {
      "name": "mileage",
      "type": "number",
      "label": "Mileage (km)",
      "required": true,
      "validation": {
        "min": 0,
        "max": 1000000
      }
    },
    {
      "name": "price",
      "type": "number",
      "label": "Price (INR)",
      "required": true,
      "validation": {
        "min": 1000,
        "max": 10000000
      }
    },
    {
      "name": "images",
      "type": "file",
      "label": "Vehicle Images",
      "required": true,
      "validation": {
        "maxFiles": 20,
        "allowedTypes": ["image/jpeg", "image/png"],
        "maxSize": 5242880
      }
    }
  ],
  "sections": [
    {
      "title": "Basic Information",
      "fields": ["make", "model", "year"],
      "order": 1
    },
    {
      "title": "Pricing & Condition",
      "fields": ["price", "mileage"],
      "order": 2
    },
    {
      "title": "Media",
      "fields": ["images"],
      "order": 3
    }
  ]
}
```

### Real Estate Category Schema
```json
{
  "name": "Real Estate Listing Schema",
  "version": 1,
  "fields": [
    {
      "name": "property_type",
      "type": "select",
      "label": "Property Type",
      "required": true,
      "options": [
        {"value": "apartment", "label": "Apartment"},
        {"value": "house", "label": "House"},
        {"value": "plot", "label": "Plot"},
        {"value": "commercial", "label": "Commercial"}
      ]
    },
    {
      "name": "bedrooms",
      "type": "number",
      "label": "Bedrooms",
      "required": true,
      "validation": {
        "min": 1,
        "max": 20,
        "integer": true
      },
      "visibleIf": {
        "field": "property_type",
        "operator": "in",
        "value": ["apartment", "house"]
      }
    },
    {
      "name": "area_sqft",
      "type": "number",
      "label": "Area (sq ft)",
      "required": true,
      "validation": {
        "min": 100,
        "max": 100000
      }
    },
    {
      "name": "price",
      "type": "number",
      "label": "Price (INR)",
      "required": true,
      "validation": {
        "min": 100000,
        "max": 1000000000
      }
    },
    {
      "name": "location",
      "type": "map",
      "label": "Location",
      "required": true
    }
  ]
}
```

## Best Practices

### 1. **Field Naming**
- Use snake_case for field names
- Keep names descriptive but concise
- Avoid special characters and spaces

### 2. **Validation Strategy**
- Start with basic validation, add complexity as needed
- Use appropriate field types for data
- Provide clear error messages

### 3. **UI/UX Considerations**
- Group related fields into sections
- Use appropriate input types for mobile
- Provide helpful placeholder text and help text

### 4. **Performance**
- Limit number of fields per form (max 50)
- Use pagination for very long forms
- Implement progressive disclosure

### 5. **Template Reuse**
- Create base templates for common patterns
- Use overrides for category-specific customizations
- Maintain template versioning

## Migration Guide

### From Static Forms to Dynamic Schema

1. **Analyze existing forms** and identify common patterns
2. **Create base templates** for each product category type
3. **Migrate field definitions** to JSON schema format
4. **Test validation rules** thoroughly
5. **Update frontend components** to use dynamic rendering
6. **Implement conditional logic** where needed

### Backward Compatibility

The system maintains backward compatibility:
- Existing categories without `input_schema` use default forms
- Legacy validation continues to work
- Gradual migration path available

## Troubleshooting

### Common Issues

1. **Schema Validation Errors**
   - Check JSON syntax
   - Verify field type compatibility
   - Ensure required fields are present

2. **Conditional Logic Not Working**
   - Verify field names match exactly
   - Check operator syntax
   - Ensure dependent fields exist

3. **Template Assignment Issues**
   - Confirm template exists and is active
   - Check category-template relationship
   - Verify override syntax

### Debug Tools

```javascript
// Validate schema structure
const isValid = validateCategorySchema(schema);
if (!isValid) {
  console.log('Schema validation errors:', validateCategorySchema.errors);
}

// Test conditional logic
const shouldShow = evaluateCondition(field.visibleIf, formData);
```

## Future Enhancements

- **Advanced Conditional Logic**: Complex boolean expressions
- **Dynamic Options**: API-driven select options
- **Field Dependencies**: Cross-field validation
- **Template Inheritance**: Multi-level template extension
- **A/B Testing**: Schema variation testing
- **Analytics**: Form completion tracking

---

This comprehensive guide covers the complete Category Input Schema system, providing everything needed to implement and manage dynamic, category-specific product forms in the eBidPortal marketplace. The system supports 18 field types, 17 validation rules, and advanced conditional logic for maximum flexibility and user experience optimization.</content>
<parameter name="filePath">/Volumes/ManishData/ManishPersonal/eBidPortal_2/eBidPortal_Apis/Category_Input_Schema_Guide.md





eventpediateam@Eventpedias-MacBook-Pro eBidPortal_Apis % node test-category-api.js
🚀 Testing Category API - Hierarchical Tree Structure
============================================================
📡 Endpoint: https://api.ebidportal.com/api/v1/catalog/categories?tree=true
🔗 Full URL: https://api.ebidportal.com/api/v1/catalog/categories?tree=true

⏳ Making API request...
📊 Response Status: 200 OK
✅ Request successful!

📋 Response Summary:
   - Success: true
   - Message: Category tree retrieved successfully
   - Root Categories: 19

🌳 Category Tree Structure:
========================================
📁 Automotive - Cars & Vehicles (ID: 2ed045fa-5b6f-40c0-baba-de01fc78e43a)
   └─ Active: true, Has Products: false
   └─ [Leaf Category - No Subcategories]

📁 Books, Sports & Hobbies (ID: 91263161-f1ce-4829-9251-df8f0a4349a8)
   └─ Active: true, Has Products: false
   └─ [Leaf Category - No Subcategories]

📁 Business & Commercial (ID: ec092906-48bb-461e-8a0a-fd6f327ab2b5)
   └─ Active: true, Has Products: false
   └─ [Leaf Category - No Subcategories]

📁 Community & Donations (ID: 971cbb43-7c68-4d4a-a788-77de43282319)
   └─ Active: true, Has Products: false
   └─ [Leaf Category - No Subcategories]

📁 Education & Training (ID: 1c9dca23-fbdc-412e-9002-18167f68638c)
   └─ Active: true, Has Products: false
   └─ [Leaf Category - No Subcategories]

📁 Electronics & Appliances (ID: 053d4fab-78c7-47a1-b381-629e5ed596c0)
   └─ Active: true, Has Products: false
   └─ [Leaf Category - No Subcategories]

📁 Events & Entertainment (ID: 85acee6e-d994-4928-b119-151d954a8ed2)
   └─ Active: true, Has Products: false
   └─ [Leaf Category - No Subcategories]

📁 Fashion & Lifestyle (ID: cf429dcd-8e9c-4eac-a1ac-78e95ae8e4a4)
   └─ Active: true, Has Products: false
   └─ [Leaf Category - No Subcategories]

📁 Furniture & Home Decor (ID: 0dc90da0-6397-4648-9d68-affa996ff258)
   └─ Active: true, Has Products: false
   └─ [Leaf Category - No Subcategories]

📁 Industrial & Tools (ID: fddbfcdc-6a8d-4918-8d28-d5e6677eeeea)
   └─ Active: true, Has Products: false
   └─ [Leaf Category - No Subcategories]

📁 Jobs (ID: adc02ac3-a05f-4463-aa29-a07f2455f889)
   └─ Active: true, Has Products: false
   └─ [Leaf Category - No Subcategories]

📁 Mobiles & Tablets (ID: b69eaab3-d7da-4ead-83a5-c92a963e83fb)
   └─ Active: true, Has Products: false
   └─ [Leaf Category - No Subcategories]

📁 Others (ID: a1a8e5ea-3fbb-4e00-9d11-c95c876b0c4b)
   └─ Active: true, Has Products: false
   └─ [Leaf Category - No Subcategories]

📁 Pets & Animals (ID: d8237ac0-96f9-41e6-bb31-5000ca0a39ac)
   └─ Active: true, Has Products: false
   └─ [Leaf Category - No Subcategories]

📁 Properties (ID: a2b483d6-6f6f-4666-867a-6b6d7e138df6)
   └─ Active: true, Has Products: false
   └─ [Leaf Category - No Subcategories]

📁 Services (ID: c960c3f1-20e5-440d-ac1d-6c761603cb9f)
   └─ Active: true, Has Products: false
   └─ [Leaf Category - No Subcategories]

📁 Test Property Category Main Has Schema (ID: b437cbd1-c754-4240-8fb5-b31710f9ced8)
   └─ Active: true, Has Products: false
   └─ [Leaf Category - No Subcategories]

📁 Test Property Category Main NO Schema (ID: 4f9bfe42-3b2c-4ccd-9fa5-ce4689406111)
   └─ Active: true, Has Products: false
  ├─ 📁 Co working Space (ID: d71109b1-5715-4595-9774-8acc00adb19e)
  │    └─ Active: true, Has Products: false
  │    └─ [Leaf Category - No Subcategories]
  └─ 📁 PG (ID: f695f254-b89c-4cdb-952f-665a0b08c3b1)
       └─ Active: true, Has Products: false
       └─ [Leaf Category - No Subcategories]

📁 Test Vehicle Category (ID: 86636ae8-c44f-40ad-a583-addf069c3024)
   └─ Active: true, Has Products: false
  ├─ 📁 Apparment (ID: 958c195b-c2cf-4104-916d-3f1640d30619)
  │    └─ Active: true, Has Products: false
  │    └─ [Leaf Category - No Subcategories]
  └─ 📁 car (ID: 9bfd1073-8682-4c7d-a628-5b4459f6bbc2)
       └─ Active: true, Has Products: false
       └─ [Leaf Category - No Subcategories]

📊 Tree Statistics:
   - Total Categories: 23
   - Max Depth: 1
   - Categories with Children: 2
   - Leaf Categories: 21

🏁 Test completed