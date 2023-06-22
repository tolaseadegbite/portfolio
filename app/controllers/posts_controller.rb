class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    before_action :correct_user, only: %i[ edit update destroy ]

    def index
        @posts = Post.includes(:user, :comments, :likes, image_attachment: :blob).order(created_at: :desc)
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
            render :edit
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :body, :image, tag_ids: [])
    end

    def find_post
        @post ||= Post.find(params[:id]) 
    end

    # confirms the correct user
    def correct_user
        @post ||= Post.find(params[:id])
        redirect_to(posts_url, status: :see_other, notice: "Access denied") unless current_user.admin?
    end
end
