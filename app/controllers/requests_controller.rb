class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]

  # GET /requests or /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1 or /requests/1.json
  def show
    @payload = JSON.parse(@request.payload)
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit; end

  # POST /requests or /requests.json
  def create
    bin = Bin.find_by(slug: request_params)
    payload = {
      headers: request.headers.env.reject { |key| key.to_s.include?('.') },
      method: request.method,
      body: request.body,
      query_params: request.query_parameters,
      timestamp: Time.now
    }
    payload = JSON.generate(payload)

    # fetch request headers, method, body, query params
    # create timestamp
    # stitch together and put payload column of requests object
    # ensure bin id is set too
    @request = Request.new(payload: payload, bin_id: bin.id)

    respond_to do |format|
      if @request.save
        # redirect to bins show page
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def request_params
    params.fetch(:bin_slug)
  end
end
