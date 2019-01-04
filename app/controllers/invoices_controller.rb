class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice, only: [:show, :edit, :update, :destroy, :pay_with_stripe]
  before_action :authorize, except: [:index]
  layout 'black_dashboard'
  # GET /invoices
  # GET /invoices.json
  def index
    if params[:project_id]
      @invoices = Invoice.where(project: params[:project_id]).order(created_at: :desc)
    else
      @invoices = Invoice.where(company: current_user.company).order(created_at: :desc)
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def pay_with_stripe

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (@invoice.amount * 100).to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    payment_type = @invoice.invoice_type == InvoiceType.deposit ? PaymentType.deposit : PaymentType.balance
    if charge['paid'] == true
      @payment = Payment.create!(user: current_user,
                                 project: @invoice.project,
                                 payment_type: payment_type,
                                 payment_method: PaymentMethod.stripe,
                                 external_id: charge['id'],
                                 amount: charge['amount'] / 100,
                                 paid_on: Date.today)
      if @payment
        @invoice.payment = @payment
        @invoice.save!
      end
      if !@payment.nil? && @invoice.invoice_type == InvoiceType.balance
        @invoice.project.try_complete
      end
      respond_to do |format|
        #TODO: Create method for ProjectMailer or PaymentMailer
        format.html { redirect_to @invoice.project, notice: "Project #{@invoice.invoice_type} Successfully Paid." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to @invoice.project, notice: "There was an Error Paying the #{@invoice.invoice_type}" }
        format.json { head :no_content }
      end
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to @invoice.project
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      if params[:invoice_id]
        @invoice = Invoice.find(params[:invoice_id])
      else
        @invoice = Invoice.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:project_id, :company_id, :payment_id, :amount, :due_date, :invoice_type)
    end

    def authorize
      if current_user.is_admin
        return
      end
      if @invoice.nil? && @invoices.nil? && @project.nil?
        return redirect_to root_path
      end
      if (!@invoice.nil? && !@invoice.company.nil?) && @invoice.company == current_user.company
        return
      end
      return redirect_to root_path
    end
end
