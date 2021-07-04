class Xampler
  def call(env)
    [ 200, { "Content-Type" => "application/json" }, [env.to_s]]
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/articles", to: "articles#index"
  get "/articles" => "articles#index"
  get "/adios" => -> (hash) { [200, {}, ["Comming Soon"]]}
  get "/later" => Xampler.new
end
