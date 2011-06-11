# A sample Guardfile
# More info at https://github.com/guard/guard#readme

  guard 'bundler' do
    watch('Gemfile')
  end

  guard 'rspec', :cli => '--color --format doc', :notification => false do
    watch('spec/spec_helper.rb')                       { "spec" }
    watch(%r{^spec/.+_spec\.rb})
    watch(%r{^lib/machinist/(.+)\.rb})                           { |m| "spec/#{m[1]}_spec.rb" }
  end