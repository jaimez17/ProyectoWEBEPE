class KnowsController < ApplicationController
  before_action :set_know, only: [:show, :edit, :update, :destroy]

  # GET /knows
  # GET /knows.json
  def index
    @knows = Know.all
    @menu = "menu1"  
  end

  # GET /knows/1
  # GET /knows/1.json
  def show
    @menu = "menu2"  
  end

  # GET /knows/new
  def new
    @know = Know.new
    @menu = "menu1"  
  end

  # GET /knows/1/edit
  def edit
    @menu = "menu1"  
  end

  # POST /knows
  # POST /knows.json
  def create
    @know = Know.new(know_params)

    respond_to do |format|
      if @know.save
        format.html { redirect_to @know, notice: 'Know was successfully created.' }
        format.json { render :show, status: :created, location: @know }
      else
        format.html { render :new }
        format.json { render json: @know.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /knows/1
  # PATCH/PUT /knows/1.json
  def update
    respond_to do |format|
      if @know.update(know_params)
        format.html { redirect_to @know, notice: 'Know was successfully updated.' }
        format.json { render :show, status: :ok, location: @know }
      else
        format.html { render :edit }
        format.json { render json: @know.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knows/1
  # DELETE /knows/1.json
  def destroy
    @know.destroy
    respond_to do |format|
      format.html { redirect_to knows_url, notice: 'Know was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_know
      @know = Know.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def know_params
      params.require(:know).permit(:name, :descripcion)
    end
end
