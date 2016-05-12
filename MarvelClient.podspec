Pod::Spec.new do |s|
  s.name             = "MarvelClient"
  s.version          = "0.1.0"
  s.summary          = "Swift client to access Marvel Comic's public API."

  s.description      =   s.description      = <<-DESC
                          Swift client to access Marvel Comic's public API. This
                          API has strongly typed entities for the Marvel provided endpoints. You'll
                          need to get a key to use the API from the Marvel developer
                          portal (http://developer.marvel.com) to be able to access the API.
                       DESC

  s.homepage         = "https://github.com/eduarenas80/MarvelClient"
  s.license          = 'MIT'
  s.author           = { "Eduardo Arenas" => "eapdev@gmail.com" }
  s.source           = { :git => "https://github.com/eduarenas80/MarvelClient.git", :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Source/**/*'

  s.dependency 'Alamofire', '~> 3.4'
  s.dependency 'MD5', '~> 0.1'
  s.dependency 'SwiftyJSON', '~> 2.3'
end
