require 'rails_helper'

RSpec.describe "User Home Page" do 
  before :each do 
    @user1 = User.create!(name: "Ashley", email: "Ashley@gmail.com", password: '123123', password_confirmation: '123123')
    visit(user_path(@user1.id))
  end

  it 'I should see usernames dashboard at the top of the page' do 
    save_and_open_page
    expect(page).to have_content(@user1.name)
  end
end