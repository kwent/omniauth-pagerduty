require 'omniauth-oauth2'
require 'digest'

module OmniAuth
  module Strategies
    class PagerDuty < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: 'https://api.pagerduty.com',
        authorize_url: 'https://app.pagerduty.com/oauth/authorize',
        token_url: 'https://app.pagerduty.com/oauth/token'
      }
      
      option :pkce, true
      option :provider_ignores_state, true

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          %w[client_options].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
            end
          end
        end
      end

      uid { Digest::SHA2.hexdigest("#{me['user']['id']}-#{access_token.client.id}") }

      extra do
        { raw_info: raw_info, me: me }
      end

      def raw_info
        @raw_info ||= {}
      end

      def me
        access_token.options[:mode] = :header
        @me ||= access_token.get('users/me', headers: { 'Accept' => 'application/vnd.pagerduty+json;version=2' }).parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

OmniAuth.config.add_camelization 'pagerduty', 'PagerDuty'
OmniAuth.config.add_camelization 'pager_duty', 'PagerDuty'
