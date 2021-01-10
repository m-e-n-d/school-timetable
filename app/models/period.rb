class Period < ApplicationRecord
  belongs_to :user

  validates :subject, uniqueness: { scope: [:weekday, :period_num, :user_id] }
end
