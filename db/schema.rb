# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091115102442) do

  create_table "accessories", :force => true do |t|
    t.string   "itemID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bin_paramaters", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bins", :force => true do |t|
    t.string   "name"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "vendorCategoryId"
    t.string   "name"
    t.text     "description"
    t.string   "operation"
    t.string   "vendor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "parentCategoryId"
    t.boolean  "isLeafCategory"
    t.boolean  "isCategoryRoot"
    t.string   "parentCategoryName"
    t.string   "searchIndex"
  end

  create_table "childrens", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comparifier_attributes", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.integer  "category_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comparifier_requests", :force => true do |t|
    t.string   "vendorRequestId"
    t.string   "vendor"
    t.string   "operation"
    t.string   "service"
    t.string   "accessKeyId"
    t.string   "responseType"
    t.string   "responseGroup"
    t.string   "version"
    t.string   "keywords"
    t.text     "response",        :limit => 2147483647
    t.text     "request"
    t.date     "requestDate"
    t.string   "totalResults"
    t.string   "totalPages"
    t.string   "condition"
    t.string   "reviewSort"
    t.string   "merchantId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_reviews", :force => true do |t|
    t.string   "itemID"
    t.string   "rating"
    t.integer  "helpfulVotes"
    t.integer  "totalVotes"
    t.string   "customerID"
    t.string   "date"
    t.string   "summary"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editorial_reviews", :force => true do |t|
    t.string   "source"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.string   "type"
    t.string   "url"
    t.string   "height"
    t.string   "width"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_attributes", :force => true do |t|
    t.text     "about"
    t.text     "about_me"
    t.text     "actor"
    t.text     "additional_name"
    t.text     "address1"
    t.text     "address2"
    t.text     "address3"
    t.text     "alternate_version"
    t.integer  "amazon_maximum_age"
    t.integer  "amazon_minimum_age"
    t.text     "amount"
    t.text     "aperture_modes"
    t.text     "artist"
    t.text     "asin"
    t.text     "aspect_ratio"
    t.text     "audience_rating"
    t.text     "audio_format"
    t.text     "author"
    t.text     "availability"
    t.text     "average_feedback_rating"
    t.text     "average_rating"
    t.text     "back_finding"
    t.text     "band_material_type"
    t.text     "batteries"
    t.text     "batteries_included"
    t.text     "battery_description"
    t.text     "battery_type"
    t.text     "benefit_description"
    t.text     "bezel_material_type"
    t.text     "binding"
    t.text     "birthday"
    t.text     "brand"
    t.text     "calendar_type"
    t.text     "camera_manual_features"
    t.text     "case_diameter"
    t.text     "case_material_type"
    t.text     "case_thickness"
    t.text     "case_type"
    t.text     "category"
    t.text     "cdrw_description"
    t.text     "chain_type"
    t.text     "city"
    t.text     "clasp_type"
    t.text     "clothing_size"
    t.text     "code"
    t.text     "color"
    t.text     "comment"
    t.text     "compatability"
    t.text     "country"
    t.text     "cpu_manufacturer"
    t.text     "cpu_speed"
    t.text     "cpu_type"
    t.text     "creator"
    t.text     "creation_date"
    t.text     "currency_amount"
    t.text     "currency_code"
    t.text     "date"
    t.text     "date_added"
    t.text     "date_created"
    t.text     "day"
    t.text     "delay_between_shots"
    t.text     "department"
    t.text     "details"
    t.text     "detail_page_url"
    t.text     "dewey_decimal_number"
    t.text     "dial_color"
    t.text     "dial_window_material_type"
    t.text     "digital_zoom"
    t.text     "director"
    t.text     "display_size"
    t.text     "distinct_users"
    t.text     "drive_type_id"
    t.text     "drive_type_name"
    t.text     "dvd_layers"
    t.text     "dvdrw_description"
    t.text     "dvd_sides"
    t.text     "ean"
    t.text     "edition"
    t.text     "editorial_reviews_link_suppressed"
    t.text     "element"
    t.text     "eligibility_requirement"
    t.text     "eligibility_requirement_description"
    t.text     "eligibility_requirements"
    t.text     "eligibility_requirement_type"
    t.text     "end_date"
    t.text     "episode_sequence"
    t.text     "exchange_id"
    t.text     "esrb_age_rating"
    t.text     "external_display_support_description"
    t.text     "fabric_type"
    t.text     "fax_number"
    t.text     "feature"
    t.text     "feedback"
    t.text     "feedback_rating"
    t.text     "first_issue_lead_time"
    t.text     "first_tagging"
    t.text     "fixed_amount"
    t.text     "flavour_name"
    t.text     "floppy_disk_drive_description"
    t.text     "format"
    t.text     "formatted_price"
    t.text     "genre"
    t.text     "gem_type"
    t.text     "gem_type_set_element"
    t.text     "glance_page"
    t.text     "golf_club_flex"
    t.text     "golf_club_loft"
    t.text     "graphics_card_interface"
    t.text     "graphics_description"
    t.text     "graphics_memory_size"
    t.text     "group_claim_code"
    t.text     "hand_orientation"
    t.text     "hard_disk_count"
    t.text     "hard_disk_size"
    t.text     "hardware_platform"
    t.text     "has_auto_focus"
    t.text     "has_burst_mode"
    t.text     "has_in_camera_editing"
    t.text     "has_redeye_reduction"
    t.text     "has_self_timer"
    t.text     "has_tripod_mode"
    t.text     "has_video_out"
    t.text     "has_viewfinder"
    t.text     "height"
    t.text     "helpful_votes"
    t.text     "hmac"
    t.text     "hours"
    t.text     "hours_of_operation"
    t.text     "image"
    t.text     "included_software"
    t.text     "includes_mp3_player"
    t.text     "ingredients"
    t.text     "ingredients_set_element"
    t.text     "is_autographed"
    t.text     "isbn"
    t.text     "is_eligible_for_super_save_shipping"
    t.text     "is_email_notify_available"
    t.text     "is_fit"
    t.text     "is_fragile"
    t.text     "is_in_benefit_set"
    t.text     "is_in_eligibility_requirement_set"
    t.text     "is_lab_created"
    t.text     "is_link_suppressed"
    t.text     "is_memorabilia"
    t.text     "iso_equivalent"
    t.text     "item"
    t.text     "item_applicability"
    t.text     "issues_per_year"
    t.text     "keyboard_description"
    t.text     "keywords"
    t.text     "label"
    t.text     "large_image"
    t.text     "last_tagging"
    t.text     "legal_disclaimer"
    t.text     "length"
    t.text     "line_voltage"
    t.text     "location"
    t.text     "long_synopsis"
    t.text     "loyalty_points"
    t.text     "macro_focus_range"
    t.text     "magazine_type"
    t.text     "manufacturer"
    t.text     "manufacturer_labour_warranty_description"
    t.text     "manufacturer_maximum_age"
    t.text     "manufacturer_minimum_age"
    t.text     "manufacturer_parts_warranty_description"
    t.text     "material_type"
    t.text     "material_type_set_element"
    t.text     "maximum_aperture"
    t.text     "maximum_color_depth"
    t.text     "maximum_focal_length"
    t.text     "maximum_high_resolution_images"
    t.text     "maximum_hours"
    t.text     "maximum_horizontal_resolution"
    t.text     "maximum_low_resolution_images"
    t.text     "maximum_resolution"
    t.text     "maximum_shutter_speed"
    t.text     "maximum_vertical_resolution"
    t.text     "maximum_weight_recommendation"
    t.text     "medium_image"
    t.text     "memory_slots_available"
    t.text     "merchandising_message"
    t.text     "merchandising"
    t.text     "message"
    t.text     "metal_stamp"
    t.text     "metal_type"
    t.text     "minimum_hours"
    t.text     "mini_movie_description"
    t.text     "minimum_focal_length"
    t.text     "minimum_shutter_speed"
    t.text     "missing_vehicle_attributes"
    t.text     "model"
    t.text     "model_description"
    t.text     "monitor_size"
    t.text     "monitor_viewable_diagonal_size"
    t.text     "mouse_description"
    t.text     "mpn"
    t.text     "name"
    t.text     "native_resolution"
    t.text     "neighborhood"
    t.text     "network_interface_description"
    t.text     "nickname"
    t.text     "notebook_display_technology"
    t.text     "notebook_pointing_device_description"
    t.text     "number"
    t.text     "number_of_disks"
    t.text     "number_of_issues"
    t.text     "number_of_items"
    t.text     "number_of_pages"
    t.text     "number_of_pearls"
    t.text     "number_of_rapid_fire_shots"
    t.text     "number_of_stones"
    t.text     "number_of_tracks"
    t.text     "occasion_date"
    t.text     "operating_system"
    t.text     "optical_zoom"
    t.text     "original_air_date"
    t.text     "original_release_date"
    t.text     "other_categories_similar_products"
    t.text     "owning_merchant_id"
    t.text     "package_quantity"
    t.text     "part"
    t.text     "part_brand_bins"
    t.text     "part_browse_node_bins"
    t.text     "partner_name"
    t.text     "pearl_lustre"
    t.text     "pearl_minimum_color"
    t.text     "pearl_shape"
    t.text     "pearl_texting_method"
    t.text     "pearl_surface_blemishes"
    t.text     "pearl_type"
    t.text     "pearl_uniformity"
    t.text     "phone_number"
    t.text     "photo_flash_type"
    t.text     "picture_format"
    t.text     "platform"
    t.text     "postal_code"
    t.text     "price"
    t.text     "price_rating"
    t.text     "processor_codes"
    t.text     "product_group"
    t.text     "product_type_subcategory"
    t.text     "promotion"
    t.text     "publication_date"
    t.text     "publisher"
    t.text     "purchase_url"
    t.text     "quantity"
    t.text     "quantity_desired"
    t.text     "quantity_received"
    t.text     "rating"
    t.text     "reading_level"
    t.text     "registry_number"
    t.text     "region_code"
    t.text     "registry_name"
    t.text     "related_item"
    t.text     "related_items"
    t.text     "related_items_count"
    t.text     "related_item_page"
    t.text     "related_item_page_count"
    t.text     "relationship"
    t.text     "relationship_type"
    t.text     "release_date"
    t.text     "removeable_memory"
    t.text     "resolution_modes"
    t.text     "ring_size"
    t.text     "role"
    t.text     "running_time"
    t.text     "sales_rank"
    t.text     "saved_for_later_item"
    t.text     "season_sequence"
    t.text     "scent_name"
    t.text     "secondary_cache_size"
    t.text     "setting_type"
    t.text     "shaft_material_type"
    t.text     "shipment_items"
    t.text     "shipments"
    t.text     "short_synopsis"
    t.text     "single_merchant_id"
    t.text     "size"
    t.text     "size_per_pearl"
    t.text     "sku"
    t.text     "small_image"
    t.text     "sound_card_description"
    t.text     "source"
    t.text     "speaker_description"
    t.text     "special_features"
    t.text     "spring_types_id"
    t.text     "spring_types_name"
    t.text     "start_date"
    t.text     "start_year"
    t.text     "state"
    t.text     "status"
    t.text     "stone_clarity"
    t.text     "stone_color"
    t.text     "stone_cut"
    t.text     "stone_shape"
    t.text     "stone_weight"
    t.text     "store_id"
    t.text     "store_name"
    t.text     "steering_id"
    t.text     "steering_name"
    t.text     "studio"
    t.text     "subject"
    t.text     "subcondition"
    t.text     "subscription_length"
    t.text     "summary"
    t.text     "supported_image_type"
    t.text     "swatch_image"
    t.text     "system_bus_speed"
    t.text     "system_memory_size"
    t.text     "system_memory_size_max"
    t.text     "system_memory_type"
    t.text     "terms_of_conditions"
    t.text     "theatrical_release_date"
    t.text     "thumbnail_image"
    t.text     "time"
    t.text     "tiny_image"
    t.text     "title"
    t.text     "top_item"
    t.text     "top_item_set"
    t.text     "total_collectible"
    t.text     "total_diamond_weight"
    t.text     "total_extenal_bays_free"
    t.text     "total_feedback"
    t.text     "total_feedback_pages"
    t.text     "total_firewire_ports"
    t.text     "total_fitments"
    t.text     "total_gem_weight"
    t.text     "total_internal_bays_free"
    t.text     "total_items"
    t.text     "total_metal_weight"
    t.text     "total_new"
    t.text     "total_ntscpal_ports"
    t.text     "total_offer_pages"
    t.text     "total_offers"
    t.text     "total_pages"
    t.text     "total_parallel_ports"
    t.text     "total_pc_card_slots"
    t.text     "total_pci_slots_free"
    t.text     "total_ratings"
    t.text     "total_refurbished"
    t.text     "total_results"
    t.text     "total_review_pages"
    t.text     "total_reviews"
    t.text     "totals"
    t.text     "total_serial_ports"
    t.text     "total_s_video_ports"
    t.text     "total_times_read"
    t.text     "total_usages"
    t.text     "total_usb_ports"
    t.text     "total_usb2_ports"
    t.text     "total_used"
    t.text     "total_vga_out_ports"
    t.text     "total_votes"
    t.text     "track"
    t.text     "transaction_date"
    t.text     "transaction_date_epoch"
    t.text     "transaction_id"
    t.text     "transaction_item"
    t.text     "transaction_item_id"
    t.text     "transaction_items"
    t.text     "transmission_id"
    t.text     "transmissio_name"
    t.text     "trim_id"
    t.text     "trim_name"
    t.text     "type"
    t.text     "unit"
    t.text     "upc"
    t.text     "url"
    t.text     "user_ident"
    t.text     "user_id"
    t.text     "value"
    t.text     "variation_denomination"
    t.text     "variation_description"
    t.text     "variation_dimension"
    t.text     "vehicle_bed_options"
    t.text     "vehicle_bed"
    t.text     "vehicle_body_style_options"
    t.text     "vehicle_body_style"
    t.text     "vehicle_brakes_options"
    t.text     "vehicle_brakes"
    t.text     "vehicle_drive_type_options"
    t.text     "vehicle_drive_type"
    t.text     "vehicle_engine_options"
    t.text     "vehicle_engine"
    t.text     "vehicle_make"
    t.text     "vehicle_makes"
    t.text     "vehicle_mfr_body_code_options"
    t.text     "vehicle_mfr_body_code"
    t.text     "vehicle_model"
    t.text     "vehicle_models"
    t.text     "vehicle_options"
    t.text     "vehicle_parts"
    t.text     "vehicle_spring_type_options"
    t.text     "vehicle_spring_types"
    t.text     "vehicle_steering_options"
    t.text     "vehicle_steering"
    t.text     "vehicle_transmission_options"
    t.text     "vehicle_transmission"
    t.text     "vehicle_wheelbase_options"
    t.text     "vehicle_wheelbase"
    t.text     "vehicle_year"
    t.text     "vehicle_years"
    t.text     "versions"
    t.text     "warranty"
    t.text     "watch_movement_type"
    t.text     "water_resistant_depth"
    t.text     "weight"
    t.text     "wheelbase"
    t.text     "wheelbase_id"
    t.text     "wheelbase_name"
    t.text     "width"
    t.text     "will_ship_expedited"
    t.text     "will_ship_international"
    t.text     "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "vendorItemId"
    t.string   "name"
    t.string   "description"
    t.string   "operation"
    t.string   "vendor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "detailPageURL"
    t.string   "salesRank"
    t.string   "lowestNewPrice"
    t.string   "lowestUsedPrice"
    t.string   "lowestRefurbishedPrice"
    t.integer  "totalNew"
    t.integer  "totalUsed"
    t.integer  "totalRefurbished"
    t.integer  "totalCollectible"
    t.integer  "totalOffers"
    t.integer  "totalOfferPages"
    t.string   "listPrice"
    t.string   "offerPrice"
    t.string   "avgCustRating"
    t.integer  "totalReviews"
    t.integer  "totalReviewPages"
  end

  create_table "listmanias", :force => true do |t|
    t.string   "listID"
    t.string   "listName"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", :force => true do |t|
    t.string   "merchantID"
    t.string   "glancePage"
    t.string   "condition"
    t.string   "subCondition"
    t.string   "price"
    t.string   "availability"
    t.string   "eligibleforSavingShipping"
    t.string   "offerListingID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operations", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parameters", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "response_groups", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_bin_sets", :force => true do |t|
    t.string   "narrowBy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_indices", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.string   "browse_node"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_result_items", :force => true do |t|
  end

  create_table "similar_products", :force => true do |t|
    t.string   "itemID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_categories", :force => true do |t|
    t.string   "name"
    t.integer  "browseId"
    t.integer  "category_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
