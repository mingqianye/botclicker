class ObtainProxyService
  def self.get
    puts Settings.gimmeproxy_url
    response = HTTParty.get(Settings.gimmeproxy_url)
    json = JSON.parse(response.body)
    puts json
    result = ProxyConfig.new
    result.ip = json.fetch('ip')
    result.port = json.fetch('port')
    result
  end
end
