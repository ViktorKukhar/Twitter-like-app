class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = resource
    @tweets = collection
  end

  private

  def resource
    User.find(params[:id])
  end

  def collection
    resource.tweets.recent
  end

end
