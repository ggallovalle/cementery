class Person:
    def __init__(self, id_card: str = None):
        self.id_card = id_card


    def __bool__(self):
        if self.id_card:
            return True
        return False
