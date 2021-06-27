

class ChoicesDTO:
    def __init__(self, keuze, votes, percentage):
        self.keuze = keuze
        self.votes = votes
        self.percentage = round(percentage * 100, 2)