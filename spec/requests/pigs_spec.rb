require 'rails_helper'

RSpec.describe "Pigs", type: :request do
  describe "GET /index" do
    it "gets a list of guinea pigs" do
      Pig.create(
        name: 'Mike the Pig',
        breed: 'Teddy Guinea Pig',
        habits: 'Helping their human with their experiments',
        image: 'https://www.istockphoto.com/es/foto/preparado-cuy-guinea-pig-gm497034064-78906333'
      )

      # Make a request
      get '/pigs'

      pig = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(pig.length).to eq 1
    end
  end
  describe "POST /create" do
    it "creates a pig" do
      # The params we are going to send with the request
      pig_params = {
        pig: {
          name: 'Mike the Pig',
          breed: 'Teddy Guinea Pig',
          habits: 'Helping their human with their experiments',
          image: 'https://www.istockphoto.com/es/foto/preparado-cuy-guinea-pig-gm497034064-78906333'
        }
      }
  
      # Send the request to the server
      post '/pigs', params: pig_params
  
      # Assure that we get a success back
      expect(response).to have_http_status(200)
  
      # Look up the cat we expect to be created in the db
      pig = Pig.last
  
      # Assure that the created cat has the correct attributes
      expect(pig.name).to eq 'Mike the Pig'
    end
  end
  describe "PATCH /update" do
    it "adds changes to a pig" do

      Pig.create(
        name: 'Mike the Pig',
        breed: 'Teddy Guinea Pig',
        habits: 'Helping their human with their experiments',
        image: 'https://www.istockphoto.com/es/foto/preparado-cuy-guinea-pig-gm497034064-78906333'
      )
      pig_params = {
        pig: {
          name: 'Mike the One and Only Pig',
          breed: 'Teddy Guinea Pig',
          habits: 'Helping their human with their experiments',
          image: 'https://www.istockphoto.com/es/foto/preparado-cuy-guinea-pig-gm497034064-78906333'
        }
      }
  
      # Send the request to the server
      pig = Pig.last
      patch "/pigs/#{pig.id}", params: pig_params
  
      # Assure that we get a success back
      expect(response).to have_http_status(200)
  
      # Look up the cat we expect to be created in the db
      pig = Pig.last
  
      # Assure that the created cat has the correct attributes
      expect(pig.name).to eq 'Mike the One and Only Pig'
    end
  end
  describe "DELETE /destroy" do
    it "destroys a requested pig" do
    #  pig = Pig.new(having_attributes)
    #   pig.save
      
     
    #   expect do delete pig_url(pig) 
    #   end.to change(Pig.all, :count).by(-1)
    pig = Pig.create(
      name: 'Mike the Pig',
      breed: 'Teddy Guinea Pig',
      habits: 'Helping their human with their experiments',
      image: 'https://www.istockphoto.com/es/foto/preparado-cuy-guinea-pig-gm497034064-78906333'
    )
    pig = Pig.last
    delete "/pigs/#{pig.id}"
      expect(response).to have_http_status(200)
    expect(Pig.all).to eq []
    end
  end
end
