class WaitForNewIpService
  MAX_TRIES = 10
  def self.wait(proxy)
    counter = 0
    while true
      raise "Cannot get new ip" if counter > MAX_TRIES
      ip = IpInfoService.get_info(proxy).fetch('query')
      break if is_new_ip?(ip)
      counter += 1
      puts "Waiting for new ip (any ip that is not #{Settings.my_ip})"
      sleep 5
    end
  end

  def self.is_new_ip?(ip)
    ip != Settings.my_ip
  end
end
