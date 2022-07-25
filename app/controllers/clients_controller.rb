class ClientsController < ApplicationController
  def index
    render json: Client.all
  end

  def show
    client = Client.find_by!(id: params[:id])
    render json: client
  end

  def update
    client = Client.find_by!(id: params[:id])
    client.update!(client_params)
    render json: client
  end

  private

  def client_params
    params.permit(:name, :age)
  end
end
