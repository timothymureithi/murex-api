class ReservationsController < ApplicationController
    def index
        res_ids = current_user.reservations.pluck(:id)
        if logged_in?
          @reservations = Reservation.where(id: res_ids)
        else
          render json: { message: "Listing cannot be located, please try again."}, status: 404
        end
      end
      
      def create
        @reservation = Reservation.new(new_reservation_params)
    
        if @reservation.save
          render :show
        else
          render json: @reservation.errors.full_messages, status: 422
        end
      end
    
      def update
        @reservation = Reservation.find(params[:id])
    
        if @reservation.update(new_reservation_params)
          render :show
        else
          render json: @reservation.errors.full_messages, status: 422
        end
      end
    
      def destroy
        @reservation = Reservation.find(params[:id])
    
        if @reservation
          @reservation.destroy
        else
          render json: { message: "Listing cannot be located, please try again."}, status: 404
        end
      end
    
      private
    
      def new_reservation_params
        snake_case_params!(params[:reservation])
        
        params.require(:reservation).permit(:user_id, :listing_id, :check_in_date, :check_out_date, :num_guests, :price)
      end
end
