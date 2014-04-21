class Bst

  constructor: (number) ->
    @data = number
    @left = null
    @right = null

  insert: (number) ->
    newBst = new Bst(number)
    if number <= @data
      if not @left
        @left = newBst
      else
        @left.insert(number)
    else
      if not @right
        @right = newBst
      else
        @right.insert(number)

  each: (func) -> 
    allData = this._collectData(this, []).sort()
    for el in allData
      func(el)


  _collectData: (bst, currentData) ->
    
    currentData.push(bst.data)
    
    if bst.left
      this._collectData(bst.left, currentData)

    if bst.right
      this._collectData(bst.right, currentData)

    currentData
  

module.exports = Bst