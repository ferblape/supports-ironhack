Rails.application.routes.draw do
  get '/', to: redirect('/challenges')

  resources :challenges do
    resources :supports
  end
end
