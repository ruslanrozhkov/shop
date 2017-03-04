Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :categories
    resources :products do
      resources :pictures
      resources :items, controller: 'product_items'
    end
    resources :params, controller: 'parameter_names' do
      resources :values, controller: 'parameter_values'
    end
    resources :comments
  end
end
