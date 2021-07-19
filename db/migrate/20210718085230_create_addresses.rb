class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :pincode
      t.references :user

      t.timestamps
    end
  end
end
