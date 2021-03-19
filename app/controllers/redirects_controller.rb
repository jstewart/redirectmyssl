class RedirectsController < ApplicationController
  before_action :set_redirect, only: %i[show edit update destroy]

  def index
    @redirects = Redirect.all
    @redirect = RedirectForm.new(user: current_user)
  end

  def show; end

  def new
    @redirect = Redirect.new
  end

  def edit; end

  def create
    @redirect = RedirectForm.new(redirect_params.merge(user: current_user))
    respond_to do |format|
      if @redirect.submit
        format.html do
          redirect_to @redirect, notice: "Redirect was successfully created."
        end
        format.json { render :show, status: :created, location: @redirect }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream
            .replace(@redirect, partial: "redirects/form", locals: {redirect: @redirect})
        end
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

  def destroy
    @redirect.destroy
    respond_to do |format|
      format.html do
        redirect_to redirects_url,
                    notice: "Redirect was successfully destroyed."
      end
      format.json { head :no_content }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@redirect) }
    end
  end

  private

  def set_redirect
    @redirect = current_user.redirects.find(params[:id])
  end

  def redirect_params
    params.require(:redirect).permit(:destination, :hosts, :url, :active)
  end
end
