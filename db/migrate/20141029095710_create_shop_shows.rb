class CreateShopShows < ActiveRecord::Migration
  def change
    create_table :shop_shows do |t|
      t.references :shop_info
      t.string :shop_name
      t.string :url
      t.references :prefecture
      t.references :city
      t.string :house_number
      t.integer :payment_hour_low
      t.integer :payment_hour_high
      t.string :payment_day
      t.references :category
      t.references :route
      t.references :station
      t.string :title
      t.string :summary
      t.boolean :time_morning
      t.boolean :time_noon
      t.boolean :time_afternoon
      t.boolean :time_night
      t.boolean :time_midnight
      t.string :job_content
      t.integer :congratulation_money
      t.string :message
      t.string :line_id
      t.string :note
      t.string :main_image
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :license
      t.boolean :stop_flag, default: false
      t.boolean :stop_flag_shop, default: false
      t.boolean :examine, default: false
      t.integer :shop_point, default: 100

      t.timestamps
    end
    add_index :shop_shows, :prefecture_id
    add_index :shop_shows, :city_id
    add_index :shop_shows, :payment_hour_high
    add_index :shop_shows, :payment_hour_low
    add_index :shop_shows, :payment_day
    add_index :shop_shows, :category_id
    add_index :shop_shows, :station_id
    add_index :shop_shows, :route_id
    add_index :shop_shows, :congratulation_money
    add_index :shop_shows, :shop_info_id
    add_index :shop_shows, :shop_point
    add_foreign_key :shop_shows, :shop_infos


  end
end
