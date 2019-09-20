class SuspeitoService
  class << self
    def is_suspeito(cep, ip)
      !(get_localidade_cep(cep).eql? get_localidade_ip(ip))
    end

    def get_localidade_cep(cep)
      res = RestClient.get 'https://viacep.com.br/ws/' + cep + '/json/'
      result = JSON.parse(res)
      I18n.transliterate(result["localidade"])
    end

    def get_localidade_ip(ip)
      begin
        res = RestClient.get 'https://api.ipgeolocation.io/ipgeo?apiKey=15627a30bd9446fc846ff54119516ecb&ip=' + ip
      rescue
        res = RestClient.get 'https://api.ipgeolocation.io/ipgeo?apiKey=15627a30bd9446fc846ff54119516ecb'
      end
      result = JSON.parse(res)
      result["city"]
    end
  end
end