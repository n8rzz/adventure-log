class ApplicationController < ActionController::Base
  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = 'http://localhost:3000'
  end
end
