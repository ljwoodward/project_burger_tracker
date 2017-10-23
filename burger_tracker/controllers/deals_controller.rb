require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/deal.rb' )

get '/deals' do
  @deals = Deal.all
  erb (:"deals/index")
end

get '/deals/:id' do
  @deal = Deal.find(params[:id].to_i)
  erb(:"deals/show")
end
