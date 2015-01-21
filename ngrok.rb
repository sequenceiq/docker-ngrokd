cask :v1 => 'ngrok-cask' do
  version '1.7.2'
  sha256 '7ea73331ee2e2d54cb0ce298ae85996436beb743c5af05ef0528aab3f19da957'
  container :type => :naked

  url 'https://s3-eu-west-1.amazonaws.com/sequenceiq/ngrok_darwin'
  name 'Ngrok'
  homepage 'https://ngrok.com/'

  binary 'ngrok_darwin', :target => '/usr/local/bin/ngrok'

  postflight do
    system "chmod", "755", "#{staged_path}/ngrok_darwin"
  end
end
