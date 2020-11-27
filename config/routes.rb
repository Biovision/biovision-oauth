Rails.application.routes.draw do
  controller :oauth do
    get 'auth/:provider/callback' => :auth_callback, as: :auth_callback
  end
end
