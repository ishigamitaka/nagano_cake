class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer:customer_id, null: false
      t.integer:postage, null: false
      t.integer:method_of_payment, null: false
      t.integer:payment, null: false
      t.string:address_name, null: false
      
      t.timestamps
    end
  end
end
