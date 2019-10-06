require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    render_views

    it 'returns http success with empty data' do
      get :index, format: :html
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to match(/<h1>Hello/im)
      expect(response.body).to match(/<div id='site_map_view'>/im)
    end
  end
end
