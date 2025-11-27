# Phase 2 Technical Specification: Catalog & Discovery

**Goal:** Implement the browsing and discovery experience, enabling users to navigate categories and search for products/auctions.

## 1. Features & Scope
*   **Category Navigation:** Tree-based navigation of categories.
*   **Auction Listing:** List active auctions with pagination and filtering.
*   **Dynamic Filtering:** Render filters based on the category schema (e.g., if "Laptops" is selected, show "RAM", "Screen Size" filters).

## 2. Architecture & Data Layer

### Repositories
*   `CatalogRepository`:
    *   `getCategories()`: Fetches the category tree (`/api/v1/catalog/categories`).
    *   `getCategorySchema(id)`: Fetches the dynamic schema for filters (`/api/v1/catalog/categories/{id}/schema`).
*   `AuctionRepository`:
    *   `getAuctions({ page, limit, categoryId, filters })`: Fetches auction list (`/api/v1/auctions`).

### State Management (Riverpod)
*   `categoriesProvider`: `FutureProvider` that caches the category tree.
*   `auctionListProvider`: `AsyncNotifier` that handles pagination and filter state.
*   `filterStateProvider`: Stores the currently selected filters (Map<String, dynamic>).

## 3. UI Components

### Screens
*   **CategoryScreen:**
    *   Displays top-level categories as Cards/Grid.
    *   Drills down into sub-categories.
*   **AuctionListScreen:**
    *   **Header:** Search bar + Filter button.
    *   **Body:** Infinite scroll grid of `AuctionCard`s.
    *   **Drawer/Modal:** Filter UI generated from Schema.

### Widgets
*   `AuctionCard`: Displays image, title, current bid, and "Ending Soon" timer.
*   `DynamicFilterWidget`:
    *   Takes a `SchemaField` (from API) and renders the appropriate input (Dropdown, Range Slider, Checkbox).

## 4. API Integration Details

### Categories
*   **Endpoint:** `GET /api/v1/catalog/categories`
*   **Response:** List of Category objects (id, name, image, children[]).

### Auctions
*   **Endpoint:** `GET /api/v1/auctions`
*   **Params:** `page`, `limit`, `category_id`, `search`, `min_price`, `max_price`, `attributes` (JSON for dynamic filters).

## 5. Implementation Steps
1.  Create `CatalogRepository` and `AuctionRepository`.
2.  Create Domain Entities (`Category`, `Auction`, `Schema`).
3.  Implement `CategoryScreen` (Grid View).
4.  Implement `AuctionListScreen` (Basic List).
5.  Implement `DynamicFilterWidget` (Advanced).
