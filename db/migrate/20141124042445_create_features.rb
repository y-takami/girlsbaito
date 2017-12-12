class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.references :shop_show
      t.boolean :daily, default: false
      t.boolean :guarantee, default: false
      t.boolean :carfare, default: false
      t.boolean :beginner, default: false
      t.boolean :experience, default: false
      t.boolean :menstruation, default: false
      t.boolean :dormitory, default: false
      t.boolean :room, default: false
      t.boolean :nursery, default: false
      t.boolean :pickup, default: false
      t.boolean :alibi, default: false
      t.boolean :home, default: false

      t.timestamps
    end
    add_foreign_key :features, :shop_shows
  end
end
