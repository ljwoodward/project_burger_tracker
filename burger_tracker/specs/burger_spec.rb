require("minitest/autorun")
require("minitest/rg")
require_relative("../models/burger.rb")
require_relative("../models/deal.rb")
require_relative("../models/eatery.rb")

class TestBurger < MiniTest::Test

  def setup()
    @eatery1 = Eatery.new('name' => 'Big Kahuna Burger', 'url' => 'www.bigkahunaburger.com')
    @burger1 = Burger.new('name' => 'Big Kahuna Special', 'price' => 9.99, 'eatery_id' => @eatery1.id)
    @deal1 = Deal.new('name' => 'Big Kahuna Deal', 'day' => 'Tuesday', 'discount' => 20, 'eatery_id' => @eatery1.id)
  end

  def test_discount()
    result = @burger1.discount(@deal1)
    assert_equal(7.99, result)
  end

end
