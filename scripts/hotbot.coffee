drinkCount = 0
participants = []

fiveDrinks = (msg) ->
  winner = participants[Math.floor(Math.random() * 5)]
  msg.send participants.toString()
  msg.send "HOT DRINKS TIME! The winner is: " + winner + "!"
  drinkCount = 0
  participants = []
  return

module.exports = (robot) ->
  robot.hear /i want tea/i, (msg) ->
    drinkCount += 1
    participants.push(username)
    if drinkCount is 5
      fiveDrinks msg
    else
      msg.send "One vote for tea from " + username + " - that makes " + drinkCount + "..."

  robot.hear /i want coffee/i, (msg) ->
    drinkCount += 1
    participants.push(username)
    if drinkCount is 5
      fiveDrinks msg
    else
      msg.send "One vote for coffee - that makes " + drinkCount + "..."


# for index of participants
#   msg.send index + ": " + participants[index]
