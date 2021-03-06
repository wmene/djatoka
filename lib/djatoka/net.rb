# Module to allow mixing in the ability to retrieve JSON via http.
# Uses curb if available; otherwise falls back on Net::HTTP
module Djatoka::Net
  # Used to get the JSON response from Djatoka for Djatoka::Metadata and ping requests.
  # Uses curb if the gem is installed; otherwise it falls back on Net::HTTP.
  def get_json(url)
    if Djatoka.use_curb?
      c = Curl::Easy.new(url)
      data = nil
      c.on_success{|curl| data = JSON.parse(curl.body_str) }
      c.perform
    else
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      case response
      when Net::HTTPSuccess
        data = JSON.parse(response.body)
      else
        data = nil
      end
    end
    data
  end
end

