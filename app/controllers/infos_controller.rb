class InfosController < ApplicationController
  def index
  @portfolio_items = Info.all
  end

  def angular
    @angular_portfolio_items =  Info.angular
  end

  def new
    @portfolio_items = Info.new
  end

  def create
      @portfolio_items = Info.new(params.require(:info).permit(:title, :subtitle, :body))

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
    @portfolio_items = Info.find(params[:id])
  end

  def update
        @portfolio_items = Info.find(params[:id])
    respond_to do |format|
      if @portfolio_items.update(params.require(:info).permit(:title, :subtitle, :body))
        format.html { redirect_to infos_path, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_items }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_items.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
      @portfolio_items = Info.find(params[:id])
  end

  def destroy
    #Lookup the item
    @portfolio_items = Info.find(params[:id])
    #Destroy/delte the item
    @portfolio_items.destroy
    #Redirect
    respond_to do |format|
      format.html { redirect_to infos_url, notice: 'Record was successfully removed.' }
      format.json { head :no_content }
    end
  end


end
