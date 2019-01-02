class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorize, except: [:new, :create, :show, :send_welcome_email, :invoices]
  layout 'black_dashboard'

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.order(:created_at).page params[:page]
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    if company_params[:instagram] && company_params[:instagram].include?('@')
      @company.instagram = company_params[:instagram].gsub!('@', '')
    end

    respond_to do |format|
      if @company.save
        if current_user.user_type == 'company'
          current_user.company = @company
          current_user.save
           if current_user.user_profile.nil?
            current_user.create_user_profile!(display_name: current_user.name)
          end
        end
        CompanyMailer.welcome_email(current_user).deliver_later
        format.html { redirect_to company_dashboard_path, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
       if company_params['instagram'].include?('@')

        new_insta = @company.instagram.gsub!('@', '')
        company_params[:instagram] = new_insta
      end
      if @company.update(company_params)
        format.html { redirect_to company_dashboard_path, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def invoices
    @company = current_user.company
  end

  def send_welcome_email

    set_company

    CompanyMailer.welcome_email(@company.users.first).deliver_now
    redirect_to @company
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      if params[:company_id]
         @company = Company.find(params[:company_id])
      else
        @company = Company.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :logo, :phone, :website, :instagram)
    end

    def authorize
      if current_user.role == 0
        return
      end
      unless  current_user && current_user.company == @company
        redirect_to root_path
      end
    end
end
