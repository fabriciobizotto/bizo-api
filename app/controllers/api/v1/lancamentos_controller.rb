module Api
  module V1
    class LancamentosController < ApiController
      before_action :set_lancamento, only: %i[show update destroy]

      # GET /lancamentos
      def index
        @lancamentos = Lancamento.joins(:category).joins(:account).allByUser(current_user)

        render json: @lancamentos.as_json(include: %i[category account tags])
      end

      # GET /lancamentos/1
      def show
        render json: @lancamento
      end

      # POST /lancamentos
      def create
        @lancamento = Lancamento.new(lancamento_params)

        if @lancamento.save
          render json: @lancamentos.as_json(include: %i[category account tags]), status: :created # , location: @lancamento
        else
          render json: @lancamento.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /lancamentos/1
      def update
        if @lancamento.update(lancamento_params)
          render json: @lancamento.as_json(include: %i[category account tags])
        else
          render json: @lancamento.errors, status: :unprocessable_entity
        end
      end

      # DELETE /lancamentos/1
      def destroy
        @lancamento.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_lancamento
        @lancamento = Lancamento.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def lancamento_params
        params.require(:lancamento).permit(:title, :dtlcto, :dtpgto, :vllcto, :vlpgto, :pagar, :despesa,
                                           :category_id, :account_id, :user_id).merge(user: current_user)
      end
    end
  end
end
