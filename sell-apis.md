All Sell APIs Used in the Application
Here are all the APIs used for the sell functionality in sellService.ts. These are admin-level sell operations that require authentication and admin privileges:

Base URL: https://api.ebidportal.com/api/v1/ (already included in apiClient base URL)
Product Management APIs
GET sell/admin/all - List all products (admin view)
GET sell/admin/{id} - Get product details by ID
PUT sell/admin/{id}/status - Update product status
PUT sell/admin/{id} - Update product details
DELETE sell/admin/{id} - Delete product
Bulk Operations APIs
POST sell/admin/bulk/status - Bulk update product status
POST sell/admin/bulk/delete - Bulk delete products
Analytics & Statistics APIs
GET sell/admin/stats - Get sell statistics
GET sell/admin/analytics - Get sell analytics
GET sell/admin/sellers/performance - Get seller performance metrics
GET sell/admin/categories/performance - Get category performance metrics
Moderation & Quality Control APIs
POST sell/admin/{id}/flag - Flag product for review
GET sell/admin/flagged - Get flagged products
PUT sell/admin/flags/{flagId}/resolve - Resolve product flag
GET sell/admin/live - Get live products
GET sell/admin/moderation - Get products needing moderation
POST sell/admin/moderation/{productId} - Moderate product
Export & Reporting APIs
GET sell/admin/export - Export products data
GET sell/admin/export/download/{exportId} - Download export file
GET sell/admin/reports - Get sell reports
POST sell/admin/reports/export - Export sell reports
Complete API Endpoints with Full URLs
When combined with the base URL (https://api.ebidportal.com/api/v1/), the complete endpoints are:

GET    https://api.ebidportal.com/api/v1/sell/admin/all
GET    https://api.ebidportal.com/api/v1/sell/admin/{id}
PUT    https://api.ebidportal.com/api/v1/sell/admin/{id}/status
PUT    https://api.ebidportal.com/api/v1/sell/admin/{id}
DELETE https://api.ebidportal.com/api/v1/sell/admin/{id}
POST   https://api.ebidportal.com/api/v1/sell/admin/bulk/status
POST   https://api.ebidportal.com/api/v1/sell/admin/bulk/delete
GET    https://api.ebidportal.com/api/v1/sell/admin/stats
GET    https://api.ebidportal.com/api/v1/sell/admin/analytics
GET    https://api.ebidportal.com/api/v1/sell/admin/sellers/performance
GET    https://api.ebidportal.com/api/v1/sell/admin/categories/performance
POST   https://api.ebidportal.com/api/v1/sell/admin/{id}/flag
GET    https://api.ebidportal.com/api/v1/sell/admin/flagged
PUT    https://api.ebidportal.com/api/v1/sell/admin/flags/{flagId}/resolve
GET    https://api.ebidportal.com/api/v1/sell/admin/export
GET    https://api.ebidportal.com/api/v1/sell/admin/export/download/{exportId}
GET    https://api.ebidportal.com/api/v1/sell/admin/live
GET    https://api.ebidportal.com/api/v1/sell/admin/moderation
POST   https://api.ebidportal.com/api/v1/sell/admin/moderation/{productId}
GET    https://api.ebidportal.com/api/v1/sell/admin/reports
POST   https://api.ebidportal.com/api/v1/sell/admin/reports/export