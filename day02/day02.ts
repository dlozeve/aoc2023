// const input: string = await Bun.file("input").text();
import { readFileSync } from "node:fs";
const input: string = readFileSync("input", "utf8");

type Reveal = {
  red: number;
  green: number;
  blue: number;
};

type Game = { id: number; reveals: Reveal[] };

function parse_reveal(reveal_str: string): Reveal {
  let r = { red: 0, green: 0, blue: 0 };
  reveal_str
    .split(", ")
    .map((s) => (r[s.split(" ")[1]] = Number(s.split(" ")[0])));
  return r;
}

function parse_game(game_str: string): Game {
  let [game, reveals] = game_str.split(": ");
  let game_id = Number(game.split(" ")[1]);
  let r = reveals.split("; ").map(parse_reveal);
  return { id: game_id, reveals: r };
}

let games = input
  .split("\n")
  .filter((s) => s.length > 0)
  .map(parse_game);

let part1 = (games: Game[]): number =>
  games
    .filter((g) =>
      g.reveals.every((r) => r.red <= 12 && r.green <= 13 && r.blue <= 14),
    )
    .map((g) => g.id)
    .reduce((a, b) => a + b);

let part2 = (games: Game[]): number =>
  games
    .map((g) =>
      g.reveals.reduce(
        (o, r) => ({
          red: Math.max(o.red, r.red),
          green: Math.max(o.green, r.green),
          blue: Math.max(o.blue, r.blue),
        }),
        { red: 0, green: 0, blue: 0 },
      ),
    )
    .map((r) => r.red * r.green * r.blue)
    .reduce((a, b) => a + b);

console.log(part1(games));
console.log(part2(games));
