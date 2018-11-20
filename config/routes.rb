Rails.application.routes.draw do
  get 'index' => 'pages#index'
  
  post 'incoming_sms' => 'pages#incoming_sms'

end
