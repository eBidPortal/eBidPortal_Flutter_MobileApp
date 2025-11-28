# TVs, Video & Audio Template

```json
{
  "name": "TVs, Video & Audio",
  "description": "Comprehensive template for televisions, monitors, projectors, audio systems, speakers, headphones, and related video/audio equipment with professional specifications and industry standards.",
  "category_type": "electronics",
  "is_active": true,
  "sections": [
    {
      "title": "Basic Information",
      "order": 1,
      "description": "Essential product details and identification",
      "is_collapsible": false,
      "fields": [
        {
          "name": "product_title",
          "label": "Product Title",
          "type": "text",
          "required": true,
          "validation": {
            "min_length": 10,
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "e.g., Samsung 55\" 4K UHD Smart TV",
            "help_text": "Include brand, size/model, and key features"
          }
        },
        {
          "name": "brand",
          "label": "Brand",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "Samsung", "LG", "Sony", "Vizio", "TCL", "Hisense", "Sharp", "Philips",
              "Panasonic", "JVC", "Pioneer", "Denon", "Bose", "JBL", "Sony Audio",
              "Yamaha", "Onkyo", "Klipsch", "Polk Audio", "Other"
            ]
          },
          "ui_config": {
            "allow_custom": true,
            "placeholder": "Select or enter brand"
          }
        },
        {
          "name": "model",
          "label": "Model Number",
          "type": "text",
          "required": true,
          "validation": {
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "e.g., UN55TU8000FXZA"
          }
        },
        {
          "name": "category",
          "label": "Product Category",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "Television", "Monitor", "Projector", "Soundbar", "Home Theater System",
              "Speakers", "Headphones", "Earbuds", "Microphones", "Audio Receivers",
              "DVD/Blu-ray Players", "Streaming Devices", "AV Receivers", "Other"
            ]
          },
          "ui_config": {
            "placeholder": "Select product category"
          }
        },
        {
          "name": "product_type",
          "label": "Product Type",
          "type": "radio",
          "required": true,
          "validation": {
            "options": [
              "New", "Refurbished", "Used", "Open Box", "Display Model"
            ]
          },
          "ui_config": {
            "layout": "horizontal"
          }
        }
      ]
    },
    {
      "title": "Technical Specifications",
      "order": 2,
      "description": "Detailed technical specifications and capabilities",
      "is_collapsible": true,
      "fields": [
        {
          "name": "screen_size",
          "label": "Screen Size (inches)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 10,
            "max": 100
          },
          "ui_config": {
            "placeholder": "e.g., 55",
            "suffix": "inches",
            "help_text": "Diagonal measurement"
          }
        },
        {
          "name": "resolution",
          "label": "Resolution",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "HD (720p)", "Full HD (1080p)", "4K UHD", "8K UHD", "1440p QHD",
              "Other"
            ]
          },
          "ui_config": {
            "placeholder": "Select resolution"
          }
        },
        {
          "name": "display_type",
          "label": "Display Technology",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "LED", "LCD", "OLED", "QLED", "Plasma", "DLP", "LCD Projector",
              "DLP Projector", "CRT", "Other"
            ]
          },
          "ui_config": {
            "placeholder": "Select display technology"
          }
        },
        {
          "name": "refresh_rate",
          "label": "Refresh Rate (Hz)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 24,
            "max": 240
          },
          "ui_config": {
            "placeholder": "e.g., 60",
            "suffix": "Hz"
          }
        },
        {
          "name": "hdr_support",
          "label": "HDR Support",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "HDR10", "HDR10+", "Dolby Vision", "HLG"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "audio_power",
          "label": "Audio Power (Watts RMS)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "e.g., 20",
            "suffix": "W RMS"
          }
        },
        {
          "name": "speaker_config",
          "label": "Speaker Configuration",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "Mono", "Stereo", "2.1", "3.1", "5.1", "7.1", "7.1.2", "9.1.2",
              "Built-in Speakers", "No Speakers", "Other"
            ]
          },
          "ui_config": {
            "placeholder": "Select speaker configuration"
          }
        },
        {
          "name": "wireless_features",
          "label": "Wireless Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Wi-Fi", "Bluetooth", "AirPlay", "Google Cast", "Alexa Built-in",
              "NFC", "Wi-Fi Direct"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        }
      ]
    },
    {
      "title": "Display & Audio Features",
      "order": 3,
      "description": "Advanced display and audio capabilities",
      "is_collapsible": true,
      "fields": [
        {
          "name": "smart_tv",
          "label": "Smart TV Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Android TV", "Tizen OS", "webOS", "Roku TV", "Fire TV",
              "Voice Control", "App Store", "Screen Mirroring"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "audio_technologies",
          "label": "Audio Technologies",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Dolby Atmos", "DTS:X", "Dolby Digital", "DTS-HD", "THX Certified",
              "Active Noise Cancellation", "Surround Sound", "Virtual Surround"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "gaming_features",
          "label": "Gaming Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "HDMI 2.1", "ALLM", "VRR", "AMD FreeSync", "NVIDIA G-Sync",
              "4K@120Hz", "Game Mode", "Input Lag <10ms"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "connectivity_ports",
          "label": "Connectivity Ports",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "HDMI", "USB", "Ethernet", "Optical Audio", "Coaxial",
              "Component Video", "Composite Video", "VGA", "DisplayPort",
              "Thunderbolt", "3.5mm Audio Jack", "RCA"
            ]
          },
          "ui_config": {
            "multiple": true,
            "help_text": "Select all available ports"
          }
        },
        {
          "name": "hdmi_count",
          "label": "Number of HDMI Ports",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 10
          },
          "ui_config": {
            "placeholder": "e.g., 4"
          }
        },
        {
          "name": "usb_count",
          "label": "Number of USB Ports",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 10
          },
          "ui_config": {
            "placeholder": "e.g., 2"
          }
        }
      ]
    },
    {
      "title": "Condition & Warranty",
      "order": 4,
      "description": "Product condition and warranty information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "condition",
          "label": "Condition",
          "type": "radio",
          "required": true,
          "validation": {
            "options": [
              "New (Sealed)", "New (Open Box)", "Excellent", "Very Good",
              "Good", "Fair", "Poor", "For Parts/Repair"
            ]
          },
          "ui_config": {
            "layout": "vertical"
          }
        },
        {
          "name": "condition_description",
          "label": "Condition Description",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 1000
          },
          "ui_config": {
            "placeholder": "Describe any wear, damage, or imperfections",
            "rows": 4
          }
        },
        {
          "name": "warranty_status",
          "label": "Warranty Status",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "Full Manufacturer Warranty", "Partial Warranty Remaining",
              "Extended Warranty Available", "No Warranty", "As-Is"
            ]
          },
          "ui_config": {
            "placeholder": "Select warranty status"
          }
        },
        {
          "name": "warranty_period",
          "label": "Warranty Period (Months)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0,
            "max": 120
          },
          "ui_config": {
            "placeholder": "e.g., 24",
            "suffix": "months"
          }
        },
        {
          "name": "original_accessories",
          "label": "Original Accessories Included",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Remote Control", "Power Cable", "HDMI Cable", "Wall Mount",
              "Stand/Base", "User Manual", "Original Box", "Speakers"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        }
      ]
    },
    {
      "title": "Pricing & Availability",
      "order": 5,
      "description": "Pricing, availability, and auction details",
      "is_collapsible": true,
      "fields": [
        {
          "name": "price",
          "label": "Price (INR)",
          "type": "number",
          "required": true,
          "validation": {
            "min": 1,
            "max": 10000000
          },
          "ui_config": {
            "placeholder": "Enter price in INR",
            "prefix": "₹"
          }
        },
        {
          "name": "currency",
          "label": "Currency",
          "type": "select",
          "required": true,
          "validation": {
            "options": ["INR", "USD", "EUR", "GBP"]
          },
          "ui_config": {
            "default": "INR"
          }
        },
        {
          "name": "price_type",
          "label": "Price Type",
          "type": "radio",
          "required": true,
          "validation": {
            "options": [
              "Fixed Price", "Auction Starting Price", "Best Offer",
              "Make an Offer"
            ]
          },
          "ui_config": {
            "layout": "horizontal"
          }
        },
        {
          "name": "quantity_available",
          "label": "Quantity Available",
          "type": "number",
          "required": true,
          "validation": {
            "min": 1,
            "max": 1000
          },
          "ui_config": {
            "placeholder": "e.g., 1",
            "default": 1
          }
        },
        {
          "name": "reserve_price",
          "label": "Reserve Price (INR)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1
          },
          "ui_config": {
            "placeholder": "Optional reserve price",
            "prefix": "₹",
            "help_text": "Minimum price for auction to sell"
          }
        },
        {
          "name": "buy_it_now_price",
          "label": "Buy It Now Price (INR)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 1
          },
          "ui_config": {
            "placeholder": "Optional Buy It Now price",
            "prefix": "₹"
          }
        }
      ]
    },
    {
      "title": "Seller Information",
      "order": 6,
      "description": "Seller details and business information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "seller_type",
          "label": "Seller Type",
          "type": "radio",
          "required": true,
          "validation": {
            "options": [
              "Individual", "Business/Reseller", "Authorized Dealer",
              "Manufacturer", "Liquidator"
            ]
          },
          "ui_config": {
            "layout": "horizontal"
          }
        },
        {
          "name": "business_name",
          "label": "Business Name",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "Enter business name if applicable"
          }
        },
        {
          "name": "seller_location",
          "label": "Seller Location",
          "type": "text",
          "required": true,
          "validation": {
            "max_length": 200
          },
          "ui_config": {
            "placeholder": "City, State/Province, Country"
          }
        },
        {
          "name": "seller_rating",
          "label": "Seller Rating",
          "type": "rating",
          "required": false,
          "validation": {
            "min": 1,
            "max": 5
          },
          "ui_config": {
            "max_rating": 5,
            "show_value": true
          }
        },
        {
          "name": "return_policy",
          "label": "Return Policy",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "14 Days Return", "30 Days Return", "No Returns",
              "Store Credit Only", "Exchange Only"
            ]
          },
          "ui_config": {
            "placeholder": "Select return policy"
          }
        },
        {
          "name": "warranty_offered",
          "label": "Additional Warranty Offered",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "label": "Seller offers additional warranty"
          }
        }
      ]
    },
    {
      "title": "Shipping & Delivery",
      "order": 7,
      "description": "Shipping options and delivery information",
      "is_collapsible": true,
      "fields": [
        {
          "name": "shipping_type",
          "label": "Shipping Type",
          "type": "radio",
          "required": true,
          "validation": {
            "options": [
              "Free Shipping", "Standard Shipping", "Express Shipping",
              "White Glove Delivery", "Local Pickup Only"
            ]
          },
          "ui_config": {
            "layout": "horizontal"
          }
        },
        {
          "name": "shipping_cost",
          "label": "Shipping Cost (INR)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0
          },
          "ui_config": {
            "placeholder": "Enter shipping cost",
            "prefix": "₹",
            "help_text": "Leave blank for free shipping"
          }
        },
        {
          "name": "estimated_delivery",
          "label": "Estimated Delivery Time",
          "type": "select",
          "required": true,
          "validation": {
            "options": [
              "1-2 Business Days", "3-5 Business Days", "1-2 Weeks",
              "2-4 Weeks", "4-6 Weeks", "6-8 Weeks", "Local Pickup"
            ]
          },
          "ui_config": {
            "placeholder": "Select delivery time"
          }
        },
        {
          "name": "weight_kg",
          "label": "Product Weight (kg)",
          "type": "number",
          "required": false,
          "validation": {
            "min": 0.1,
            "max": 500
          },
          "ui_config": {
            "placeholder": "e.g., 15.5",
            "suffix": "kg",
            "step": 0.1
          }
        },
        {
          "name": "dimensions",
          "label": "Product Dimensions (cm)",
          "type": "object",
          "required": false,
          "validation": {
            "properties": {
              "length": { "type": "number", "min": 1 },
              "width": { "type": "number", "min": 1 },
              "height": { "type": "number", "min": 1 }
            }
          },
          "ui_config": {
            "fields": [
              { "name": "length", "label": "Length (cm)", "type": "number" },
              { "name": "width", "label": "Width (cm)", "type": "number" },
              { "name": "height", "label": "Height (cm)", "type": "number" }
            ]
          }
        },
        {
          "name": "international_shipping",
          "label": "International Shipping",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "label": "Available for international shipping"
          }
        }
      ]
    },
    {
      "title": "Additional Features",
      "order": 8,
      "description": "Extra features and capabilities",
      "is_collapsible": true,
      "fields": [
        {
          "name": "energy_rating",
          "label": "Energy Rating",
          "type": "select",
          "required": false,
          "validation": {
            "options": [
              "5 Star", "4 Star", "3 Star", "2 Star", "1 Star", "Not Rated"
            ]
          },
          "ui_config": {
            "placeholder": "Select energy rating"
          }
        },
        {
          "name": "certifications",
          "label": "Certifications & Standards",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "CE Certified", "FCC Certified", "RoHS Compliant", "Energy Star",
              "UL Listed", "CSA Certified", "BIS Certified", "ISI Marked"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "special_features",
          "label": "Special Features",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Wall Mount Compatible", "VESA Compatible", "Curved Screen",
              "Ambilight", "Local Dimming", "Quantum Dot Technology",
              "Micro LED", "Laser Projector", "Waterproof", "Dustproof",
              "Wireless Subwoofer", "Multi-Room Audio", "Voice Assistant"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "compatible_devices",
          "label": "Compatible Devices",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "iOS Devices", "Android Devices", "Windows PC", "Mac",
              "PlayStation", "Xbox", "Nintendo Switch", "Smart Home Hubs",
              "Streaming Sticks", "Blu-ray Players", "Gaming Consoles"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        },
        {
          "name": "included_software",
          "label": "Included Software/Apps",
          "type": "checkbox",
          "required": false,
          "validation": {
            "options": [
              "Netflix", "Amazon Prime", "Disney+", "YouTube", "Spotify",
              "YouTube TV", "Hulu", "HBO Max", "Apple TV+", "Peacock",
              "Gaming Apps", "Browser", "Media Player"
            ]
          },
          "ui_config": {
            "multiple": true
          }
        }
      ]
    },
    {
      "title": "Compliance & Documentation",
      "order": 9,
      "description": "Regulatory compliance and documentation",
      "is_collapsible": true,
      "fields": [
        {
          "name": "serial_number",
          "label": "Serial Number",
          "type": "text",
          "required": false,
          "validation": {
            "max_length": 100
          },
          "ui_config": {
            "placeholder": "Enter serial number if available"
          }
        },
        {
          "name": "manufacture_date",
          "label": "Manufacture Date",
          "type": "date",
          "required": false,
          "ui_config": {
            "placeholder": "Select manufacture date"
          }
        },
        {
          "name": "purchase_date",
          "label": "Original Purchase Date",
          "type": "date",
          "required": false,
          "ui_config": {
            "placeholder": "Select original purchase date"
          }
        },
        {
          "name": "receipt_available",
          "label": "Receipt Available",
          "type": "boolean",
          "required": false,
          "ui_config": {
            "label": "Original receipt available"
          }
        },
        {
          "name": "compliance_info",
          "label": "Compliance Information",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 500
          },
          "ui_config": {
            "placeholder": "EMI compliance, safety standards, etc.",
            "rows": 3
          }
        },
        {
          "name": "additional_notes",
          "label": "Additional Notes",
          "type": "textarea",
          "required": false,
          "validation": {
            "max_length": 1000
          },
          "ui_config": {
            "placeholder": "Any additional information about the product",
            "rows": 4
          }
        },
        {
          "name": "product_images",
          "label": "Product Images",
          "type": "file",
          "required": true,
          "validation": {
            "max_files": 10,
            "allowed_types": ["image/jpeg", "image/png", "image/webp"],
            "max_size_mb": 5
          },
          "ui_config": {
            "multiple": true,
            "help_text": "Upload up to 10 high-quality images showing all angles and any imperfections"
          }
        }
      ]
    }
  ]
}
```