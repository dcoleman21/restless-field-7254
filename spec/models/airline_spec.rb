require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it { should have_many :flights }
  end

  describe 'instance methods' do
    it "can get a list of unique adult passengers ordered by number of flights" do
      frontier = Airline.create!(name: "Frontier")
      flight1 = frontier.flights.create!(number: "249", date: "06/13/22", departure_city: "Denver", arrival_city: "Houston")
      flight2 = frontier.flights.create!(number: "278", date: "06/20/22", departure_city: "Denver", arrival_city: "St. Louis")
      flight3 = frontier.flights.create!(number: "250", date: "06/16/22", departure_city: "Denver", arrival_city: "Tampa")

      southwest = Airline.create!(name: "Southwest")
      flight4 = southwest.flights.create!(number: "1010", date: "06/13/22", departure_city: "Denver", arrival_city: "Los Angeles")
      flight5 = southwest.flights.create!(number: "1011", date: "06/20/22", departure_city: "Denver", arrival_city: "Austin")
      flight6 = southwest.flights.create!(number: "1012", date: "06/16/22", departure_city: "Denver", arrival_city: "Bozeman")

      dani = Passenger.create!(name: "Dani Coleman", age: 41)
      kat = Passenger.create!(name: "Kat Scriver", age: 37)
      nico = Passenger.create!(name: "Nico Theorine", age: 17)
      robert = Passenger.create!(name: "Robert Cornell", age: 45)
      kelly = Passenger.create!(name: "Kelly Theorine", age: 51)
      jeff = Passenger.create!(name: "Jeff Jacobson", age: 54)

      PassengerFlight.create!(flight_id: flight1.id, passenger_id: dani.id)
      PassengerFlight.create!(flight_id: flight1.id, passenger_id: kat.id)
      PassengerFlight.create!(flight_id: flight1.id, passenger_id: kelly.id)
      PassengerFlight.create!(flight_id: flight2.id, passenger_id: robert.id)
      PassengerFlight.create!(flight_id: flight2.id, passenger_id: jeff.id)
      PassengerFlight.create!(flight_id: flight3.id, passenger_id: kat.id)
      PassengerFlight.create!(flight_id: flight3.id, passenger_id: kelly.id)
      PassengerFlight.create!(flight_id: flight4.id, passenger_id: nico.id)
      PassengerFlight.create!(flight_id: flight4.id, passenger_id: dani.id)
      PassengerFlight.create!(flight_id: flight4.id, passenger_id: kelly.id)
      PassengerFlight.create!(flight_id: flight5.id, passenger_id: kat.id)
      PassengerFlight.create!(flight_id: flight5.id, passenger_id: robert.id)
      PassengerFlight.create!(flight_id: flight6.id, passenger_id: jeff.id)
      PassengerFlight.create!(flight_id: flight6.id, passenger_id: nico.id)

      frontier_passenger_list = frontier.adult_passengers.flat_map do |passenger|
        [passenger.name, passenger.age, passenger.flight_count]
      end
      expect(frontier_passenger_list).to eq(["Kat Scriver", 37, 2, "Kelly Theorine", 51, 2, "Dani Coleman", 41, 1, "Robert Cornell", 45, 1, "Jeff Jacobson", 54, 1])

      southwest_passenger_list = southwest.adult_passengers.flat_map do |passenger|
        [passenger.name, passenger.age, passenger.flight_count]
      end
      expect(southwest_passenger_list).to eq(["Dani Coleman", 41, 1, "Kat Scriver", 37, 1, "Robert Cornell", 45, 1, "Kelly Theorine", 51, 1, "Jeff Jacobson", 54, 1])
    end
  end
end
