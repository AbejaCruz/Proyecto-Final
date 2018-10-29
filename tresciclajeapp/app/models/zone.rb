class Zone < ActiveRecord::Base
  # has_many :users
  has_many :sources
  belongs_to :city

  validates :name, presence: true
  validates :city, presence: true
end