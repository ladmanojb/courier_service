class Order < ApplicationRecord
	belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
	belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

	delegate :email_id, :full_name, to: :sender, prefix: true
	delegate :email_id, :full_name, to: :receiver, prefix: true

	accepts_nested_attributes_for :sender, :receiver

  before_create :generate_token
  after_create :send_email

  scope :search, lambda {|kw| where('Lower(order_number) like ?', "%#{kw.downcase}%")}

  def sender_full_name
  	sender.full_name
  end

  def receiver_full_name
  	receiver.full_name
  end

	private
	  def generate_token
	    self.order_number = Digest::SHA1.hexdigest([Time.now, rand].join)[0..12].upcase
	    generate_token if Order.exists?(order_number: self.order_number)
	  end

	  def send_email
			OrderMailer.with(order: self).order_created.deliver_later
	  end
end
