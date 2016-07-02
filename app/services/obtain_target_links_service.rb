class ObtainTargetLinksService
  def self.get
    response = HTTParty.get(Settings.g_spreadsheet_url)
    puts 'Getting links from google spreadsheet'
    lines = response.body.split("\n").map(&:strip)
    links = lines.map {|l| l.split("\t").second }.compact
  end
end
