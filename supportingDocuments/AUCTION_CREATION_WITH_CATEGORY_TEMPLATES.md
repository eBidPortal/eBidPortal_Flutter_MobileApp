# Auction Creation with Category Template Integration

## 🎯 Overview

This document provides a complete guide for implementing auction creation functionality with integrated category template support. The system allows users to create auctions with dynamic, category-specific forms that ensure consistent and professional auction listings.

## 🏗️ System Architecture

### Core Components
- **Auction Creation Form**: Standard auction fields (title, pricing, timing, etc.)
- **Category Template System**: Dynamic forms based on selected category
- **Validation Engine**: Client and server-side validation
- **Data Storage**: Combined auction and template data in JSONB fields

### Data Flow
1. User selects category → Load category template
2. Fill standard auction fields → Fill category-specific fields
3. Validate all data → Submit combined data
4. Store in database → Return success confirmation

## 📋 API Endpoints

### 1. Get Categories for Auction Creation
**Endpoint:** `GET /api/v1/catalog/categories`
**Purpose:** Retrieve categories available for auction creation

**Request:**
```http
GET /api/v1/catalog/categories
Authorization: Bearer <jwt_token>
Content-Type: application/json
```

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": "ec20b5a1-5293-4f78-b74c-8d278a565aec",
      "name": "Electronics",
      "description": "Electronic devices and gadgets",
      "image_url": "https://example.com/electronics.jpg",
      "has_template": true,
      "parent_id": null,
      "createdAt": "2025-11-28T08:00:00.000Z"
    },
    {
      "id": "550e8400-e29b-41d4-a716-446655440000",
      "name": "Vehicles",
      "description": "Cars, motorcycles, and automotive",
      "image_url": "https://example.com/vehicles.jpg",
      "has_template": true,
      "parent_id": null,
      "createdAt": "2025-11-28T08:00:00.000Z"
    }
  ]
}
```

### 2. Get Category Template Schema
**Endpoint:** `GET /api/v1/catalog/categories/{category_id}/schema`
**Purpose:** Retrieve the template schema for dynamic form generation

**Request:**
```http
GET /api/v1/catalog/categories/ec20b5a1-5293-4f78-b74c-8d278a565aec/schema
Authorization: Bearer <jwt_token>
Content-Type: application/json
```

**Response:**
```json
{
  "success": true,
  "data": {
    "category_id": "ec20b5a1-5293-4f78-b74c-8d278a565aec",
    "template_name": "Electronics Template",
    "schema": {
      "sections": [
        {
          "id": "basic_info",
          "name": "Basic Information",
          "order": 1,
          "fields": [
            {
              "id": "brand",
              "name": "Brand",
              "type": "text",
              "required": true,
              "validation": {
                "minLength": 2,
                "maxLength": 50
              },
              "placeholder": "Enter brand name"
            },
            {
              "id": "model",
              "name": "Model",
              "type": "text",
              "required": true,
              "validation": {
                "minLength": 1,
                "maxLength": 100
              },
              "placeholder": "Enter model name"
            }
          ]
        },
        {
          "id": "specifications",
          "name": "Specifications",
          "order": 2,
          "fields": [
            {
              "id": "color",
              "name": "Color",
              "type": "select",
              "required": false,
              "options": ["Black", "White", "Silver", "Gold", "Blue", "Red"],
              "placeholder": "Select color"
            },
            {
              "id": "storage_capacity",
              "name": "Storage Capacity",
              "type": "select",
              "required": true,
              "options": ["64GB", "128GB", "256GB", "512GB", "1TB", "2TB"],
              "placeholder": "Select storage capacity"
            },
            {
              "id": "warranty",
              "name": "Has Warranty",
              "type": "checkbox",
              "required": false,
              "default": false
            },
            {
              "id": "purchase_year",
              "name": "Year of Purchase",
              "type": "number",
              "required": false,
              "validation": {
                "min": 2000,
                "max": 2025
              }
            }
          ]
        }
      ]
    }
  }
}
```

### 3. Create Auction with Template Data
**Endpoint:** `POST /api/v1/auctions`
**Purpose:** Create a new auction with category template data

**Request:**
```http
POST /api/v1/auctions
Authorization: Bearer <jwt_token>
Content-Type: application/json
```

**Request Body:**
```json
{
  "title": "iPhone 15 Pro Max 256GB - Brand New",
  "description": "Selling a brand new iPhone 15 Pro Max with 256GB storage. Still in original packaging with all accessories included.",
  "category_id": "ec20b5a1-5293-4f78-b74c-8d278a565aec",
  "subcategory_id": null,
  "starting_price": 1200.00,
  "reserve_price": 1500.00,
  "buy_now_price": 1800.00,
  "start_time": "2025-11-28T10:00:00.000Z",
  "end_time": "2025-12-05T10:00:00.000Z",
  "currency": "INR",
  "condition": "mint",
  "auction_type": "english",
  "images": [
    "https://example.com/iphone1.jpg",
    "https://example.com/iphone2.jpg",
    "https://example.com/iphone3.jpg"
  ],
  "shipping": {
    "weight": 0.5,
    "dimensions": {
      "length": 15,
      "width": 8,
      "height": 1
    },
    "cost": 50.00
  },
  "location": {
    "country": "India",
    "state": "Maharashtra",
    "city": "Mumbai",
    "zip_code": "400001"
  },
  "attributes": {
    "brand": "Apple",
    "model": "iPhone 15 Pro Max",
    "color": "Black",
    "storage_capacity": "256GB",
    "warranty": true,
    "purchase_year": 2025,
    "original_box": true,
    "imei_number": "123456789012345"
  }
}
```

**Response (Success):**
```json
{
  "success": true,
  "data": {
    "id": "a1b2c3d4-5678-9abc-def0-123456789abc",
    "title": "iPhone 15 Pro Max 256GB - Brand New",
    "description": "Selling a brand new iPhone 15 Pro Max with 256GB storage. Still in original packaging with all accessories included.",
    "category_id": "ec20b5a1-5293-4f78-b74c-8d278a565aec",
    "starting_price": 1200.00,
    "reserve_price": 1500.00,
    "buy_now_price": 1800.00,
    "start_time": "2025-11-28T10:00:00.000Z",
    "end_time": "2025-12-05T10:00:00.000Z",
    "currency": "INR",
    "condition": "mint",
    "auction_type": "english",
    "status": "pending",
    "attributes": {
      "brand": "Apple",
      "model": "iPhone 15 Pro Max",
      "color": "Black",
      "storage_capacity": "256GB",
      "warranty": true,
      "purchase_year": 2025,
      "original_box": true,
      "imei_number": "123456789012345"
    },
    "seller_id": "user-uuid",
    "createdAt": "2025-11-28T08:45:00.000Z",
    "updatedAt": "2025-11-28T08:45:00.000Z"
  }
}
```

**Response (Validation Error):**
```json
{
  "success": false,
  "message": "Category template validation failed",
  "error": "Field 'Brand' is required for this category, Field 'Model' is required for this category"
}
```

## 🎨 Implementation Workflow

### Step 1: Category Selection
1. Fetch available categories using `GET /api/v1/catalog/categories`
2. Filter categories where `has_template: true`
3. Display categories in a dropdown or selection interface
4. Store selected category ID for template loading

### Step 2: Template Loading
1. When category is selected, fetch template schema using `GET /api/v1/catalog/categories/{category_id}/schema`
2. Parse the schema structure (sections and fields)
3. Dynamically generate form fields based on schema
4. Initialize form validation rules

### Step 3: Form Data Collection
1. Collect standard auction fields (title, description, pricing, timing)
2. Collect category template fields based on schema
3. Validate data in real-time as user types
4. Show validation errors for individual fields

### Step 4: Data Validation
1. **Client-Side Validation:**
   - Required field checking
   - Data type validation
   - Format validation (email, URL, etc.)
   - Cross-field validation (reserve price > starting price)

2. **Server-Side Validation:**
   - Template schema compliance
   - Business rule validation
   - Data sanitization

### Step 5: Auction Submission
1. Combine standard auction data with template data
2. Format dates to ISO string
3. Send POST request to `/api/v1/auctions`
4. Handle success/error responses
5. Redirect to auction details or show success message

## 📊 Data Structure Details

### Standard Auction Fields
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `title` | string | Yes | Auction title (10-200 characters) |
| `description` | string | Yes | Detailed description (50-5000 characters) |
| `category_id` | string | Yes | UUID of selected category |
| `starting_price` | number | Yes | Starting bid price |
| `reserve_price` | number | No | Minimum price for sale |
| `buy_now_price` | number | No | Immediate purchase price |
| `start_time` | string | Yes | Auction start time (ISO format) |
| `end_time` | string | Yes | Auction end time (ISO format) |
| `currency` | string | Yes | Currency code (e.g., "INR", "USD") |
| `condition` | string | Yes | Item condition (mint, excellent, very_good, good, fair, poor) |
| `auction_type` | string | Yes | Auction format (english, dutch, sealed) |
| `images` | array | No | Array of image URLs |
| `shipping` | object | No | Shipping details (weight, dimensions, cost) |
| `location` | object | No | Item location (country, state, city) |

### Template Data Structure
Template fields are stored in the `attributes` object:

```json
{
  "attributes": {
    "brand": "Apple",
    "model": "iPhone 15 Pro Max",
    "color": "Black",
    "storage_capacity": "256GB",
    "warranty": true,
    "purchase_year": 2025,
    "original_box": true,
    "imei_number": "123456789012345"
  }
}
```

## ✅ Validation Rules

### Auction-Level Validation
- **Title**: 10-200 characters, no HTML
- **Description**: 50-5000 characters
- **Starting Price**: Positive number, max 2 decimal places
- **Reserve Price**: Must be > starting price if provided
- **Buy Now Price**: Must be > reserve price if both provided
- **Start Time**: Future date, before end time
- **End Time**: After start time, within reasonable duration
- **Images**: Valid URLs, max 10 images

### Template-Level Validation
- **Required Fields**: Must be provided based on schema
- **Data Types**: Match field type (string, number, boolean)
- **Length Limits**: Respect min/max length constraints
- **Format Validation**: Email, URL, phone number formats
- **Option Values**: Select/radio fields must use predefined options

## 🔄 State Management

### Form States
1. **Initial**: No category selected, basic form shown
2. **Category Selected**: Template loading, form building
3. **Form Ready**: All fields available, validation active
4. **Submitting**: Form disabled, API call in progress
5. **Success**: Auction created, show confirmation
6. **Error**: Show validation errors, allow retry

### Data States
- `selectedCategory`: Current category ID
- `templateSchema`: Loaded schema for current category
- `auctionData`: Standard auction form data
- `templateData`: Category-specific form data
- `validationErrors`: Field-specific error messages
- `isSubmitting`: Loading state flag

## 🔧 Error Handling

### Common Error Scenarios

1. **Category Not Found**
   ```json
   {
     "success": false,
     "message": "Category not found",
     "error": "Invalid category ID provided"
   }
   ```

2. **Template Validation Failed**
   ```json
   {
     "success": false,
     "message": "Category template validation failed",
     "error": "Field 'Brand' is required for this category"
   }
   ```

3. **Authentication Error**
   ```json
   {
     "success": false,
     "message": "Unauthorized",
     "error": "Invalid or expired token"
   }
   ```

4. **Server Error**
   ```json
   {
     "success": false,
     "message": "Internal server error",
     "error": "Database connection failed"
   }
   ```

### Error Recovery
- **Network Errors**: Retry with exponential backoff
- **Validation Errors**: Highlight invalid fields, show helpful messages
- **Authentication Errors**: Redirect to login or refresh token
- **Server Errors**: Show generic error, suggest retry later

## 📱 Mobile Considerations

### Responsive Design
- Stack form sections vertically on mobile
- Use appropriate input types for mobile keyboards
- Optimize touch targets (minimum 44px)
- Progressive loading of template sections

### Performance Optimization
- Lazy load category templates
- Cache frequently used schemas
- Debounce validation on mobile
- Compress images before upload

## 🧪 Testing Scenarios

### Success Cases
- [ ] Create auction with all required fields
- [ ] Create auction with optional fields
- [ ] Create auction with complex template data
- [ ] Create auction with multiple images

### Error Cases
- [ ] Missing required auction fields
- [ ] Missing required template fields
- [ ] Invalid data formats
- [ ] Network connectivity issues
- [ ] Authentication failures

### Edge Cases
- [ ] Very long text fields
- [ ] Special characters in text
- [ ] Large numbers and decimals
- [ ] Future/past dates
- [ ] Empty arrays and objects

## 📋 Implementation Checklist

### Core Features
- [ ] Category selection interface
- [ ] Template schema loading
- [ ] Dynamic form generation
- [ ] Real-time validation
- [ ] Data submission and error handling
- [ ] Success confirmation

### Advanced Features
- [ ] Form draft saving
- [ ] Image upload and preview
- [ ] Rich text editor for description
- [ ] Location autocomplete
- [ ] Auction preview
- [ ] Social media sharing

### Quality Assurance
- [ ] Cross-browser compatibility
- [ ] Mobile responsiveness
- [ ] Accessibility compliance
- [ ] Performance optimization
- [ ] Security validation

## 🎯 Best Practices

### User Experience
- Clear visual hierarchy for form sections
- Progressive disclosure of complex fields
- Inline help text and tooltips
- Save draft functionality
- Form progress indicators

### Performance
- Lazy load template schemas
- Cache category data
- Debounce validation
- Optimize image handling
- Minimize API calls

### Security
- Validate all data server-side
- Sanitize user inputs
- Rate limiting for API calls
- CSRF protection
- Secure file uploads

### Maintainability
- Modular component structure
- Clear separation of concerns
- Comprehensive error logging
- Automated testing
- Documentation updates

## 📚 Related Documentation

- [API Documentation](./eBidPortalApis.md)
- [Category Template CRUD Demo](./category-template-crud-demo.js)
- [Frontend Logic Guide](./FRONTEND_AUCTION_CATEGORY_TEMPLATE_GUIDE.md)
- [Backend Implementation](./routes/auctions.js)

---

## 🚀 Quick Start Implementation

1. **Setup Category Selection**
   - Fetch categories on component mount
   - Display in dropdown with template indicators

2. **Implement Template Loading**
   - Load schema when category changes
   - Generate form fields dynamically

3. **Handle Form Submission**
   - Combine auction and template data
   - Submit to auction creation endpoint
   - Handle success/error responses

4. **Add Validation**
   - Client-side validation for UX
   - Server-side validation for security
   - Clear error messaging

This comprehensive guide provides everything needed to implement professional auction creation with full category template integration.

---

## 📚 References

### Category Input Schema System - Complete Guide

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

This comprehensive guide covers the complete Category Input Schema system, providing everything needed to implement and manage dynamic, category-specific product forms in the eBidPortal marketplace. The system supports 18 field types, 17 validation rules, and advanced conditional logic for maximum flexibility and user experience optimization.