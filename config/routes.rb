Rails.application.routes.draw do
  root 'phrases#index'

  get '/phrases/show_random' => 'phrases#show_random', as: 'show_random_phrase'
  get '/phrases/clear' => 'phrases#clear', as: 'clear_phrases'
  resource :phrases, only: [:show]

end
