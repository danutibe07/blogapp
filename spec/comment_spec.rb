# require 'rails_helper'
# RSpec.describe Comment, type: :model do
#     describe 'associations' do
#       it { should belong_to(:post).class_name('Post').with_foreign_key(:post_id) }
#       it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }
#     end

#     describe 'callbacks' do
#       describe 'after_create :update_post_comments_counter' do
#         let(:post) { create(:post) }

#         it 'increments the post comments counter' do
#           expect {
#             create(:comment, post: post)
#             post.reload
#           }.to change(post, :comments_counter).by(1)
#         end
#       end
#     end
#   end

require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     posts_counter: 0)
  post = user.posts.create(title: 'Post 1', text: 'This is post 1', comments_counter: 0, likes_counters: 0)
  subject { Comment.new(text: 'Text', author_id: user.id, post_id: post.id) }

  before { subject.save }

  it 'author_id should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'post_id should be present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  describe '#update_post_comments_counter' do
    it 'increment' do
      expect(subject.post.comments_counter).to eq(1)
      subject.update_post_comments_counter
      expect(subject.post.comments_counter).to eq(2)
    end
  end
end
