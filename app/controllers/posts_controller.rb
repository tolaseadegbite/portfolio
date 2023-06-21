class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_post, only: [:edit, :update, :destroy]

    def index
        @posts = Post.includes(:user, image_attachment: :blob).order(created_at: :desc)
    end

    def new
        @post = current_user.posts.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:notice] = "Post created successfully"
            redirect_to @post
        else
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
        @commentable = @post
        @comment = Comment.new
    end

    def edit
        
    end

    def update
        if @post.update(post_params)
            flash[:notice] = "Post updated successfully"
            redirect_to @post
        else
            rende :edit
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :body, :image, tag_ids: [])
    end

    def find_post
        @post ||= current_user.posts.find(params[:id]) 
    end
end
