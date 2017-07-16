require 'twitter_ebooks'

class MyBot < Ebooks::Bot
  def configure
    self.consumer_key = 'cRiAA629PuYBSBsZo33jIAe3h' # Your app consumer key
    self.consumer_secret = 'L4AtPBKp253Gid10DmNWgbvc7THa6VthdvhXoWW9tRurKCuD1P' # Your app consumer secret

    # Users to block instead of interacting with
    self.blacklist = ['tnietzschequote']

    # Range in seconds to randomize delay when bot.delay is called
    self.delay_range = 1..6
  end

  def on_startup
    scheduler.every '3h' do
      # Tweet something every 3 hours
      model = Ebooks::Model.load("model/aaaaaanu.model")
      tweet(model.make_statement(140))
    end
  end

  def on_message(dm)
    reply(dm, "I am a bot. Please don't message me.")
  end

  def on_follow(user)
    # Follow a user back
    # follow(user.screen_name)
  end

  def on_mention(tweet)
    model = Ebooks::Model.load("model/aaaaaanu.model")
    reply(tweet, model.make_statement(140))
  end

  def on_timeline(tweet)
    # Reply to a tweet in the bot's timeline
    # reply(tweet, "nice tweet")
  end

  def on_favorite(user, tweet)
    # Follow user who just favorited bot's tweet
    # follow(user.screen_name)
  end

  def on_retweet(tweet)
    # Follow user who just retweeted bot's tweet
    # follow(tweet.user.screen_name)
  end
end

# Make a MyBot and attach it to an account
MyBot.new("AnuBot") do |bot|
  bot.access_token = "871204302299295744-jjHiY2nn4Qq7q4ZcH0Vl5BSCf2hjIw9" # Token connecting the app to this account
  bot.access_token_secret = "5GKSrdcQnd2SaVMi701MurHFTzGtgZl9PmzaY0gMx2b3O" # Secret connecting the app to this account
end
