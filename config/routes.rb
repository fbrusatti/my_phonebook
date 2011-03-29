Phonebook::Application.routes.draw do

  resources :contacts

  root :to => "landing#index"

end
