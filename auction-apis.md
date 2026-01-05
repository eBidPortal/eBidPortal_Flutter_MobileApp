All Auction APIs Used in the Application
Here are all the APIs used for Auction Operations in the application. These are organized by service and include both auction management and bidding functionality:

Base URL: https://api.ebidportal.com/api/v1/ (already included in apiClient base URL)

Auction Management APIs (auctionService.ts)
GET auctions - List all auctions with filtering and pagination
GET auctions/{id} - Get auction details by ID
POST auctions - Create new auction
PUT auctions/{id} - Update auction details
DELETE auctions/{id} - Delete auction
PUT auctions/{id}/approve - Approve auction
PUT auctions/{id}/cancel - Cancel auction
PUT auctions/{id}/flag - Flag auction for review
GET auctions/active - Get active auctions
GET auctions/ending-soon - Get auctions ending soon
GET auctions/{id}/history - Get auction bidding history
GET auctions/{id}/similar - Get similar auctions
GET auctions/templates - Get auction templates
POST auctions/from-template/{id} - Create auction from template
GET auctions/{id}/questions - Get auction questions
POST auctions/{auctionId}/questions - Ask question about auction
PUT questions/{questionId}/answer - Answer auction question
GET auctions/{id}/shipping - Get auction shipping options
PUT auctions/{id}/end - End auction manually
PUT auctions/{id}/extend - Extend auction duration

V1 Simplified Auction APIs (auctionService.ts)
GET auctions - List auctions (V1 API)
GET auctions/{id} - Get auction by ID (V1 API)
POST auctions - Create auction (V1 API)
PUT auctions/{id} - Update auction (V1 API)
DELETE auctions/{id} - Delete auction (V1 API)
GET auctions/search/attributes - Search auction attributes
POST auctions/{id}/clone - Clone auction
POST auctions/bulk/status - Bulk update auction status
GET auctions/my - Get user's auctions
GET auctions/stats/overview - Get auction statistics overview

Bidding APIs (biddingService.ts)
POST bids - Place a bid on an auction
GET bids/auction/{auctionId} - Get all bids for specific auction
GET bids/my-bids - Get user's bids
GET bids/user/{userId} - Get bids by user ID
GET bids/auction/{auctionId}/statistics - Get bid statistics for auction
DELETE bids/{bidId}/cancel - Cancel a bid

Category & Schema APIs (auctionService.ts)
GET catalog/categories - Get all categories
GET catalog/categories/{categoryId}/schema - Get category schema

Complete API Endpoints with Full URLs
When combined with the base URL (https://api.ebidportal.com/api/v1/), the complete endpoints are:

Auction CRUD Operations
GET    https://api.ebidportal.com/api/v1/auctions
GET    https://api.ebidportal.com/api/v1/auctions/{id}
POST   https://api.ebidportal.com/api/v1/auctions
PUT    https://api.ebidportal.com/api/v1/auctions/{id}
DELETE https://api.ebidportal.com/api/v1/auctions/{id}

Auction Status Management
PUT    https://api.ebidportal.com/api/v1/auctions/{id}/approve
PUT    https://api.ebidportal.com/api/v1/auctions/{id}/cancel
PUT    https://api.ebidportal.com/api/v1/auctions/{id}/flag

Auction Discovery & Listing
GET    https://api.ebidportal.com/api/v1/auctions/active
GET    https://api.ebidportal.com/api/v1/auctions/ending-soon
GET    https://api.ebidportal.com/api/v1/auctions/{id}/history
GET    https://api.ebidportal.com/api/v1/auctions/{id}/similar
GET    https://api.ebidportal.com/api/v1/auctions/templates
POST   https://api.ebidportal.com/api/v1/auctions/from-template/{id}

Auction Communication
GET    https://api.ebidportal.com/api/v1/auctions/{id}/questions
POST   https://api.ebidportal.com/api/v1/auctions/{auctionId}/questions
PUT    https://api.ebidportal.com/api/v1/questions/{questionId}/answer

Live Auction Operations
POST   https://api.ebidportal.com/api/v1/bids
PUT    https://api.ebidportal.com/api/v1/auctions/{id}/end
PUT    https://api.ebidportal.com/api/v1/auctions/{id}/extend
GET    https://api.ebidportal.com/api/v1/auctions/{id}/shipping

Bidding System
GET    https://api.ebidportal.com/api/v1/bids/auction/{auctionId}
GET    https://api.ebidportal.com/api/v1/bids/my-bids
GET    https://api.ebidportal.com/api/v1/bids/user/{userId}
GET    https://api.ebidportal.com/api/v1/bids/auction/{auctionId}/statistics
DELETE https://api.ebidportal.com/api/v1/bids/{bidId}/cancel

V1 Simplified APIs
GET    https://api.ebidportal.com/api/v1/auctions/search/attributes
POST   https://api.ebidportal.com/api/v1/auctions/{id}/clone
POST   https://api.ebidportal.com/api/v1/auctions/bulk/status
GET    https://api.ebidportal.com/api/v1/auctions/my
GET    https://api.ebidportal.com/api/v1/auctions/stats/overview

Categories
GET    https://api.ebidportal.com/api/v1/catalog/categories
GET    https://api.ebidportal.com/api/v1/catalog/categories/{categoryId}/schema