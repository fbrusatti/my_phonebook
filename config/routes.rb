Phonebook::Application.routes.draw do

  resources :companies do 
    resources :contacts
  end
  resources :contacts

  root :to => "landing#index"

end
