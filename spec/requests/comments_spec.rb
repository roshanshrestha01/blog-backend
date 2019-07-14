require 'rails_helper'

RSpec.describe 'Comments API' do
  # Initialize the test data
  let!(:post) { create(:post) }
  let!(:comments) { create_list(:comment, 20, post_id: post.id) }
  let(:post_id) { post.id }
  let(:id) { comments.first.id }

#   Test suite for GET /v1/posts/:post_id/comments
  describe 'GET /v1/posts/:post_id/comments' do
    before { get "/v1/posts/#{post_id}/comments" }

    context 'when posts exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all post comments' do
        expect(json.size).to eq(20)
      end
    end

    context 'when post does not exist' do
      let(:post_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Post/)
      end
    end
  end
end