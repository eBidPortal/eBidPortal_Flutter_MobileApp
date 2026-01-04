# eBidPortal Selling API - Complete Documentation

**Version:** 3.2.6  
**Last Updated:** January 4, 2026  
**Base URL:** `https://api.ebidportal.com/api/v1/sell`  
**Environment:** Production (Railway)

---

## 📋 Table of Contents

1. [Overview](#overview)
2. [Authentication](#authentication)
3. [CRUD Operations](#crud-operations)
   - [Create Product](#create-product)
   - [Get Product by ID](#get-product-by-id)
   - [Update Product](#update-product)
   - [Delete Product](#delete-product)
4. [User-Specific Endpoints](#user-specific-endpoints)
   - [My Listings](#my-listings)
   - [My Products](#my-products)
5. [Location-Based Discovery](#location-based-discovery)
   - [Nearby Search](#nearby-search)
   - [Near Me](#near-me)
   - [Set Location](#set-location)
   - [My Locations](#my-locations)
   - [Recommendations](#recommendations)
6. [Search & Filtering](#search--filtering)
7. [Category Templates](#category-templates)
8. [Error Handling](#error-handling)
9. [Rate Limiting](#rate-limiting)
10. [Examples](#examples)

---

## Overview

The eBidPortal Selling API provides a comprehensive platform for direct product sales with fixed pricing (as opposed to the auction system). It supports:

- ✅ **Dynamic Category Templates** - Category-specific fields and validation
- ✅ **Location-Based Discovery** - OLX-level radius-based search using Haversine formula
- ✅ **Professional Features** - Authentication requirements, shipping options, commission rates
- ✅ **Full CRUD Operations** - Complete product lifecycle management
- ✅ **Advanced Search** - Full-text search with faceted filtering
- ✅ **User Management** - Personal listings and location preferences

---

## Authentication

All endpoints (except public search endpoints) require JWT authentication.

**Header:**
```http
Authorization: Bearer <your_jwt_token>
```

**Getting a Token:**
```bash
POST /auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "your_password"
}
```

---

## CRUD Operations

### Create Product

Create a new product listing for direct sale with category template validation.

**Endpoint:** `POST /api/v1/sell`

**Authentication:** Required

**Request Body:**
```json
{
  "productName": "Premium Smartphone Pro Max 2024",
  "description": "Latest flagship smartphone with cutting-edge technology and professional-grade camera system",
  "category_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "product_price": 45999.99,
  "currency": "INR",
  "quantity": 25,
  "condition": "new",
  "brand": "TechBrand",
  "model": "Pro Max 2024",
  "images": [
    "https://storage.example.com/products/smartphone-front.jpg",
    "https://storage.example.com/products/smartphone-back.jpg",
    "https://storage.example.com/products/smartphone-side.jpg"
  ],
  "dynamic_attributes": {
    "color": "Midnight Blue",
    "storage": "256GB",
    "ram": "12GB",
    "warranty": "2 years",
    "network": "5G",
    "screen_size": "6.7 inches",
    "battery": "5000mAh"
  },
  "attributes": {
    "processor": "Snapdragon 8 Gen 3",
    "camera": "200MP Triple Camera"
  },
  "shipping": {
    "weight_kg": 0.2,
    "dimensions": {
      "length_cm": 15,
      "width_cm": 7,
      "height_cm": 1
    },
    "free_shipping": true,
    "shipping_time_days": 3
  },
  "location": {
    "latitude": 19.0760,
    "longitude": 72.8777,
    "city": "Mumbai",
    "state": "Maharashtra",
    "country": "India"
  },
  "tags": ["smartphone", "5G", "flagship", "camera"],
  "seo_keywords": ["premium smartphone", "5G phone", "professional camera"],
  "return_policy": "30-day money-back guarantee",
  "authentication_required": false,
  "shipping_included": true,
  "commission_rate": 0.05,
  "buyer_premium": 0.02,
  "timezone": "Asia/Kolkata",
  "payment_terms": {
    "accepted_methods": ["UPI", "Card", "Net Banking", "COD"],
    "cod_available": true,
    "emi_available": true
  }
}
```

**Validation Rules:**
- `productName`: Required, 3-200 characters (mapped to `title` in database)
- `description`: Optional, max 5000 characters
- `category_id`: Required, valid UUID
- `product_price`: Required, positive number (mapped to `price` in database)
- `currency`: Optional, defaults to "INR", supports: INR, USD, EUR, GBP, JPY
- `quantity`: Optional, defaults to 1
- `condition`: Optional, enum: "new", "used", "refurbished"
- `images`: Optional, array of valid URLs
- `dynamic_attributes`: Required, validated against category template
- `location`: Optional, JSONB object with coordinates

**Response (201 Created):**
```json
{
  "success": true,
  "message": "Product listed for sale successfully",
  "data": {
    "id": "f1e2d3c4-b5a6-7890-1234-567890abcdef",
    "seller_id": "user-uuid-here",
    "category_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
    "title": "Premium Smartphone Pro Max 2024",
    "description": "Latest flagship smartphone with cutting-edge technology...",
    "price": "45999.99",
    "currency": "INR",
    "quantity": 25,
    "condition": "new",
    "brand": "TechBrand",
    "model": "Pro Max 2024",
    "images": ["https://storage.example.com/products/smartphone-front.jpg"],
    "dynamic_attributes": {
      "color": "Midnight Blue",
      "storage": "256GB",
      "ram": "12GB",
      "warranty": "2 years",
      "network": "5G"
    },
    "attributes": {
      "processor": "Snapdragon 8 Gen 3",
      "camera": "200MP Triple Camera"
    },
    "shipping": {
      "weight_kg": 0.2,
      "free_shipping": true
    },
    "location": {
      "latitude": 19.076,
      "longitude": 72.8777,
      "city": "Mumbai",
      "state": "Maharashtra"
    },
    "tags": ["smartphone", "5G", "flagship", "camera"],
    "status": "pending",
    "featured": false,
    "return_policy": "30-day money-back guarantee",
    "authentication_required": false,
    "shipping_included": true,
    "commission_rate": 0.05,
    "buyer_premium": 0.02,
    "timezone": "Asia/Kolkata",
    "payment_terms": {
      "accepted_methods": ["UPI", "Card", "Net Banking", "COD"],
      "cod_available": true
    },
    "created_at": "2026-01-04T06:24:00.000Z",
    "updated_at": "2026-01-04T06:24:00.000Z"
  }
}
```

**Error Responses:**

```json
// 400 Bad Request - Validation Failed
{
  "success": false,
  "message": "Validation failed",
  "error": "\"productName\" is required, \"category_id\" must be a valid UUID"
}

// 400 Bad Request - Category Template Validation
{
  "success": false,
  "message": "Category template validation failed",
  "error": "Brand is required for this category, Storage must be a number"
}

// 401 Unauthorized
{
  "success": false,
  "message": "Authentication required"
}
```

---

### Get Product by ID

Retrieve detailed information about a specific product.

**Endpoint:** `GET /api/v1/sell/:id`

**Authentication:** Required

**URL Parameters:**
- `id` (UUID): Product ID

**Example Request:**
```bash
GET /api/v1/sell/f1e2d3c4-b5a6-7890-1234-567890abcdef
Authorization: Bearer <your_jwt_token>
```

**Response (200 OK):**
```json
{
  "success": true,
  "message": "Product retrieved successfully",
  "data": {
    "id": "f1e2d3c4-b5a6-7890-1234-567890abcdef",
    "seller_id": "user-uuid-here",
    "title": "Premium Smartphone Pro Max 2024",
    "description": "Latest flagship smartphone...",
    "price": "45999.99",
    "currency": "INR",
    "quantity": 25,
    "condition": "new",
    "brand": "TechBrand",
    "model": "Pro Max 2024",
    "images": ["https://storage.example.com/products/smartphone-front.jpg"],
    "dynamic_attributes": {
      "color": "Midnight Blue",
      "storage": "256GB"
    },
    "status": "active",
    "category": {
      "id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
      "name": "Mobile Phones"
    },
    "seller": {
      "id": "user-uuid-here",
      "name": "TechStore Pro",
      "email": "techstore@example.com"
    },
    "created_at": "2026-01-04T06:24:00.000Z",
    "updated_at": "2026-01-04T06:24:00.000Z"
  }
}
```

**Error Responses:**
```json
// 404 Not Found
{
  "success": false,
  "message": "Product not found"
}
```

---

### Update Product

Update an existing product listing. Only the product owner can update.

**Endpoint:** `PUT /api/v1/sell/:id`

**Authentication:** Required (Owner only)

**URL Parameters:**
- `id` (UUID): Product ID

**Request Body:**
```json
{
  "productName": "Premium Smartphone Pro Max 2024 - Updated",
  "product_price": 42999.99,
  "quantity": 20,
  "dynamic_attributes": {
    "color": "Midnight Blue",
    "storage": "512GB",
    "ram": "16GB"
  },
  "images": [
    "https://storage.example.com/products/smartphone-new-1.jpg",
    "https://storage.example.com/products/smartphone-new-2.jpg"
  ],
  "status": "active"
}
```

**Validation Rules:**
- Only fields provided in the request will be updated
- Cannot update if product status is `sold` or `cancelled`
- Only owner can update their products
- All validation rules from creation apply

**Response (200 OK):**
```json
{
  "success": true,
  "message": "Product listing updated successfully",
  "data": {
    "id": "f1e2d3c4-b5a6-7890-1234-567890abcdef",
    "title": "Premium Smartphone Pro Max 2024 - Updated",
    "price": "42999.99",
    "quantity": 20,
    "dynamic_attributes": {
      "color": "Midnight Blue",
      "storage": "512GB",
      "ram": "16GB"
    },
    "status": "active",
    "updated_at": "2026-01-04T07:30:00.000Z"
  }
}
```

**Error Responses:**
```json
// 404 Not Found or Access Denied
{
  "success": false,
  "message": "Product not found or access denied"
}

// 400 Bad Request - Invalid Status
{
  "success": false,
  "message": "Cannot update product in current status"
}

// 400 Bad Request - Validation Failed
{
  "success": false,
  "message": "Validation failed",
  "error": "\"product_price\" must be a positive number"
}
```

---

### Delete Product

Delete a product listing. Only pending products can be deleted.

**Endpoint:** `DELETE /api/v1/sell/:id`

**Authentication:** Required (Owner only)

**URL Parameters:**
- `id` (UUID): Product ID

**Example Request:**
```bash
DELETE /api/v1/sell/f1e2d3c4-b5a6-7890-1234-567890abcdef
Authorization: Bearer <your_jwt_token>
```

**Response (200 OK):**
```json
{
  "success": true,
  "message": "Product listing deleted successfully"
}
```

**Error Responses:**
```json
// 404 Not Found or Access Denied
{
  "success": false,
  "message": "Product not found or access denied"
}

// 400 Bad Request - Invalid Status
{
  "success": false,
  "message": "Cannot delete product in current status"
}
```

**Notes:**
- Only products with status `pending` can be deleted
- Products with status `active`, `sold`, or `cancelled` cannot be deleted
- Deletion is permanent (hard delete via Sequelize)

---

## User-Specific Endpoints

### My Listings

Get all products listed by the authenticated user.

**Endpoint:** `GET /api/v1/sell/my-listings`

**Authentication:** Required

**Query Parameters:**
- `page` (number, optional): Page number, default: 1
- `limit` (number, optional): Results per page, default: 20
- `status` (string, optional): Filter by status: "pending", "active", "sold", "cancelled"

**Example Request:**
```bash
GET /api/v1/sell/my-listings?page=1&limit=20&status=active
Authorization: Bearer <your_jwt_token>
```

**Response (200 OK):**
```json
{
  "success": true,
  "message": "User product listings retrieved",
  "data": {
    "products": [
      {
        "id": "f1e2d3c4-b5a6-7890-1234-567890abcdef",
        "title": "Premium Smartphone Pro Max 2024",
        "price": "45999.99",
        "currency": "INR",
        "quantity": 25,
        "condition": "new",
        "status": "active",
        "images": ["https://storage.example.com/products/smartphone-front.jpg"],
        "category": {
          "id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
          "name": "Mobile Phones"
        },
        "created_at": "2026-01-04T06:24:00.000Z",
        "updated_at": "2026-01-04T06:24:00.000Z"
      },
      {
        "id": "a2b3c4d5-e6f7-8901-2345-678901bcdefg",
        "title": "Wireless Bluetooth Headphones",
        "price": "2999.99",
        "currency": "INR",
        "quantity": 50,
        "condition": "new",
        "status": "active",
        "images": ["https://storage.example.com/products/headphones.jpg"],
        "category": {
          "id": "b2c3d4e5-f6g7-8901-bcde-f12345678901",
          "name": "Audio Accessories"
        },
        "created_at": "2026-01-03T10:15:00.000Z",
        "updated_at": "2026-01-03T10:15:00.000Z"
      }
    ],
    "total": 15,
    "page": 1,
    "limit": 20
  }
}
```

---

### My Products

Alias endpoint for `my-listings` with identical functionality.

**Endpoint:** `GET /api/v1/sell/my-products`

**Authentication:** Required

**Query Parameters:** Same as `my-listings`

**Response:** Same as `my-listings`

---

## Location-Based Discovery

### Nearby Search

Search for products within a specified radius using coordinates.

**Endpoint:** `GET /api/v1/sell/nearby`

**Authentication:** Public (no authentication required)

**Query Parameters:**
- `latitude` (number, required): User's latitude
- `longitude` (number, required): User's longitude
- `radius` (number, optional): Search radius in kilometers, default: 50
- `category_id` (UUID, optional): Filter by category
- `condition` (string, optional): Filter by condition
- `min_price` (number, optional): Minimum price filter
- `max_price` (number, optional): Maximum price filter
- `page` (number, optional): Page number, default: 1
- `limit` (number, optional): Results per page, default: 20

**Example Request:**
```bash
GET /api/v1/sell/nearby?latitude=19.0760&longitude=72.8777&radius=25&category_id=a1b2c3d4-e5f6-7890-abcd-ef1234567890&page=1&limit=10
```

**Response (200 OK):**
```json
{
  "success": true,
  "message": "Found 8 products within 25km",
  "data": {
    "products": [
      {
        "id": "f1e2d3c4-b5a6-7890-1234-567890abcdef",
        "title": "Premium Smartphone Pro Max 2024",
        "description": "Latest flagship smartphone...",
        "price": "45999.99",
        "images": ["https://storage.example.com/products/smartphone-front.jpg"],
        "condition": "new",
        "location": {
          "latitude": 19.076,
          "longitude": 72.8777,
          "city": "Mumbai",
          "state": "Maharashtra"
        },
        "distance_km": 2.34,
        "category_name": "Mobile Phones",
        "seller_name": "TechStore Pro",
        "created_at": "2026-01-04T06:24:00.000Z"
      },
      {
        "id": "b2c3d4e5-f6g7-8901-2345-678901bcdefg",
        "title": "Gaming Laptop High Performance",
        "price": "89999.99",
        "distance_km": 5.67,
        "category_name": "Laptops",
        "seller_name": "Gaming Hub",
        "created_at": "2026-01-03T14:20:00.000Z"
      }
    ],
    "total": 8,
    "page": 1,
    "limit": 10,
    "location_data": {
      "user_location": {
        "latitude": 19.076,
        "longitude": 72.8777
      },
      "search_radius_km": 25,
      "results_with_distance": true
    }
  }
}
```

**Algorithm:**
- Uses **Haversine formula** for accurate distance calculation
- JavaScript-based implementation (not PostgreSQL raw SQL)
- Products sorted by distance (nearest first)
- Only returns products with valid location coordinates

**Error Responses:**
```json
// 400 Bad Request - Missing Coordinates
{
  "success": false,
  "message": "Latitude and longitude are required for nearby search"
}
```

---

### Near Me

Auto-location based search using the user's saved primary address.

**Endpoint:** `GET /api/v1/sell/near-me`

**Authentication:** Required

**Query Parameters:**
- `radius` (number, optional): Search radius in km, default: 50
- `category_id` (UUID, optional): Filter by category
- `condition` (string, optional): Filter by condition
- `limit` (number, optional): Results per page, default: 20
- `page` (number, optional): Page number, default: 1

**Example Request:**
```bash
GET /api/v1/sell/near-me?radius=30&category_id=a1b2c3d4-e5f6-7890-abcd-ef1234567890
Authorization: Bearer <your_jwt_token>
```

**Response (200 OK):**
```json
{
  "success": true,
  "message": "Found 12 products near your location",
  "data": {
    "products": [
      {
        "id": "f1e2d3c4-b5a6-7890-1234-567890abcdef",
        "title": "Premium Smartphone Pro Max 2024",
        "price": "45999.99",
        "distance_km": 3.45,
        "created_at": "2026-01-04T06:24:00.000Z"
      }
    ],
    "total": 12,
    "page": 1,
    "limit": 20,
    "user_location": {
      "address": "Mumbai, Maharashtra",
      "coordinates": {
        "latitude": 19.076,
        "longitude": 72.8777
      }
    },
    "search_radius_km": 30
  }
}
```

**Error Responses:**
```json
// 400 Bad Request - No Address Found
{
  "success": false,
  "message": "No address with coordinates found. Please add your location to see nearby products.",
  "suggestion": "Update your address with location details for location-based recommendations."
}
```

---

### Set Location

Save or update the user's location for auto-discovery features.

**Endpoint:** `POST /api/v1/sell/set-location`

**Authentication:** Required

**Request Body:**
```json
{
  "latitude": 19.0760,
  "longitude": 72.8777,
  "city": "Mumbai",
  "state": "Maharashtra",
  "country": "India",
  "address_line": "Andheri West, Mumbai"
}
```

**Validation Rules:**
- `latitude`: Required, number between -90 and 90
- `longitude`: Required, number between -180 and 180
- `city`: Optional, string
- `state`: Optional, string
- `country`: Optional, defaults to "India"
- `address_line`: Optional, string

**Response (200 OK):**
```json
{
  "success": true,
  "message": "Location updated successfully",
  "data": {
    "address_id": "addr-uuid-here",
    "latitude": 19.076,
    "longitude": 72.8777,
    "city": "Mumbai",
    "state": "Maharashtra",
    "is_default": true
  }
}
```

**Notes:**
- Automatically sets the new location as the default
- Existing default location is unmarked
- Creates a new UserAddress entry or updates existing

---

### My Locations

Get all saved locations for the authenticated user.

**Endpoint:** `GET /api/v1/sell/my-locations`

**Authentication:** Required

**Example Request:**
```bash
GET /api/v1/sell/my-locations
Authorization: Bearer <your_jwt_token>
```

**Response (200 OK):**
```json
{
  "success": true,
  "message": "User locations retrieved successfully",
  "data": {
    "addresses": [
      {
        "id": "addr-uuid-1",
        "latitude": 19.076,
        "longitude": 72.8777,
        "city": "Mumbai",
        "state": "Maharashtra",
        "country": "India",
        "address_line": "Andheri West, Mumbai",
        "is_default": true,
        "created_at": "2026-01-04T06:00:00.000Z"
      },
      {
        "id": "addr-uuid-2",
        "latitude": 28.7041,
        "longitude": 77.1025,
        "city": "Delhi",
        "state": "Delhi",
        "country": "India",
        "address_line": "Connaught Place, Delhi",
        "is_default": false,
        "created_at": "2026-01-02T10:30:00.000Z"
      }
    ],
    "has_location": true
  }
}
```

---

### Recommendations

Get location-aware product recommendations with distance-based zones.

**Endpoint:** `GET /api/v1/sell/recommendations`

**Authentication:** Public

**Query Parameters:**
- `latitude` (number, required): User's latitude
- `longitude` (number, required): User's longitude
- `category_id` (UUID, optional): Filter by category
- `limit` (number, optional): Max results, default: 10
- `max_price` (number, optional): Maximum price filter
- `exclude_seller_id` (UUID, optional): Exclude products from specific seller

**Example Request:**
```bash
GET /api/v1/sell/recommendations?latitude=19.0760&longitude=72.8777&limit=15&category_id=a1b2c3d4-e5f6-7890-abcd-ef1234567890
```

**Response (200 OK):**
```json
{
  "success": true,
  "message": "Found 15 recommendations near your location",
  "data": {
    "recommendations": [
      {
        "id": "f1e2d3c4-b5a6-7890-1234-567890abcdef",
        "title": "Premium Smartphone Pro Max 2024",
        "price": "45999.99",
        "distance_km": 2.34,
        "price_category": "premium",
        "category": {
          "id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
          "name": "Mobile Phones"
        },
        "seller": {
          "id": "seller-uuid",
          "name": "TechStore Pro"
        }
      }
    ],
    "zones": {
      "nearby": {
        "count": 5,
        "max_distance": "10km"
      },
      "local": {
        "count": 7,
        "max_distance": "50km"
      },
      "regional": {
        "count": 3,
        "max_distance": "100km"
      }
    },
    "user_location": {
      "latitude": 19.076,
      "longitude": 72.8777
    },
    "algorithm": "distance + recency + featured"
  }
}
```

**Recommendation Algorithm:**
1. **Distance Priority:** Nearest products ranked first
2. **Recency:** Recently listed products get higher priority
3. **Featured Status:** Featured products boosted in rankings
4. **Price Categories:** Grouped as budget/mid-range/premium

**Distance Zones:**
- **Nearby:** 0-10 km
- **Local:** 10-50 km
- **Regional:** 50+ km

---

## Search & Filtering

### Advanced Search

Search products with full-text search and multiple filters.

**Endpoint:** `GET /api/v1/sell/search`

**Authentication:** Public

**Query Parameters:**
- `q` (string, optional): Search query (searches title, description, brand, model)
- `category_id` (UUID, optional): Filter by category
- `min_price` (number, optional): Minimum price
- `max_price` (number, optional): Maximum price
- `condition` (string, optional): Filter by condition
- `brand` (string, optional): Filter by brand
- `location` (string, optional): Location filter
- `latitude` (number, optional): For distance-based sorting
- `longitude` (number, optional): For distance-based sorting
- `radius` (number, optional): Search radius in km, default: 50
- `page` (number, optional): Page number, default: 1
- `limit` (number, optional): Results per page, default: 20

**Example Request:**
```bash
GET /api/v1/sell/search?q=smartphone&category_id=a1b2c3d4-e5f6-7890-abcd-ef1234567890&min_price=20000&max_price=60000&condition=new&page=1&limit=20
```

**Response (200 OK):**
```json
{
  "success": true,
  "message": "Product search completed",
  "data": {
    "products": [
      {
        "id": "f1e2d3c4-b5a6-7890-1234-567890abcdef",
        "title": "Premium Smartphone Pro Max 2024",
        "description": "Latest flagship smartphone...",
        "price": "45999.99",
        "currency": "INR",
        "condition": "new",
        "brand": "TechBrand",
        "images": ["https://storage.example.com/products/smartphone-front.jpg"],
        "category": {
          "id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
          "name": "Mobile Phones"
        },
        "seller": {
          "id": "seller-uuid",
          "name": "TechStore Pro"
        },
        "created_at": "2026-01-04T06:24:00.000Z"
      }
    ],
    "total": 45,
    "page": 1,
    "limit": 20
  }
}
```

**Search Features:**
- **Full-text search:** Searches across title, description, brand, and model
- **Case-insensitive:** Uses PostgreSQL `ILIKE` operator
- **Multiple filters:** Combine category, price, condition, brand
- **Location-aware:** Optional distance-based results when coordinates provided

---

## Category Templates

### Get Category Schema

Retrieve the dynamic form schema for a specific category.

**Endpoint:** `GET /api/v1/sell/category-schema/:category_id`

**Authentication:** Required

**URL Parameters:**
- `category_id` (UUID): Category ID

**Example Request:**
```bash
GET /api/v1/sell/category-schema/a1b2c3d4-e5f6-7890-abcd-ef1234567890
Authorization: Bearer <your_jwt_token>
```

**Response (200 OK):**
```json
{
  "success": true,
  "message": "Category schema retrieved successfully",
  "data": {
    "category_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
    "template_id": "template-uuid-here",
    "template_name": "Mobile Phones Template",
    "template_description": "Schema for mobile phone listings",
    "schema": {
      "sections": [
        {
          "name": "Basic Specifications",
          "order": 1,
          "fields": [
            {
              "name": "brand",
              "label": "Brand",
              "type": "text",
              "required": true,
              "placeholder": "e.g., Samsung, Apple, OnePlus"
            },
            {
              "name": "model",
              "label": "Model",
              "type": "text",
              "required": true,
              "placeholder": "e.g., Galaxy S24, iPhone 15 Pro"
            },
            {
              "name": "storage",
              "label": "Storage Capacity",
              "type": "select",
              "required": true,
              "options": ["64GB", "128GB", "256GB", "512GB", "1TB"]
            },
            {
              "name": "ram",
              "label": "RAM",
              "type": "select",
              "required": true,
              "options": ["4GB", "6GB", "8GB", "12GB", "16GB"]
            },
            {
              "name": "color",
              "label": "Color",
              "type": "text",
              "required": true
            }
          ]
        },
        {
          "name": "Technical Details",
          "order": 2,
          "fields": [
            {
              "name": "screen_size",
              "label": "Screen Size",
              "type": "text",
              "required": false,
              "placeholder": "e.g., 6.7 inches"
            },
            {
              "name": "battery",
              "label": "Battery Capacity",
              "type": "text",
              "required": false,
              "placeholder": "e.g., 5000mAh"
            },
            {
              "name": "network",
              "label": "Network Support",
              "type": "select",
              "required": true,
              "options": ["4G", "5G"]
            },
            {
              "name": "warranty",
              "label": "Warranty Period",
              "type": "text",
              "required": false,
              "placeholder": "e.g., 1 year, 2 years"
            }
          ]
        }
      ]
    },
    "assigned_by": "admin-uuid",
    "assigned_at": "2025-12-15T10:00:00.000Z"
  }
}
```

**Response (404 Not Found):**
```json
{
  "success": false,
  "message": "No schema template found for this category"
}
```

**Usage:**
1. Call this endpoint before creating a product
2. Use the schema to generate dynamic form fields in your frontend
3. Collect user input based on the field definitions
4. Submit the collected data in `dynamic_attributes` when creating the product

---

## Error Handling

### Standard Error Response Format

All errors follow this structure:

```json
{
  "success": false,
  "message": "Human-readable error message",
  "error": "Detailed error information (optional)"
}
```

### HTTP Status Codes

| Code | Meaning | Usage |
|------|---------|-------|
| `200` | OK | Successful GET/PUT/DELETE |
| `201` | Created | Successful POST (resource created) |
| `400` | Bad Request | Validation errors, invalid input |
| `401` | Unauthorized | Missing or invalid authentication |
| `403` | Forbidden | Authenticated but lacks permission |
| `404` | Not Found | Resource doesn't exist |
| `500` | Internal Server Error | Server-side error |

### Common Error Scenarios

**Validation Errors:**
```json
{
  "success": false,
  "message": "Validation failed",
  "error": "\"productName\" is required, \"product_price\" must be a positive number"
}
```

**Authentication Errors:**
```json
{
  "success": false,
  "message": "Authentication required"
}
```

**Permission Errors:**
```json
{
  "success": false,
  "message": "Product not found or access denied"
}
```

**Category Template Validation:**
```json
{
  "success": false,
  "message": "Category template validation failed",
  "error": "Brand is required for this category, Storage must be a number"
}
```

---

## Rate Limiting

### Standard Rate Limits

- **Authenticated Endpoints:** 100 requests per 15 minutes per user
- **Public Search Endpoints:** 30 requests per 1 minute per IP
- **Product Creation:** 20 requests per 15 minutes per user

### Rate Limit Headers

```http
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1704355200
```

### Rate Limit Exceeded Response

```json
{
  "success": false,
  "message": "Too many requests from this IP, please try again later"
}
```

---

## Examples

### Example 1: Complete Product Listing Flow

```javascript
// Step 1: Get category schema
const schemaResponse = await fetch(
  'https://api.ebidportal.com/api/v1/sell/category-schema/a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  {
    headers: {
      'Authorization': 'Bearer YOUR_JWT_TOKEN'
    }
  }
);
const schema = await schemaResponse.json();

// Step 2: Create product with dynamic attributes
const productData = {
  productName: "Premium Smartphone Pro Max 2024",
  description: "Latest flagship smartphone with cutting-edge technology",
  category_id: "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  product_price: 45999.99,
  currency: "INR",
  quantity: 25,
  condition: "new",
  images: [
    "https://storage.example.com/products/smartphone-front.jpg",
    "https://storage.example.com/products/smartphone-back.jpg"
  ],
  dynamic_attributes: {
    brand: "TechBrand",
    model: "Pro Max 2024",
    storage: "256GB",
    ram: "12GB",
    color: "Midnight Blue",
    network: "5G",
    warranty: "2 years"
  },
  location: {
    latitude: 19.0760,
    longitude: 72.8777,
    city: "Mumbai",
    state: "Maharashtra"
  },
  shipping_included: true
};

const createResponse = await fetch(
  'https://api.ebidportal.com/api/v1/sell',
  {
    method: 'POST',
    headers: {
      'Authorization': 'Bearer YOUR_JWT_TOKEN',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(productData)
  }
);
const product = await createResponse.json();
console.log('Product created:', product.data.id);
```

### Example 2: Location-Based Search

```javascript
// Get user's current location
navigator.geolocation.getCurrentPosition(async (position) => {
  const { latitude, longitude } = position.coords;
  
  // Search nearby products
  const response = await fetch(
    `https://api.ebidportal.com/api/v1/sell/nearby?latitude=${latitude}&longitude=${longitude}&radius=25&category_id=a1b2c3d4-e5f6-7890-abcd-ef1234567890&limit=20`,
    {
      headers: {
        'Content-Type': 'application/json'
      }
    }
  );
  
  const data = await response.json();
  console.log(`Found ${data.data.total} products within 25km`);
  console.log('Products:', data.data.products);
});
```

### Example 3: Update Product Price

```javascript
const productId = 'f1e2d3c4-b5a6-7890-1234-567890abcdef';

const updateData = {
  product_price: 42999.99,
  status: 'active'
};

const response = await fetch(
  `https://api.ebidportal.com/api/v1/sell/${productId}`,
  {
    method: 'PUT',
    headers: {
      'Authorization': 'Bearer YOUR_JWT_TOKEN',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(updateData)
  }
);

const result = await response.json();
console.log('Product updated:', result.data);
```

### Example 4: Get My Listings with Filtering

```javascript
const response = await fetch(
  'https://api.ebidportal.com/api/v1/sell/my-listings?page=1&limit=20&status=active',
  {
    headers: {
      'Authorization': 'Bearer YOUR_JWT_TOKEN'
    }
  }
);

const data = await response.json();
console.log(`Total listings: ${data.data.total}`);
console.log('Active products:', data.data.products);
```

### Example 5: Advanced Search with Multiple Filters

```javascript
const searchParams = new URLSearchParams({
  q: 'smartphone',
  category_id: 'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  min_price: 20000,
  max_price: 60000,
  condition: 'new',
  brand: 'TechBrand',
  page: 1,
  limit: 20
});

const response = await fetch(
  `https://api.ebidportal.com/api/v1/sell/search?${searchParams}`,
  {
    headers: {
      'Content-Type': 'application/json'
    }
  }
);

const data = await response.json();
console.log('Search results:', data.data.products);
```

---

## Best Practices

### 1. **Always Validate Input**
- Use the category schema endpoint before creating products
- Validate all required fields on the frontend
- Handle validation errors gracefully

### 2. **Optimize Images**
- Upload images to Firebase Storage or CDN
- Use optimized image URLs
- Provide multiple image angles

### 3. **Location Data**
- Always include location coordinates for better discoverability
- Use accurate GPS coordinates
- Save user's location for faster listings

### 4. **Error Handling**
- Always check the `success` field in responses
- Display user-friendly error messages
- Log errors for debugging

### 5. **Performance**
- Use pagination for large result sets
- Cache category schemas
- Implement debouncing for search inputs

### 6. **Security**
- Never expose JWT tokens in client-side code
- Validate user permissions before updates/deletes
- Sanitize user input

---

## Support

For API support and questions:
- **Email:** api-support@ebidportal.com
- **Documentation:** https://docs.ebidportal.com
- **Status Page:** https://status.ebidportal.com

---

**Last Updated:** January 4, 2026  
**API Version:** 3.2.6  
**Documentation Version:** 1.0.0
