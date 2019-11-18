class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}
  validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :password, length: {in: 8..32}, format: {with: /(?=.*[0-9])(?=.*[a-zA-Z])/}
  validates :password_confirmation, length: {in: 8..32}, format: {with: /(?=.*[0-9])(?=.*[a-zA-Z])/}

  has_secure_password

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
  has_many :comment_topics, through: :comments, source: 'topic'
end
