class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :product_name        ,null: false
      t.text    :description         ,null: false
      t.integer :category_id         ,null: false
      t.integer :condition_id        ,null: false
      t.integer :fee_id              ,null: false
      t.integer :area_id             ,null: false
      t.integer :deliverytime_id     ,null: false
      t.integer :price               ,null: false
      t.references :user , foreign_key: true, null: false
      t.timestamps
      
      

      t.timestamps
    end
  end
end
