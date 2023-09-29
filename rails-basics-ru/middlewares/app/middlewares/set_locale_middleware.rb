# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    locale_header = env['HTTP_ACCEPT_LANGUAGE']

    locale = if locale_header && !locale_header.empty?
               locale_header.split(',').first
             else
               I18n.default_locale
             end
    if locale.to_s.include?("-")
      locale = locale.split("-").first
    end

    I18n.locale = locale

    @app.call(env)
  end
  # def call(env)
  #   @headers, @response = @app.call(env)
  #
  #   [@status, @headers, @response]
  # end
  #
  # def switch_locale(&action)
  #   logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
  #   locale = extract_locale_from_accept_language_header
  #   logger.debug "* Locale set to '#{locale}'"
  #   I18n.with_locale(locale, &action)
  # end
  #
  # private
  # def extract_locale_from_accept_language_header
  #   request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  # end
  # END
end
