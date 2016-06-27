class ObtainProxyService
  def self.get
    response = HTTParty.get(Settings.gimmeproxy_url)
    json = JSON.parse(response.body)
    result = ProxyConfig.new
    result.ip = json.fetch('ip')
    result.port = json.fetch('port')
    result
  end
end
