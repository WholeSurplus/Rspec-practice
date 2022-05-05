## Article Request Test

We are currently using Factory_Bot to create articles. So the code is creating three articles

```ruby
let!(:articles) { create_list(:article, 3) }
```
### Article #index

```ruby
  describe '#index' do
  # we defined subject cuz we want to test the response and every time send get request so we dont want to repeat the code
  # we can call one time in before like this :before { get :articles }
  subject { get '/articles' }
  before { subject }
  it 'returns a success response' do
    # we check the response status
    expect(response).to have_http_status(:ok)
  end

  it 'should returns articles' do
    # we check the response body from get request of articles
    expect(JSON.parse(response.body).count).to eq(3)
    expect(JSON.parse(response.body).pluck("title")).to eq(articles.pluck("title"))
  end
end
```

### Article #show

````ruby
 describe '#show' do
    # we can define different article in describe block
    let!(:article) { create(:article) }
    # we give article id to subject
    subject { get "/articles/#{article.id}" }
    before { subject }
    it 'returns an article' do
      # we check the response body 
      json_data = JSON.parse(response.body)
      expect(json_data.deep_symbolize_keys).to include({ id: article.id, title: article.title, content: article.content })
    end
  end
````

### Article #create

````ruby
  describe '#create' do
    # we can define different article in describe block. We used attributes_for because we want to create article with all attributes
    let!(:article) { attributes_for(:article) }
    subject { post '/articles', params: { article: article } }
    before { subject }

    it 'should have 201 status code' do
      # we check the response status
      expect(response).to have_http_status(201)
    end

    it 'returns an created article' do
      json_data = JSON.parse(response.body)
      #we check the response body
      expect(json_data.deep_symbolize_keys).to include({ title: article[:title], content: article[:content] })
    end
  end
````

### Article #update

````ruby
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
````

### Article #destroy

````ruby
  describe '#destroy' do
    let!(:article) { create(:article) }
    subject { delete "/articles/#{article.id}" }
    before { subject }

    it 'should have 204 status code' do
      expect(response).to have_http_status(204)
    end
  end
````


