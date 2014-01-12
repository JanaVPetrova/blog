class Web::Admin::ApplicationController < Web::ApplicationController
  before_filter :authentificate_admin!
end