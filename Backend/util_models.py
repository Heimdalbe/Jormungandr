from enum import Enum


class ActionType(Enum):
    SINGLE = 1
    BULK = 2


class EventAction(Enum):
    ADD = 1
    UPDATE = 2
    SHOW = 3
    HIDE = 4
    DELETE = 5

    @classmethod
    def get_bulk_actions(cls):
        return {str.capitalize(cls.SHOW.name): cls.SHOW.value, str.capitalize(cls.HIDE.name): cls.HIDE.value,
                str.capitalize(cls.DELETE.name): cls.DELETE.value}

    @classmethod
    def get_single_actions(cls):
        return {str.capitalize(cls.ADD.name): cls.ADD.value, str.capitalize(cls.UPDATE.name): cls.UPDATE.value}
