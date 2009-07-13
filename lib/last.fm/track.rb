class LastFm::Track
  attr_accessor :image_url, :album, :artist, :name, :url
  def initialize(params)
    @image_url, @album, @artist, @name, @url =\
    params[:image_url], params[:album], params[:artist],
    params[:name], params[:url]
  end
end