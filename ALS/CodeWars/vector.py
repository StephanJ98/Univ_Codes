class Vector:
    def __init__(self, *args):
        if len(args) == 1:
            self._values = [x for x in args[0]]
        else:
            self._values = [x for x in args]

        if len(self._values) >= 3:
            self._x = self._values[0]
            self._y = self._values[1]
            self._z = self._values[2]
        else:
            self._x = 0
            self._y = 0
            self._z = 0

        self._magnitude = (self.x ** 2 + self.y ** 2 + self.z ** 2) ** 0.5

    @property
    def x(self):
        return self._x

    @property
    def y(self):
        return self._y

    @property
    def z(self):
        return self._z

    @property
    def magnitude(self):
        return self._magnitude

    @property
    def values(self):
        return self._values

    def to_tuple(self):
        return tuple(self._values)

    def cross(self, other):
        c = [self.y * other.z - self.z * other.y,
             self.z * other.x - self.x * other.z,
             self.x * other.y - self.y * other.x]
        return Vector(c)

    def length(self):
        return len(self.values)

    def get(self, index):
        return self.values[index]

    def dot(self, other):
        assert (self.length() == other.length())
        total = 0
        for i in range(0, self.length()):
            total += (self.get(i) * other.get(i))
        return total

    def __eq__(self, other):
        return self.values == other.values

    def __add__(self, other):
        return Vector(self.x + other.x, self.y + other.y, self.z + other.z)

    def __sub__(self, other):
        return Vector(self.x - other.x, self.y - other.y, self.z - other.z)

    def __str__(self):
        return f"<{self.x}, {self.y}, {self.z}>"
