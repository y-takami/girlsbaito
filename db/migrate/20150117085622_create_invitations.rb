class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :girl
      t.integer :application_amount

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
      t.boolean :examine

      t.timestamps
    end
  end
end
