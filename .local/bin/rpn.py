#!/usr/bin/env python

import os

# setup get character functions
if os.name == 'nt':
    import msvcrt
    def getch():
        return msvcrt.getch().decode()
else:
    import sys, tty, termios
    fd = sys.stdin.fileno()
    old_settings = termios.tcgetattr(fd)
    def getch():
        try:
            tty.setraw(sys.stdin.fileno())
            ch = sys.stdin.read(1)
        finally:
            termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
        return ch

def main():
    stack = []

    while True:
        
        # get input from user
        expression = ''
        while True:
            ch = getch()
        
            if ch == '\r':
                break
            elif ch == '+':
                break
            elif ch == '-':
                break
            elif ch == '*':
                break
            elif ch == '/':
                break
            else:
                expression += ch
            print '\r' + expression,
        print

        # if entry is command then perform command
        if expression in ['quit', 'q', 'exit']:
            exit()
        elif expression in ['clear', 'empty']:
            stack = []
            continue

        # if entry is empty then add last entry to the stack again
        elif ch == '\r' and len(expression) == 0:
            stack.append(stack[-1])

        # if entry is a number add it to the stack
        if is_number(expression):
            stack.append(float(expression))
            expression = ''
            
        # if entry is an operator perform operation
        if ch == '+' or ch == '-' or ch == '*' or ch == '/':
            if len(stack) > 1:
                stack = perform_operation(ch, stack)
            else:
                print 'stack = ', stack
                print 'stack needs at least 2 values to perform operation'
            
        print stack
            
def perform_operation(op, stack):
    a = stack.pop()
    b = stack.pop()
    if op == '+':
        stack.append(b + a)
    if op == '-':
        stack.append(b - a)
    if op == '*':
        stack.append(b*a)
    if op == '/':
        stack.append(b/a)
    return stack
    

    
def is_number(teststring):
    if is_int(teststring) or is_float(teststring):
        return True
    else:
        return False

def is_float(input):
    try:
        num = float(input)
    except ValueError:
        return False
    return True

def is_int(input):
    try:
        num = int(input)
    except ValueError:
        return False
    return True

if __name__ == '__main__':
    main()
