class BusinessesController < ApplicationController
  before_action :signed_in_user, only: [:index]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.all
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
  require 'open-uri'
  require 'nokogiri'
  @business = Business.find(params[:id])
  url = "http://www.iconosquare.com/#{@business.name}"
  data = Nokogiri::HTML(open(url))
  unless data.at_css(".bio-user").nil? 
  @description = data.at_css(".bio-user").text.strip
  end
  @description ||= "For this business's Description please visit their instagram page"
  unless data.at_css(".fullname").nil?
  @title = data.at_css(".fullname").text.strip
  end
  @title ||= "This user is Private on Instagram :("
  unless data.at_css(".bio-user").nil?
  @image = data.xpath("//img/@src")[5].to_s
  end
  @image ||= "https://d13yacurqjgara.cloudfront.net/users/22251/screenshots/803201/no-photo-grey_1x.png"
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  @business = Business.find(params[:id])
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
  @business = Business.find(params[:id])
    if @business.update_attributes(business_params)
      flash[:success] = "Business info updated"
      redirect_to @business
    else
      render 'edit'
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    Business.find(params[:id]).destroy
    flash[:success] = "Business deleted."
    redirect_to businesses_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit(:name)
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
