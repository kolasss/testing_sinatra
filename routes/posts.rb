namespace '/api/v1' do

  helpers do
    def json_params
      begin
        JSON.parse(request.body.read)
      rescue
        halt 400, json(errors: 'Invalid JSON')
      end
    end

    def post
      @post ||= Post[params[:id]]
    end

    def halt_if_not_found!
      halt 404, json(errors: 'Not Found') unless post
    end
  end

  get '/posts' do
    json posts: Post.all
  end

  get '/posts/:id' do |id|
    halt_if_not_found!
    json post: post
  end

  post '/posts' do
    post = Post.new(json_params)
    halt 422, json(post: post, errors: post.errors) unless post.save

    response.headers['Location'] = url "api/v1/posts/#{post.id}"
    status 201
  end

  patch '/posts/:id' do |id|
    halt_if_not_found!
    halt 422, json(post: post, errors: post.errors) unless post.update(json_params)
    json post
  end

  delete '/posts/:id' do |id|
    halt_if_not_found!
    post.destroy
    status 204
  end
end