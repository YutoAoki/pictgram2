class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  #その時、throughを使用することで、
  #以下の図のように、お気に入りを通した投稿を取得することができます。
  has_secure_password


end
