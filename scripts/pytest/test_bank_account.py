import pytest


class BankAccount:
    def __init__(self, owner, balance=0):
        self.owner = owner
        self.balance = balance

    def deposit(self, amount):
        if amount <= 0:
            raise ValueError("Deposit must be positive")
        self.balance += amount

    def withdraw(self, amount):
        if amount > self.balance:
            raise ValueError("Insufficient funds")
        self.balance -= amount

    def __str__(self):
        return f"{self.owner}'s account balance: £{self.balance}"


def test_deposit_increases_balance():
    account = BankAccount("Jane", 100)
    account.deposit(50)
    assert account.balance == 150


def test_withdraw_decreases_balance():
    account = BankAccount("Jane", 200)
    account.withdraw(80)
    assert account.balance == 120


def test_withdraw_too_much_raises_error():
    account = BankAccount("Jane", 50)
    with pytest.raises(ValueError, match="Insufficient funds"):
        account.withdraw(100)


def test_negative_deposit_raises_error():
    account = BankAccount("Jane", 100)
    with pytest.raises(ValueError, match="Deposit must be positive"):
        account.deposit(-20)


@pytest.mark.parametrize("deposit,expected", [(10, 110), (50, 150), (0, 100)])
def test_multiple_deposits(deposit, expected):
    account = BankAccount("Jane", 100)
    if deposit == 0:
        with pytest.raises(ValueError):
            account.deposit(deposit)
    else:
        account.deposit(deposit)
        assert account.balance == expected
