class SampleJob < ApplicationJob
  queue_as :default

  def perform(text)
    path = File.expand_path('log/sample.log', Rails.root)
    File.open(path, 'a') do |f|
      f.puts "Sample #{text}!"
    end
  end
end
