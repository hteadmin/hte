class PreOrder < ActiveRecord::Base
  serialize :games, Array
  belongs_to :district
end
