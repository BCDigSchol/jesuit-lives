Rails.application.routes.draw do

  get "/dashboard/" => "dashboard#index"

  resources :staticpages

  namespace :pages, path: '/pages' do
    # root goes to dedicated home page record
    get "/" => '/staticpages#load_page', slug: :home, as: 'home_page'
    get "/:slug" => '/staticpages#load_page', as: 'page'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  concern :range_searchable, BlacklightRangeLimit::Routes::RangeSearchable.new
  resources :jesuits
  resources :places
  resources :provinces
  resources :titles

  mount Blacklight::Engine => '/'
  root to: "catalog#index"
  concern :searchable, Blacklight::Routes::Searchable.new

  resource :catalog, only: [:index], as: 'catalog', path: '/catalog', controller: 'catalog' do
    concerns :searchable
    concerns :range_searchable

  end
  devise_for :users
  concern :exportable, Blacklight::Routes::Exportable.new

  resources :solr_documents, only: [:show], path: '/catalog', controller: 'catalog' do
    concerns :exportable
  end

  resources :solr_documents, only: [:show], path: '/catalog', controller: 'catalog'do
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
