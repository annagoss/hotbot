drinkCount = 0
maxVotes = 5
participants = []

fiveDrinks = (msg) ->
  winner = participants[Math.floor(Math.random() * 5)]
  msg.send "HOT DRINKS TIME! The winner is: #{winner}! Good luck out there."
  drinkCount = 0
  participants = []
  return

waitForInput = () ->
  drinkCount = 0
setTimeout(waitForInput, 600000)

module.exports = (robot) ->
  robot.hear /i want :?(tea|coffee):?/i, (msg) ->
    window.clearTimeout waitForInput
    drink = msg.match[1]
    drinkCount += 1
    participants.push(msg.message.user.name)
    if drinkCount is maxVotes
      fiveDrinks msg
    else
      waitForInput
      msg.send "One vote for #{drink} from #{msg.message.user.name} - that makes #{drinkCount}..."
