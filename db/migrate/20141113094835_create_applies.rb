class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.references :girl
      t.references :shop_show
      t.boolean :employment, default: nil
      t.date :employment_day
      t.integer :congratulation_money
      t.string :method
      t.string :note
      t.date :interview
      t.date :first_work_day
      t.boolean :time_over
      t.string :invitation_code
      t.string :name
      t.string :email
      t.string :line_id
      t.string :tel

      t.timestamps
    end
    add_index :applies, :girl_id
    add_index :applies, :shop_show_id
    add_foreign_key :applies, :girls
    add_foreign_key :applies, :shop_shows
  end
end
