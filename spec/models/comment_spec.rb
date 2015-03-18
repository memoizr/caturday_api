require 'spec_helper'

describe Comment, :type => :model do
  let!(:user) { create(:user, password: "foobarhoot") }
  let!(:cat_post) { create(:cat_post) }

  describe 'create' do
    describe 'with valid parameters' do
      let!(:comment) {
        Comment.create(
          content: "This is cool",
          commentable_type: "CatPost",
          commentable_id: cat_post.id,
          user_id: user.id ) }

      it 'post belongs to user' do
        expect(cat_post.reload.comments).to eq([comment])
      end
    end
  end
end


