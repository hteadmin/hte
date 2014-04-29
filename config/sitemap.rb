# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://hte.vn"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  add dich_vu_path, :priority => 0.8, :changefreq => 'weekly'
  add chon_game_path, :priority => 0.6, :changefreq => 'weekly'
  add thue_phu_kien_path, :priority => 0.6, :changefreq => 'weekly'
  Game.find_each do |game|
    add game_path(game.slug), :lastmod => game.updated_at
  end
end