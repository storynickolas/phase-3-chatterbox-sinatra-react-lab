class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    messages = Message.by_created
    messages.to_json
  end

  post '/messages' do
    im = Message.create(
      body: params[:body],
      username: params[:username]
    )
    im.to_json
  end

  patch '/messages/:id' do
    old = Message.find(params[:id])
    old.update(
      body: params[:body]
    )
    old.to_json
  end

  delete '/messages/:id' do
    old = Message.find(params[:id])
    old.destroy
    old.to_json
  end
  
end
