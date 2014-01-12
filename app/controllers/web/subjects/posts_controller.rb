class Web::Subjects::PostsController < Web::Subjects::ApplicationController
  def index
    @posts = resource_subject.published_posts
  end
end
