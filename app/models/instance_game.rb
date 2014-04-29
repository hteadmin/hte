class InstanceGame < ActiveRecord::Base
  belongs_to :instance
  belongs_to :game
end
