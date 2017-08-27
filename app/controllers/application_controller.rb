class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # You need to be a logged in user to access
  before_action :authenticate_user!
  before_action :set_locale
  
  def set_locale
    I18n.locale = current_user.try(:language) || extract_locale_from_accept_language_header
  end
  
  private
  
    def extract_locale_from_accept_language_header
      language = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
      if (language != "en" || language != "fr")
        puts "**** Language unknown = " + language
        "en"
      else
        language
      end
    end
end
