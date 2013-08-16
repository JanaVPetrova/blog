class Web::ApplicationController < ApplicationController
  helper_method :resource_post

  def resource_post
    Post.find(params[:id])
  end
end