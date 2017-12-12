class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|

      t.string :belong
      t.string :name
      t.string :name_kana
      t.string :company_name
      t.string :company_name_kana
      t.string :mail
      t.string :tel
      t.string :homepage
      t.string :content

      t.timestamps
    end
  end
end
