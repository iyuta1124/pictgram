class User < ApplicationRecord
    validates :name, presence: true,length: { maximum: 15 }
  validates :email,format:{with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },presence: true
  validates :password,presence: true,length: { minimum:8, maximum: 32 }, format:{with:/([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/}
  
  has_secure_password
  
  has_many :topics
  
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  
  has_many :comments
  has_many :comments_topics, through: :comments, source: 'topic'
end
