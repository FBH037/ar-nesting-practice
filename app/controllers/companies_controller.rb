class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :destroy, :update]

  def index
    @companies = Company.all
  end

  def show
   @locations = @company.locations
   @products = @company.products 

  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def update
    if @company.update
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    if @company.destroy
      redirect_to companies_path
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:suffix, :catch_phrase, :start_date, :email, :industry)
  end

end
