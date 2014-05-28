class CakestoresController < ApplicationController
  before_action :set_cakestore, only: [:show, :edit, :update, :destroy]
  before_filter :authorize
  layout "cakestores"

  # GET /cakestores
  # GET /cakestores.json
  def index
    @cakestores = Cakestore.all
  end

  # GET /cakestores/1
  # GET /cakestores/1.json
  def show
  end

  # GET /cakestores/new
  def new
    @cakestore = Cakestore.new
  end

  # GET /cakestores/1/edit
  def edit
  end

  # POST /cakestores
  # POST /cakestores.json
  def create
    @cakestore = Cakestore.new(cakestore_params)

    respond_to do |format|
      if @cakestore.save
        format.html { redirect_to @cakestore, notice: 'Cakestore was successfully created.' }
        format.json { render :show, status: :created, location: @cakestore }
      else
        format.html { render :new }
        format.json { render json: @cakestore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cakestores/1
  # PATCH/PUT /cakestores/1.json
  def update
    respond_to do |format|
      if @cakestore.update(cakestore_params)
        format.html { redirect_to @cakestore, notice: 'Cakestore was successfully updated.' }
        format.json { render :show, status: :ok, location: @cakestore }
      else
        format.html { render :edit }
        format.json { render json: @cakestore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cakestores/1
  # DELETE /cakestores/1.json
  def destroy
    @cakestore.destroy
    respond_to do |format|
      format.html { redirect_to cakestores_url, notice: 'Cakestore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cakestore
      @cakestore = Cakestore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cakestore_params
      params.require(:cakestore).permit(:cake_name, :description, :cake_weight, :price, :quantity, :occasion, :image)
    end
    
    def authorize
      if session[:admin].nil?
      flash[:notice] = "Please log in"
      redirect_to :controller => :admin, :action => :login
      end
    end
    
end
