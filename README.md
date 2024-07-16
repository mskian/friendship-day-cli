# Friendship Day CLI

![build-test](https://github.com/mskian/friendship-day-cli/workflows/build-test/badge.svg)  ![npm](https://github.com/mskian/friendship-day-cli/workflows/npm/badge.svg)  

Frnd - Happy Friendship Day CLI : ASCII Text Art Greeting Wishes.  

> "frnd" > friend.

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

- Link and Test the CLI Locally

```sh
npm link or pnpm link --global
```

- unlink CLI

```sh
npm rm --global frnd or pnpm uninstall --global frnd
```

- Access CLI Globally

```sh

frnd -h

```

- Access via `NPX`

```sh
npx frnd -h
```

- install via `NPM` and `PNPM`

```sh

## install via npm
npm install -g frnd

## Remove Package
npm uninstall -g frnd


## install via pnpm
pnpm install -g frnd

## update package
pnpm update -g frnd

## Remove Package
pnpm uninstall -g frnd

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
