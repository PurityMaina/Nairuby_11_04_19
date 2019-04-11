class SlackWorker
  include Sidekiq::Worker
  require 'rest-client'

  def perform(message, username="Nairuby Demo", emoji=":money_with_wings:")
    payload = {
      channel: ENV['DEFAULT_SLACK_NOTIFICATION_CHANNEL'],
      username: username,
      text: message,
      icon_emoji: emoji
    }.to_json
    puts payload
    puts ENV['SLACK_WEBHOOK_URL']
    if Rails.env.development?
      RestClient.post ENV['SLACK_WEBHOOK_URL'], payload
    end
  end
end
