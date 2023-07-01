module Api
    module V1
      class PostsController < ApplicationController
        before_action :authenticate_user!
  
        def index
          @user = User.find(params[:user_id])
          @posts = @user.posts.includes(:comments).order(created_at: :desc)
          render json: @posts
        end
      end
    end
  end

  