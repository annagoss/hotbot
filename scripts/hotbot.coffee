drinkCount = 0
participants = {}

fiveDrinks = (msg) ->
  drinkCount = 0
  msg.send "HOT DRINKS TIME! The winner is: " + msg.random Object.keys(participants) + "!"
  participants = {}
  return

module.exports = (robot) ->
  robot.hear /i want tea/i, (msg) ->
    drinkCount += 1
    participants[msg.user] = 'Tea'
    if drinkCount is 5
      fiveDrinks msg
    msg.send "One vote for tea - that makes " + drinkCount + "..."

  robot.hear /i want coffee/i, (msg) ->
    drinkCount += 1
    participants[msg.user] = 'Coffee'
    if drinkCount is 5
      fiveDrinks msg
    msg.send "One vote for coffee - that makes " + drinkCount + "..."

# for index of participants
#   msg.send index + ": " + participants[index]
