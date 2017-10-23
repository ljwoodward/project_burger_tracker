require_relative('../models/user.rb')
require_relative('../models/eatery.rb')
require_relative('../models/visit.rb')
require_relative('../models/burger.rb')
require_relative('../models/deal.rb')
require_relative('../models/burgerdeal.rb')
require("pry-byebug")

BurgerDeal.delete_all()
Deal.delete_all()
Burger.delete_all()
Visit.delete_all()
Eatery.delete_all()
User.delete_all()

user1 = User.new('name' => 'Jarrod')
user1.save()

eatery1 = Eatery.new('name' => 'Big Kahuna Burger', 'url' => 'www.bigkahunaburger.com')
eatery1.save()

visit1 = Visit.new('user_id' => user1.id, 'eatery_id' => eatery1.id)
visit1.save

burger1 = Burger.new('name' => 'Big Kahuna Special', 'price' => 9.99, 'eatery_id' => eatery1.id)
burger1.save

deal1 = Deal.new('name' => 'Big Kahuna Deal', 'day' => 'Tuesday', 'discount' => 2, 'eatery_id' => eatery1.id)
deal1.save

burgerdeal1 = BurgerDeal.new('eatery_id' => eatery1.id, 'burger_id' => burger1.id)
burgerdeal1.save

binding.pry
nil
