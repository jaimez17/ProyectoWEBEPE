class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
    @menu = "menu1"
  end

  def abiertas 
    @tickets = Ticket.all
    @ticket = Ticket.new
    @menu = "menu2"
  end

  def atendidas
    @tickets = Ticket.all
    @ticket = Ticket.new
    @menu = "menu2"
  end

    # GET /tickets/1
  # GET /tickets/1.json
  def show
    @menu = "menu1"
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @menu = "menu1"
  end

  # GET /tickets/1/edit
  def edit
    @menu = "menu1"
  end
  
  def asignar
    #params[:ticket][:estado] = 2
    #debugger params
    render nothing: false
  end
    
  # POST /tickets
  # POST /tickets.json
  def create
    
    params[:ticket][:usuario_id] = 1 #MI USUARIO
    params[:ticket][:empresa_id] = 1 #EMPRESA OXICODE
    params[:ticket][:prioridad] = 2
    params[:ticket][:estado] = 1
    #params[:ticket][:empleado_id] = 
    params[:ticket][:codigo] = Ticket.where(empresa_id: 1).count + 1
    @ticket = Ticket.new(ticket_params)
    
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:codigo, :asunto, :prioridad, :empresa_id, :cliente_id, :empleado_id, :categoria_id, :subcategoria_id, :area_id, :tipo, :estado, :usuario_id, :empresa_id)
    end
end
