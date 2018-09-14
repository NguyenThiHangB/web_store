class CreateAdvertises < ActiveRecord::Migration[5.2]
  def change
    create_table :advertises do |t|
      t.string :name
      t.string :image
      t.integer :width
      t.integer :height
      t.string :link
      t.integer :target
      t.integer :position
      t.string :click
      t.integer :order
      t.integer :status
      t.float :money

      t.references :advertiser, foreignkey: true

      t.timestamps
    end
  end
end
