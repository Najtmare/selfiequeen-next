Devise.setup do |config|

  config.secret_key = 'b4e8ae1cc003b59e2fa3584a214457b1d0cb0aaa0e7521e582d9544f161beead996d8ab83714ba0998b913733794301e42fa935fd8c9ed56f320aeee80f16711'

  config.navigational_formats = ["/", :html, :json]
end