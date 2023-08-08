class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :reactions, dependent: :destroy
         has_many :publications, through: :reactions
         has_many :comments, dependent: :destroy
end
