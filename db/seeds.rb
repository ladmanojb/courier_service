# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


sender = User.create(full_name: "sender one", phone_number: 987654, email_id: 'abc@gmail.com')
sender_address = Address.create(address: 'Address one', pincode: '1234', user:sender)
receiver = User.create(full_name: "receiver one", phone_number: 7654432, email_id: 'pqr@gmail.com')
receiver_address = Address.create(address: 'Address tow', pincode: '9876', user:receiver)

order = Order.create(status: 'Sent', sender: sender, receiver: receiver, weight: '10', type_of_service: 'Speed Post', cost_of_service: '50',payment_mode:'COD')