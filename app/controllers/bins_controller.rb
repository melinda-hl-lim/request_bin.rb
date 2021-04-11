class BinsController < ApplicationController
  before_action :set_bin, only: %i[show update destroy]

  # GET /bins or /bins.json
  def index
    @bins = Bin.all
  end

  # GET /bins/1 or /bins/1.json
  def show
    
  end

  # GET /bins/new
  def new
    @bin = Bin.new
  end

  # POST /bins or /bins.json
  def create
    @bin = Bin.new

    respond_to do |format|
      if @bin.save
        format.html { redirect_to "/data/#{@bin.slug}", notice: 'Bin was successfully created.' }
        format.json { render :show, status: :created, location: @bin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bins/1 or /bins/1.json
  def update
    respond_to do |format|
      if @bin.update(bin_params)
        format.html { redirect_to "/data/#{@bin.slug}", notice: 'Bin was successfully updated.' }
        format.json { render :show, status: :ok, location: @bin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bins/1 or /bins/1.json
  def destroy
    @bin.destroy
    respond_to do |format|
      format.html { redirect_to bins_url, notice: 'Bin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bin
    # byebug.pry
    @bin = Bin.find_by(slug: bin_params)
  end

  # Only allow a list of trusted parameters through.
  def bin_params
    params.fetch(:bin_slug)
  end
end
