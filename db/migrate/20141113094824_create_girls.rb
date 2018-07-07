class CreateGirls < ActiveRecord::Migration
  def change
    create_table :girls do |t|
      t.string :nickname
      t.string :name

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


      t.string :invitation_code
      t.integer :invitation_num, default: 0
      t.integer :invitation_point, default: 0

      t.string :favorite
      t.string :history

      t.string :email
      t.string :encrypted_password

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      t.timestamps
    end
    add_index :girls, :email, unique: true
    add_index :girls, :invitation_code, unique: true
  end
end
