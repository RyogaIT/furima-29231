class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, present: true
         validates :email, present: true
         validates :password, present: true
         validates :firstname, present: true
         validates :lastname, present: true
         validates :firstnamekana, present: true
         validates :lastnamekana, present: true
         validates :birthday, present: true
end
