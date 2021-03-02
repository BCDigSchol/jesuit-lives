Rails.application.routes.draw do

  catalog_id_regex = /\d+\.\d+/

  resources :jesuits
  resources :places
  resources :provinces
  resources :titles

  mount Blacklight::Engine => '/'
  root to: "catalog#index"
  concern :searchable, Blacklight::Routes::Searchable.new

  resource :catalog, only: [:index], as: 'catalog', path: '/catalog', controller: 'catalog', constraints: { id: catalog_id_regex} do
    concerns :searchable
  end
  devise_for :users
  concern :exportable, Blacklight::Routes::Exportable.new

  resources :solr_documents, only: [:show], path: '/catalog', controller: 'catalog', constraints: { id: catalog_id_regex } do
    concerns :exportable
  end

  resources :solr_documents, only: [:show], path: '/catalog', controller: 'catalog', constraints: { id: catalog_id_regex } do
    concerns :exportable
  end


  resources :bookmarks do
    concerns :exportable

    collection do
      delete 'clear'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
