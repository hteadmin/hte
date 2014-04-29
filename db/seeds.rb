# encoding: UTF-8

Shipping.create!(location: 'Quận 1', price: 50000)
Shipping.create!(location: 'Quận 2', price: 50000)
Shipping.create!(location: 'Quận 3', price: 50000)
Shipping.create!(location: 'Quận 4', price: 50000)
Shipping.create!(location: 'Quận 5', price: 50000)
Shipping.create!(location: 'Quận 6', price: 50000)
Shipping.create!(location: 'Quận 7', price: 50000)
Shipping.create!(location: 'Quận 8', price: 50000)
Shipping.create!(location: 'Quận 9', price: 50000)
Shipping.create!(location: 'Quận 10', price: 50000)
Shipping.create!(location: 'Quận 11', price: 50000)
Shipping.create!(location: 'Quận 12', price: 50000)
Shipping.create!(location: 'Quận Phú Nhuận', price: 50000)
Shipping.create!(location: 'Quận Bình Thạnh', price: 50000)
Shipping.create!(location: 'Quận Tân Bình', price: 50000)
Shipping.create!(location: 'Quận Tân Phú', price: 50000)
Shipping.create!(location: 'Quận Gò Vấp', price: 50000)
Shipping.create!(location: 'Quận Bình Tân', price: 50000)
Shipping.create!(location: 'Quận Thủ Đức', price: 50000)

def get_product_photo(file)
  File.new(Rails.root.join("app", "assets", "images", "products", file))
end

Product.create!(name: 'Máy PS3 (bao gồm 1 tay cầm + game đã được cài sẵn trong máy)', slug: 'ps3', cost: 8000000, price: 350000, sale_price: 280000, unit: 'tuần / máy', photo: get_product_photo('ps3.jpg')).tap do |ps3|
  Product.create!(root: ps3, name: 'Tay Cầm', slug: 'tay-cam-ps3', cost: 1000000, price: 100000, sale_price: 80000, noc_price: 120000, unit: 'tuần / tay', photo: get_product_photo('ps3_controller.jpg'))
  Product.create!(root: ps3, name: 'Bộ PS Move (tay cầm Move + camera)', slug: 'ps-move-bundle', cost: 1600000, price: 120000, sale_price: 100000, noc_price: 150000, unit: 'tuần / bộ', photo: get_product_photo('ps3_move.jpg'))
  Product.create!(root: ps3, name: 'Tay cầm Move', slug: 'tay-cam-move', cost: 900000, price: 100000, sale_price: 80000, noc_price: 120000, unit: 'tuần / tay', photo: get_product_photo('ps3_move_controller.jpg'))
  Product.create!(root: ps3, name: 'Tay cầm Navigator', slug: 'navigator', cost: 900000, price: 100000, sale_price: 80000, noc_price: 120000, unit: 'tuần / tay', photo: get_product_photo('ps3_navigator.jpg'))
end

Game.create! name: "Dynasty Warrior 8", slug: 'dynasty-warrior-8'
Game.create! name: "Resident Evil 6", slug: 'resident-evil-6'
Game.create! name: "God of War Ascension", slug: 'god-of-war-ascension'
Game.create! name: "Metal Gear Solid V: Ground Zero", slug: 'metal-gear-solid-v'
Game.create! name: "Assassin's Creed 3", slug: 'assassin-creed-3'
Game.create! name: "Need For Speed Most Wanted", slug: 'need-for-speed-most-wanted'
Game.create! name: "Sniper Ghost Warrior 2", slug: 'sniper-ghost-warrior-2'
Game.create! name: "The Last Of Us", slug: 'the-last-of-us'
Game.create! name: "Twisted Metal", slug: 'twisted-metal'
Game.create! name: "Far Cry 3", slug: 'far-cry-3'
Game.create! name: "Uncharted 3: GOTY", slug: 'uncharted-3'
Game.create! name: "Bayonetta", slug: 'bayonetta'
Game.create! name: "Hatsune Miku: Project Diva F", slug: 'hatsune-miku'
Game.create! name: "Yu-ri-oh! 5D's Decade Duels Plus", slug: 'yu-ri-oh'
Game.create! name: "Batman Arkham City", slug: 'batman-arkham-city'
Game.create! name: "EA Sport : MMA", slug: 'mma'