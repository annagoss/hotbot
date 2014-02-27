drinkCount = 0
participants = {}

module.exports = (robot) ->
  robot.hear /i want tea/i, (msg) ->
    msg.send "OH YOU WANT TEA?"
    drinkCount += 1
    participants[msg.user] = 'Tea'

  robot.hear /i want coffee/i, (msg) ->
    msg.send "OH YOU WANT COFFEE?"
    drinkCount += 1
    participants[msg.user] = 'Coffee'

  if drinkCount is 5
    msg.send "WHOA THERE!"
    msg.send "Time for someone to make HOT DRINKS!"
    winner = Object.keys(participants)[Math.floor(Math.random() * 5)]
    msg.send "AND THE WINNER IS: " + winner + "!"
    for index of participants
      msg.send index + ": " + participants[index]
    drinkCount = 0
    participants = {}
