Rails.application.routes.draw do
  get 'info/index'
  get 'home/index'
  get 'welcome', to: 'attendance#welcome', as: "welcome"
  post '/process', to: 'attendance#proc'
  root "home#index"
end
