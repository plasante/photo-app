Rails.application.routes.draw do
  get 'charges/new'
  
  get 'saves', to: 'saves#save_money', as: 'saves'
  get 'details', to: 'saves#show_details', as: 'details'
  
  post 'charges/create'
  
  get 'thanks', to: 'charges#thanks', as: 'thanks'

  devise_for :users
  
  root 'welcome#index'
end
