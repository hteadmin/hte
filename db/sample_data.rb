ps3 = Product.first

6.times do |x|
  Instance.create! product: ps3, name: "Set #{x + 1}", slug: "set#{x+1}", available: true, games: Game.offset(rand(Game.count))
end