class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true , length: { maximum: 255 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friendships, class_name: "Friendship", foreign_key: 'sender_id'
  has_many :friends, through: :friendships, source: "receiver"
  has_many :friend_requests, class_name: "FriendRequest", foreign_key: 'request_sender'
  has_many :requests_received, class_name: "FriendRequest", foreign_key: 'request_receiver'
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
end
