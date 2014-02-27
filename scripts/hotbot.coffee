drinkCount = 0
participants = {}

module.exports = (robot) ->
  robot.hear /i want tea/i, (msg) ->
    drinkCount += 1
    participants[msg.user] = 'Tea'
    msg.send "OH YOU WANT TEA?"
    msg.send drinkCount

  robot.hear /i want coffee/i, (msg) ->
    drinkCount += 1
    participants[msg.user] = 'Coffee'
    msg.send "OH YOU WANT COFFEE?"
    msg.send drinkCount

  if drinkCount is 5
    msg.send "WHOA THERE!"
    msg.send "Time for someone to make HOT DRINKS!"
    winner = Object.keys(participants)[Math.floor(Math.random() * 5)]
    msg.send "AND THE WINNER IS: " + winner + "!"
    for index of participants
      msg.send index + ": " + participants[index]
    drinkCount = 0
    participants = {}
