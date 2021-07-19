# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

	def welcome_email
		order = Order.last
		OrderMailer.welcome_email(order)
	end

end
