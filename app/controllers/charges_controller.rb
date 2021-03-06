class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = params[:amount]
    @initial_amount = @amount

    @amount = @amount.gsub('$', '').gsub(',', '')

    begin
    @amount = Float(@amount).round(2)
    @amount = Integer(@amount * 100)
    rescue
      flash[:error] = 'Charge not completed. Please enter a valid amount in USD ($).'
      redirect_to new_charge_path
      return
    end

    if @amount < 500
      flash[:error] = 'Charge not completed. Donation amount must be at least $5.'
      redirect_to new_charge_path
      return
    end



    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Deposit For Future Work',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

  end

  def proposal_deposit
    @proposal = Proposal.find(params[:proposal_id])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @proposal.price,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    if charge['paid'] == true
      @proposal.deposit_paid = true
      @proposal.deposit_id = charge['id']
      @proposal.deposit_paid_on = Date.today
      @proposal.save
      respond_to do |format|
        ProposalMailer.deposit_received(@proposal).deliver_now
        format.html { redirect_to @proposal, notice: 'Proposal Deposit Successfully Paid.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to proposal_deposit_path(@proposal), notice: 'There was an Error Paying the Deposit' }
        format.json { head :no_content }
      end
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def proposal_balance
    @proposal = Proposal.find(params[:proposal_id])
    @amount = ((@proposal.price - (@proposal.price * 0.10)) * 100).to_int
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    if charge['paid'] == true
      @proposal.paid = true
      @proposal.charge_id = charge['id']
      @proposal.balance_paid_on = Date.today
      @proposal.save
      respond_to do |format|
        ProposalMailer.balance_received(@proposal).deliver_now
        format.html { redirect_to @proposal, notice: 'Proposal Balance Successfully Paid.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to proposal_deposit_path(@proposal), notice: 'There was an Error Paying the Balance' }
        format.json { head :no_content }
      end
    end
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
end
