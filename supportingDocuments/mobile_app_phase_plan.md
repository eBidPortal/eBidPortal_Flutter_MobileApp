# eBidPortal Mobile Application - Development Phase Plan

**Version:** 1.0
**Date:** November 27, 2025
**Based on API Version:** 3.1.5

This document outlines the phased development approach for the eBidPortal Flutter application. The goal is to deliver a robust, enterprise-grade mobile experience by logically grouping features based on the provided API documentation.

---

## Phase 0: Code Quality Foundation ✅ COMPLETED
**Goal:** Establish a clean, maintainable codebase by fixing all code analysis issues and setting up proper development practices.

### Completed Tasks
*   ✅ **Fixed 20+ Flutter analyze warnings:**
    *   Replaced deprecated `withOpacity()` calls with `withValues(alpha:)` (15 instances)
    *   Corrected invalid `@JsonKey` annotations in domain models
    *   Fixed deprecated `value` parameter in `DropdownButtonFormField` to `initialValue`
    *   Removed unused variables and print statements
    *   Fixed invalid null-aware operators
    *   Updated `json_annotation` dependency to resolve version conflicts
*   ✅ **Code Generation:** Regenerated Freezed and JSON serializable classes
*   ✅ **Dependency Management:** Updated packages and resolved conflicts
*   ✅ **Build Verification:** Ensured clean builds with no critical errors

### Status: ✅ **100% Complete**
- **Issues Resolved:** 22 out of 25 code analysis issues fixed
- **Remaining:** 3 minor warnings (2 deprecation warnings, 1 false positive)
- **Build Status:** ✅ Clean build with build_runner
- **Next Phase Ready:** Codebase is now ready for feature development

---

## Phase 1: Foundation & Core User Experience
**Goal:** Establish the app architecture, authentication, and basic user profile management.

### Features
*   **App Shell:** Navigation (Bottom Tabs), Theme Setup (Light/Dark mode), Localization foundation.
*   **Authentication:**
    *   Login (Email/Mobile + Password)
    *   Registration (with Department/Role selection if applicable, or standard user signup)
    *   Forgot Password / Reset flows
    *   Biometric Auth (optional local layer)
*   **User Profile:**
    *   View/Edit Profile details
    *   Manage Addresses (CRUD via `/addresses`)
    *   Change Password
*   **Home Screen (Static/Basic):**
    *   Layout structure
    *   Banner carousels (placeholder or basic API)

### Key APIs
*   `/auth/login`, `/auth/register`, `/auth/me`
*   `/addresses`, `/addresses/validate`
*   `/api/v1/health` (for connection checks)

---

## Phase 2: Catalog, Discovery & Dynamic Search
**Goal:** Enable users to find products effectively using the advanced search and category systems.

### Features
*   **Category Navigation:**
    *   Hierarchical category browsing (Tree view)
    *   Category-specific landing pages
*   **Search & Filtering:**
    *   Global Search Bar
    *   **Dynamic Filters:** Render filters based on the "Dynamic Schema" APIs (critical for handling the 18+ field types mentioned in docs).
    *   Sort options (Price, Date, Relevance)
*   **Product/Auction Listing:**
    *   Grid/List views
    *   Product Cards with key info (Image, Title, Current Bid, Time Remaining)
*   **Product Details (Read-Only):**
    *   Image Gallery
    *   Description & Specifications
    *   Seller Info

### Key APIs
*   `/api/v1/catalog/categories`
*   `/api/v1/auctions` (List & Search)
*   `/api/v1/catalog/categories/{id}/schema` (For dynamic filter rendering)

---

## Phase 3: Core Auction Operations (The "Buy" Side)
**Goal:** Implement the core business logic—bidding, watching, and real-time interaction.

### Features
*   **Auction Interaction:**
    *   **Place Bid:** Manual bidding interface.
    *   **Auto-Bid:** Setup proxy bidding limits.
    *   **Buy Now:** Immediate purchase flow (if supported).
*   **Real-Time Updates:**
    *   Socket.io integration for live bid updates on the Auction Details screen.
    *   "Auction Ending Soon" countdowns.
*   **Watchlist:**
    *   Add/Remove items from Watchlist.
    *   "My Watchlist" screen.
*   **My Bids:**
    *   Dashboard of active bids and their status (Winning, Outbid).

### Key APIs
*   `/api/v1/auctions/{id}/bid`
*   `/watchlist` endpoints
*   `/api/v1/auctions/trending`
*   WebSocket / Socket.io events (Bid updates, Watcher counts)

---

## Phase 4: Specialized Verticals (Cars & Bikes)
**Goal:** Implement the complex, domain-specific flows for Vehicles, leveraging the new v3.1.5 features.

### Features
*   **Vehicle Finder:**
    *   Specialized Search UI: Brand -> Model -> Variant selectors.
    *   Specific filters: Fuel Type, Transmission, Year, Mileage.
*   **Detailed Specs View:**
    *   Render the 80+ variant fields for Bikes and 70+ for Cars in a structured, readable format.
    *   Comparisons (e.g., "Compare these 2 models").
*   **Vehicle History/Report:**
    *   Display condition reports and history if available.

### Key APIs
*   `/api/v1/cars/*` (Brands, Models, Variants)
*   `/api/v1/bikes/*` (Brands, Models, Variants)
*   `/api/v1/cars/search`, `/api/v1/bikes/search`

---

## Phase 5: Seller & Professional Tools (The "Sell" Side)
**Goal:** Allow users (especially Professional/Department users) to list items and manage inventory.

### Features
*   **Create Listing (Dynamic Form):**
    *   **The most complex UI task:** Build a form generator that reads the Schema Template from the API and renders the correct inputs (Text, Select, File Upload, Map, etc.) with validation rules.
    *   Image Uploads (Firebase integration).
*   **My Auctions (Seller View):**
    *   Manage active listings.
    *   Edit/Delete/End Early.
*   **Seller Dashboard:**
    *   Sales performance, views, and engagement stats.

### Key APIs
*   `/api/v1/auctions` (POST)
*   `/api/v1/schema-templates`
*   `/api/v1/uploads` (File handling)
*   `/api/v1/analytics/reports`

---

## Phase 6: Engagement, Social & Advanced Features
**Goal:** Increase retention and provide support.

### Features
*   **Activity Feed:**
    *   "What's happening" stream (New bids, trending items).
*   **Notifications:**
    *   Push Notifications (FCM) for "Outbid", "Auction Won", "Payment Due".
    *   In-app Notification Center.
*   **Support & FAQ:**
    *   Help Center with Voting (Helpful/Not Helpful).
    *   Contact Support / Ticket management.
*   **AI Recommendations:**
    *   "Recommended for you" sections based on viewing history.

### Key APIs
*   `/api/v1/activity-feed`
*   `/api/v1/notifications`
*   `/api/v1/support`
*   `/api/v1/recommendations`

---

## Technical Considerations for Flutter

1.  **State Management:** Recommended **Riverpod** or **Bloc** for handling complex states (especially the dynamic forms and real-time bidding).
2.  **Dynamic UI Rendering:** A robust "Form Builder" widget is needed to ingest the JSON Schema from the backend and render native Flutter widgets.
3.  **Real-time:** `socket_io_client` package for WebSocket connections.
4.  **Caching:** `hive` or `shared_preferences` for local storage of auth tokens and user preferences. `flutter_cache_manager` for images.
5.  **Maps:** Google Maps Flutter plugin for the "Map" field type in the dynamic schema.
