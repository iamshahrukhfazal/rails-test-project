# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Report, type: :model do
  subject do
    described_class.new(id: 1, reportable_type: 'Post', reportable_id: current_post.id, user_id: current_user.id,
                        created_at: DateTime.now, updated_at: DateTime.now)
  end

  let(:current_user) { User.create(email: 'jane21@doe.com', password: 'pw123456') }
  let(:current_post) { Post.create(content: '<div>Content</div>', title: 'Hello Worsld', user_id: current_user.id) }

  context 'Report belongs with user' do
    it { is_expected.to belong_to(:user).class_name('User') }
  end

  context 'Report belongs to Report' do
    it { is_expected.to belong_to(:reportable) }
  end

  context 'validation tests' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without reportable_id' do
      subject.reportable_id = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without reportable_type' do
      subject.reportable_type = nil
      expect(subject).not_to be_valid
    end

    it 'is valid without report_status' do
      subject.report_status = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without user_id' do
      subject.user_id = nil
      expect(subject).not_to be_valid
    end
  end
end
