class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'
  #has_many :unread_messages, class_name: 'Message', -> {where(read_at: nil)}

  has_many :friendship,->{ where(status: true) }, class_name: 'Friend'
  has_many :friends, :through => :friendship

  has_many :requested_friendship,->{ where(status: true) }, class_name: 'Friend',  foreign_key: 'friend_id'
  has_many :friend_requested, :through => :requested_friendship, source: :user

  has_many :pending, ->{ where(:status => nil) }, :class_name => 'Friend', :foreign_key => 'friend_id'
  has_many :pending_friends, through: :pending, :source => :user

  has_many :other, class_name: 'Friend', foreign_key: 'user_id'
  has_many :other1, :through => :other, :source => :user


  def unread_messages
    @message = received_messages.where(read_at: nil)
  end

  def friend_list
    @friends = friends + friend_requested
  end

end
