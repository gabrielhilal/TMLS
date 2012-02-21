class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number
      t.date :date
      t.string :currency
      t.string :comments
      t.integer :customer_id
      t.integer :factory_id

      t.timestamps
    end
  end
end
