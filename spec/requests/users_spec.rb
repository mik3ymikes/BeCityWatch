require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
   
    let (:user) {create(:user)}
    let(:token) {auth_token_for_user(user)}

    before do
      user
     get "/users", headers: {Authorization: "Bearer #{token}"}
    end
    
    it "returns a success response" do
      expect(response).to be_successful
    end
    
    it "returns a response with all the users" do
      expect(response.body).to eq(User.all.to_json)
    end
    end
    
    #  show
    describe "GET /users/:id" do
    let(:user) { create(:user) }
    let(:token) {auth_token_for_user(user)}
    
    
    before do
      get "/users/#{user.id}", headers: {Authorization: "Bearer #{token}"}
    end
    
    it "returns a success response" do
      expect(response).to be_successful
    end
    
    it "returns a response with the correct user" do
      expect(response.body).to eq(user.to_json)
    end
    end

    #create
    
    describe "POST /users" do
      # let(:token) {auth_token_for_user(user)}
      
      context "with valid params" do
        let(:user) { create(:user) }
     
    
      before do
        user_attributes = attributes_for(:user)
        # post "/users", params: post_attributes, headers: {Authorization: "Bearer #{token}"}
        post "/users", params: user_attributes
      end
    
      it "returns a success response" do
        expect(response).to be_successful
      end
    
      it "creates a new user" do
        expect(User.count).to eq(1)
      end
    end
    
    context "with invalid params" do
     
    
      before do
        user_attributes = attributes_for(:user, username: nil)
        # post "/users", params: user_attributes, headers: {Authorization: "Bearer #{token}"}
        post "/users", params: user_attributes
      end
    
      it "returns a response with errors" do
        expect(response.status).to eq(422)
      end
    end
    end
    
    # update

    describe "PUT /users/:id" do
      context "with valid params" do
    let(:user) { create(:user) }
    let(:token) {auth_token_for_user(user)}
    
    
    
      before do
        put "/users/#{user.id}", params: user_attributes, headers: {Authorization: "Bearer #{token}"}
        user_attributes = {username: "cat"}
       
        # post.reload
      end
    
      it "updates a user" do
        user.reload
        expect(user.username).to eq("cat")
      end
    
      it "returns a success response" do
        expect(response).to be_successful
      end
    end
    
    context "with invalid params" do
      let(:user) { create(:user) }
      let(:token) {auth_token_for_user(user)}
    
      before do
        user_attributes = {username: nil}

        put "/users/#{user.id}", params: user_attributes, params: user_attributes, headers: {Authorization: "Bearer #{token}"}
      end
    
      it "returns a response with errors" do
        expect(response.status).to eq(422)
      end
    end
    end


    #destroy
    describe "DELETE /users/:id" do
    let(:user) { create(:user) }
    let(:token) {auth_token_for_user(user)}
    
    before do
      delete "/users/#{user.id}", headers: {Authorization: "Bearer #{token}"}
      delete "/users/#{user.id}"

    end
    
    it "deletes a user" do
      expect(User.count).to eq(0)
    end
    
    it "returns success response" do
      expect(response).to be_successful
    end
    end
    end