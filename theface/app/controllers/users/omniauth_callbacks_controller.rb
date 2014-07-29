class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    facebook_details = request.env["omniauth.auth"]

    # get deets
    uid = facebook_details["uid"]
    access_token = facebook_details.fetch("credentials").fetch("token")
    name = facebook_details.fetch("info").fetch("name")

    # create user or update user
    user = User.find_by uid: uid
    if user
      user.update access_token: access_token, name: name
    else
      user = User.create! uid: uid, access_token: access_token, name: name
    end

    # sign in user
    sign_in_and_redirect user

  end
end
