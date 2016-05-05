require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
    describe "POST create" do
        let(:p) { create(:post) }
        let(:comment_params) { attributes_for(:comment, post_id: p.id) }

        it "creates a new comment" do
            expect { post(:create, { comment: comment_params }) }.to change { Comment.count }.by 1
        end

        it "creates a comment with correct title and author_name" do
            post(:create , { comment: comment_params })

            @comment = Comment.last
            expect(@comment.content).to eq(comment_params[:content])
            expect(@comment.author_name).to eq(comment_params[:author_name])
        end
    end

    describe "DELETE destroy" do
        let(:comment) { create(:comment) }

        it 'destroys comment' do
            expect(comment.persisted?).to eq(true)
            expect { delete :destroy, id: comment.id }.to change { Comment.count }.by -1
        end
    end
end