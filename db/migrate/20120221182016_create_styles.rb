class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :style
      t.string :construction
      t.string :picture

      t.timestamps
    end
  end
end
