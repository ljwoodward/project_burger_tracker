require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/burger.rb' )

get '/burgers' do
  @burgers = Burger.all
  erb (:"burgers/index")
end

get '/burgers/:id' do
  @burger = Burger.find(params[:id].to_i)
  erb(:"burgers/show")
end
