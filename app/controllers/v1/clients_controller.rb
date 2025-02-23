module V1
  class ClientsController < ApiController
    def create
      client = Client.create!(permitted_params)
      render json: client, status: :created
    end

    def show
      client = Client.find_id_or_cnpj!(params[:id])
      render json: client, status: :ok
    end

    private

    def permitted_params
      params
        .require(:client)
        .permit(:name,
                :cnpj,
                phones: [],
                addresses_attributes: %i[cep street state city number complement])
    end
  end
end
