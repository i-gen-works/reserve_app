class Reservation < ApplicationRecord
  validates :people, presence: true
  validates :start_at, presence: true, comparison: { less_than: :end_at }
  validates :end_at, presence: true, comparison: { greater_than: :start_at }
  validate :time_check
  validate :reserve_check

  enum :status, { reserved: 0, cancelled: 1 }

  belongs_to :room
    belongs_to :user

    def time_check
      errors.add(:start_at,"は0分または30分を選択してください") unless [00,30].include?(start_at.min)
      errors.add(:end_at,"は0分または30分を選択してください") unless [00,30].include?(end_at.min)
      errors.add(:start_at,"は0秒を選択してください") unless start_at.sec.zero?
      errors.add(:end_at,"は0秒を選択してください") unless end_at.sec.zero?
      errors.add(:end_at,"予約時間は最長4時間までです") if end_at - start_at > 4.hours
    end

    def reserve_check
      errors.add(:start_at, "9:00より前の予約はできません") if start_at.hour < 9
    end
end
