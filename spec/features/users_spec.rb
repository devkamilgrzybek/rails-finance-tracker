require 'rails_helper'

RSpec.feature "Features Users", type: :feature do
  let (:params){{        
    last_name: 'Lastname', 
    first_name: 'Firstname',
    email:'aaaaa@wp.pl',
    password: "123456", 
    password_confirmation: "123456" 
  }}

  context 'create new user' do
    before(:each) do
      visit new_user_registration_path
      within('form') do
        fill_in "user_first_name", with: "jhon"
        fill_in 'user_last_name', with: 'doe'
        fill_in 'user_email', with: 'eloelo@wp.pl'
        fill_in 'user_password', with: '123456'
      end
    end

    scenario "should be successfull" do
      within('form') do
        fill_in 'user_password_confirmation', with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content('A message with a confirmation link has been sent to your email address.')
      open_email('eloelo@wp.pl')
      expect(current_email.find('a')[:href]).not_to be(nil) 
      visit(current_email.find('a')[:href])
      expect(page).to have_content('Your email address has been successfully confirmed')
    end

    scenario "should fail" do
      click_button 'Sign up'
      expect(page).to have_content('Password confirmation doesn\'t match Password')
    end
  end

  context 'update user' do
    scenario "should be successfull" do
      user = User.create(params)
      user.confirm
      login_as(user, :scope => :user)

      visit(edit_user_registration_path(user))
      # puts page.html
      within('form') do
        fill_in 'user_first_name', with: 'Leszek'
        fill_in 'user_current_password', with: '123456'
      end
      click_button 'Update'
      expect(page).to have_content('Your account has been updated successfully.')
      
    end
  end

  context 'destroy user' do
    scenario "should be successfull" do
      user = User.create(params)
      user.confirm
      login_as(user, :scope => :user)

      visit(edit_user_registration_path(user))
      # click_link('Cancel my account')
      
      expect { click_link('Cancel my account').to change(User,:count).by(-1) }
      expect(page).to have_content('Bye! Your account has been successfully cancelled. We hope to see you again soon.')
    end   
  end

end