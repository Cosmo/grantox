Grantox::Engine.routes.draw do
  root 'pages#index'
  
  resources :nodes
  resources :sections
  resources :pages
  resources :links
  
  resources :connectors do
    collection do
      post "add"
    end
    member do
      put "move"
    end
  end
  
  Grantox::ContentBlock.installed.each do |content_block|
    resources content_block.to_s.to_sym
  end
  resources :content_blocks
  
  match "*path", to: "pages#show", via: :all
end

Rails.application.routes.draw do
  get "visual_edit_mode", to: "grantox/application#visual_edit_mode"
  root 'grantox/pages#index'
  match "*path", to: "grantox/pages#show", via: :all
end