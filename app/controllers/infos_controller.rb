class InfosController < ApplicationController
  def index
  @portfolio_items = Info.all
  end
end
