class Web::Subjects::ApplicationController < Web::ApplicationController
  helper_method :resource_subject

  def resource_subject
    Subject.find(params[:subject_id])
  end
end