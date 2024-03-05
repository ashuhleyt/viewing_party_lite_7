require 'rails_helper' 

RSpec.describe 'Users Discover Page', :vcr do 
  before :each do 
    @user1 = User.create!(name: "Ashley", email: "Ashley@gmail.com", password: '123123', password_confirmation: '123123')
    # visit "/users/#{@user1.id}/discover"
  end

  it 'I see a button to discover top rated movies', :vcr do 
    VCR.use_cassette('discover_page') do
      visit "/users/#{@user1.id}/discover"
      expect(page).to have_button('Discover Top Rated Movies')
    end
  end
end