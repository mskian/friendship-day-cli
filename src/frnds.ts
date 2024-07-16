import { Command } from 'commander';

const ASCII_ART = `
\x1b[35m
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
\x1b[0m
`;

const QUOTES = [
  "True friends are those who lift you up when you have forgotten how to fly ❤️",
  "Friendship is like a rainbow between two hearts, shining with love and joy 👋",
  "A friend is someone who sees the magic in you, even when you can't see it yourself 🌟",
  "In the garden of life, friends are the flowers that make it bloom with joy 🎁",
  "Friendship is a treasure chest filled with memories and laughter ❤️",
  "Friendship is the compass that guides us through life's storm 🌟",
  "Friends are the greatest gifts of life. You will always be a significant part of my life ❤️",
  "The love of friends makes life's toughest moments more bearable 🎁",
  "Friendship is like a star We truly realize how bright and valuable it is during the darkest times 🌟",
];

function slugify(input: string): string {
  return input
    .trim()
    .toLowerCase()
    .replace(/\s+/g, '-')
    .replace(/[^a-z0-9-]/g, '')
    .replace(/--+/g, '-');
}

function cleanSpecialCharacters(input: string): string {
  const cleaned = input.replace(/[^a-zA-Z0-9 ]/g, '').trim();
  return cleaned.length > 36 ? cleaned.substring(0, 36) : cleaned;
}

function validateName(name: string): boolean {
  const trimmedName = name.trim();
  return /^[a-zA-Z0-9\s]+$/.test(trimmedName) && trimmedName.length >= 2 && trimmedName.length <= 36;
}

function generatePersonalizedGreeting(name: string) {
  if (!validateName(name)) {
    console.error('\x1b[31mError: Invalid name. Please use letters, numbers, and spaces only, and ensure the name is between 2 and 36 characters long.\n\x1b[0m');
    return;
  }

  const cleanedName = cleanSpecialCharacters(name);
  const slugifiedName = slugify(cleanedName);
  const url = `https://searchquotes.quest/wish/web?name=${slugifiedName}`;

  console.log(`
\x1b[32m👋 Happy Friendship Day, \x1b[36m${cleanedName}\x1b[32m 🌟\n\x1b[0m
\x1b[36m✔ Your personalized greeting URL: \x1b[33m${url}\x1b[0m
`);
}

function printGreeting(message: string | undefined, name: string | undefined) {
  if (message) {
    console.log(`
\x1b[32m👋 ${message} 🌟\x1b[0m
`);
  } else if (name) {
    generatePersonalizedGreeting(name);
  } else {
    console.log(`
\x1b[32m👋 Happy Friendship Day 🌟\x1b[0m
`);
  }
}

async function printRandomQuote() {
  const randomIndex = Math.floor(Math.random() * QUOTES.length);
  console.log(`
\x1b[36m✅ Here's a special quote for you:\n\x1b[0m
\x1b[36m${QUOTES[randomIndex]}\x1b[0m
`);
}

function printAsciiArt() {
  console.log(`
\x1b[35m✅ Happy Friendship Day ASCII art:\x1b[0m
${ASCII_ART}
`);
}

const program = new Command();

program
  .option('-m, --message <message>', 'Custom message to display')
  .option('-n, --name <name>', 'Your name for a personalized greeting')
  .option('-q, --quote', 'Display a random Friendship Day quote')
  .option('-a, --art', 'Display ASCII art')
  .action(async (options) => {
    try {
      printGreeting(options.message, options.name);
      if (options.quote) {
        await printRandomQuote();
      }
      if (options.art) {
        printAsciiArt();
      }
    } catch (error: unknown) {
      if (error instanceof Error) {
        console.error('\x1b[31mError:', error.message, '\x1b[0m');
      } else {
        console.error('\x1b[31mAn unknown error occurred.\x1b[0m');
      }
    }
  });

program.parse(process.argv);
