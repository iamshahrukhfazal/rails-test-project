# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:current_user) { User.create(email: 'jane21@doe.com', password: 'pw123456') }
  let(:current_post) { Post.create(content: '<div>Content</div>', title: 'Hello Worsld', user_id: current_user.id) }

  # subject { Comment.new(id:1, content: '<div>Content</div>', user_id: current_user.id, post_id: current_post.id, reply_id:nil, created_at:DateTime.now,updated_at:DateTime.now) }

  context 'Like belongs with user' do
    it { is_expected.to belong_to(:user).class_name('User') }
  end

  context 'Like belongs to Likeable' do
    it { is_expected.to belong_to(:likeable) }
  end
end
