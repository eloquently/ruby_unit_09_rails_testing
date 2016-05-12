require 'rails_helper'

RSpec.describe PostsController, type: :controller do

    describe "GET new" do
        it 'sets @post' do
            get :new
            # @post <-> assigns[:post]
            expect(assigns[:post]).to be_a_new(Post)
        end
    end
    
    describe "GET index" do
        it 'correctly sets up @posts for the view' do
            p = create(:post)
            p2 = create(:post)
            get :index

            expect(assigns[:posts]).to eq([p, p2])
        end
    end

    describe "PATCH add_tag" do
        let(:p) { create(:post) }
        let(:tag) { create(:tag) }
        it 'adds tag to post' do
            expect(p.tags).to eq([])
            patch :add_tag, id: p.id, tag_id: tag.id
            expect(p.reload.tags).to eq([tag])
        end
    end
end