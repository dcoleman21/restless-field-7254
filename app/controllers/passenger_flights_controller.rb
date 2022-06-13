class PassengerFlightsController < ApplicationController
  def destroy
    PassengerFlight.find_by(flight_id: params[:flight_id], passenger_id: params[:passenger_id]).destroy
    redirect_to flights_path
  end
end
