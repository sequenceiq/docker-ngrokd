class Ngrok < Cask
  url 'https://s3-eu-west-1.amazonaws.com/sequenceiq/ngrok_darwin'
  homepage 'https://ngrok.com/'
  version '1.7.2'
  sha256 '7ea73331ee2e2d54cb0ce298ae85996436beb743c5af05ef0528aab3f19da957'
  binary 'ngrok_darwin', :target => '/usr/local/bin/ngrok'
  container_type 'naked'
  after_install do
    system "chmod", "755", "#{destination_path}/ngrok_darwin"
  end
end
