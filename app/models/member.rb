class Member < ActiveRecord::Base
  has_many :member_teams
  has_many :teams, through: :member_teams
  has_many :qas
  validates :team, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true

  def team
    teams.first
  end
end
