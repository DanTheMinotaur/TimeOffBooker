class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_level: { unassigned: 0, employee: 1, manager: 2, admin: 3 }

  has_many :time_offs
  has_and_belongs_to_many(:users, :join_table => 'approvals', :foreign_key => 'user_id', :association_foreign_key => 'manager_id')
end
