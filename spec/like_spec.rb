require 'rails_helper'
RSpec.describe Like, type: :model do
    describe 'associations' do
      it { should belong_to(:post).class_name('Post').with_foreign_key(:post_id) }
      it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }
    end
  
    describe 'callbacks' do
      describe 'after_create :update_post_likes_counter' do
        let(:post) { create(:post) }
  
        it 'increments the post likes counter' do
          expect {
            create(:like, post: post)
            post.reload
          }.to change(post, :likes_counter).by(1)
        end
      end
    end
  end
  