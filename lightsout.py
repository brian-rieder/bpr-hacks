#!/usr/bin/env python3

import random

dimension = 5

def start_game(dimension):
    print('''##############################################################################################
################################## Welcome to LightsOut! #####################################
#                                                                                            #
# To play, simply input chess coordinates to toggle the lights.                              #
# When you select a light, that light and all of the lights around it (N/S/E/W) will toggle. #
# You win when all of the lights are off! (i.e., all zero)                                   #
#                                                                                            #
# Chess Coordinates:                                                                         #
# a5 b5 c5 d5 e5                                                                             #
# a4 b4 c4 d4 e4                                                                             #
# a3 b3 c3 d3 e3                                                                             #
# a2 b2 c2 d2 b2                                                                             #
# a1 b1 c1 d1 e1                                                                             #
#                                                                                            #
# Good luck!                                                                                 #
#                                                                                            #
##############################################################################################
''')
    board = [[int(random.randint(0,1)) for _ in range(dimension)] for _ in range(dimension)]
    return board

def print_board(board):
    print()
    for row in board:
        print(' '.join([str(x) for x in row]))
    print()

def check_complete(board):
    return(sum([item for sublist in board for item in sublist]) == 0)

def get_user_input():
    coordinate_str = input('Enter a chess coordinate: ')
    try:
        if len(coordinate_str) != 2:
            raise ValueError
        file = str(coordinate_str[0])
        if not ('a' <= file <= 'e'):
            raise ValueError
        rank = int(coordinate_str[1])
        if not (1 <= rank <= 5):
            raise ValueError
        return [file, rank]
    except:
        print('Invalid coordinate, must be a valid a1-e5 coordinate.')
        return get_user_input()

def make_move(board, move, dimension=5):
    file, rank = move
    file = ord(file) - ord('a')
    rank = (dimension-1) - (rank-1)
    board[rank][file] ^= 1
    if rank > 0:
        board[rank-1][file] ^= 1
    if rank < (dimension-1):
        board[rank+1][file] ^= 1
    if file > 0:
        board[rank][file-1] ^= 1
    if file < (dimension-1):
        board[rank][file+1] ^= 1


if __name__ == '__main__':
    board = start_game(dimension)
    print_board(board)
    while not check_complete(board):
        move = get_user_input()
        print(move)
        make_move(board, move)
        print_board(board)
    print('You win!!!!!!!!!!')
    
