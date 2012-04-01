class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number
      t.date :date
      t.string :currency
      t.string :comments
      t.integer :customer_id
      t.integer :factory_id
      t.decimal :finance, :precision => 7, :scale => 2
      t.decimal :returns, :precision => 7, :scale => 2
      t.boolean :acknowledgement
      t.date    :acknowledgementdate
      t.string  :edited
      t.date    :edited_date

      t.timestamps
    end
  end
end
