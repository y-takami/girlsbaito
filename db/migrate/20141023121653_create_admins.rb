class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :email
      t.string :password_digest
      t.boolean :suspended, default: false
      
      t.timestamps
    end
    
    add_index :admins, :email, unique: true
  end
end
