module MyApp
  module Routes 
    module Posts

      def self.registered(app)
        app.namespace '/api/v1' do

          helpers MyApp::Params

          helpers do
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
      end

    end
  end
end