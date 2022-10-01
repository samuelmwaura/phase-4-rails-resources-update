Rails.application.routes.draw do
  resources :birds, only: [:index, :show, :create,:update]
  patch("birds/:id/likes",to: "birds#increment_likes")
end
