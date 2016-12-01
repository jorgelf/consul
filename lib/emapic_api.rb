require 'net/http'
require 'openssl'

class EmapicApi

  def self.get_random_address
    print_debug_start("to get the address")

    uri = build_uri('/api/randomMadrid')
    http = build_http_object(uri)
    request = Net::HTTP::Get.new(uri)

    response = http.request(request)

    puts "Address: #{JSON.parse(response.body)['display_name']}"
    print_debug_end(response.code)

    return JSON.parse(response.body)['display_name']
  end

  def self.register_random_location(group_id, user_id)
    print_debug_start("to register a vote with a random address")

    uri = build_uri('/api/locationgroup/' + emapic_login + '/'  + group_id)
    http = build_http_object(uri)
    request = Net::HTTP::Post.new(uri)
    request.basic_auth(emapic_api_key, emapic_api_secret)
    request.set_form_data('usr_id': user_id, 'address': get_random_address)

    response = http.request(request)

    print_debug_end(response.code)
  end

  def self.register_location(group_id, user_id, lat, lng)
    print_debug_start("to register a vote with lat/lng")

    uri = build_uri('/api/locationgroup/' + emapic_login + '/'  + group_id)
    http = build_http_object(uri)
    request = Net::HTTP::Post.new(uri)
    request.basic_auth(emapic_api_key, emapic_api_secret)
    request.set_form_data('usr_id': user_id, 'lat': lat, 'lng': lng)

    response = http.request(request)

    print_debug_end(response.code)
  end

  def self.create_location_group(id, title)
    print_debug_start("to create a new proposal")

    uri = build_uri('/api/locationgroup/' + emapic_login)
    http = build_http_object(uri)
    request = Net::HTTP::Post.new(uri)
    request.basic_auth(emapic_api_key, emapic_api_secret)
    request.set_form_data('id': id, 'title': title)

    response = http.request(request)

    print_debug_end(response.code)
  end

  private

    def self.build_uri(path)
      URI(emapic_url + path)
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

    def self.emapic_url
      Rails.application.secrets.emapic_url
    end

    def self.emapic_api_key
      Rails.application.secrets.emapic_api_key
    end

    def self.emapic_api_secret
      Rails.application.secrets.emapic_api_secret
    end

    def self.emapic_login
      Rails.application.secrets.emapic_login
    end
end
