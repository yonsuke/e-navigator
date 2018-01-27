class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :interviews
  validates :name,  presence: true
  validates :birthdate,  presence: true
  validates :gender,  presence: true
  validates :school,  presence: true
  enum gender: { male:0, female:1 }

  def age
    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - birthdate.strftime(date_format).to_i) / 10000
  end
end
