UWAnnachat::Application.routes.draw do
  controller :sessions do
  	get "login" => :new
  	post "login" => :create
  	delete "logout" => :destroy
  end

  controller :static do
  	get "faq" => :faq
  	get "rules" => :rules
  	get "about" => :about
  	get "sitemap" => :sitemap
  	get "contact" => :contact
    get "ref" => :ref
  end

  resources :users
  resources :chatrooms
  resources :messages

  root :to => 'static#home'
end
