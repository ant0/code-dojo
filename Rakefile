task default: %w[test]

task :run do
  ruby 'lib/turnstile.rb'
  ruby 'lib/safe.rb'
end

task :test do
  ruby 'test/turnstile_test.rb'
  ruby 'test/safe_test.rb'
end
