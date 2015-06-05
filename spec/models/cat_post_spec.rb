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

  describe 'destroy' do
    let! (:comment_1) { create(:comment,
                            user_id: user.id,
                            commentable_type: "CatPost",
                            commentable_id: cat_post.id) }

    let! (:comment_2) { create(:comment,
                            user_id: user.id,
                            commentable_type: "CatPost",
                            commentable_id: cat_post.id) }

    let! (:vote_0) { create(:vote,
                            user_id: user.id,
                            voteable_type: "CatPost",
                            voteable_id: cat_post.id) }

    let! (:vote_1) { create(:vote,
                            user_id: user.id,
                            voteable_type: "CatPost",
                            voteable_id: cat_post.id) }
    before do
      cat_post.reload.destroy
    end

    it 'destroys the post' do
      expect(CatPost.all.count).to eq(0)
    end

    it 'destroys the comments' do
      expect(Comment.all.count).to eq(0)
    end

    it 'destroys the votes' do
      expect(Vote.all.count).to eq(0)
    end
  end
end

