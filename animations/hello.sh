#!/bin/bash

# Define the ASCII art
frames=(
    ""
    "H"
    "He"
    "Hel"
    "Hell"
    "Hello"
    "Hello "
    "Hello W"
    "Hello Wo"
    "Hello Wor"
    "Hello Worl"
    "Hello World"
    "Hello World!"
    "Hello World! "
    "Hello World! T"
    "Hello World! Th"
    "Hello World! Thi"
    "Hello World! This"
    "Hello World! This "
    "Hello World! This i"
    "Hello World! This is"
    "Hello World! This is "
    "Hello World! This is z"
    "Hello World! This is Z0"
    "Hello World! This is Z0D"
    "Hello World! This is Z0D1"
    "Hello World! This is Z0D1A"
    "Hello World! This is Z0D1AC"
    "Hello World! This is Z0D1AC"
    "Hello World! This is Z0D1AC"
    "Hello World! This is Z0D1AC"
    "Hello World! This is Z0D1AC"
    "Hello World! This is Z0D1AC"
    "Hello World! This is Z0D1AC"
    "Hello World! This is Z0D1AC"
    "Hello World! This is Z0D1AC"
    "Hello World! This is Z0D1A"
    "Hello World! This is Z0D1"
    "Hello World! This is Z0D"
    "Hello World! This is Z0"
    "Hello World! This is Z"
    "Hello World! This is "
    "Hello World! This is"
    "Hello World! This i"
    "Hello World! This "
    "Hello World! This"
    "Hello World! Thi"
    "Hello World! Th"
    "Hello World! T"
    "Hello World! "
    "Hello World!"
    "Hello World"
    "Hello Worl"
    "Hello Wor"
    "Hello Wo"
    "Hello W"
    "Hello "
    "Hello"
    "Hell"
    "Hel"
    "He"
    "H"
    ""
)

color='\e[35m'  # This sets the color to purple

# Function to clear the terminal screen
clear_screen() {
    tput reset
}

# Function to display the frames with a specific color
display_frames() {
    for frame in "${frames[@]}"; do
        clear_screen
        echo -e "${color}${frame}\e[0m"
        sleep 0.06  # Adjust the delay for animation speed
    done
}

# Main program
display_frames
