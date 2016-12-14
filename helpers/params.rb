module MyApp
  module Params

    def json_params
      begin
        JSON.parse(request.body.read)
      rescue
        halt 400, json(errors: 'Invalid JSON')
      end
    end

  end
end