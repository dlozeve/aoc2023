with open("input") as fd:
    lines = fd.readlines()

games = {}
for line in lines:
    line.split(":")
    game, reveals = line.split(":")
    game_id = int(game.split()[1])
    r = []
    for reveal in reveals.split(";"):
        d = {}
        for color in reveal.split(","):
            n, col = color.split()
            d[col] = int(n)
        r.append(d)
    games[game_id] = r


def check_game(reveals, thresh):
    for reveal in reveals:
        for color in ("red", "green", "blue"):
            if reveal.get(color, 0) > thresh[color]:
                return False
    return True

thresh = {"red": 12, "green": 13, "blue": 14}
r = 0
for game_id, reveals in games.items():
    if check_game(reveals, thresh):
        r += game_id
print(r)

def min_games(reveals):
    return {
        color: max(r.get(color, 0) for r in reveals)
        for color in ("red", "green", "blue")
    }

r = 0
for _, reveals in games.items():
    x, y, z = min_games(reveals).values()
    r += x * y * z
print(r)
