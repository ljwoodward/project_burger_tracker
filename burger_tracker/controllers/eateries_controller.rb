require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/eatery.rb' )
require_relative( '../models/burger.rb' )
require_relative( '../models/deal.rb' )

get '/eateries' do
  @eateries = Eatery.all
  erb (:"eateries/index")
end

get '/eateries/:id' do
  @eatery = Eatery.find(params[:id].to_i)
  @burgers = @eatery.burgers
  erb(:"eateries/show")
end
