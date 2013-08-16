class Web::ApplicationController < ApplicationController
  helper_method :resource_post

  add_breadcrumb "home", :root_path

  def resource_post
    Post.find(params[:id])
  end
end