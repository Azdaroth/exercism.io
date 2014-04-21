class Queens 

  constructor: (options) ->
    options = options || {}
    @white = options.white || [0,3] 
    @black = options.black || [7,3]
    @board = @_drawBoard()
    @_validatePositions()

  toString: ->
    currentBoard = @board
    currentBoard.map (row, idx) ->
      formattedRow = row.join(" ")
      currentBoard[idx] = formattedRow
    currentBoard.join("\n")

  canAttack: ->
    @_sameRow() or @_sameColumn() or @_onDiagonal()

  _drawDefaultBoard: ->
    board = []
    range = [0..7]
    for row in range
      board.push([])
      for column in range
        board[row].push("O")
    board

  _drawBoard: ->
    currentBoard = @_drawDefaultBoard()
    currentBoard[@white[1]][@white[0]] = "W"
    currentBoard[@black[1]][@black[0]] = "B"
    currentBoard

  _validatePositions: ->
    throw "Queens cannot share the same space" if @_whiteBlackSamePosition()  

  _whiteBlackSamePosition: ->
    @white.join("") is @black.join("")

  _sameRow: ->
    @white[1] is @black[1]

  _sameColumn: ->
    @white[0] is @black[0]

  _onDiagonal: ->
    Math.abs(@white[1] - @black[1]) is Math.abs(@white[0] - @black[0])
    
  
module.exports = Queens