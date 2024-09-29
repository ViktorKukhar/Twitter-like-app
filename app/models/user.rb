class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true,
            length: { minimum: 3, maximum: 50 },
            uniqueness: true,
            format: { with: /\A[a-zA-Z0-9_]+\z/ }

end
