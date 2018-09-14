class CreateTypeNews < ActiveRecord::Migration[5.2]
  def change
    create_table :type_news do |t|
      t.string :name
      t.text :note

      t.references :category, foreignkey: true

      t.timestamps
    end
  end
end
