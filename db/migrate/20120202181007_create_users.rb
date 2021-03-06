class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :department
      t.string :name
      t.integer :factory_id
      t.boolean :admin

      t.timestamps
    end
  end
end
