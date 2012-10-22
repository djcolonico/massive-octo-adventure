UWAnnachat::Application.routes.draw do
  controller :sessions do
  	get "login" => :new
  	post "login" => :create
  	delete "logout" => :destroy
  end

  resources :users
  resources :chatrooms
  resources :messages
end
