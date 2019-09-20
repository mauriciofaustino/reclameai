class ComplaintsController < ApplicationController
  before_action :set_complaint, only: [:show, :edit, :update, :destroy]

  # GET /complaints
  # GET /complaints.json
  def index
    @complaints = Complaint.all
  end

  # GET /complaints/1
  # GET /complaints/1.json
  def show
  end

  # GET /complaints/new
  def new
    @complaint = Complaint.new
  end

  # GET /complaints/1/edit
  def edit
  end

  # POST /complaints
  # POST /complaints.json
  def create
    @complaint = Complaint.new(complaint_params)
    
    @complaint.suspeito = is_suspeito(@complaint.cep, request.remote_ip)

    respond_to do |format|
      if @complaint.save
        format.html { redirect_to @complaint, notice: 'Complaint was successfully created.' }
        format.json { render :show, status: :created, location: @complaint }
      else
        format.html { render :new }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  def is_suspeito(cep, ip)
    res = RestClient.get 'https://viacep.com.br/ws/'+cep+'/json/'
    result = JSON.parse(res)

    begin 
      res2 = RestClient.get 'https://api.ipgeolocation.io/ipgeo?apiKey=15627a30bd9446fc846ff54119516ecb&ip='+ip
    rescue
      res2 = RestClient.get 'https://api.ipgeolocation.io/ipgeo?apiKey=15627a30bd9446fc846ff54119516ecb'
    end  
    result2 = JSON.parse(res2)

    localidade_igual = I18n.transliterate(result["localidade"]).eql? result2["city"]
    return !localidade_igual
  end

  # PATCH/PUT /complaints/1
  # PATCH/PUT /complaints/1.json
  def update
    respond_to do |format|
      if @complaint.update(complaint_params)
        format.html { redirect_to @complaint, notice: 'Complaint was successfully updated.' }
        format.json { render :show, status: :ok, location: @complaint }
      else
        format.html { render :edit }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaints/1
  # DELETE /complaints/1.json
  def destroy
    @complaint.destroy
    respond_to do |format|
      format.html { redirect_to complaints_url, notice: 'Complaint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complaint_params
      params.require(:complaint).permit(:nome, :email, :numero_pedido, :cep, :descricao, :suspeito)
    end
end
