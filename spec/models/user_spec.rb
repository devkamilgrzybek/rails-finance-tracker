require 'rails_helper'

RSpec.describe "Model User", type: :model do
  let (:params){{        
    last_name: 'Lastname', 
    first_name: 'Firstname',
    email:'aaaaa@wp.pl',
    password: "123456", 
    password_confirmation: "123456" 
  }}

  context 'validation tests' do
    it 'ensures first name presence' do
      user = User.new(last_name: 'Lastname', email: 'exampleEmail@wp.pl').save
      expect(user).to eq(false)
    end
    
    it 'ensures last name presence' do
      user = User.new(first_name: 'Firstname', email: 'exampleEmail@wp.pl').save
      expect(user).to eq(false)
    end
    
    it 'ensures email presence' do
      user = User.new(last_name: 'Lastname', first_name: 'Firstname').save
      expect(user).to eq(false)
    end
    
    it 'should save successfully' do
      user = User.new(params).save

      expect(user).to eq(true)
    end
  end
  
  context 'scope tests' do    
    before(:each) do
      user = User.create!(params)
      user.confirm  
      user = User.create!(params.merge(email:"panwiesio.@wp.pl"))  
    end

    it '1 confirmed user' do
      expect(User.active_users.size).to eq(1)
    end

    it '1 unconfirmed user' do
      expect(User.unconfirmed_users.size).to eq(1)
    end
  end

end
