Rails.application.routes.draw do
  resources :links
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'ss/:short_url', to: 'links#url_redirect'
end
