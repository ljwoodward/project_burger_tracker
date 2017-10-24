require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/burger.rb' )
require_relative( '../models/eatery.rb' )
require_relative( '../models/deal.rb' )

get '/burgers' do
  @burgers = Burger.all
  erb (:"burgers/index")
end

get '/burgers/new' do
  @eateries = Eatery.all
  @deals = Deal.all
  erb(:"burgers/new")
end

post '/burgers' do
  @burger = Burger.new(params)
  @burger.save()
  redirect to '/burgers'
end

get '/burgers/:id' do
  @burger = Burger.find(params[:id].to_i)
  erb(:"burgers/show")
end
