class SuggestedBusinessesController < ApplicationController
  before_action :signed_in_user, only: [:index, :show]
  before_action :admin_user, only: [:create, :edit, :update, :destroy]

  # GET /suggested_businesses
  # GET /suggested_businesses.json
  def index
    @suggested_businesses = SuggestedBusiness.all
  end

  # GET /suggested_businesses/1
  # GET /suggested_businesses/1.json
  def show
  end

  # GET /suggested_businesses/new
  def new
    @suggested_business = SuggestedBusiness.new
  end

  # GET /suggested_businesses/1/edit
  def edit
  end

  # POST /suggested_businesses
  # POST /suggested_businesses.json
  def create
    @suggested_business = SuggestedBusiness.new(suggested_business_params)

    respond_to do |format|
      if @suggested_business.save
        format.html { redirect_to root_path, notice: 'The Busienss entry has succesfully been sent.' }
      else
        format.html { render :new }
        format.json { render json: @suggested_business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suggested_businesses/1
  # PATCH/PUT /suggested_businesses/1.json
  def update
    respond_to do |format|
      if @suggested_business.update(suggested_business_params)
        format.html { redirect_to @suggested_business, notice: 'Suggested business was successfully updated.' }
        format.json { render :show, status: :ok, location: @suggested_business }
      else
        format.html { render :edit }
        format.json { render json: @suggested_business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggested_businesses/1
  # DELETE /suggested_businesses/1.json
  def destroy
    @suggested_business.destroy
    respond_to do |format|
      format.html { redirect_to suggested_businesses_url, notice: 'Suggested business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def verified
 require 'open-uri'
  require 'nokogiri'
  url = "http://www.iconosquare.com/hello"
  data = Nokogiri::HTML(open(url))
  return data.at_css("title").equal("404 not found") 
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggested_business
      @suggested_business = SuggestedBusiness.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suggested_business_params
      params.require(:suggested_business).permit(:requester, :business_name)
    end
	
	def signed_in_user
	unless signed_in?
		store_location
		redirect_to signin_url, notice: "please sign in"
		end
	end

	def admin_user
	redirect_to(root_url) unless signed_in? && current_user.admin?
	end
end
