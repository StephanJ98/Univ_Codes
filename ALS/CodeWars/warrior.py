class Warrior:
    _RANKS = ("Pushover", "Novice", "Fighter", "Warrior", "Veteran", "Sage", "Elite", "Conqueror", "Champion", "Master", "Greatest")
    _MESSAGE = ("You've been defeated", "Easy fight", "A good fight", "An intense fight")
    _INVALID_BATTLE = "Invalid level"
    _INVALID_TRAINING = "Not strong enough"

    def __init__(self):
        self._experience = 100
        self._achievements = []

    @property
    def experience(self):
        return self._experience if self._experience <= 10000 else 10000

    @property
    def level(self):
        return self.experience // 100

    @property
    def rank(self):
        return Warrior._RANKS[self.level // 10]

    @property
    def achievements(self):
        return self._achievements

    def battle(self, enemy_level):
        result = -1
        diff = self.level - enemy_level
        if enemy_level not in range(1,101):
            return Warrior._INVALID_BATTLE
        if self.level // 10 < enemy_level // 10 and diff <= -5:
            result = 0
        elif diff >= 2:
            result = 1
        elif diff >= 0:
            result = 2
        elif diff < 0:  
            result = 3
        if result > 0:
            self.update_exp(diff)
        return self._MESSAGE[result]

    def update_exp(self, diff):
        if diff == 0:
            self._experience += 10
        elif diff == 1:
            self._experience += 5
        elif diff >= 2:
            self._experience += 0
        else:
            self._experience += 20 * diff * diff

    def training(self, args):
        if self.level >= args[2]:
            self._achievements.append(args[0])
            self._experience += args[1]
            return args[0]
        else:
            return Warrior._INVALID_TRAINING