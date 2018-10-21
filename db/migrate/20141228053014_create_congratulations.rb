class CreateCongratulations < ActiveRecord::Migration
  def change
    create_table :congratulations do |t|
      t.references :apply
      t.boolean :first_work_flag
      t.string :method
      t.string :postal_first
      t.string :postal_last
      t.string :prefecture
      t.string :city
      t.string :house_number
      t.string :name
      t.string :name_sei_kana
      t.string :name_mei_kana
      t.string :bank_name
      t.string :bank_branch_name
      t.string :bank_type
      t.string :bank_number
      t.string :email
      t.string :tel
      t.date :interview
      t.date :first_work_day
      t.string :note
      t.boolean :policy
      t.boolean :examine, default: false
      
      t.timestamps
    end
    add_foreign_key :congratulations, :applies
  end
end
