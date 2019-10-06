require 'rails_helper'

RSpec.describe SiteMapController, type: :controller do
  describe 'GET #index' do
    it 'returns http success with empty data' do
      get :index
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json).to eq({ "data" => [] })
    end

    it 'returns http success with single record' do
      SitePoint.create(name: 'Home', path: 'home')
      get :index
      expect(response).to have_http_status(:success)

      json = JSON.parse(response.body)
      expect(json['data'].size).to eq(1)

      node = json['data'].first

      expect(node['name']).to eq('Home')
      expect(node['absolute_path']).to eq('home')
      expect(node['view_id']).to eq('home')
      expect(node['leaf']).to eq(true)
    end
  end
end
