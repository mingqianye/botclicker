class IpInfoService
  def self.get_info(proxy)
    options  = { http_proxyaddr: proxy.host, http_proxyport:proxy.port }
    response = HTTParty.get(Settings.ip_info_url, options)
    JSON.parse(response.body)
  end
end
