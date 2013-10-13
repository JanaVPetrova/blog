class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name
    "#{login} (#{email})"
  end
end