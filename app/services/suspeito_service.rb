class SuspeitoService
    class << self
        def is_suspeito(cep, ip)
            res = RestClient.get 'https://viacep.com.br/ws/'+cep+'/json/'
            result = JSON.parse(res)

            begin 
            res2 = RestClient.get 'https://api.ipgeolocation.io/ipgeo?apiKey=15627a30bd9446fc846ff54119516ecb&ip='+ip
            rescue
            res2 = RestClient.get 'https://api.ipgeolocation.io/ipgeo?apiKey=15627a30bd9446fc846ff54119516ecb'
            end  
            result2 = JSON.parse(res2)

            localidade_igual = I18n.transliterate(result["localidade"]).eql? result2["city"]
            !localidade_igual
        end
    end
  end