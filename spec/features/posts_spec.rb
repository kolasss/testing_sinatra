require_relative '../spec_helper'

describe 'api v1 Posts Path' do

  api_path = '/api/v1'

  describe 'GET /posts' do
    before do
      create_list :post, 2
    end
    
    it "show posts" do
      get "#{api_path}/posts"
      expect(last_response).to be_ok
      expect(last_response.body).to include("posts")
    end
  end

  describe 'GET /posts/:id' do
    let(:post) { create :post }
    
    it "show posts" do
      get "#{api_path}/posts/#{post.id}"
      expect(last_response).to be_ok
      expect(last_response.body).to include("post")
    end
  end
end