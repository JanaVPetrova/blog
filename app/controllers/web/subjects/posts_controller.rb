class Web::Subjects::PostsController < Web::Subjects::ApplicationController
  #FIXME
  before_filter :authentificate_approved_user!

  def index
    @posts = resource_subject.published_posts
  end
end
