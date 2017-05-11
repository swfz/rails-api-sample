Rails.application.routes.draw do
  resources :users

  get 'jobs/:text', :to => 'jobs#sample'

  require 'resque/server'
  mount Resque::Server.new, :at => '/resque'
end
