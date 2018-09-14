class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.text :summary
      t.float :price
      t.float :price_discount
      t.integer :status

      t.references :group_product, foreignkey: true

      t.timestamps
    end
  end
end
