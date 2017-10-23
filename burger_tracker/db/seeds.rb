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
user2 = User.new('name' => 'Ubercorn')
user2.save()

eatery1 = Eatery.new('name' => 'Big Kahuna Burger', 'url' => 'www.bigkahunaburger.com')
eatery1.save()
eatery2 = Eatery.new('name' => 'Bread Meats Bread', 'url' => 'www.breadmeatsbread.com')
eatery2.save()

visit1 = Visit.new('user_id' => user1.id, 'eatery_id' => eatery1.id)
visit1.save
visit2 = Visit.new('user_id' => user2.id, 'eatery_id' => eatery2.id)
visit2.save

burger1 = Burger.new('name' => 'Big Kahuna Special', 'price' => 9.99, 'eatery_id' => eatery1.id)
burger1.save
burger2 = Burger.new('name' => 'Full House Burger', 'price' => 9.00, 'eatery_id' => eatery2.id)
burger2.save
burger3 = Burger.new('name' => 'Big Badass Burger', 'price' => 12.99, 'eatery_id' => eatery1.id)
burger3.save

deal1 = Deal.new('name' => 'Big Kahuna Deal', 'day' => 'Tuesday', 'discount' => 2, 'eatery_id' => eatery1.id)
deal1.save
deal2 = Deal.new('name' => 'BMB Wednesday Madness', 'day' => 'Wednesday', 'discount' => 2, 'eatery_id' => eatery2.id)
deal2.save

burgerdeal1 = BurgerDeal.new('deal_id' => deal1.id, 'burger_id' => burger1.id)
burgerdeal1.save
burgerdeal2 = BurgerDeal.new('deal_id' => deal2.id, 'burger_id' => burger2.id)
burgerdeal2.save
burgerdeal3 = BurgerDeal.new('deal_id' => deal1.id, 'burger_id' => burger3.id)
burgerdeal3.save

binding.pry
nil
