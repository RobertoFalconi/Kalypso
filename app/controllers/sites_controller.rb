class SitesController < ApplicationController
  #before_action :set_site, only: [:show, :edit, :update, :destroy]

  # GET /sites
  # GET /sites.json
  
def index
	#@sites = Site.all
	redirect_to root_path
end

  # GET /sites/1
  # GET /sites/1.json
  def show
	  redirect_to root_path
  end

  # GET /sites/new
  def new
    @site = Site.new
  end

  # GET /sites/1/edit
def edit
	redirect_to root_path
end

  # POST /sites
  # POST /sites.json
def create
#@site = Site.new(site_path)
	if Site.nil?
		@site = Site.new(suspended: false)
	else @site = Site.find(1)
	end
#    respond_to do |format|
#      if @site.save
#        format.html { redirect_to @site, notice: 'Site was successfully created.' }
#        format.json { render :show, status: :created, location: @site }
#      else
#        format.html { render :new }
#        format.json { render json: @site.errors, status: :unprocessable_entity }
#      end
#    end
end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
#  def update
#    respond_to do |format|
#      if @site.update(site_params)
#        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
#        format.json { render :show, status: :ok, location: @site }
#      else
#        format.html { render :edit }
#        format.json { render json: @site.errors, status: :unprocessable_entity }
#      end
#    end
#  end

	
def suspend
    if current_user.admin? 
      Site.first.update_attributes(suspended: true)
	  flash[:success] = "Kalypso updated"
      redirect_to root_path
    end
  end
    
  def unsuspend
    if current_user.admin? 
      Site.first.update_attributes(suspended: false)
	  flash[:success] = "Kalypso updated"
      redirect_to root_path
    end
  end
    
  def update
    params[:site][:suspended] == '1' ? suspend : unsuspend
  end

    
    
  # DELETE /sites/1
  # DELETE /sites/1.json
#  def destroy
#    @site.destroy
#    respond_to do |format|
#      format.html { redirect_to sites_url, notice: 'Site was successfully destroyed.' }
#      format.json { head :no_content }
#    end
#  end

#  private
    # Use callbacks to share common setup or constraints between actions.
#    def set_site
#      @site = Site.find(params[:id])
#    end

    # Never trust parameters from the scary internet, only allow the white list through.
#    def site_params
#      params.require(:site).permit(:suspended)
#    end
end
