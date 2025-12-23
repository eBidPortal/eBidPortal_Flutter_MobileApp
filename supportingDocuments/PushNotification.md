# 📱 FCM Token Registration - API Integration Steps

## Overview

This guide provides step-by-step API integration instructions for registering FCM tokens with the eBidPortal backend.

## 🔄 FCM Token Registration Flow

### **Step 1: Prerequisites**
- User must be authenticated (have valid JWT token)
- Frontend must have obtained FCM token from Firebase SDK
- FCM token should be a valid Firebase token string

### **Step 2: Register FCM Token**

**API Endpoint**: `POST /api/v1/notifications/fcm-token`

**Authentication**: Required (JWT Bearer token)

**Request Headers**:
```
Content-Type: application/json
Authorization: Bearer <your_jwt_token>
```

**Request Body** (Flexible - supports both formats):

#### **Option 1: Using 'platform' (Recommended)**
```json
{
  "fcm_token": "f5UXdky1TkOHphhkHwhsOJ:APA91bH3Pk7jrug...",
  "platform": "Web",
  "device_name": "Chrome Browser",
  "app_version": "1.0.0"
}
```

#### **Option 2: Using 'device_type' (Backward Compatibility)**
```json
{
  "fcm_token": "f5UXdky1TkOHphhkHwhsOJ:APA91bH3Pk7jrug...",
  "device_type": "Web",
  "device_name": "Chrome Browser"
}
```

**Validation Rules**:
- `fcm_token`: Required, valid FCM token string
- `platform` or `device_type`: Optional, defaults to 'Android', normalized to 'iOS'/'Android'/'Web'
- `device_name`: Optional, device/browser identifier
- `app_version`: Optional, application version

### **Step 3: Handle Success Response**

**New Registration (201 Created)**:
```json
{
  "success": true,
  "message": "FCM token registered successfully",
  "data": {
    "device_id": 5,
    "status": "created",
    "fcm_token": "f5UXdky1TkOHphhkHwhsOJ:APA91bH3Pk7jrug...",
    "platform": "Web"
  }
}
```

**Token Update (200 OK)**:
```json
{
  "success": true,
  "message": "FCM token updated successfully",
  "data": {
    "device_id": 5,
    "status": "updated",
    "fcm_token": "f5UXdky1TkOHphhkHwhsOJ:APA91bH3Pk7jrug...",
    "platform": "Web"
  }
}
```

**Actions on Success**:
- Store `device_id` for future reference
- Mark FCM registration as complete locally
- Proceed with normal app flow

### **Step 4: Handle Error Responses**

**400 Bad Request - Missing Token**:
```json
{
  "success": false,
  "message": "FCM token is required"
}
```
**Action**: Ensure FCM token is provided in request

**401 Unauthorized**:
```json
{
  "success": false,
  "message": "Authentication required"
}
```
**Action**: Refresh JWT token or re-authenticate user

**500 Internal Server Error**:
```json
{
  "success": false,
  "message": "Failed to register FCM token",
  "error": "Database connection error"
}
```
**Action**: Retry registration or show user-friendly error message

### **Step 5: Token Management**

#### **List User Devices**
**API**: `GET /api/v1/notifications/fcm-tokens`

**Response**:
```json
{
  "success": true,
  "data": {
    "tokens": [
      {
        "id": 5,
        "fcm_token": "f5UXdky1TkOHphhkHwhsOJ:APA91bH3Pk7jrug...",
        "platform": "Web",
        "app_version": "1.0.0",
        "device_name": "Chrome Browser",
        "last_seen": "2025-12-23T10:30:00.000Z",
        "registered_at": "2025-12-23T10:30:00.000Z"
      }
    ],
    "total": 1
  }
}
```

#### **Remove FCM Token**
**API**: `DELETE /api/v1/notifications/fcm-token`

**Request Body**:
```json
{
  "fcm_token": "f5UXdky1TkOHphhkHwhsOJ:APA91bH3Pk7jrug..."
}
```

**Response**:
```json
{
  "success": true,
  "message": "FCM token removed successfully",
  "data": {
    "fcm_token": "f5UXdky1TkOHphhkHwhsOJ:APA91bH3Pk7jrug...",
    "status": "removed"
  }
}
```

### **Step 6: Integration Points**

#### **After User Login**
1. Check if user already has FCM token registered
2. If not, obtain FCM token from Firebase
3. Call registration API
4. Store registration status locally

#### **On Token Refresh** (FCM rotates tokens periodically)
1. Detect token refresh event
2. Get new FCM token
3. Call registration API with new token
4. Update local storage

#### **On User Logout**
1. Optionally call token removal API
2. Clear local FCM registration status
3. Clear stored FCM token

#### **On App Launch**
1. Check authentication status
2. Check FCM registration status
3. If authenticated but no FCM token, register new one

### **Step 7: Testing Integration**

#### **Test Registration**
```bash
# Register FCM token
curl -X POST "http://localhost:3000/api/v1/notifications/fcm-token" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "fcm_token": "test_fcm_token_12345",
    "platform": "Web",
    "device_name": "Chrome Browser"
  }'
```

#### **Verify Registration**
```bash
# Check user profile for FCM tokens
curl -X GET "http://localhost:3000/api/v1/users?search=username" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

#### **Test Token Removal**
```bash
# Remove FCM token
curl -X DELETE "http://localhost:3000/api/v1/notifications/fcm-token" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"fcm_token": "test_fcm_token_12345"}'
```

## 📊 Data Storage Architecture

FCM tokens are stored in two locations:

### **user_devices Table** (Primary)
- `id`: Auto-increment primary key
- `user_id`: Foreign key to users table
- `device_token`: FCM token (unique)
- `platform`: 'iOS', 'Android', 'Web'
- `device_name`: Device/browser identifier
- `last_seen`: Last activity timestamp
- `is_active`: Boolean flag

### **users Table** (Sync)
- `fcm_token`: Latest token (for backward compatibility)
- `fcm_tokens`: JSON array of all active device tokens

## 🔧 Platform Support

| Platform | Request Value | Normalized Value |
|----------|---------------|------------------|
| iOS | `"platform": "iOS"` or `"platform": "ios"` | `"iOS"` |
| Android | `"platform": "Android"` or `"platform": "android"` | `"Android"` |
| Web | `"platform": "Web"` or `"platform": "web"` | `"Web"` |

## 📋 Integration Checklist

- [ ] Authenticate user and obtain JWT token
- [ ] Obtain FCM token from Firebase SDK
- [ ] Call `POST /api/v1/notifications/fcm-token` API
- [ ] Handle success response and store device_id
- [ ] Handle error responses appropriately
- [ ] Implement token refresh handling
- [ ] Test registration with real FCM tokens
- [ ] Verify tokens appear in user profile
- [ ] Test token removal on logout (optional)

## 🚀 Production Notes

- Use real FCM tokens (not test strings) in production
- Handle network failures with retry logic
- Implement proper error logging
- Consider rate limiting (API allows 100 requests/hour per user)
- Monitor FCM registration success rates

---

**Note**: This guide focuses on backend API integration. For frontend Firebase setup, refer to Firebase documentation.