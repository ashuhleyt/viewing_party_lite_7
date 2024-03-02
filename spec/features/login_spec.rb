require 'rails_helper'

RSpec.describe 'Welcome Index Page' do 
  before :each do 
    @user1 = User.create!(name: "Ashley", email: "Ashley@gmail.com", password: '123123', password_confirmation: '123123')
    visit "/"
  end

  it 'will have a button to create a new user' do 

  end

  it 'when I have correct login credentials, i am taken to my dashboard' do 
    expect(page).to have_link("Login")
    click_link("Login")

    fill_in("Email", with: "Ashley@gmail.com")
    fill_in("Password", with: "123123")
    click_button "Log In"
    expect(current_path).to eq(user_path(@user1.id))
  end

  it 'when i have incorrect logins, i am still at the home page' do 
    expect(page).to have_link("Login")
    click_link("Login")

    fill_in("Email", with: "Ashley@gmail.com")
    fill_in("Password", with: "123")
    click_button "Log In"
    
    expect(page).to have_content("Invalid email or password")
    expect(current_path).to eq("/login")
  end
end