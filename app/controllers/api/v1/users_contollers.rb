module Api::V1
    class UsersController < ApplicationController
      def posts
        @user = User.find(params[:user_id])
        @posts = @user.posts.includes(:comments).order(created_at: :desc).limit(5)
        render json: @posts
      end
    end
  end

  