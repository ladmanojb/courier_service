class OrdersController < ApplicationController

	def index
		@orders = Order.includes(:sender, :receiver).all
	end

	def new
		@order = Order.new
		@sender = @order.create_sender
		@receiver = @order.create_receiver
		@sender_address = @sender.addresses.build
		@receiver_address = @receiver.addresses.build
	end

	def create
   	@order = Order.new(order_params)
   	if @order.save
   		redirect_to orders_path, notice: 'Order Created Successfully'
   	else
   		render :new
   	end
	end

	def search
	  if params[:search].blank?
	    redirect_to(root_path, alert: 'Empty field!') and return
	  else
	    @results = Order.search(params[:search].downcase)
	  end
	end

	private

	def order_params
		params.require(:order).permit(:status, :weight, :type_of_service, :cost_of_service, :payment_mode, :sender_attributes => [:full_name, :phone_number, :email_id, :addresses_attributes => [:address, :pincode]], :receiver_attributes => [:full_name, :phone_number, :email_id, :addresses_attributes => [:address, :pincode]])
	end

end
