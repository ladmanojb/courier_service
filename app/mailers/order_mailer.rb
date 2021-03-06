class OrderMailer < ApplicationMailer

	def order_created
		@order = params[:order]
    emails = [@order.sender_email_id, @order.receiver_email_id]
    mail( :to      => emails,
          :subject => "Courier service Order Placed"
    ) do |format|
      format.text
      format.html
    end
  end

end
