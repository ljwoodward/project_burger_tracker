require_relative('../models/user.rb')
require_relative('../models/eatery.rb')
require("pry-byebug")

user1 = User.new('name' => 'Duncan')
user1.save()

eatery1 = Eatery.new('name' => 'Big Kahuna Burger', 'url' => 'www.bigkahunaburger.com')
eatery1.save()

binding.pry
nil
