require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/eatery.rb' )
require_relative( '../models/burger.rb' )
require_relative( '../models/deal.rb' )

get '/eateries' do
  @eateries = Eatery.all
  erb (:"eateries/index")
end

get '/eateries/new' do
  @deals = Deal.all
  @burgers = Burger.all
  erb(:"eateries/new")
end

post '/eateries' do
  @eatery = Eatery.new(params)
  @eatery.save()
  redirect to '/eateries'
end

get '/eateries/:id' do
  @eatery = Eatery.find(params[:id].to_i)
  @burgers = @eatery.burgers
  erb(:"eateries/show")
end

get '/eateries/:id/edit' do
  @eatery = Eatery.find(params[:id].to_i)
  erb(:"eateries/edit")
end

post '/eaterys/:id' do
  Eatery.new(params).update
  redirect to '/eateries'
end
