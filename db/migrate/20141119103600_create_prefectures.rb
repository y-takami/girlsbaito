class CreatePrefectures < ActiveRecord::Migration
  def change
    create_table :prefectures do |t|
      t.string :region
      t.string :name
      t.string :romaji

      t.timestamps
    end
    add_index :prefectures, :region
    add_index :prefectures, :name
    add_index :prefectures, :romaji
  end
end
