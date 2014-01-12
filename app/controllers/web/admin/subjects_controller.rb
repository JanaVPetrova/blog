class Web::Admin::SubjectsController < Web::Admin::ApplicationController
  #FIXME fix if current_user_owner
  def index
    if current_user_owner?
      @subjects = Subject.all
    else
      f(:error)
      redirect_to subjects_path
    end
  end

  def new
    if current_user_owner?
      @subject = Subject.new
    else
      f(:error)
      redirect_to subjects_path
    end
  end

  def create
    if current_user_owner?
      @subject = SubjectEditType.new(params[:subject])
      if @subject.save
        f(:success)
        redirect_to subjects_path
      else
        f(:error)
        render 'new'
      end
    else
      f(:error)
      redirect_to subjects_path
    end
  end
end
