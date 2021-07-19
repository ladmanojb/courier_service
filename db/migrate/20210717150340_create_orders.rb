class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :status
      t.string :order_number
      t.string :weight
      t.string :type_of_service
      t.integer :cost_of_service
      t.string :payment_mode
      t.references :sender, null: false, foreign_key: { to_table: :users }
      t.references :receiver, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
