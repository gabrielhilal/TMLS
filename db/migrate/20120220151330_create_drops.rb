class CreateDrops < ActiveRecord::Migration
  def change
    create_table :drops do |t|
      t.date :factory_date
      t.date :customer_date
      t.integer :order_id
      t.integer :consignee_id

      t.timestamps
    end
  end
end
