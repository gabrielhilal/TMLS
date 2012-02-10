class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :postcode
      t.string :country
      t.string :contact
      t.string :email
      t.string :telephone
      t.decimal :discount, :precision => 8, :scale => 2
      t.decimal :returns, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
