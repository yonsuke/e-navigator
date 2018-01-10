class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name,  presence: true
  validates :birthdate,  presence: true
  validates :gender,  presence: true
  validates :school,  presence: true
  enum gender: { male:0, female:1 }
end
