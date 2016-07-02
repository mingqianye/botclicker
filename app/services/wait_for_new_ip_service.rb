class WaitForNewIpService
  MAX_TRIES = 10
  def self.wait(browser)
    browser.goto(Settings.ip_info_url)
    counter = 0
    while true
      raise "Cannot get new ip" if counter > MAX_TRIES
      ip = JSON.parse(browser.body.text).fetch('query')
      break if is_new_ip?(ip)
      counter += 1
      sleep 5
    end
  end

  def self.is_new_ip?(ip)
    ip != Setting.my_ip
  end

end
