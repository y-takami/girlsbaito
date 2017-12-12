class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.references :prefecture
      t.string :name
      
      t.timestamps
    end
    add_index :cities, :prefecture_id
    add_index :cities, :name
    add_index :cities, [ :prefecture_id, :name ]
    add_foreign_key :cities, :prefectures
  end
end
