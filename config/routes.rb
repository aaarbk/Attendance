Rails.application.routes.draw do
  get 'shifts/new' #  localhost:3000/shifts/new <-- shift allocation form
  resources :shifts
  get 'assignment_details/index'
  get 'home/index'
  get 'welcome', to: 'attendance#welcome', as: "welcome"
  post '/process', to: 'attendance#proc'
  post '/sa', to: 'attendance#shift_allocate' 
  root "attendance#welcome"

  get "/welcome", to: "attendance#welcome"
end
