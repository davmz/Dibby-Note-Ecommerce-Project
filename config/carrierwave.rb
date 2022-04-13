CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider                           => 'Google',
      :google_storage_access_key_id       => 'GOOGXP2TTYLUNFNWHTZVPY2C',
      :google_storage_secret_access_key   => 'VAljksYGRvZ/01jxSjmcUE2qpaY0ARenvUx4dnX3'
  }
  config.fog_directory = 'dibby-note-application'
  end