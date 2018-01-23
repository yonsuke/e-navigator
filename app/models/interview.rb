class Interview < ApplicationRecord
  belongs_to :user
  default_scope -> { order(:start_time) }
  validates :start_time, presence: true
  validates :status, presence: true
  enum status: { pending: 0, approved: 1, rejected: 2 }
  validate :is_the_date_the_future?

  private

    def is_the_date_the_future?
      if start_time.past?
        errors.add(:start_time, "は未来の時間を指定してください")
      end
    end
end
