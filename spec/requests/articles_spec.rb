require 'rails_helper'

RSpec.describe "/articles", type: :request do
  let!(:articles) { create_list(:article, 3)}

  describe '#index' do
    it 'returns a success response' do
      get '/articles'
      expect(response).to have_http_status(:ok)
    end

    it 'should returns articles' do
      get '/articles'
      expect(JSON.parse(response.body).count).to eq(3)
      expect(JSON.parse(response.body).pluck("title")).to eq(articles.pluck("title"))
    end
  end
end
