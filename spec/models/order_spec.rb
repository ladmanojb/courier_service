require 'rails_helper'

RSpec.describe Order, type: :model do
 	before(:each) do
    sender = User.create(full_name: "Test Order", phone_number: "987654321", email_id: "abcd@gmail.com")
    receiver = User.create(full_name: "Test Order", phone_number: "987654321", email_id: "pqr@gmail.com")
    @order = Order.create(status: "Sent", weight: "5", type_of_service: "Speed Post", cost_of_service:'10', payment_mode:'COD', sender: sender, receiver:receiver)
	end

  it "finds a searched order by order_number" do
    order_number = @order.order_number
    result = Order.search(order_number.to_s)
    expect(result).to eq([@order])
  end

  it "finds a searched order by order_number with random string" do
    order_number = @order.order_number
    result = Order.search('RANDOMSTING')
    expect(result).to eq([])
  end

  it "ensure email with correct subject" do
	  result = OrderMailer.with(order: @order).order_created.deliver_now
    expect(result.subject).to eq('Courier service Order Placed')
  end

  it "ensure correct emails in to email" do
    result = OrderMailer.with(order: @order).order_created.deliver_now
    expect(result.to).to eq(['abcd@gmail.com', 'pqr@gmail.com'])
  end

end
