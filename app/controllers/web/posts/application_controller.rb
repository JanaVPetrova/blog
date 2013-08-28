class Web::Posts::ApplicationController < Web::ApplicationController
  helper_method :resource_post

  def resource_post
    Post.find(params[:post_id])
  end
end