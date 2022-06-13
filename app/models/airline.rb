class Airline < ApplicationRecord
  has_many :flights

  def adult_passengers
    flights.joins(:passengers)
           .select("passengers.*, count(passengers.id) as flight_count")
           .group("passengers.id")
           .where("passengers.age >= ?", 18)
           .order("flight_count desc")
           .distinct
  end
end
