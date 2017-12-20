Rails.application.routes.draw do

  mount Consent::Engine => "/consent"
end
