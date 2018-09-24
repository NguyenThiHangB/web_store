class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.date :birth_day
      t.string :email
      t.integer :phone
      t.string :address

      t.references :user, foreignkey: true
      t.references :province, foreignkey: true

      t.timestamps
    end
  end
end
