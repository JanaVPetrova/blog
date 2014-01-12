class Web::Admin::SubjectsController < Web::Admin::ApplicationController
  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = SubjectEditType.new(params[:subject])
    if @subject.save
      f(:success)
      redirect_to subjects_path
    else
      f(:error)
      render 'new'
    end
  end
end
