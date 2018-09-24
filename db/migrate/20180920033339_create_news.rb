class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.string :image
      t.text :summary
      t.text :detail
      t.integer :view
      t.integer :hot_view
      t.integer :status

      t.references :type_new, foreignkey: true

      t.timestamps
    end
  end
end
