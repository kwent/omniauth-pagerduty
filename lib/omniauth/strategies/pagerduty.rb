require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class PagerDuty < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://app.pagerduty.com',
        :authorize_url => 'https://app.pagerduty.com/oauth/authorize',
        :token_url => 'https://app.pagerduty.com/oauth/token'
      }

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          %w[scope client_options].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
            end
          end
        end
      end

      uid { raw_info['id'].to_s }

      extra do
        {:raw_info => raw_info, :scope => scope }
      end

      def raw_info
        access_token.options[:mode] = :header
        @raw_info ||= access_token.get('user').parsed
      end

      def scope
        access_token['scope']
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

OmniAuth.config.add_camelization 'pagerduty', 'PagerDuty'
