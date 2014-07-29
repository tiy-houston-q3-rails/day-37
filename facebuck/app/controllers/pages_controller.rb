class PagesController < ApplicationController

  before_action :authenticate_user!, only: [:private]
  

  def public
  end

  def private
  end
end
