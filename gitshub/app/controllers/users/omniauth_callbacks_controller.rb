class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    # You need to implement the method below in your model (e.g. app/models/user.rb)

    # see if user has already been created
    # if so, sign in
    # if not, create and sign in

    yo = request.env["omniauth.auth"]

    uid = yo["uid"]
    username = yo.fetch("info").fetch("nickname")
    access_token = yo.fetch("credentials").fetch("token")
    email = yo.fetch("info").fetch("email")
    photo_url = yo.fetch("info").fetch("image")

    user = User.find_by uid: uid
    if user
      user.update(username: username, access_token: access_token, email: email, photo_url: photo_url)
    else
      User.create!(uid: uid, username: username, access_token: access_token, email: email, photo_url: photo_url)
    end

    sign_in_and_redirect user, :event => :authentication #this will throw if @user is not activated
    set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
  end

end
