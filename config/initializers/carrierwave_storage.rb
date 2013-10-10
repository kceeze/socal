CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAINN3RLX5OVI4VX2Q',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'us-west-2'               # optional, defaults to 'us-east-1'           # optional, defaults to nil
  }
  config.fog_directory  = 'socalmusic'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end