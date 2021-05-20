class BrosController < ApplicationController

  before_action :find_bro, only: [:show, :update, :destroy]

  def index # GET /bros
    @bros = Bro.all
    render json: @bros, include: :scooters, except: [:created_at, :updated_at]
  end

  def show # GET /bros/:id
    render json: @bro, include: :scooters
  end

  def create # POST /bros
    @new_bro = Bro.create(
      name: params[:name],
      age: params[:age]
    )
    render json: @new_bro
  end

  def update # PATCH or PUT /bros/:id
    @bro.update name: params[:name], age: params[:age]
    render json: @bro
  end

  def destroy # DELETE /bros/:id
    @bro.destroy
  end

  private

  def find_bro
    @bro = Bro.find params[:id]
  end

end
