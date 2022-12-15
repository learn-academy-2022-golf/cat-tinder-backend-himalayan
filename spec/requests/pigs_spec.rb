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
    it "can create a pig in the database and recieve the proper response" do
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
    it 'can cannot create a pig without a name' do
      pig_params = {
        pig: {
          
          breed: 'Teddy Guinea Pig',
          habits: 'Helping their human with their experiments',
          image: 'https://www.istockphoto.com/es/foto/preparado-cuy-guinea-pig-gm497034064-78906333'
        }
      }

      post '/pigs', params: pig_params

      expect(response).to have_http_status(422)

      json_response = JSON.parse(response.body)

      expect(json_response['name']).to include "can't be blank"
    end
    it 'can cannot create a pig without an breed' do
      pig_params = {
        pig: {
          name: "Mike The Pig", 
          habits: "showing up in places randomly", 
          image: 'https://www.istockphoto.com/es/foto/preparado-cuy-guinea-pig-gm497034064-78906333'
        }
      }

      post '/pigs', params: pig_params

      expect(response).to have_http_status(422)

      json_response = JSON.parse(response.body)

      expect(json_response['breed']).to include "can't be blank"
    end
    it 'cannot create a pig without habits' do
      pig_params = {
        pig: {
          name: "Mike The Pig", 
          breed: 'Teddy Guinea Pig',  
          image:'https://www.istockphoto.com/es/foto/preparado-cuy-guinea-pig-gm497034064-78906333'
        }
      }

      post '/pigs', params: pig_params

      expect(response).to have_http_status(422)

      json_response = JSON.parse(response.body)

      expect(json_response['habits']).to include "can't be blank"
    end
    it 'can cannot create a pig without an image' do
      pig_params = {
        pig: {
          name: "Mike The Pig", 
          breed: 'Teddy Guinea Pig',
          habits: 'Helping their human with their experiments'
        }
      }

      post '/pigs', params: pig_params

      expect(response).to have_http_status(422)

      json_response = JSON.parse(response.body)

      expect(json_response['image']).to include "can't be blank"
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
