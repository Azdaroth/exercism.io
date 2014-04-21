Bst = require './example'

recordAllData = (bst) ->
  out = []
  bst.each((data) -> out.push(data))
  out

describe 'BinarySearchTree', ->

  it 'data is retained', ->
    expect(4).toEqual new Bst(4).data

  xit 'inserting less', ->
    four = new Bst(4)
    four.insert(2)

    expect(4).toEqual four.data
    expect(2).toEqual four.left.data

  it 'inserting same', ->
    four = new Bst(4)
    four.insert(4)

    expect(4).toEqual four.data
    expect(4).toEqual four.left.data

  it 'inserting right', ->
    four = new Bst(4)
    four.insert(5)

    expect(4).toEqual four.data
    expect(5).toEqual four.right.data

  it 'complex tree', ->
    four = new Bst(4)
    four.insert(2)
    four.insert(6)
    four.insert(1)
    four.insert(3)
    four.insert(7)
    four.insert(5)

    expect(4).toEqual four.data
    expect(2).toEqual four.left.data
    expect(1).toEqual four.left.left.data
    expect(3).toEqual four.left.right.data
    expect(6).toEqual four.right.data
    expect(5).toEqual four.right.left.data
    expect(7).toEqual four.right.right.data

  it 'iterating one element', ->
    expect([4]).toEqual recordAllData(new Bst(4))

  it 'iterating over smaller element', ->
    four = new Bst(4)
    four.insert(2)

    expect([2, 4]).toEqual recordAllData(four)

  it 'iterating over larger element', ->
    four = new Bst(4)
    four.insert(5)

    expect([4, 5]).toEqual recordAllData(four)

  it 'iterating over complex tree', ->
    four = new Bst(4)
    four.insert(2)
    four.insert(1)
    four.insert(3)
    four.insert(6)
    four.insert(7)
    four.insert(5)

    expect([1, 2, 3, 4, 5, 6, 7]).toEqual recordAllData(four)

