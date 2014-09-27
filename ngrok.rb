class Ngrok < Cask
  url 'https://s3-eu-west-1.amazonaws.com/sequenceiq/ngrok_darwin'
  homepage 'https://ngrok.com/'
  version '1.7.1'
  sha256 'cb7f858534c8d519b57485300ccee4baba4872fa2775adc977e9c29927804863'
  binary 'ngrok_darwin', :target => '/usr/local/bin/ngrok'
  container_type 'naked'
  after_install do
    system "chmod", "755", "#{destination_path}/ngrok_darwin"
  end
end
