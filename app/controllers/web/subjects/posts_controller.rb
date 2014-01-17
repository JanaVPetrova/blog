class Web::Subjects::PostsController < Web::Subjects::ApplicationController
  #FIXME
  before_filter :authentificate_approved_user!

  def index
    query = { s: 'title asc' }.merge(params[:q] || {})
    search = resource_subject.posts.web.published.search(query)
    @posts = search.result
  end
end
