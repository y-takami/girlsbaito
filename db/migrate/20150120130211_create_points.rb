class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :girl
      t.references :congratulation
      t.integer :amount

      t.timestamps
    end
  end
end
