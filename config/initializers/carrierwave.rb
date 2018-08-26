CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:               'AWS',
    aws_access_key_id:     'AKIAJJWANRUNNWMKWC5A',
    aws_secret_access_key:  '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',
    region:                 'us-east-1'
  }

  if Rails.env.test? || Rails.env.cucumber?
    config.storage           = :file
    config.enable_processing = false
    config.root              = "#{Rails.root}/tmp"
  else
    config.storage           = :fog
  end

  config.cache_dir     = "#{Rails.root}/tmp/uploads"
  config.fog_directory = 'bookstore-rails'
end

module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end
  end
end
