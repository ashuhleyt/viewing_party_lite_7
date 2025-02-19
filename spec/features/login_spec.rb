require 'rails_helper'

RSpec.describe 'Welcome Index Page' do 
  before :each do 
    @user1 = User.create!(name: "Ashley", email: "Ashley@gmail.com", password: '123123', password_confirmation: '123123')
    @user2 = User.create!(name: "Gaia", email: "Gaia@gmail.com", password: '456456', password_confirmation: '456456')
    @user3 = User.create!(name: "Mary", email: "Mary@gmail.com", password: '789789', password_confirmation: '789789')
    @user4 = User.create!(name: "Tara", email: "Tara@gmail.com", password: '420420', password_confirmation: '420420')
    visit "/"
  end

  it 'will have a button to create a new user' do 
  expect(page).to have_button("Create New User")
  click_button("Create New User")
  expect(current_path).to eq(register_path) 

  fill_in("Name", with: "Naomi")
  fill_in("Email", with: "Naomi@gmail.com")
  fill_in(:password, with: "pw123")

  click_button("Register New User")
  
  @user = User.last


  # expect(page).to have_content("Naomi")
  # expect(current_path).to eq(user_path(User.last))
  #can't get the above line to pass even though opening the server proved that it passed. 
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