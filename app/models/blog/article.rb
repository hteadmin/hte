class Blog::Article < ActiveRecord::Base
  belongs_to :category
  validates :category, :title, :slug, :body, presence: true

  scope :published, -> { where(published: true) }
  scope :recents, -> (num) { order('created_at DESC').limit(num)}
end
