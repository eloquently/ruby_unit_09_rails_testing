class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.save!
        
        redirect_to @comment.post
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        
        redirect_to @comment.post
    end 
    
    
    def comment_params
        params.require(:comment).permit(:author_name, :content, :post_id)
    end
end
