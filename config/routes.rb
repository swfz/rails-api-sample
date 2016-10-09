Rails.application.routes.draw do
  resources :users

  get 'jobs/:text', :to => 'jobs#sample'
end
