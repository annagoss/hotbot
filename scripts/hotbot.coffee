drinkCount = 0
participants = []

fiveDrinks = (msg) ->
  winner = participants[Math.floor(Math.random() * 5)]
  msg.send "HOT DRINKS TIME! The winner is: " + winner + "!"
  drinkCount = 0
  participants = []
  return

module.exports = (robot) ->
  robot.hear /i want tea/i, (msg) ->
    drinkCount += 1
    participants.push(msg.name)
    msg.send "One vote for tea - that makes " + drinkCount + "..."
    if drinkCount is 5
      fiveDrinks msg


  robot.hear /i want coffee/i, (msg) ->
    drinkCount += 1
    participants.push(msg.name)
    msg.send "One vote for coffee - that makes " + drinkCount + "..."
    if drinkCount is 5
      fiveDrinks msg


# for index of participants
#   msg.send index + ": " + participants[index]
