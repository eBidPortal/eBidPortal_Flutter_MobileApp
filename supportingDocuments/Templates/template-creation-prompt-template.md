# eBidPortal Template Creation Prompt Template

**File:** `template-creation-prompt-template.md`
**Purpose:** Reusable prompt template for creating industry-level templates for eBidPortal marketplace categories
**Created:** November 20, 2025
**Last Updated:** November 20, 2025

---

## 📋 Reusable Prompt Template for eBidPortal Template Creation

```
**CONTEXT:** We are building industry-level templates for the eBidPortal marketplace platform. Each template follows a professional JSON structure with comprehensive fields, validation rules, and API integrations.

**CURRENT STATUS:**
- ✅ Completed Templates: Car Rentals & Taxi Services, Commercial Vehicles, Bikes (Motorcycles/Scooters/Bicycles), Spare Parts & Accessories, Vehicle Insurance & Financing
- 📍 Next Template: [CATEGORY NAME TO CREATE]
- 🎯 Pattern: Industry-level coverage with 6-7 sections, 50+ fields, professional specifications, regulatory compliance, and business features

**TASK:** Create a comprehensive, industry-level template for "[CATEGORY NAME]" following the established pattern.

**REQUIREMENTS:**
- Industry-standard specifications and terminology
- Professional field validation and UI configurations
- Regulatory compliance and certifications where applicable
- Business terms, pricing models, and commercial features
- Contact information and documentation sections
- API integration points with existing eBidPortal systems
- Comprehensive field coverage for B2B marketplace transactions

**DELIVERABLES:**
- Complete JSON template structure with all sections and fields
- Professional documentation with feature explanations
- API integration details and usage examples
- Industry-specific validation rules and business logic

**OUTPUT FORMAT:**
- Save as: `/Volumes/ManishData/ManishPersonal/eBidPortal_2/eBidPortal_Apis/Docs/Templates/[category-name]-template.md`
- Include: Template JSON, Features summary, API Integration points, Implementation notes, Usage examples

**START CREATION:** Create the "[CATEGORY NAME]" template now.
```

---

## 🔄 How to Use This Prompt Template:

### Step 1: Copy the Template
Copy the entire prompt template block above (between the triple backticks).

### Step 2: Customize for Your Category
Replace the following placeholders:
- `[CATEGORY NAME TO CREATE]` → Your desired category (e.g., "Real Estate Properties")
- `[CATEGORY NAME]` → Same category name in the task description
- `[category-name]` → Kebab-case version for filename (e.g., "real-estate-properties")

### Step 3: Update Status (Optional)
If we've completed more templates, update the "Completed Templates" list.

### Step 4: Paste and Execute
Paste the customized prompt into your next message to start template creation.

---

## 📝 Example Usage:

**For "Real Estate Properties" template:**

```
**CONTEXT:** We are building industry-level templates for the eBidPortal marketplace platform. Each template follows a professional JSON structure with comprehensive fields, validation rules, and API integrations.

**CURRENT STATUS:**
- ✅ Completed Templates: Car Rentals & Taxi Services, Commercial Vehicles, Bikes (Motorcycles/Scooters/Bicycles), Spare Parts & Accessories, Vehicle Insurance & Financing
- 📍 Next Template: Real Estate Properties
- 🎯 Pattern: Industry-level coverage with 6-7 sections, 50+ fields, professional specifications, regulatory compliance, and business features

**TASK:** Create a comprehensive, industry-level template for "Real Estate Properties" following the established pattern.

**REQUIREMENTS:**
- Industry-standard specifications and terminology
- Professional field validation and UI configurations
- Regulatory compliance and certifications where applicable
- Business terms, pricing models, and commercial features
- Contact information and documentation sections
- API integration points with existing eBidPortal systems
- Comprehensive field coverage for B2B marketplace transactions

**DELIVERABLES:**
- Complete JSON template structure with all sections and fields
- Professional documentation with feature explanations
- API integration details and usage examples
- Industry-specific validation rules and business logic

**OUTPUT FORMAT:**
- Save as: `/Volumes/ManishData/ManishPersonal/eBidPortal_2/eBidPortal_Apis/Docs/Templates/real-estate-properties-template.md`
- Include: Template JSON, Features summary, API Integration points, Implementation notes, Usage examples

**START CREATION:** Create the "Real Estate Properties" template now.
```

---

## 🎯 Template Creation Pattern Summary:

### **Standard Structure:**
1. **Service/Product Information** - Basic identification and classification
2. **Technical Specifications** - Industry-specific details and requirements
3. **Compatibility/Applications** - Usage contexts and limitations
4. **Quality & Certification** - Standards, compliance, and approvals
5. **Business & Pricing** - Commercial terms and pricing models
6. **Contact & Documentation** - Contact details and supporting files

### **Field Types Used:**
- `text` - Single line text input
- `textarea` - Multi-line text input
- `select` - Dropdown selection
- `radio` - Single choice selection
- `checkbox` - Multiple choice selection
- `number` - Numeric input
- `email` - Email validation
- `phone` - Phone number validation
- `url` - URL validation
- `file` - File upload
- `boolean` - Yes/No toggle
- `date` - Date picker

### **Validation Rules:**
- `required` - Mandatory field
- `min_length/max_length` - Text length limits
- `min/max` - Numeric ranges
- `email` - Email format validation
- `phone` - Phone format validation
- `url` - URL format validation
- `fileType` - File type restrictions
- `fileSize` - File size limits

### **UI Configuration:**
- `placeholder` - Input placeholder text
- `helpText` - Field description/help text
- `suffix/prefix` - Unit indicators
- `step` - Number input increments
- `multiple` - Allow multiple selections/uploads
- `maxFiles` - Maximum file count
- `accept` - Accepted file types
- `options` - Selection options with value/label pairs

---

## 📊 Completed Templates Tracking:

| Template | Status | Sections | Fields | Key Features |
|----------|--------|----------|--------|--------------|
| Car Rentals & Taxi Services | ✅ Complete | 9 | 50+ | Vehicle fleet, pricing, regulatory compliance |
| Commercial Vehicles | ✅ Complete | 7 | 50+ | Load capacity, safety features, certifications |
| Bikes (Motorcycles/Scooters/Bicycles) | ✅ Complete | 7 | 50+ | Engine specs, safety features, bike types |
| Spare Parts & Accessories | ✅ Complete | 7 | 50+ | Part compatibility, quality standards, warranty |
| Vehicle Insurance & Financing | ✅ Complete | 7 | 50+ | Coverage options, loan terms, regulatory compliance |

---

## 🚀 Next Steps:

1. **Choose Next Category** - Decide which marketplace category to template next
2. **Customize Prompt** - Use this template to create your specific prompt
3. **Execute Creation** - Paste the prompt to start automated template generation
4. **Review & Integrate** - Verify the generated template and integrate with frontend

---

**Note:** This prompt template ensures consistency across all eBidPortal category templates and provides complete context for efficient template creation. Update the "Completed Templates" list as new templates are finished.