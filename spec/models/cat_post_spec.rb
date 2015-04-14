require 'spec_helper'

describe CatPost, :type => :model do
  let(:user) { create(:user, password: "foobarhoot") }
  let!(:cat_post) {
    CatPost.create(
      caption: "This is cool", image_url: "image.png", user: user)}

  describe 'create' do
    describe 'with valid parameters' do

      it 'post belongs to user' do
        expect(user.cat_posts).to eq([cat_post])
      end
    end
  end

  describe 'get comments' do
    let! (:comment) { create(:comment,
                            user_id: user.id,
                            commentable_type: "CatPost",
                            commentable_id: cat_post.id,
                            content: "No problem") }

    it 'lists the comments' do
      expect(cat_post.reload.comment_ids).to eq([comment.id])
    end
  end
end

