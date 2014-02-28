drinkCount = 0
maxVotes = 5
participants = []
resetTimer = null

fiveDrinks = (msg) ->
  winner = participants[Math.floor(Math.random() * 5)]
  msg.send "HOT DRINKS TIME! The winner is: #{winner}! Good luck out there."
  clearTimeout(resetTimer)
  drinkCount = 0
  participants = []
  return

module.exports = (robot) ->
  robot.hear /i want :?(tea|coffee):?/i, (msg) ->
    drink = msg.match[1]
    drinkCount += 1
    participants.push(msg.message.user.name)
    if drinkCount is maxVotes
      fiveDrinks msg
    else
      msg.send "One vote for #{drink} from #{msg.message.user.name} - that makes #{drinkCount}..."
      clearTimeout(resetTimer)
      setTimeout () ->
        drinkCount = 0
      , 300000
