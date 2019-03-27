Rails.application.routes.draw do
  get "pages/about", as: "about"
  root to: "opportunities#index"
end
