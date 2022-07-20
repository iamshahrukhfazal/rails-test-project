# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    described_class.new(id: 1, content: '<div>Content</div>', user_id: 2, title: 'Content For Post', status: 0,
                        created_at: DateTime.now, updated_at: DateTime.now)
  end

  context 'Post association with user' do
    it { is_expected.to belong_to(:user).class_name('User') }
  end

  context 'Post have many Comments' do
    it { is_expected.to have_many(:comments) }
  end

  context 'Post have many Likes' do
    it { is_expected.to have_many(:likes) }
  end

  context 'Post have many Reports' do
    it { is_expected.to have_many(:reports) }
  end

  context 'Post have many Suggestions' do
    it { is_expected.to have_many(:suggestions) }
  end

  context 'validation tests' do
    it 'is valid with valid attributes' do
      expect(subject).not_to be_valid
    end

    it 'is valid without content' do
      subject.content = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without title' do
      subject.title = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without user id' do
      subject.user_id = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without post status' do
      subject.status = nil
      expect(subject).not_to be_valid
    end
  end
end
