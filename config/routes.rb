Rails.application.routes.draw do
  #get 'attendance/welcome'
  post '/process', to: 'attendance#proc'
  root "attendance#welcome"
end
