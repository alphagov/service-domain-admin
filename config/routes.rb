Rails.application.routes.draw do
  get '/domains', to: 'domains#index'
end
