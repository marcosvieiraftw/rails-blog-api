class ApplicationController < ActionController::API
  include KnockAuthenticable
  include CanCan::ControllerAdditions

  check_authorization
  rescue_from CanCan::AccessDenied, with: :user_not_authorized

  private
  def user_not_authorized
    render json: {errors: [I18n.t('authorization.default.unauthorized')]}, status: :forbidden
  end
end
