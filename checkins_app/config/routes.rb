CheckinsApp::Application.routes.draw do

  get "/locations" => 'locations#index'
  root to: 'app#index'

  post "/locations/city" => 'locations#find_sushi_city'

end
