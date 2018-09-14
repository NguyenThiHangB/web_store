class CreateAdvertisers < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisers do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :address

      t.references :province, foreignkey: true

      t.timestamps
    end
  end
end
