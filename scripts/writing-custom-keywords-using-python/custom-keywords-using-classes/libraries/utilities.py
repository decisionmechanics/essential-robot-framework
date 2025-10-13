import random
from typing import List
from robot.api import logger
from robot.api.deco import keyword, library
import robot.utils.asserts


@library
class Utilities:
    @keyword(name="Get Random Number")
    def get_random_integer(self, lower_limit: int = 0, upper_limit: int = 100):
        """Generate a random integer between two limits (defaults to 0-100)."""
        value: int = random.randint(lower_limit, upper_limit)
        logger.info(f"Random number is {value}")
        return value

    @keyword(name="Select Random Value From List")
    def select_random_value(self, values: List):
        """Select a random item from the list."""
        return random.choice(values)

    @keyword("Should Be Equal As Sets")
    def are_equal_as_sets(self, actual_list: List, expected_list: List):
        "Check that two lists are equal when order and duplicates are ignored."
        actual_set = set(actual_list)
        expected_set = set(expected_list)
        robot.utils.asserts.assert_equal(actual_set, expected_set)
