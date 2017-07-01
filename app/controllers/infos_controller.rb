class InfosController < ApplicationController
  before_action :set_info , only: [:show, :edit, :update, :destroy]
  layout 'info'
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
  @portfolio_items = Info.by_position
  end

  def angular
    @angular_portfolio_items =  Info.angular
  end

  def new
    @portfolio_items = Info.new
    3.times{@portfolio_items.technologies.build}
  end

  def create
      @portfolio_items = Info.new(portfolio_params)

    respond_to do |format|
      if @portfolio_items.save
        format.html { redirect_to infos_path, notice: 'Portfolio is now live.' }
        format.json { render :show, status: :created, location: @portfolio_items }
      else
        format.html { render :new }
        format.json { render json: @portfolio_items.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_items.update(portfolio_params)
        format.html { redirect_to infos_path, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_items }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_items.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    #Destroy/delte the item
    @portfolio_items.destroy
    #Redirect
    respond_to do |format|
      format.html { redirect_to infos_url, notice: 'Record was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def portfolio_params
    params.require(:info).permit(:title, :subtitle, :body, technologies_attributes: [:name])
  end

  def set_info
    @portfolio_items = Info.find(params[:id])
  end



end
