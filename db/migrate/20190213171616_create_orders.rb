class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :reference
      t.string :purchaseChanel
      t.string :clientName
      t.string :address
      t.string :deliveryService
      t.decimal :totalValue
      t.string :lineItems
      t.string :status
      t.references :batch, index: true

      t.timestamps
    end
  end
end
