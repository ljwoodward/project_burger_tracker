require_relative('../models/user.rb')
require_relative('../models/eatery.rb')
require_relative('../models/visit.rb')
require("pry-byebug")

user1 = User.new('name' => 'Duncan')
user1.save()

eatery1 = Eatery.new('name' => 'Big Kahuna Burger', 'url' => 'www.bigkahunaburger.com')
eatery1.save()

visit1 = Visit.new('user_id' => user1.id, 'eatery_id' => eatery1.id)
visit1.save

binding.pry
nil
