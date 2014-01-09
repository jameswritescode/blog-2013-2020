require 'securerandom'

def find_secure_token
  token_file = Rails.root.join('.secret')

  if File.exist?(token_file)
    File.read(token_file).chomp
  else
    token = SecureRandom.hex(64)

    File.write(token_file, token)

    token
  end
end

Blog::Application.config.secret_key_base = find_secure_token
