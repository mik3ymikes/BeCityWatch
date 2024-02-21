require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
   
    let (:user) {create(:user)}

    before do
      user
      get "/users"
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
    # let(:user) { create(:user) }
    # let(:token) {auth_token_for_user(user)}
    
    before do
      get "/users/#{user.id}"
    end
    
    it "returns a success response" do
      expect(response).to be_successful
    end
    
    it "returns a response with the correct user" do
      expect(response.body).to eq(user.to_json)
    end
    end

    #create
    
    describe "User /users" do
      # let(:token) {auth_token_for_user(user)}
      
      context "with valid params" do
        let(:user) { create(:user) }
     
    
      before do
        user_attributes = attributes_for(:user, user_id:user.id)
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
        user_attributes = attributes_for(:user, content: nil)
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
    # let(:token) {auth_token_for_user(user)}
    
    
    
      before do
        # put "/posts/#{post.id}", params: post_attributes, headers: {Authorization: "Bearer #{token}"}
        user_attributes = attributes_for(:user, content: "updated content")
        put "/users/#{user.id}", params: user_attributes
        # post.reload
      end
    
      it "updates a user" do
        user.reload
        expect(user.content).to eq("updated content")
      end
    
      it "returns a success response" do
        expect(response).to be_successful
      end
    end
    
    context "with invalid params" do
      let(:user) { create(:user) }
    
      before do
        user_attributes = {content: nil}
        # put "/users/#{post.id}", params: user_attributes, headers: {Authorization: "Bearer #{token}"}
        put "/users/#{user.id}", params: user_attributes
      end
    
      it "returns a response with errors" do
        expect(response.status).to eq(422)
      end
    end
    end


    #destroy
    describe "DELETE /users/:id" do
    let(:user) { create(:user) }
    # let(:user) { create(:user) }
    # let(:token) {auth_token_for_user(user)}
    
    before do
      # delete "/posts/#{post.id}", headers: {Authorization: "Bearer #{token}"}
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