class Spacecat < ActiveRecord::Base
  validates :name, presence: true
end