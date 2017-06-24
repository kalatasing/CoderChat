class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'
  #has_many :unread_messages, class_name: 'Message', -> {where(read_at: nil)}


  def unread_messages
    @message = received_messages.where(read_at: nil)
  end

end
