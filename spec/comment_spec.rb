require 'rails_helper'
RSpec.describe Comment, type: :model do
    describe 'associations' do
      it { should belong_to(:post).class_name('Post').with_foreign_key(:post_id) }
      it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }
    end
  
    describe 'callbacks' do
      describe 'after_create :update_post_comments_counter' do
        let(:post) { create(:post) }
  
        it 'increments the post comments counter' do
          expect {
            create(:comment, post: post)
            post.reload
          }.to change(post, :comments_counter).by(1)
        end
      end
    end
  end
  