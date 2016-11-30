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

    uri = build_uri('/api/locationgroup/' + api_login + '/'  + group_id)
    http = build_http_object(uri)
    request = Net::HTTP::Post.new(uri)
    request.basic_auth(api_key, api_secret)
    request.set_form_data('usr_id': user_id, 'address': get_random_address)

    response = http.request(request)

    print_debug_end(response.code)
  end

  def self.get_locations(id)
    print_debug_start("to get the locations JSON")

    uri = build_uri('/api/locationgroup/' + api_login + '/' + id)
    http = build_http_object(uri)
    request = Net::HTTP::Get.new(uri)

    response = http.request(request)

    puts "Response body: #{response.body}"
    print_debug_end(response.code)

    return response.body
  end

  def self.get_barrios(id)
    print_debug_start("to get the barrios JSON")

    uri = build_uri('/api/locationgroup/' + api_login + '/'  + id + '/totals/madrid_barrios')
    http = build_http_object(uri)
    request = Net::HTTP::Get.new(uri)

    response = http.request(request)

    puts "Response body: #{response.body}"
    print_debug_end(response.code)

    return response.body
  end

  def self.get_distritos(id)
    print_debug_start("to get the distritos JSON")

    uri = build_uri('/api/locationgroup/' + api_login + '/'  + id + '/totals/madrid_distritos')
    http = build_http_object(uri)
    puts "#{uri}"
    request = Net::HTTP::Get.new(uri)

    response = http.request(request)

    ## puts "Response body: #{response.body}"
    print_debug_end(response.code)

    return response.body
  end

  def self.create_location_group(id, title)
    print_debug_start("to create a new proposal")

    uri = build_uri('/api/locationgroup/' + api_login)
    http = build_http_object(uri)
    request = Net::HTTP::Post.new(uri)
    request.basic_auth(api_key, api_secret)
    request.set_form_data('id': id, 'title': title)

    response = http.request(request)

    print_debug_end(response.code)
  end

  def self.create_get_proposal_indiv_votes_url(proposal)
    return self.create_get_indiv_votes_url('proposal_' + proposal.id.to_s)
  end

  def self.create_get_proposal_barrios_votes_url(proposal)
    return self.create_get_barrios_votes_url('proposal_' + proposal.id.to_s)
  end

  def self.create_get_proposal_distritos_votes_url(proposal)
    return self.create_get_distritos_votes_url('proposal_' + proposal.id.to_s)
  end

  private

    # Example: '/api/survey/50ibWU/totals/countries'
    def self.build_uri(path)
      URI::HTTPS.build(host: api_host, path: path, port: api_port)
    end

    def self.build_http_object(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http
    end

    def self.create_get_indiv_votes_url(id)
      uri = build_uri('/api/locationgroup/' + api_login + '/' + id)
      return uri
    end

    def self.create_get_barrios_votes_url(id)
      uri = build_uri('/api/locationgroup/' + api_login + '/' + id + '/totals/madrid_barrios')
      return uri
    end

    def self.create_get_distritos_votes_url(id)
      uri = build_uri('/api/locationgroup/' + api_login + '/' + id + '/totals/madrid_distritos')
      return uri
    end

    def self.print_debug_start(description = "")
      puts "\n\n\n" + "-"*60
      puts "Sending request to EMAPIC API " + description
    end

    def self.print_debug_end(http_code)
      puts "Response code: #{http_code}"
      puts "-"*60 + "\n\n\n"
    end

    def self.api_host
      Rails.application.secrets.emapic_api_host
    end

    def self.api_port
      Rails.application.secrets.emapic_api_port
    end

    def self.api_key
      Rails.application.secrets.emapic_api_key
    end

    def self.api_secret
      Rails.application.secrets.emapic_api_secret
    end

    def self.api_login
      Rails.application.secrets.emapic_api_login
    end
end
