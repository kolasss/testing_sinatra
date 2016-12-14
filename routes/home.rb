module MyApp
  module Routes 
    module Home

      def self.registered(app)
        app.get '/' do
          json message: 'Welcome to Ololo!'
        end
      end

    end
  end
end