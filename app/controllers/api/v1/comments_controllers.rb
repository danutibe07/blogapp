module Api
    module V1
      class CommentsController < ApplicationController
        before_action :authenticate_user!
  
        def index
          @user = User.find(params[:user_id])
          @post = @user.posts.find(params[:post_id])
          @comments = @post.comments
          render json: @comments
        end
  
        def create
          @post = Post.find(params[:post_id])
          @comment = @post.comments.build(comment_params)
          @comment.author = current_user
  
          if @comment.save
            render json: @comment, status: :created
          else
            render json: @comment.errors, status: :unprocessable_entity
          end
        end
  
        private
  
        def comment_params
          params.require(:comment).permit(:text)
        end
      end
    end
  end
  