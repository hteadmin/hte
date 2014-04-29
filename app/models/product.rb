class Product < ActiveRecord::Base
  has_attached_file :photo, :styles => { :thumb => "256x256>" }, :default_url => lambda { |product| product.instance.set_default_url}
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  belongs_to :root, :class_name => 'Product'
  has_many :accessories, :class_name => 'Product', :foreign_key => 'root_id'

  scope :accessories, -> {where("root_id IS NOT NULL")}

  def set_default_url
    ActionController::Base.helpers.asset_path('missing.png')
  end

  def sell_price
    sale_price.presence || price.presence || 0
  end
end
