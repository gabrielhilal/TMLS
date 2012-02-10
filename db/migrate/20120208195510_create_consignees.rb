class CreateConsignees < ActiveRecord::Migration
  def change
    create_table :consignees do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :country
      t.string :postcode
      t.integer :customer_id

      t.timestamps
    end
  end
end
