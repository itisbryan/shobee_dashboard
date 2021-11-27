# frozen_string_literal: true

create_table 'auctions', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
  t.string 'auction_code', null: false

  t.datetime 'created_at'
  t.datetime 'updated_at'
  t.index %w[auction_code], name: 'index_auction_details_on_auction_code', unique: true
end
