class AvatarService
  def self.search(nation)
    get_url("?affiliation=#{nation}&perPage=500")
  end

  private

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.conn
    Faraday.new('https://last-airbender-api.fly.dev/api/v1/characters/')
  end
end
