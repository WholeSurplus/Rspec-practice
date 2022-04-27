require 'rails_helper'

RSpec.describe "/articles", type: :request do
  let!(:articles) { create_list(:article, 3) }

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

  describe '#show' do
    let!(:article) { create(:article) }
    subject { get "/articles/#{article.id}" }
    before { subject }
    it 'returns an article' do
      json_data = JSON.parse(response.body)
      expect(json_data.deep_symbolize_keys).to include({ id: article.id, title: article.title, content: article.content })
    end
  end

  describe '#create' do
    let!(:article) { attributes_for(:article) }
    subject { post '/articles', params: { article: article } }
    before { subject }

    it 'should have 201 status code' do
      expect(response).to have_http_status(201)
    end

    it 'returns an created article' do
      json_data = JSON.parse(response.body)
      expect(json_data.deep_symbolize_keys).to include({ title: article[:title], content: article[:content] })
    end
  end

  describe '#update' do
    let!(:article) { create(:article) }
    let!(:article_params) { attributes_for(:article) }
    subject { get "/articles/#{article.id}", params: { article: article_params } }
    before { subject }

    it 'should have 200 status code' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'returns an article' do
      json_data = JSON.parse(response.body)
      expect(json_data.deep_symbolize_keys).to include({ id: article.id, title: article.title, content: article.content })
    end
  end

  describe '#destroy' do
    let!(:article) { create(:article) }
    subject { delete "/articles/#{article.id}" }

    it 'should have 204 status code' do
      subject
      expect(response).to have_http_status(:no_content)
    end

    it 'should destroy the article' do
      expect { subject }.to change { Article.count }.by(-1)
    end

  end

end
