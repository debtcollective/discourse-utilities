# frozen_string_literal: true

require 'rails_helper'

describe "Sessions" do
  describe 'GET sso_cookies' do
    context "no return_url parameter" do
      it 'returns error' do
        get "/session/sso_cookies"

        expect(response.status).to eq(400)
      end
    end

    it 'redirects to /login and sets sso_destination_url cookie' do
      get "/session/sso_cookies?return_url=example.com"

      expect(response.cookies['sso_destination_url']).to eq('example.com')
      expect(response).to redirect_to('/login')
    end
  end

  describe 'GET sso_cookies_signup' do
    context "no return_url parameter" do
      it 'returns error' do
        get "/session/sso_cookies/signup"

        expect(response.status).to eq(400)
      end
    end

    it 'redirects to /signup and sets sso_destination_url cookie' do
      get "/session/sso_cookies/signup?return_url=example.com"

      expect(response.cookies['sso_destination_url']).to eq('example.com')
      expect(response).to redirect_to('/signup')
    end
  end
end