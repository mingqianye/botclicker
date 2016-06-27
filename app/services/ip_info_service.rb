class IpInfoService
  def self.get_info(ip_string)
    response = HTTParty.get(Settings.ip_info_url)
    JSON.parse(response.body)
  end
end
