require 'rails_helper'

RSpec.describe Comment do
    describe 'validations' do
        let(:post) { create(:post) }
        let(:comment_attrs) { attributes_for(:comment, post_id: post.id) }

        it 'allows valid comment to be created' do
            c = Comment.new(comment_attrs)
            expect(c.save).to eq(true)
        end

        it 'does not allow comment without author_name' do
            comment_attrs.delete(:author_name)
            c = Comment.new(comment_attrs)
            expect(c.save).to eq(false)
        end

        it 'does not allow comment without content' do
            comment_attrs.delete(:content)
            c = Comment.new(comment_attrs)
            expect(c.save).to eq(false)
        end
    end
end