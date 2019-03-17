class Approval < ApplicationRecord
  belongs_to :user
  belongs_to :time_off
end
