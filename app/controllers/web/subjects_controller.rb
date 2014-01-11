class Web::SubjectsController < Web::ApplicationController
  add_breadcrumb :index, :subjects_path
  #FIXME remove if current_user_owner

  def index
    @search = Subject.search(params[:q])
    @subjects = @search.result.page(params[:page])
    #add_breadcrumb :index, :subjects_path
  end

  def new
    if current_user_owner?
      @subject = Subject.new
    else
      f(:error)
      redirect_to subjects_path
    end
    add_breadcrumb :new, :new_subject_path
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

  def show
    @subject = Subject.find params[:id]
    add_breadcrumb :show, @subject
  end

  def destroy
    if current_user_owner?
      @subject = Subject.published.find(params[:id])
      @subject.mark_as_deleted
    else
      f(:error)
    end
    redirect_to subjects_path
  end
end
