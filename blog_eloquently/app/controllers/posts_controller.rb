class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :add_tag]

    def index
        @posts = Post.all
    end

    def show
        @comment = Comment.new
        @comments = @post.comments
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.save

        redirect_to @post
    end

    def edit
    end

    def update
        @post.update_attributes(post_params)
        @post.save

        redirect_to @post
    end

    def destroy
        @post.destroy

        redirect_to posts_path
    end

    def add_tag
        @tag = Tag.find(params[:id])
        @post.tags << @tag
        redirect_to @post
    end

    def find_post
        @post = Post.find(params[:id])
    end

    # strong parameters
    def post_params
        params.require(:post).permit(:title, :comtent)
    end
end
