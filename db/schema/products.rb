# frozen_string_literal: true

create_table 'products', id: :integer, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci', force: :cascade do |t|
  t.string 'name', null: false
  t.string 'description'
  t.string 'features'
  t.float 'price'
  t.string 'href'
  t.string 'keywords'
  t.string 'status', default: 'unknown', null: false
  t.integer 'auction_id'
  t.datetime 'created_at'
  t.datetime 'updated_at'
end
add_index :products, %w[auction_id product_id], name: 'index_auction_details_on_auction_code', using: :btree
add_foreign_key :products, 'auction', name: 'fk_products_on_auction', using: :btree
