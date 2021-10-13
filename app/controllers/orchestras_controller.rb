class OrchestrasController < ApplicationController
  def index
    @orchestras = Orchestra.all
  end

  def new
  end

  def create
    orchestra = Orchestra.new({
      name: params[:orchestra][:name],
      city: params[:orchestra][:city],
      hiring: params[:orchestra][:hiring],
      max_musicians: params[:orchestra][:max_musicians],
      created_at: Time.now,
      updated_at: Time.now
      })

    orchestra.save

    redirect_to '/orchestras'
  end

  def show
    @orchestra = Orchestra.find(params[:id])
  end

  def edit
    @orchestra = Orchestra.find(params[:id])
  end

  def update
    orchestra = Orchetra.find(params[:id])
    orchestra.update({
      name: params[:orchestra][:name],
      city: params[:orchestra][:city],
      hiring: params[:orchestra][:hiring],
      max_musicians: params[:orchestra][:max_musicians],
      updated_at: Time.now
      })

    orchestra.save
    redirect_to "/orchestras/#{orchestra.id}"
  end

  def destroy
    Orchestra.destroy(params[:id])
    redirect_to '/orchestras'
  end
end