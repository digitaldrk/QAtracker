class Member < ActiveRecord::Base
  belongs_to :team
  has_many :qas
  validates :team, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
end
