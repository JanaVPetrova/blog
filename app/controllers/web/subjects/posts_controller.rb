class Web::Subjects::PostsController < Web::Subjects::ApplicationController
  def index
    @posts = resource_subject.posts
  end
end
