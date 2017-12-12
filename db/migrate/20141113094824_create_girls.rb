class CreateGirls < ActiveRecord::Migration
  def change
    create_table :girls do |t|
      t.string :nickname
      t.string :name
      t.string :email
      t.string :tel
      t.string :line_id

      t.string :method
      t.string :postal_first
      t.string :postal_last
      t.string :prefecture
      t.string :city
      t.string :house_number
      t.string :name_sei_kana
      t.string :name_mei_kana
      t.string :bank_name
      t.string :bank_branch_name
      t.string :bank_type
      t.string :bank_number

      t.string :password_digest
      t.string :invitation_code
      t.integer :invitation_num, default: 0
      t.integer :invitation_point, default: 0

      t.string :favorite
      t.string :history

      t.timestamps
    end
    add_index :girls, :email, unique: true
    add_index :girls, :invitation_code, unique: true
  end
end
