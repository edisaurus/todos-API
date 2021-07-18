module RequestSpecHelper
  def json
    JSON.parse(reponse.body)
  end
end