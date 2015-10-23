class Qa < ActiveRecord::Base
  belongs_to :member
  
  validates :title, presence: true
  validates :member_id, presence: true
  validates :team_id, presence: true
end
