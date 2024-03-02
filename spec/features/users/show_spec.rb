RSpec.describe "User Home Page" do 
  before :each do 
    @user1 = User.create!(name: "Ashley", email: "Ashley@gmail.com", password: '123123', password_confirmation: '123123')
    visit "/login"

    fill_in("Email", with: "Ashley@gmail.com")
    fill_in("Password", with: "123123")
    click_button "Log In"
  end

  it 'I should see usernames dashboard at the top of the page' do 
    visit user_path(@user1.id)
    expect(current_path).to eq(user_path(@user1.id))
    expect(page).to have_content("#{@user1.name}'s Dashboard!!")
  end

  it 'I should see a button to Discover Movies' do 
    expect(page).to have_button("Discover Movies")
    click_button("Discover Movies")
    expect(current_path).to eq(user_discover_index_path(@user1.id))
  end
end
