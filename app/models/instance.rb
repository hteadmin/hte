class Instance < ActiveRecord::Base
  belongs_to :product
  has_many :instance_games
  has_many :games, :through => :instance_games
end
