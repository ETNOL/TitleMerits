require 'net/http'
class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  # POST /organizations/import/1
  def importBamboo
    apiKey = params[:apiKey]
    credentials = "#{apiKey}:x"
    authorization = "Basic #{Base64::encode64(credentials)}".gsub("\n", "")
    organization = Organization.find(params[:id])
    bambooUrl = "https://api.bamboohr.com/api/gateway.php/#{organization.name}/v1/employees/directory"
    url = URI(bambooUrl)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    request["Accept"] = 'application/json'
    request["Authorization"] = authorization
    response = http.request(request)


    employeeList = JSON.parse(response.read_body)
    employeeList = employeeList[employeeList.keys[1]]
    puts response.code
    employeeList.each do |employee|
        # if Member.where(email: employee["workEmail"])
        #     next
        # end
       member = Member.new({
           first_name: employee["firstName"],
           last_name: employee["lastName"],
           email: employee["workEmail"],
           display_name: employee["displayName"]
       })
       member.organization = organization
       puts member
       member.save
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name, :apiKey)
    end
end
