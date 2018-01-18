class Interview < ApplicationRecord
  belongs_to :user
  validates :start_time, presence: true
  validates :status, presence: true
  validates :user_id,  presence: true
  enum status: { pending: 0, approved: 1, rejected: 2 }
end
