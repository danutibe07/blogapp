require 'rails_helper'
RSpec.describe Post, type: :model do
    describe 'associations' do
      it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }
      it { should have_many(:comments).class_name('Comment').with_foreign_key(:post_id) }
      it { should have_many(:likes).class_name('Like').with_foreign_key(:post_id) }
    end
  
    describe 'validations' do
      it { should validate_presence_of(:title) }
      it { should validate_length_of(:title).is_at_most(250) }
      it { should validate_numericality_of(:comments_counter).only_integer(true).is_greater_than_or_equal_to(0) }
      it { should validate_numericality_of(:likes_counter).only_integer(true).is_greater_than_or_equal_to(0) }
    end
  
    describe 'callbacks' do
      describe 'after_create :update_user_posts_counter' do
        let(:user) { create(:user) }
  
        it 'increments the user posts counter' do
          expect {
            create(:post, author: user)
            user.reload
          }.to change(user, :posts_counter).by(1)
        end
      end
    end
  
    describe '#recent_comments' do
      let(:post) { create(:post) }
  
      it 'returns the most recent 3 comments for the post' do
        old_comment = create(:comment, post: post, created_at: 1.day.ago)
        new_comment = create(:comment, post: post, created_at: Time.current)
        expect(post.recent_comments).to eq([new_comment, old_comment])
      end
    end
  end
  