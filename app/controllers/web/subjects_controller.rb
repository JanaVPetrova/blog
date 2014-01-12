class Web::SubjectsController < Web::ApplicationController
  add_breadcrumb :index, :subjects_path

  def index
    @search = Subject.search(params[:q])
    @subjects = @search.result.page(params[:page])
  end

  def show
    @subject = Subject.find params[:id]
    add_breadcrumb :show, @subject
  end
end
