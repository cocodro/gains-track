class TopicController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @topic = Topic.all
  end

  def new
  end

  def show
  end
end
