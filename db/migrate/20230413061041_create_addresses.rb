class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code,        null: false
      t.integer :area_id,         null: false
      t.string :municipalities,    null: false
      t.string :house_number,      null: false
      t.string :building_name,     
      t.string :phone_number,      null: false
      t.references :order,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
