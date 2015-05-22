class GcmSender
  def self.send_to_ids(ids, data, collapse_key)
    gcm = GCM.new(ENV['GCM_KEY'])
    # you can set option parameters in here
    #  - all options are pass to HTTParty method arguments
    #  - ref: https://github.com/jnunemaker/httparty/blob/master/lib/httparty.rb#L40-L68
    #  gcm = GCM.new("my_api_key", timeout: 3)

    options = {data: data, collapse_key: collapse_key}
    gcm.send(ids, options)
  end
end
