class Team < ActiveRecord::Base
  belongs_to :user
  has_many :member_teams
  has_many :members, through: :member_team
  has_many :qas, through: :members
  validates :name, presence: true
  validates :name, uniqueness: true
end
