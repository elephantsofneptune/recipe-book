# spec/features/visitor_signs_up_spec.rb
require 'spec_helper'
require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'abc@example.com', 'abcdef', 'password', 'password'

    expect(page).to have_content('Sign Out')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'abcdef', 'password', 'password'

    expect(page).to have_content('Sign In')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', 'abcdef', '', ''

    expect(page).to have_content('Sign In')
  end

  def sign_up_with(email, username, password, confirmation)
    visit root_path
    within(".newuser") do
	    fill_in 'Email', with: email
	    fill_in 'Username', with: username
	    fill_in 'Password', with: password
	    fill_in 'Password confirmation', with: confirmation
	    click_button 'Sign Up'
	end
  end
end