module Api
  module V1
    class AccountsController < Api::V1::ApiController
      before_action :set_account, only: [:show, :update, :destroy]
      # skip_before_action :authenticate_user!, only: [:index]

      # GET /accounts
      def index
        @accounts = Account.allByUser(current_user)

        render json: @accounts
      end

      # GET /accounts/1
      def show
        render json: @account
      end

      # POST /accounts
      def create
        @account = Account.new(account_params)

        if @account.save
          render json: @account, status: :created#, location: @account
        else
          render json: @account.errors, status: :unprocessable_entity
        end

        # if @account.save
        #   render json: {status: 'SUCCESS', message:'Conta criada com sucesso!', data:@account}, status: :created
        # else
        #   render json: {status: 'ERROR', message:'Erro ao criar a conta!', data:@account.errors}, status: :unprocessable_entity
        # end
      end

      # PATCH/PUT /accounts/1
      def update
        if @account.update(account_params)
          render json: @account
        else
          render json: @account.errors, status: :unprocessable_entity
        end
      end

      # DELETE /accounts/1
      def destroy
        @account.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_account
          @account = Account.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def account_params
          params.require(:account).permit(:title, :active, :investment, :user_id).merge(user:current_user)
        end
    end
  end
end