require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('./models/pizza.rb')

#INDEX   READ - ALL
get '/pizzas' do
  @pizzas=Pizza.all
  erb(:index)
end

#NEW  CREATE - GET FORM
get '/pizzas/new' do

erb(:new)
end

#SHOW  READ - FIND BY ID
get '/pizzas/:id' do
@pizza=Pizza.find( params[:id] )
  erb(:show)
end


#CREATE   CREATE - SUBMIT FORM
post '/pizzas' do
@new_order=Pizza.new(params)
@new_order.save
erb(:create)
  end


#EDIT   UPDATE -- CREATE FORM
get '/pizzas/:id/edit' do
@pizza = Pizza.find(params[:id])

  erb(:edit)
  end

#UPDATE   UPDATE - SUBMIT FORM
post '/pizzas/:id' do
pizza= Pizza.new (params)
pizza.update
redirect to('/pizzas')
end


#DESTROY  DELETE
# Method =’POST’ action = ‘pizzas/:id/delete’
post '/pizzas/:id/delete' do
@pizza=Pizza.find( params[:id])
@pizza.delete
redirect to('/pizzas')
return "#{@pizza.last_name} has been deleted"
end