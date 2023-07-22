Rails.application.config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
    rewrite %r{.*}, proc { |rack_env|
      if rack_env['HTTP_HOST'] == 'showbizzy.org' || rack_env['HTTP_HOST'] == 'www.showbizzy.org'
        # Replace 'yourdomain.com' with your actual domain
        "https://www.showbizzy.org#{rack_env['REQUEST_URI']}"
      else
        rack_env['REQUEST_URI']
      end
    }
  end