RSpec.shared_context :valid_tweet do
  let!(:tweet) { create(:tweet, user: user) }
  let(:valid_attributes) { { body: "New Tweet", user_id: user.id } }
end
