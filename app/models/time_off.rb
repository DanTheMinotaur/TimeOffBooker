class TimeOff < ApplicationRecord
  belongs_to :user

  enum off_type: { holiday: 0, sick: 1 }
end
