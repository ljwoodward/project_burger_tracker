require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/burgers_controller')
require_relative('controllers/deals_controller')
require_relative('controllers/eateries_controller')
require_relative('controllers/burgers_deals_controller')
require_relative('controllers/admin_controller')

get '/' do
  erb( :index )
end
