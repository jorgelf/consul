require 'net/http'
require 'openssl'

class EmapicApi
  HOST = 'emapic'
  PORT = 3000
  EMAPIC_USER = 4
  EMAPIC_PASS = 4
  def self.register_vote
    print_debug_start("to register a vote")

    uri = build_uri('/api/test')
    http = build_http_object(uri)
    request = Net::HTTP::Post.new(uri)
    request.basic_auth(EMAPIC_USER, EMAPIC_PASS)

    response = http.request(request)

    print_debug_end(response.code)
  end

  # Example: '/api/survey/50ibWU/totals/countries'
  def self.build_uri(path)
    URI::HTTP.build(host: HOST, path: path, port: PORT)
  end

  def self.build_http_object(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http
  end

  def self.print_debug_start(description = "")
    puts "\n\n\n" + "-"*60
    puts "Sending request to EMAPIC API " + description
  end

  def self.print_debug_end(http_code)
    puts "Response code: #{http_code}"
    puts "-"*60 + "\n\n\n"
  end
end
