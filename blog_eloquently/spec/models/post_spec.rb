require 'rails_helper'

RSpec.describe Post do

    let(:post) { create(:post) }

    it 'has title and content' do
        expect(post.title).to_not be_nil
        expect(post.content).to_not be_nil
    end

    describe 'comments association' do
        let(:comment_1) { build(:comment, :no_post) }
        let(:comment_2) { build(:comment, :no_post, content: "Comment 2") }

        it 'lists comments in the order they were created' do
            comment_1.post_id = post.id
            comment_1.save!
            comment_2.post_id = post.id
            comment_2.save!
            expect(post.comments).to eq([comment_1, comment_2])
        end
    end

    describe 'tags association' do
        let(:post) { create(:post) }
        let(:tag) { create(:tag) }
        it 'cannot have the same tag twice' do
            expect(post.tags).to eq([])
            post.tags << tag
            expect(post.tags).to eq([tag])
            expect { post.tags << tag }.to raise_error ActiveRecord::RecordNotUnique
        end
    end

end