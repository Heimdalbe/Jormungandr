from enum import Enum


class ActionType(Enum):
    SINGLE = 1
    BULK = 2


class EventAction(Enum):
    ADD = 1
    UPDATE = 2
    SHOW = 3
    DELETE = 4

    @classmethod
    def get_bulk_actions(cls):
        return list(map(str.capitalize, [cls.SHOW.name, cls.DELETE.name]))

    @classmethod
    def get_single_actions(cls):
        return list(map(str.capitalize, [cls.ADD.name, cls.UPDATE.name]))
