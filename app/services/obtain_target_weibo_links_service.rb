class ObtainTargetWeiboLinksService
  def self.get
    response = HTTParty.get(Settings.g_spreadsheet_url)
    lines = response.body.split("\n").map(&:strip)
    links = lines.map {|l| l.split("\t").first }
  end
end
