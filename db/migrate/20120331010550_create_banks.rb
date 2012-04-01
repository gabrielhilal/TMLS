class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :notice
      t.string :name
      t.string :sort_code
      t.string :account
      t.string :swift
      t.string :iban
      t.string :bic
      t.string :address

      t.timestamps
    end
  end
end
