Rails.application.routes.draw do
  root 'static_page#home'
  # get 'static_page/home' not needed as we'll use root_path and rooth_url

  # get 'static_page/help'
  get '/help', to: 'static_page#help'
  # get 'static_page/about'
  get '/about', to: 'static_page#about'
  # get 'static_page/contact'
  get '/contact', to: 'static_page#contact'
end
