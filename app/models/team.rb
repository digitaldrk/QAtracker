class Team < ActiveRecord::Base
  belongs_to :user
  has_many :members
  has_many :qas, through: :members
end
