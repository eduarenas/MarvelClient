Pod::Spec.new do |s|
  s.name             = "MarvelClient"
  s.version          = "0.1.0"
  s.summary          = "Swift client to access Marvel Comic's public API."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

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

  s.ios.deployment_target = '8.0'

  s.source_files = 'MarvelClient/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
