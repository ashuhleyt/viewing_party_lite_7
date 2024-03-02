require 'rails_helper'

describe MovieService do 
  context 'class methods' do 
    context "#search_movies" do 
      it 'returns movie data by title', :vcr do 
        VCR.use_cassette('search_movies') do
          search = MovieService.search_movies("Test")
          expect(search).to be_a Hash
          expect(search[:results]).to be_an Array
          # require 'pry'; binding.pry
        end
      end
    end
  end
end