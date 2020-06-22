class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  puts '=========================='
  puts '=========================='
  puts '=========================='
  puts 'IN APPLICATION MAILBOX ROUTER'
  puts '=========================='
  puts '=========================='
  puts '=========================='
  routing :all => :comments
end
