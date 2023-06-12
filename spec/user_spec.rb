require 'rails_helper'
RSpec.describe User, type: :model do
    describe 'associations' do
      it { should have_many(:posts).class_name('Post').with_foreign_key(:author_id) }
      it { should have_many(:comments).class_name('Comment').with_foreign_key(:author_id) }
      it { should have_many(:likes).class_name('Like').with_foreign_key(:author_id) }
    end
  
    describe 'validations' do
      it { should validate_presence_of(:name) }
      it { should validate_numericality_of(:posts_counter).only_integer(true).is_greater_than_or_equal_to(0) }
    end
  
    describe '#recent_posts' do
      let(:user) { create(:user) }
  
      it 'returns the most recent 3 posts' do
        old_post = create(:post, author: user, created_at: 1.day.ago)
        new_post = create(:post, author: user, created_at: Time.current)
        expect(user.recent_posts).to eq([new_post, old_post])
      end
    end
  end
  