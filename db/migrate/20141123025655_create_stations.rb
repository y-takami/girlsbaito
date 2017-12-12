class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.references :route
      t.references :prefecture
      t.string :name
      

      t.timestamps
    end
    add_index :stations, :name
    add_index :stations, :route_id
    add_index :stations, :prefecture_id
    add_foreign_key :stations, :prefectures
 
  end
end
