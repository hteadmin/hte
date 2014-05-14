Product.find_by_slug('ps3').tap do |ps3|
  10.times do |x|
    Instance.create! product: ps3, name: "Set #{x + 1}", slug: "set#{x+1}", available: true, games: Game.offset(rand(Game.count))
  end
end

Product.find_by_slug('ps4').tap do |ps4|
  6.times do |x|
    Instance.create! product: ps4, name: "Set #{x + 1}", slug: "set#{x+1}", available: true, games: Game.offset(rand(Game.count))
  end
end