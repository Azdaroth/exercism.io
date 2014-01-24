def on_square(square):
    return 2**(square-1)

def total_after(squares):
    return sum([on_square(square) for square in range(1, squares + 1)])