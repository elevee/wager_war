# class OmniAuthCallbacksController < Devise::OmniAuthCallbacksController

#   raise env["omniauth.auth"].to_yaml

#   def facebook
#     user = User.find_for_oauth(request.env["omniauth.auth"])

#     if user.persisted?
#       flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
#       sign_in_and_redirect user, :event => :authentication
#     else
#       session["devise.facebook_data"] = request.env["omniauth.auth"]
#       redirect_to new_user_registration_url
#     end

#   end

# end
