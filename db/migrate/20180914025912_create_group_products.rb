class CreateGroupProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :group_products do |t|
      t.string :name
      t.string :image
      t.text :content
      t.integer :order
      t.integer :status

      t.timestamps
    end
  end
end
