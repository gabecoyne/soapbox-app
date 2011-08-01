# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110712211301) do

  create_table "attachments", :force => true do |t|
    t.string    "title"
    t.string    "attachment_file_name"
    t.string    "attachment_content_type"
    t.integer   "attachment_file_size"
    t.timestamp "attachment_updated_at"
    t.string    "attachable_type"
    t.integer   "attachable_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "attachment_type"
  end

  add_index "attachments", ["attachable_id", "attachable_type", "attachment_type"], :name => "index_attachable_and_type"

  create_table "categories", :force => true do |t|
    t.string    "title"
    t.integer   "parent_id"
    t.integer   "position"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "categories", ["id"], :name => "index_categories_on_id"

  create_table "comments", :force => true do |t|
    t.text      "comment"
    t.integer   "commentable_id"
    t.string    "commentable_type"
    t.integer   "user_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "comments", ["id"], :name => "index_comments_on_id"

  create_table "communities", :force => true do |t|
    t.string    "title"
    t.string    "address"
    t.string    "contact_phone"
    t.string    "contact_email"
    t.text      "summary"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.float     "lat"
    t.float     "lng"
    t.string    "city"
    t.string    "state"
    t.string    "zip"
    t.integer   "page_id"
  end

  add_index "communities", ["id"], :name => "index_properties_on_id"
  add_index "communities", ["lat", "lng"], :name => "index_communities_on_lat_and_lng"

  create_table "contents", :force => true do |t|
    t.string    "contentable_type"
    t.integer   "contentable_id"
    t.string    "key"
    t.string    "note"
    t.text      "body"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "contents", ["id"], :name => "index_contents_on_id"

  create_table "galleries", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "galleriable_id"
    t.string    "galleriable_type"
  end

  add_index "galleries", ["galleriable_id", "galleriable_type"], :name => "index_galleries_on_galleriable_id_and_galleriable_type"
  add_index "galleries", ["id"], :name => "index_galleries_on_id"

  create_table "gallery_images", :force => true do |t|
    t.integer   "gallery_id"
    t.string    "caption"
    t.integer   "position"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "gallery_images", ["id"], :name => "index_gallery_images_on_id"

  create_table "groups", :force => true do |t|
    t.string    "name"
    t.string    "details"
    t.string    "group_type"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "groups", ["id"], :name => "index_groups_on_id"

  create_table "members", :force => true do |t|
    t.string    "email",                               :default => "", :null => false
    t.string    "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string    "password_salt",                       :default => "", :null => false
    t.string    "reset_password_token"
    t.string    "remember_token"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                       :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["reset_password_token"], :name => "index_members_on_reset_password_token", :unique => true

  create_table "memberships", :force => true do |t|
    t.integer   "user_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "group_id"
  end

  add_index "memberships", ["group_id", "user_id"], :name => "index_memberships_on_group_id_and_user_id"

  create_table "menu_items", :force => true do |t|
    t.integer   "menu_id"
    t.string    "label"
    t.string    "link"
    t.integer   "position"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "menuable_type"
    t.integer   "menuable_id"
  end

  create_table "menus", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string    "title"
    t.string    "meta_keywords"
    t.string    "meta_description"
    t.integer   "parent_id"
    t.string    "redirect"
    t.string    "nav_label"
    t.integer   "position"
    t.string    "template"
    t.timestamp "release_at"
    t.timestamp "expire_at"
    t.boolean   "private"
    t.boolean   "publish"
    t.boolean   "homepage"
    t.text      "body"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.text      "area_1"
    t.text      "area_2"
  end

  add_index "pages", ["id"], :name => "index_pages_on_id"
  add_index "pages", ["parent_id"], :name => "index_pages_on_parent_id"

  create_table "payments", :force => true do |t|
    t.integer   "member_id"
    t.float     "amount"
    t.string    "confirmation_code"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "can"
    t.integer   "group_id"
    t.string    "object"
  end

  create_table "plugins", :force => true do |t|
    t.string    "title"
    t.string    "route"
    t.integer   "parent_id"
    t.boolean   "active"
    t.integer   "position"
    t.string    "note"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "plugins", ["id"], :name => "index_plugins_on_id"

  create_table "redirects", :force => true do |t|
    t.string    "source"
    t.string    "destination"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string    "name"
    t.string    "value"
    t.string    "note"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "settings", ["id"], :name => "index_settings_on_id"
  add_index "settings", ["name"], :name => "index_settings_on_name"

  create_table "slugs", :force => true do |t|
    t.string    "name"
    t.integer   "sluggable_id"
    t.integer   "sequence",                     :default => 1, :null => false
    t.string    "sluggable_type", :limit => 40
    t.string    "scope"
    t.timestamp "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "taggings", :force => true do |t|
    t.integer   "tag_id"
    t.integer   "taggable_id"
    t.string    "taggable_type"
    t.integer   "tagger_id"
    t.string    "tagger_type"
    t.string    "context"
    t.timestamp "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string    "email",                                              :null => false
    t.string    "encrypted_password",   :limit => 128,                :null => false
    t.string    "password_salt",                                      :null => false
    t.string    "reset_password_token"
    t.string    "remember_token"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                       :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.boolean   "super_admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string    "item_type",  :null => false
    t.integer   "item_id",    :null => false
    t.string    "event",      :null => false
    t.string    "whodunnit"
    t.text      "object"
    t.timestamp "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
