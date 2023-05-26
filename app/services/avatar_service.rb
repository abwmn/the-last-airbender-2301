class AvatarService
  def search(nation)
    get_url("?affiliation=#{nation}&perPage=25&page=1")
  end



  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def conn
    Faraday.new('https://last-airbender-api.fly.dev/api/v1/characters/')
  end
end
