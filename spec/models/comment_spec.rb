require 'spec_helper'

describe Comment, :type => :model do
  let!(:user) { create(:user, password: "foobarhoot") }
  let!(:cat_post) { create(:cat_post) }

  describe 'create' do
    describe 'with valid parameters' do
      let!(:comment) {
        Comment.create(
          content: "This is cool", cat_post: cat_post, user: user ) }

      it 'post belongs to user' do
        expect(cat_post.comments).to eq([comment])
      end
    end
  end

  describe 'add_like' do
    let!(:comment) { create(:comment) }

    before do
      comment.update_attributes(likes: 1)
    end

    it 'adds a like' do
      expect(comment.add_like).to eq(2)
    end
  end
end


