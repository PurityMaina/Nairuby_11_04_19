class SendSlackMessageWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
     message = "Attempting to notify a channel about something."
      puts message
      puts "------------------------------------------"
     SlackWorker.perform_async(message)
  end
end
