require 'rails_helper'
 
RSpec.describe KalypsoController, :type=> :controller do
    describe "GET #home" do
        it "responds succesfully with an http 200 status code" do
            get :home
            expect(response).to be_success
            expect(response).to have_http_status(200)

        end
    end
    describe "GET #about" do
        it "responds succesfully with an http 200 status code" do
            get :about
            expect(response).to be_success
            expect(response).to have_http_status(200)

        end
    end
    describe "GET #faq" do
        it "responds succesfully with an http 200 status code" do
            get :faq
            expect(response).to be_success
            expect(response).to have_http_status(200)

        end
    end
end
