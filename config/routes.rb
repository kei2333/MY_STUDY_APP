Rails.application.routes.draw do
  root 'test#pre_test'
  get 'study_session', to: 'test#study_session'
  get 'post_test', to: 'test#post_test'
  post 'submit_pre_test', to: 'test#submit_pre_test'
  get 'result_pre_test', to: 'test#result_pre_test'
  get 'control_study', to: 'test#control_study'
end
