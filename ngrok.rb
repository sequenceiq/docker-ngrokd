class Ngrok < Cask
  url 'https://s3-eu-west-1.amazonaws.com/sequenceiq/ngrok_darwin'
  homepage 'https://ngrok.com/'
  version '1.7'
  sha256 '97a6f8cbdf3a91cd8393fc7520fb765764ead16b6ae508299c83a1aa80df29f5'
  binary 'ngrok_darwin', :target => '/usr/local/bin/ngrok'
  container_type 'naked'
  after_install do
    system "chmod", "755", "#{destination_path}/ngrok_darwin"
  end
end
