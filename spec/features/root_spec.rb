require_relative '../spec_helper'

describe 'Root Path' do
  describe 'GET /' do
    it "says Welcome" do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to eq("{\"message\":\"Welcome to Ololo!\"}")
    end
  end
end