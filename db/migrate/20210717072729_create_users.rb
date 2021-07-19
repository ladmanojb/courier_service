class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :phone_number
      t.string :email_id
      t.timestamps
    end
  end
end