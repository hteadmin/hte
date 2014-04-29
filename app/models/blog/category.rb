class Blog::Category < ActiveRecord::Base
  validates :name, :slug, presence: true
  has_many :articles, dependent: :destroy
end
