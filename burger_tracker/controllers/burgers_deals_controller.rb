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
  @burger = Burger.new(params)
  @burger.save()
  redirect to '/burgers_deals'
end
