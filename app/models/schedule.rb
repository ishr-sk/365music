class Schedule < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {maximum: 50}
  validates :body, presence: true, length: {maximum: 100}
  validates :user_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
