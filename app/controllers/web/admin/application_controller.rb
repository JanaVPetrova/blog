class Web::Admin::ApplicationController < Web::ApplicationController
  #FIXME
  before_filter :authentificate_approved_user!
end