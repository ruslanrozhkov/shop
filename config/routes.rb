Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :categories
    resources :products do
      resources :pictures
    end
    resources :comments
  end
end
