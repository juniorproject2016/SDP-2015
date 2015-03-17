class BusinessCategoriesController < ApplicationController
  before_action :signed_in_user, only: [:index, :show]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  
  def main
      @business_categories = BusinessCategory.all
  end
  
  # GET /business_categories
  # GET /business_categories.json
  def index
    @business_categories = BusinessCategory.all
  end

  # GET /business_categories/1
  # GET /business_categories/1.json
  def show
  @business_category = BusinessCategory.find(params[:id])
  end

  # GET /business_categories/new
  def new
    @business_category = BusinessCategory.new
  end

  # GET /business_categories/1/edit
  def edit
  @business_category = BusinessCategory.find(params[:id])
  end

  # POST /business_categories
  # POST /business_categories.json
  def create
    @business_category = BusinessCategory.new(business_category_params)

    respond_to do |format|
      if @business_category.save
        format.html { redirect_to @business_category, notice: 'Business category was successfully created.' }
        format.json { render :show, status: :created, location: @business_category }
      else
        format.html { render :new }
        format.json { render json: @business_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business_categories/1
  # PATCH/PUT /business_categories/1.json
  def update
    @business_category = BusinessCategory.find(params[:id])
    if @business_category.update_attributes(business_category_params)
      flash[:success] = "Business info updated"
      redirect_to @business_category
    else
      render 'edit'
    end
  end

  # DELETE /business_categories/1
  # DELETE /business_categories/1.json
  def destroy
    BusinessCategory.find(params[:id]).destroy
    flash[:success] = "Business deleted."
    redirect_to business_categories_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_category
      @business_category = BusinessCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_category_params
      params.require(:business_category).permit(:business_id, :category_id)
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
