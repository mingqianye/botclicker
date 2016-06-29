class ObtainProxyService
  def self.get
    puts Settings.gimmeproxy_url
    response = HTTParty.get(Settings.gimmeproxy_url)
    json = JSON.parse(response.body)
    puts json
    ProxyConfig.new(json.fetch('ipPort'))
  end
end
