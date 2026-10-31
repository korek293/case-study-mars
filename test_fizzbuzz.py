import pytest

from fizzbuzz import evaluate_number, printing_numbers_from_1_to_100


@pytest.mark.parametrize("number, expected", [(1, "1"), (2, "2"), (4, "4"), (98, "98")])
def test_regular_numbers_return_string(number: int, expected: str) -> None:
    assert evaluate_number(number) == expected


@pytest.mark.parametrize("number", [3, 6, 9, 99])
def test_multiples_of_three_return_fizz(number: int) -> None:
    assert evaluate_number(number) == "Fizz"


@pytest.mark.parametrize("number", [5, 10, 20, 100])
def test_multiples_of_five_return_buzz(number: int) -> None:
    assert evaluate_number(number) == "Buzz"


@pytest.mark.parametrize("number", [15, 30, 45, 90])
def test_multiples_of_fifteen_return_fizzbuzz(number: int) -> None:
    assert evaluate_number(number) == "FizzBuzz"


def test_printing_numbers_from_1_to_100(capsys: pytest.CaptureFixture[str]) -> None:
    printing_numbers_from_1_to_100()
    captured = capsys.readouterr()
    lines = captured.out.strip().splitlines()

    assert len(lines) == 100
    assert lines[0] == "1"
    assert lines[2] == "Fizz"
    assert lines[4] == "Buzz"
    assert lines[14] == "FizzBuzz"
    assert lines[99] == "Buzz"