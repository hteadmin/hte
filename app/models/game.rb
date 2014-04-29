class Game < ActiveRecord::Base
  has_attached_file :photo, :styles => { :thumb => "256x256>" }, :default_url => lambda { |game| game.instance.set_default_url}
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  has_many :instance_games
  has_many :instances, :through => :instance_games


  def set_default_url
    ActionController::Base.helpers.asset_path('no-poster.jpg')
  end
end
