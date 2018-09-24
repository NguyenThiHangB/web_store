class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :link
      t.integer :order
      t.integer :status

      t.timestamps
    end
  end
end
