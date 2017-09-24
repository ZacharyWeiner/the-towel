class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy, :assign_to]
  layout 'admin'
  # GET /tickets
  # GET /tickets.json
  def index
    if current_user.is_admin
      @tickets = Ticket.where(cohort: current_user.current_cohort)
    else
      @tickets = Ticket.where(creator: current_user)
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    notification = Notification.where(user: current_user, notification_type: "Ticket", notification_obeject_id: @ticket.id).first
    unless notification.nil?
      notification.read = true
      notification.save
    end
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.creator = current_user
    @ticket.cohort = current_user.current_cohort
    @ticket.status = "In Queue"
    respond_to do |format|
      if @ticket.save
        send_notifications
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

  def assign
    set_ticket
  end

  def assign_to
    assignee = User.find(params[:ticket][:assigned_to])
    @ticket.set_asignee(assignee)
    redirect_to @ticket
  end

  def resolve
    set_ticket
    @ticket.mark_resolved(current_user)
    redirect_to @ticket
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      if params[:ticket_id]
        @ticket = Ticket.find(params[:ticket_id])
      else
        @ticket = Ticket.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:created_by, :assigned_to, :status, :details, :resolution, :resolved_on, :title, :resolved_by, :cohort_id)
    end

    def send_notifications
      @ticket.cohort.admins.each do |admin|
        notification = Notification.create!(user: admin, notification_type: "Ticket", notification_obeject_id: @ticket.id)
      end
    end
end
