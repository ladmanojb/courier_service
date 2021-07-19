class User < ApplicationRecord
	has_many :addresses
	has_many :sent_orders, class_name: "Order", foreign_key: "sender_id"
    has_many :received_orders, class_name: "Order", foreign_key: "receiver_id"
    # delegate :pincode, to: :addresses, allow_nil: true
    accepts_nested_attributes_for :addresses

    validates_presence_of :full_name, :phone_number, :email_id
end
