class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :colour
      t.integer :quantity
      t.decimal :customer_price, :precision => 7, :scale => 2
      t.decimal :factory_price, :precision => 7, :scale => 2
      t.string :mda
      t.string :line_number
      t.string :customer_style
      t.string :lining
      t.string :sock
      t.string :binding
      t.string :metals
      t.string :sole
      t.string :heel
      t.integer :drop_id
      t.integer :style_id

      t.timestamps
    end
  end
end
