require 'rails_helper'

RSpec.describe "Alerts", type: :request do
  describe "GET /alerts" do
    
    let (:alert) {create(:alert)}

    before do
      alert
      get "/alerts"
    end
    
    it "returns a success response" do
      expect(response).to be_successful
    end
    
    it "returns a response with all the alerts" do
      expect(response.body).to eq(Alert.all.to_json)
    end
    end
    
    #  show
    describe "GET /alerts/:id" do
    let(:alert) { create(:alert) }
    # let(:user) { create(:user) }
    # let(:token) {auth_token_for_user(user)}
    
    before do
      get "/alerts/#{alert.id}"
    end
    
    it "returns a success response" do
      expect(response).to be_successful
    end
    
    it "returns a response with the correct alert" do
      expect(response.body).to eq(alert.to_json)
    end
    end

    #create
    
    describe "Alert /alerts" do
      # let(:token) {auth_token_for_user(user)}
      
      context "with valid params" do
        let(:user) { create(:user) }
     
    
      before do
        alert_attributes = attributes_for(:alert, user_id:user.id)
        # post "/alerts", params: post_attributes, headers: {Authorization: "Bearer #{token}"}
        post "/alerts", params: alert_attributes
      end
    
      it "returns a success response" do
        expect(response).to be_successful
      end
    
      it "creates a new alert" do
        expect(Alert.count).to eq(1)
      end
    end
    
    context "with invalid params" do
     
    
      before do
        alert_attributes = attributes_for(:alert, content: nil)
        # post "/alerts", params: alert_attributes, headers: {Authorization: "Bearer #{token}"}
        post "/alerts", params: alert_attributes
      end
    
      it "returns a response with errors" do
        expect(response.status).to eq(422)
      end
    end
    end
    
    # update

    describe "PUT /alerts/:id" do
      context "with valid params" do
    let(:alert) { create(:alert) }
    # let(:token) {auth_token_for_user(user)}
    
    
    
      before do
        # put "/posts/#{post.id}", params: post_attributes, headers: {Authorization: "Bearer #{token}"}
        alert_attributes = attributes_for(:alert, content: "updated content")
        put "/alerts/#{alert.id}", params: alert_attributes
        # post.reload
      end
    
      it "updates a alert" do
        alert.reload
        expect(alert.content).to eq("updated content")
      end
    
      it "returns a success response" do
        expect(response).to be_successful
      end
    end
    
    context "with invalid params" do
      let(:alert) { create(:alert) }
    
      before do
        alert_attributes = {content: nil}
        # put "/alerts/#{post.id}", params: alert_attributes, headers: {Authorization: "Bearer #{token}"}
        put "/alerts/#{alert.id}", params: alert_attributes
      end
    
      it "returns a response with errors" do
        expect(response.status).to eq(422)
      end
    end
    end


    #destroy
    describe "DELETE /alerts/:id" do
    let(:alert) { create(:alert) }
    # let(:user) { create(:user) }
    # let(:token) {auth_token_for_user(user)}
    
    before do
      # delete "/posts/#{post.id}", headers: {Authorization: "Bearer #{token}"}
      delete "/alerts/#{alert.id}"

    end
    
    it "deletes a alert" do
      expect(Alert.count).to eq(0)
    end
    
    it "returns success response" do
      expect(response).to be_successful
    end
    end
    end
   






