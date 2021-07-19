# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

	def order_created
		order = Order.last
		OrderMailer.with(order: order).order_created
	end

end
