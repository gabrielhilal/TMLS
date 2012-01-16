class CreateFactories < ActiveRecord::Migration
  def change
    create_table :factories do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :postcode
      t.string :country
      t.string :city
      t.string :telephone
      t.string :email
      t.string :contact

      t.timestamps

    add_index :factories, :name, :unique => true
    add_index :factories, :email, :unique => true
    end

  end
end
