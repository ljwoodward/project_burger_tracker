require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/deal.rb' )
require_relative( '../models/eatery.rb' )
require_relative( '../models/burger.rb' )

get '/deals' do
  @deals = Deal.all
  erb (:"deals/index")
end

get '/deals/new' do
  @eateries = Eatery.all
  @burgers = Burger.all
  erb(:"deals/new")
end

post '/deals' do
  @deal = Deal.new(params)
  @deal.save()
  redirect to '/burgers_deals/new'
end

get '/deals/:id' do
  @deal = Deal.find(params[:id].to_i)
  @burgers = @deal.burgers
  erb(:"deals/show")
end
