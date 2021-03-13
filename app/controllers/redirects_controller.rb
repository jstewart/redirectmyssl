class RedirectsController < ApplicationController
  before_action :set_redirect, only: %i[show edit update destroy]

  # GET /redirects
  # GET /redirects.json
  def index
    @redirects = Redirect.all
    @redirect = RedirectForm.new(user: current_user)
  end

  # GET /redirects/1
  # GET /redirects/1.json
  def show; end

  # GET /redirects/new
  def new
    @redirect = Redirect.new
  end

  # GET /redirects/1/edit
  def edit; end

  # POST /redirects
  # POST /redirects.json
  def create
    @redirect = RedirectForm.new(redirect_params.merge(user: current_user))
    respond_to do |format|
      if @redirect.submit
        format.html do
          redirect_to @redirect, notice: "Redirect was successfully created."
        end
        format.json { render :show, status: :created, location: @redirect }
      else
        format.html do
          @redirects = Redirect.all
          render :index, status: :unprocessable_entity
        end

        format.json do
          render json: @redirect.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /redirects/1
  # PATCH/PUT /redirects/1.json
  def update
    respond_to do |format|
      if @redirect.update(redirect_params)
        format.html do
          redirect_to @redirect, notice: "Redirect was successfully updated."
        end
        format.json { render :show, status: :ok, location: @redirect }
      else
        format.html { render :edit }
        format.json do
          render json: @redirect.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /redirects/1
  # DELETE /redirects/1.json
  def destroy
    @redirect.destroy
    respond_to do |format|
      format.html do
        redirect_to redirects_url,
                    notice: "Redirect was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_redirect
    @redirect = current_user.redirects.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def redirect_params
    params.require(:redirect).permit(:destination, :hosts, :url, :active)
  end
end
