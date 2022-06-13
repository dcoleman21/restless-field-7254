require 'rails_helper'

RSpec.describe 'Flights Index Page' do
  context 'User Story 1' do
    it "can see a list off all flight numbers and that flights airline" do
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
      nico = Passenger.create!(name: "Nico Theorine", age: 26)
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

      visit "/flights"

      expect(page).to have_content("Flights Board")

      within("#flight-0") do
        expect(page).to have_content("249")
        expect(page).to have_content("Frontier")
        expect(page).to_not have_content("Southwest")
      end
      within("#flight-1") do
        expect(page).to have_content("278")
        expect(page).to have_content("Frontier")
        expect(page).to_not have_content("Southwest")
      end
      within("#flight-2") do
        expect(page).to have_content("250")
        expect(page).to have_content("Frontier")
        expect(page).to_not have_content("Southwest")
      end
      within("#flight-3") do
        expect(page).to have_content("1010")
        expect(page).to have_content("Southwest")
        expect(page).to_not have_content("Frontier")
      end
      within("#flight-4") do
        expect(page).to have_content("1011")
        expect(page).to have_content("Southwest")
        expect(page).to_not have_content("Frontier")
      end
      within("#flight-5") do
        expect(page).to have_content("1012")
        expect(page).to have_content("Southwest")
        expect(page).to_not have_content("Frontier")
      end
    end

    it "can see the names of all that flights passengers" do
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
      nico = Passenger.create!(name: "Nico Theorine", age: 26)
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

      visit "/flights"

      within("#flight-0") do
        expect(page).to have_content("Dani Coleman")
        expect(page).to have_content("Kat Scriver")
        expect(page).to have_content("Kelly Theorine")
        expect(page).to_not have_content("Jeff Jacobson")
      end
      within("#flight-1") do
        expect(page).to have_content("Robert Cornell")
        expect(page).to have_content("Jeff Jacobson")
        expect(page).to_not have_content("Dani Coleman")
      end
      within("#flight-2") do
        expect(page).to have_content("Kat Scriver")
        expect(page).to have_content("Kelly Theorine")
        expect(page).to_not have_content("Nico Theorine")
      end
      within("#flight-3") do
        expect(page).to have_content("Nico Theorine")
        expect(page).to have_content("Dani Coleman")
        expect(page).to have_content("Kelly Theorine")
        expect(page).to_not have_content("Robert Cornell")
      end
      within("#flight-4") do
        expect(page).to have_content("Kat Scriver")
        expect(page).to have_content("Robert Cornell")
        expect(page).to_not have_content("Kelly Theorine")
      end
      within("#flight-5") do
        expect(page).to have_content("Nico Theorine")
        expect(page).to have_content("Jeff Jacobson")
        expect(page).to_not have_content("Kat Scriver")
      end
    end
  end

  context 'User Story 2' do
    before(:each) do
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
      nico = Passenger.create!(name: "Nico Theorine", age: 26)
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

      visit "/flights"
    end
    it "can see a link to remove that passenger from that flight, when clicked, return to flights index and that passenger is no longer listed" do
      within("#flight-0") do
        expect(page).to have_content("Dani Coleman")
        expect(page).to have_link("Delete")

        click_link "Delete", match: :first

        expect(current_path).to eq("/flights")
        expect(page).to_not have_content("Dani Coleman")
      end
      within("#flight-1") do
        expect(page).to have_content("Robert Cornell")
        expect(page).to have_link("Delete")

        click_link "Delete", match: :first

        expect(current_path).to eq("/flights")
        expect(page).to_not have_content("Robert Cornell")
      end
    end
  end
end
