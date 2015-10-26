class Team < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :members
  has_many :qas, through: :members
  
  validates :name, presence: true
  validates :name, uniqueness: true
end
