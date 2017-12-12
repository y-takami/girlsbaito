class CreateShopInfos < ActiveRecord::Migration
  def change
    create_table :shop_infos do |t|
      t.integer :group_number, default: 1
      t.string :shop_name
      t.string :url
      t.string :admin_name
      t.string :admin_name_sei
      t.string :admin_name_mei
      t.string :admin_email
      t.string :admin_tel
      t.string :billing_company
      t.string :manager_name
      t.string :manager_name_sei
      t.string :manager_name_mei
      t.string :billing_email
      t.string :billing_tel
      t.string :postal_first
      t.string :postal_last
      t.string :prefecture
      t.string :city
      t.string :house_number
      t.string :password_digest
      t.boolean :examine, default: false
      t.boolean :suspended, default: false

      t.timestamps
    end
    add_index :shop_infos, :admin_email, unique: true
  end
end
