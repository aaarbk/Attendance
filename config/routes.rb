Rails.application.routes.draw do
  get 'assignment_details/index'
  get 'home/index'
  get 'welcome', to: 'attendance#welcome', as: "welcome"
  post '/process', to: 'attendance#proc'
  root "attendance#welcome"

  get "/welcome", to: "attendance#welcome"
end
