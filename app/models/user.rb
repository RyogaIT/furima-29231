class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_one :item_buyer
    
  with_options presence: true do
         validates :nickname, format: { with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input full-width characters."}
       #   validates :email, format: {message: "is invalid. Input full-width characters."}
         validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input full-width characters."}
         validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
         validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
         validates :firstnamekana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width characters."}
         validates :lastnamekana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width characters."}
         validates :birthday
  end
end
