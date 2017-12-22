Rails.application.routes.draw do

  mount Consense::Engine => "/consent"

  get "index", to: "promptable#index"
  get "approved", to: "promptable#approved"
  get "denied", to: "promptable#denied"
end
