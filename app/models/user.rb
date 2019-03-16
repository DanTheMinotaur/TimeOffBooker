class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_level: { unassigned: 0, employee: 1, manager: 2, admin: 3 }

  has_many :time_offs, through: :approvals
end
