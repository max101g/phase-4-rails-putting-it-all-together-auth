class ApplicationController < ActionController::API
  include ActionController::Cookies
  # before_action :authorize  

  # private

  # def authorize
  #   render json: { error: "User not authorized" }, status: :unauthorized unless session.include? :user_id
  # end

end
