require "rails_helper"

RSpec.describe ArticlesController, type: :routing do
  describe 'Article Routes' do
    it 'routes to articles#index' do
        expect(get '/articles').to route_to('articles#index')
    end

    it 'routes to articles#show' do
      expect(get '/articles/1').to route_to('articles#show', id: '1')
    end

    it 'should route to articles create' do
      expect(post '/articles').to route_to('articles#create')
    end

    it 'should route to article update' do
      expect(put 'articles/1').to route_to('articles#update', id: '1')
      expect(patch 'articles/1').to route_to('articles#update', id: '1')
    end

    it 'should route to articles destroy' do
      expect(delete '/articles/1').to route_to('articles#destroy', id: '1')
    end
  end
end
