module GoogleManager

  class << self
    def google_key
      ENV['GOOGLE_KEY']
    end

    def google_secret
      ENV['GOOGLE_SECRET']
    end

    def bucket_name
      ENV['CATURDAY_GOOGLE_BUCKET']
    end

    def google_connection
      @connection ||= Fog::Storage.new({
        :provider                 => 'Google',
        :google_storage_access_key_id        => google_key,
        :google_storage_secret_access_key    => google_secret
      })
    end

    def google_bucket
      @google_bucket ||= google_connection.directories.get(bucket_name)
    end
  end
end
