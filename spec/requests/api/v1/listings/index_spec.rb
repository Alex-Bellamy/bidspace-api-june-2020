RSpec.describe 'GET /api/v1/listings', type: :request do
  describe 'successfully get listings' do
    let!(:listing) { 3.times {create(:listing, category: 'car park', description: 'Wide space with safe area', scene: 'indoor', height: 4, address: 'Gothenburg', price: 200)}}
 
    before do
      get '/api/v1/listings'
    end

    it 'should return a 200 response' do
    expect(response).to have_http_status 200
    end

    it 'should return listings' do
    expect(response_json["listings"].count).to eq 3
    end
  end 

  describe 'no listing has been added' do
    before do
      get '/api/v1/listings'
    end

    it 'should have no articles on page' do
      expect(response_json["listings"]).to eq []
    end
  end
end