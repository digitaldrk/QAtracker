class Qa < ActiveRecord::Base
  belongs_to :member
  validates :title, presence: true
  validates :member, presence: true
end
