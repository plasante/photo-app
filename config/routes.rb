Rails.application.routes.draw do
  get 'charges/new'
  
  get 'saves', to: 'saves#saves', as: 'saves'
  
  post 'charges/create'
  
  get 'thanks', to: 'charges#thanks', as: 'thanks'

  devise_for :users
  
  root 'welcome#index'
end
