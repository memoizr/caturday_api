require 'spec_helper'

describe CatPost, :type => :model do
  let(:user) { create(:user, password: "foobarhoot") }

  describe 'create' do
    describe 'with valid parameters' do
      let!(:cat_post) {
        CatPost.create(
          caption: "This is cool", image_url: "image.png", user: user)}

      it 'post belongs to user' do
        expect(user.cat_posts).to eq([cat_post])
      end
    end
  end

  describe 'add_like' do
    let!(:cat_post) { create(:cat_post) }

    before do
      cat_post.update_attributes(likes: 1)
    end

    it 'adds a like' do
      expect(cat_post.add_like).to eq(2)
    end
  end
end

