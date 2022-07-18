# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Suggestion, type: :model do
  subject do
    described_class.new(id: 1, content: 'Content', user_id: current_user.id, post_id: current_post.id, message: 'Game on hy',
                        created_at: DateTime.now, updated_at: DateTime.now)
  end

  let(:current_user) { User.create(email: 'jane21@doe.com', password: 'pw123456') }
  let(:current_post) { Post.create(content: '<div>Content</div>', title: 'Hello Worsld', user_id: current_user.id) }

  context 'Suggestion association with user' do
    it { is_expected.to belong_to(:user).class_name('User') }
  end

  context 'Suggestion association with Post' do
    it { is_expected.to belong_to(:post).class_name('Post') }
  end

  # context 'Comment association with Replies' do
  #   it { should belong_to(:reply).class_name('Comment') }
  # end

  context 'validation tests' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is valid without content' do
      subject.content = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without user id' do
      subject.user_id = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without post id' do
      subject.post_id = nil
      expect(subject).not_to be_valid
    end

    it 'is valid without Suggestion Status' do
      subject.status = 0
      expect(subject).to be_valid
    end

    it 'is valid without Suggestion message' do
      subject.message = nil
      expect(subject).to be_valid
    end
  end
end
