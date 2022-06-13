require 'rails_helper'

RSpec.describe 'Airlines Show Page' do
  context 'User Story 3' do
    it "can see a unique list of adult passengers that have flights on that airline" do
      frontier = Airline.create!(name: "Frontier")
      southwest = Airline.create!(name: "Southwest")
      flight1 = frontier.flights.create!(number: "249", date: "06/13/22", departure_city: "Denver", arrival_city: "Houston")
      flight2 = frontier.flights.create!(number: "278", date: "06/20/22", departure_city: "Denver", arrival_city: "St. Louis")
      flight3 = frontier.flights.create!(number: "250", date: "06/16/22", departure_city: "Denver", arrival_city: "Tampa")

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

      visit "/airlines/#{frontier.id}"

      expect(page).to have_content("Welcome to Frontier Airlines")
      expect(page).to_not have_content("Welcome to Southwest Airlines")

      within("#passengers") do
        expect(page).to have_content("Dani Coleman", count: 1)
        expect(page).to have_content("Kat Scriver", count: 1)
        expect(page).to have_content("Kelly Theorine", count: 1)
        expect(page).to have_content("Jeff Jacobson", count: 1)
        expect(page).to have_content("Robert Cornell", count: 1)
        expect(page).to_not have_content("Nico Theorine")
      end

      frontier = Airline.create!(name: "Frontier")
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

      PassengerFlight.create!(flight_id: flight4.id, passenger_id: nico.id)
      PassengerFlight.create!(flight_id: flight4.id, passenger_id: dani.id)
      PassengerFlight.create!(flight_id: flight4.id, passenger_id: kelly.id)
      PassengerFlight.create!(flight_id: flight5.id, passenger_id: kat.id)
      PassengerFlight.create!(flight_id: flight5.id, passenger_id: robert.id)
      PassengerFlight.create!(flight_id: flight6.id, passenger_id: jeff.id)
      PassengerFlight.create!(flight_id: flight6.id, passenger_id: nico.id)

      visit "/airlines/#{southwest.id}"

      expect(page).to have_content("Welcome to Southwest Airlines")
      expect(page).to_not have_content("Welcome to Frontier Airlines")

      within("#passengers") do
        expect(page).to have_content("Dani Coleman", count: 1)
        expect(page).to have_content("Kat Scriver", count: 1)
        expect(page).to have_content("Kelly Theorine", count: 1)
        expect(page).to have_content("Jeff Jacobson", count: 1)
        expect(page).to have_content("Robert Cornell", count: 1)
        expect(page).to_not have_content("Nico Theorine")
      end
    end
  end

  context 'Extension' do
    it "can see a sorted list of adult passengers by number of flights taken most to least " do
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

      visit "/airlines/#{frontier.id}"

      within("#passengers") do
        expect(page).to have_content("Kat Scriver")
        expect(page).to have_content("Kelly Theorine")
        expect(page).to have_content("Dani Coleman")
        expect(page).to have_content("Robert Cornell")
        expect(page).to have_content("Jeff Jacobson")
      end
    end
  end
end
