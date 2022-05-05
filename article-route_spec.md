### Article Index 
The test article index is a simple list of articles. We get request (GET method) to articles_controller#index. So we check correct route with the test.
```ruby
it 'routes to articles#index' do
        expect(get '/articles').to route_to('articles#index')
    end
```

### Article Show
We get request (GET method) for the article as id equal 1 to articles_controller#show. So we check correct route with the test.
```ruby
 it 'routes to articles#show' do
  expect(get '/articles/1').to route_to('articles#show', id: '1')
end
```

### Article Create
We get request (POST method) for creating new article to articles_controller#create. So we check correct route with the test.
```ruby
 it 'should route to articles create' do
  expect(post '/articles').to route_to('articles#create')
end
```

### Article Update
We get request (PUT or PATCH method) for updating the article to articles_controller#update. So we check correct route with the test.
```ruby
it 'should route to article update' do
  expect(put 'articles/1').to route_to('articles#update', id: '1')
  expect(patch 'articles/1').to route_to('articles#update', id: '1')
end
```

### Article Destroy
We get request (DELETE method ) for the article as id equal 1 to articles_controller#destroy. So we check correct route with the test.
```ruby
 it 'should route to articles destroy' do
  expect(delete '/articles/1').to route_to('articles#destroy', id: '1')
end
```

