from robot.utils.asserts import assert_true
from robot.api.deco import keyword


def is_prime(n: int):
    if n < 2:
        return False
    for i in range(2, int(n**0.5) + 1):
        if n % i == 0:
            return False
    return True


@keyword(name="Should Be Prime")
def assert_prime(n: int):
    assert_true(is_prime(n), f"{n} is not a prime number")
