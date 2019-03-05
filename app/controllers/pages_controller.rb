class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  def home
  end
  def dashboard
    @initiatives = Initiative.all
    @commitments = Commitment.all
  end
end
