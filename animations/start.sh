#!/bin/bash

# Define the ASCII art
frames=(
    ""
    "H"
    "He"
    "Hel"
    "Hell"
    "Hello"
    "Hello,"
    "Hello, "
    "Hello, z"
    "Hello, z0"
    "Hello, z0d"
    "Hello, z0d1"
    "Hello, z0d1a"
    "Hello, z0d1ac"
    "Hello, z0d1ac!"
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

exec bash
