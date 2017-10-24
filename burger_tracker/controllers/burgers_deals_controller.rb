require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/burgerdeal.rb' )
require_relative( '../models/burger.rb' )
require_relative( '../models/eatery.rb' )
require_relative( '../models/deal.rb' )

get '/burgers_deals' do
  @burgerdeals = BurgerDeal.all
  erb (:"burgers_deals/index")
end

get '/burgers_deals/new' do
  @burgers = Burger.all
  @deals = Deal.all
  erb(:"burgers_deals/new")
end

post '/burgers_deals' do
  params["burger_id"].each do |item|

    options = {}
    options["deal_id"] = params["deal_id"]
    options["burger_id"] = item

    @burgerdeals = BurgerDeal.new(options)
    @burgerdeals.save()
  end
  redirect to '/burgers_deals'
end
