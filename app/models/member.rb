class Member < ActiveRecord::Base
  #attr_accessor :team
  has_and_belongs_to_many :teams
  has_many :qas
  
  
  #validates :team, presence: true
  #validates :name, presence: true
  #validates :name, uniqueness: true
end
