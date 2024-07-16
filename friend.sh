#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

STAR="🌟"
HEART="❤️"
WAVING_HAND="👋"
GIFT="🎁"
CONFETTI="🎉"

ASCII_ART="
${MAGENTA}

··································································
:                                                                :
:  #     #                                                       :
:  #     #   ##   #####  #####  #   #                            :
:  #     #  #  #  #    # #    #  # #                             :
:  ####### #    # #    # #    #   #                              :
:  #     # ###### #####  #####    #                              :
:  #     # #    # #      #        #                              :
:  #     # #    # #      #        #                              :
:                                                                :
:  #######                                                       :
:  #       #####  # ###### #    # #####   ####  #    # # #####   :
:  #       #    # # #      ##   # #    # #      #    # # #    #  :
:  #####   #    # # #####  # #  # #    #  ####  ###### # #    #  :
:  #       #####  # #      #  # # #    #      # #    # # #####   :
:  #       #   #  # #      #   ## #    # #    # #    # # #       :
:  #       #    # # ###### #    # #####   ####  #    # # #       :
:                                                                :
:  ######                                                        :
:  #     #   ##   #   #                                          :
:  #     #  #  #   # #                                           :
:  #     # #    #   #                                            :
:  #     # ######   #                                            :
:  #     # #    #   #                                            :
:  ######  #    #   #                                            :
:                                                                :
··································································
                                  
${NC}
"

QUOTES=(
    "True friends are those who lift you up when you have forgotten how to fly ${HEART}"
    "Friendship is like a rainbow between two hearts, shining with love and joy ${WAVING_HAND}"
    "A friend is someone who sees the magic in you, even when you can't see it yourself ${STAR}"
    "In the garden of life, friends are the flowers that make it bloom with joy ${GIFT}"
    "Friendship is a treasure chest filled with memories and laughter ${HEART}"
    "Friendship is the compass that guides us through life's storm ${STAR}"
    "Friends are the greatest gifts of life. You will always be a significant part of my life ${HEART}"
    "The love of friends makes life's toughest moments more bearable ${GIFT}"
    "Friendship is like a star We truly realize how bright and valuable it is during the darkest times ${STAR}"
)

print_usage() {
    echo -e "${CYAN}Usage: $0 [options]${NC}"
    echo -e "${CYAN}Options:${NC}"
    echo -e "  ${YELLOW}-m, --message${NC}    Custom message to display ${MAGENTA}(e.g., \"$0 -m 'Your Custom Message Here'\"${NC})"
    echo -e "  ${YELLOW}-n, --name${NC}       Your name for a personalized greeting ${YELLOW}(${HEART} for a special touch${NC})"
    echo -e "  ${YELLOW}-q, --quote${NC}      Display a random Friendship Day quote ${YELLOW}(${HEART} for inspiration${NC})"
    echo -e "  ${YELLOW}-a, --art${NC}        Display ASCII art ${YELLOW}(${GIFT} for a unique touch${NC})"
    echo -e "  ${YELLOW}-h, --help${NC}       Show this help message ${YELLOW}(${HEART} for more info${NC})"
}

slugify() {
    local input="$1"
    echo "$input" | \
    tr '[:upper:]' '[:lower:]' | \
    sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' | \
    sed -e 's/[[:space:]]\+/ /g' | \
    sed -e 's/[^a-z0-9]/-/g' | \
    sed -e 's/-\+/-/g' -e 's/^-//;s/-$//'
}

clean_special_characters() {
    local input="$1"
    echo "$input" | sed 's/[^a-zA-Z0-9 ]//g'
}

generate_personalized_greeting() {
    local name="$1"
    local cleaned_name
    cleaned_name=$(clean_special_characters "$name")
    local slugified_name
    slugified_name=$(slugify "$cleaned_name")
    local url="https://searchquotes.quest/wish/web?name=$slugified_name"
    
    echo -e "\n${GREEN}${WAVING_HAND} Happy Friendship Day, ${CYAN}${cleaned_name}${GREEN} ${STAR}${NC}\n"
    echo -e "${CYAN}✔ Your personalized greeting URL: ${YELLOW}${url}${NC}\n"
}

print_greeting() {
    local message="$1"
    local name="$2"

    if [ -z "$message" ]; then
        if [ -n "$name" ]; then
            generate_personalized_greeting "$name"
        else
            message="Happy Friendship Day ${STAR}"
            echo -e "\n${GREEN}${WAVING_HAND} $message ${GREEN}${STAR}${NC}\n"
        fi
    else
        echo -e "\n${GREEN}${WAVING_HAND} $message ${GREEN}${STAR}${NC}\n"
    fi
}

print_random_quote() {
    local random_index
    random_index=$(( RANDOM % ${#QUOTES[@]} ))
    echo -e "\n${CYAN}✅ Here's a special quote for you:\n${NC}\n${CYAN}${QUOTES[$random_index]}${NC}\n"
}

print_ascii_art() {
    echo -e "\n${MAGENTA}✅ Happy Friendship Day ASCII art:${NC}\n${MAGENTA}$ASCII_ART${NC}\n"
}

handle_unknown_option() {
    echo -e "${RED}Error: Unknown option: $1${NC}"
    print_usage
    exit 1
}

parse_options() {
    local custom_message=""
    local name=""
    local display_quote=false
    local display_art=false

    while [[ $# -gt 0 ]]; do
        case $1 in
            -m|--message)
                shift
                if [[ -z "$1" || "$1" == -* ]]; then
                    echo -e "${RED}Error: Missing value for -m/--message${NC}"
                    print_usage
                    exit 1
                fi
                custom_message="$1"
                shift
                ;;
            -n|--name)
                shift
                if [[ -z "$1" || "$1" == -* ]]; then
                    echo -e "${RED}Error: Missing value for -n/--name${NC}"
                    print_usage
                    exit 1
                fi
                name="$1"
                shift
                ;;
            -q|--quote)
                display_quote=true
                shift
                ;;
            -a|--art)
                display_art=true
                shift
                ;;
            -h|--help)
                print_usage
                exit 0
                ;;
            *)
                handle_unknown_option "$1"
                ;;
        esac
    done

    print_greeting "$custom_message" "$name"
    if $display_quote; then
        print_random_quote
    fi
    if $display_art; then
        print_ascii_art
    fi
}

if [[ $# -eq 0 ]]; then
    echo -e "${RED}Error: No options provided${NC}"
    print_usage
    exit 1
fi

parse_options "$@"
