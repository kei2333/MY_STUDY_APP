Rails.application.routes.draw do
  root 'surveys#pre_test'
  get 'study_session', to: 'surveys#study_session'
  get 'post_test', to: 'surveys#post_test'
  post 'submit_pre_test', to: 'surveys#submit_pre_test'
  get 'result_pre_test', to: 'surveys#result_pre_test'
  get 'control_study', to: 'surveys#control_study'
end
