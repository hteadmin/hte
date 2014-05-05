class PreOrder < ActiveRecord::Base
  serialize :games, Array
  belongs_to :district, class_name: 'Shipping', foreign_key: 'district_id'

  def address
    "%s, %s, TP.HCM" % [street, district]
  end
end
