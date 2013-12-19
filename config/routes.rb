CheckinsApp::Application.routes.draw do

  get "/venues" => 'venues#index'
  root to: 'app#index'

end
