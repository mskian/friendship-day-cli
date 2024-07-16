# Friendship Day CLI

![build-test](https://github.com/mskian/friendship-day-cli/workflows/build-test/badge.svg)  ![npm](https://github.com/mskian/friendship-day-cli/workflows/npm/badge.svg)  

frnds - Happy Friendship Day CLI : ASCII Text Art Greeting Wishes.  

> "frnds" : friends 🌟  

Command Line Interface tool for Happy Friendship Day Wishes : Happy Friendship Day Wishes in Terminal/CMD and Termux.  

## Built using

- Typescript
- ASCII Art
- ANSI Colors
- Emoji's
- Commander.js - <https://github.com/tj/commander.js>

## Setup

- Clone or Download Repo

```sh

git clone https://github.com/mskian/friendship-day-cli.git

## Open Project Folder
cd friendship-day-cli

## install packages
pnpm install

## build CLI
pnpm build

```

- Link and Test the CLI Locally

```sh
npm link or pnpm link --global
```

- unlink CLI

```sh
npm rm --global frnds or pnpm uninstall --global frnds
```

- Access CLI Globally

```sh

frnds -h

```

- Access via `NPX`

```sh
npx frnds -h
```

- install via `NPM` and `PNPM`

```sh

## install via npm
npm install -g frnds

## Remove Package
npm uninstall -g frnds


## install via pnpm
pnpm install -g frnds

## update package
pnpm update -g frnds

## Remove Package
pnpm uninstall -g frnds

```

## CLI Usage

```sh

# For Help Message
frnds -h

# Generate Greeting Web page
frnds -n "Hello Friend"

# Random Quotes
frnds -q

# ASCII Text Art
frnds -a

# Custom Message
frnds -m "Happy Friendship Day"

```

## Bash CLI

Happy Friendship Day Bash CLI

```sh

## Set Permission
chmod +x friend.sh

# RUN CLI
./friend.sh -h

```

## MISC (Development)

- Clear NPX and PNPM Cache

```sh
npx clear-npx-cache
pnpm store prune
```

## Contributing 🙌

Your PR's are Welcome  

## LICENSE

MIT
