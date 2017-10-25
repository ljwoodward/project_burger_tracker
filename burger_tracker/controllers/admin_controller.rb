require( 'sinatra' )
require( 'sinatra/contrib/all' )

get '/admin' do
  erb(:"admin/index")
end
