class TimeOff < ApplicationRecord
  has_many :users, through: :approvals
end
