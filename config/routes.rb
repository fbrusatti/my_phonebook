Phonebook::Application.routes.draw do

  resources :companies
  resources :contacts do
     get :search, :on => :collection
  end

  root :to => "landing#index"

end
