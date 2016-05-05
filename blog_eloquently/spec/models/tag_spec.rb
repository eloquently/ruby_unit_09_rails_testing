require 'rails_helper'

RSpec.describe Tag, type: :model do
    describe "posts association" do
        let(:post_1) { create(:post) }
        let(:post_2) { create(:post) }
        let(:tag_1) { create(:tag) }
        let(:tag_2) { create(:tag) }
        
        it 'gives tag an array of posts' do
            expect(tag_1.posts).to eq([])
            tag_1.posts << post_1
            expect(tag_1.posts).to eq([post_1])
        end
    end
end
