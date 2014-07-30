class PagesController < ApplicationController

  before_action :authenticate_user!, only: [:private]

  def public
  end

  def private
    fb = Koala::Facebook::API.new(current_user.access_token)
    @friends = fb.get_connection("me", "friends")
  end
end
