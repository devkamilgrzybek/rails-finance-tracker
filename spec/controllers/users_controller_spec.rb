require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  setup do
    @user = User.create!(
      last_name: 'Lastname', 
      first_name: 'Firstname',
      email:'aaaaa@wp.pl',
      password: "123456", 
      password_confirmation: "123456" 
    )
    @user.confirm
    sign_in @user
  end
  
  context 'GET #show' do
    it 'should render show{ user }' do
      get :show, params: { id: @user.to_param }
      expect(response).to be_successful
    end
  end

end
