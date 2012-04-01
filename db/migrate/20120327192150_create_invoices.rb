class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :number
      t.date :date
      t.integer :cartoons
      t.decimal :gross, :precision => 7, :scale => 4
      t.decimal :net, :precision => 7, :scale => 4
      t.decimal :cubic, :precision => 7, :scale => 4
      t.string :hts
      t.boolean :paid
      t.integer :drop_id
      t.integer :bank_id
      t.decimal :vat, :precision => 7, :scale => 2
      t.string  :factory_invoice

      t.timestamps
    end
  end
end
