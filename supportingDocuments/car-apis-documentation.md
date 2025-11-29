# 🚗 Car Management APIs Documentation

**Version:** 1.0.0
**Last Updated:** November 29, 2025
**Base URL:** `https://api.ebidportal.com/api/v1/cars`
**Authentication:** Bearer JWT tokens required for all endpoints

## Table of Contents

- [Authentication](#authentication)
- [Brands APIs](#brands-apis)
- [Models APIs](#models-apis)
- [Variants APIs](#variants-apis)
- [Search APIs](#search-apis)
- [Analytics APIs](#analytics-apis)
- [System Management APIs](#system-management-apis)
- [Cascading Dropdown Flow](#cascading-dropdown-flow)

---

## Authentication

All endpoints require JWT authentication:

```http
Authorization: Bearer <your_jwt_token>
Content-Type: application/json
```

---

## Brands APIs

### Get All Brands
```http
GET /api/v1/cars/brands
```

### Get Featured Brands
```http
GET /api/v1/cars/brands/featured
```

### Get Brand Statistics
```http
GET /api/v1/cars/brands/statistics
```

### Bulk Import Brands (Admin)
```http
POST /api/v1/cars/brands/bulk
```

---

## Models APIs

### Get All Models
```http
GET /api/v1/cars/models
```

### Get Models by Brand (Cascading)
```http
GET /api/v1/cars/brands/{brandId}/models
```

### Get Featured Models
```http
GET /api/v1/cars/models/featured
```

### Get Model Categories
```http
GET /api/v1/cars/models/categories
```

### Get Model Statistics
```http
GET /api/v1/cars/models/statistics
```

### Bulk Import Models (Admin)
```http
POST /api/v1/cars/models/bulk
```

---

## Variants APIs

### Get All Variants
```http
GET /api/v1/cars/variants
```

### Get Variants by Model (Cascading)
```http
GET /api/v1/cars/models/{modelId}/variants
```

### Get Featured Variants
```http
GET /api/v1/cars/variants/featured
```

### Get Fuel Types
```http
GET /api/v1/cars/variants/fuel-types
```

### Get Transmission Types
```http
GET /api/v1/cars/variants/transmissions
```

### Get Price Ranges
```http
GET /api/v1/cars/variants/price-ranges
```

### Get Performance Data
```http
GET /api/v1/cars/variants/performance
```

### Get Variant Statistics
```http
GET /api/v1/cars/variants/statistics
```

### Bulk Import Variants (Admin)
```http
POST /api/v1/cars/variants/bulk
```

---

## Search APIs

### Search Cars
```http
GET /api/v1/cars/search
```
**Query Parameters:**
- `query` - Search term
- `brand` - Brand ID filter
- `model` - Model ID filter
- `year_min` - Minimum year
- `year_max` - Maximum year
- `price_min` - Minimum price
- `price_max` - Maximum price
- `limit` - Results limit (default: 50)

### Batch Search
```http
GET /api/v1/cars/search/batch
```

### Quick Search
```http
GET /api/v1/cars/search/quick?q=search_term
```

### Clear Search Cache (Admin)
```http
DELETE /api/v1/cars/search/cache
```

### Get Search Facets
```http
GET /api/v1/cars/search/facets
```

### Get Popular Searches
```http
GET /api/v1/cars/search/popular
```

### Get Search Suggestions
```http
GET /api/v1/cars/search/suggestions?query=partial_term
```

### Get Search Trends
```http
GET /api/v1/cars/search/trends
```

---

## Analytics APIs

### Get Analytics Reports
```http
GET /api/v1/cars/analytics/reports
```

### Get Analytics Trends
```http
GET /api/v1/cars/analytics/trends
```

### Get Analytics Overview
```http
GET /api/v1/cars/analytics/overview
```

### Get Performance Analytics
```http
GET /api/v1/cars/analytics/performance
```

### Get Analytics Health
```http
GET /api/v1/cars/analytics/health
```

---

## System Management APIs (Admin Only)

### Get System Status
```http
GET /api/v1/cars/system/status
```

### Get System Metrics
```http
GET /api/v1/cars/system/metrics
```

### Seed System Data
```http
POST /api/v1/cars/system/seed
```

### Reset System (Super Admin)
```http
POST /api/v1/cars/system/reset
```

---

## Cascading Dropdown Flow

### Frontend Implementation Flow:

1. **Load Brands**
   ```http
   GET /api/v1/cars/brands
   ```

2. **Load Models for Selected Brand**
   ```http
   GET /api/v1/cars/brands/{brandId}/models
   ```

3. **Load Variants for Selected Model**
   ```http
   GET /api/v1/cars/models/{modelId}/variants
   ```

### Response Format:

All endpoints return JSON with consistent structure:
```json
{
  "success": true,
  "data": [...],
  "message": "Optional message"
}
```

### Error Response:
```json
{
  "success": false,
  "error": {
    "code": "ERROR_CODE",
    "message": "Error description"
  }
}
```

---

## Rate Limiting

- **Public endpoints:** 50 requests per 15 minutes
- **Authenticated endpoints:** 100 requests per 15 minutes
- **Admin endpoints:** 200 requests per 15 minutes
- **Search endpoints:** 60 requests per minute

---

## Testing

Run the test script to verify all APIs:
```bash
node test-cascading-apis.js
```

This will test the complete cascading dropdown flow and confirm all endpoints are working.

---

**Note:** All endpoints require proper JWT authentication. Admin-only endpoints require appropriate role permissions.</content>
<parameter name="filePath">/Volumes/ManishData/ManishPersonal/eBidPortal_2/eBidPortal_Apis/Docs/car-apis-documentation.md



Your API documentation confirms that the changes I made are correct. The endpoints use path parameters as follows:

Models by Brand: GET /api/v1/cars/brands/{brandId}/models
Variants by Model: GET /api/v1/cars/models/{modelId}/variants
With my updates:

Brand field now loads from /cars/brands and uses id as the value
Model field uses /cars/brands/{brand}/models where {brand} gets replaced with the selected brand's ID
Variant field uses /cars/models/{model}/variants where {model} gets replaced with the selected model's ID
No query parameters are added for cascading fields - only path parameters
The full URL construction will be:

https://api.ebidportal.com/api/v1/cars/brands/{brandId}/models
https://api.ebidportal.com/api/v1/cars/models/{modelId}/variants
This matches your documentation exactly. The previous 500 error was due to using the brand name "Tata" instead of the brand ID in the path, which should now be resolved.


https://api.ebidportal.com/api/v1/cars/brands/f9c2817f-a229-4690-87d9-88f0026bc318/models