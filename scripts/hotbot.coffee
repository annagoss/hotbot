# Description:
#   Allows a group of users to randomly decide who makes tea and coffee.
#
# Dependencies:
#   "hubot-slack": "2.0.3"
#
# Configuration:
#   HEROKU_URL
#   HUBOT_SLACK_TOKEN
#   HUBOT_SLACK_TEAM
#   HUBOT_SLACK_BOTNAME
#
# Commands:
#   i want <tea/coffee> - Adds an order to the pile.
#
# Notes:
#   Once five orders have been entered, Hotbot decides who shall make the drinks.
#   Emoji is supported - try :tea: and :coffee:!
#   Deploy the bot to Heroku.
#
# Author:
#   calumgunn

maxVotes = 5
participants = []
orders = []
resetTimer = null
previousWinner = null
winner = null

pickAWinner = (prev) ->
  winner = participants[Math.floor(Math.random() * participants.length)]
  pickAWinner prev if prev == winner

fiveDrinks = (msg, drink) ->
  previousWinner = winner if winner?
  pickAWinner previousWinner
  orders.push("#{msg.message.user.name}: #{drink}\n")
  formatted_orders = (order + "\n" for order in orders)
  msg.send "One vote for #{drink} from @#{msg.message.user.name} - that makes #{participants.length}...
            \nHOT DRINKS TIME! The winner is: @#{winner}!
            \nORDERS:\n" + formatted_orders
  clearTimeout(resetTimer)
  participants = []
  orders = []
  return

module.exports = (robot) ->
  robot.hear /i want :?(tea|coffee):?/i, (msg) ->
    drink = msg.match[1]
    participants.push(msg.message.user.name)
    if participants.length is maxVotes
      fiveDrinks msg, drink
    else
      clearTimeout(resetTimer)
      resetTimer = setTimeout () ->
        msg.send "TOO BAD! Not enough votes. Stay strong though! RESETTING VOTES..."
        participants = []
      , 600000
      orders.push("#{msg.message.user.name}: #{drink}")
      msg.send "One vote for #{drink} from @#{msg.message.user.name} - that makes #{participants.length}..."

