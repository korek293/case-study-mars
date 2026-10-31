#!/usr/bin/env python3
"""FizzBuzz implementation and CLI runner."""

from typing import List


def evaluate_number(n: int) -> str:
    """Return the FizzBuzz representation for a single positive integer.

    Rules:
    - Multiple of both 3 and 5 -> "FizzBuzz"
    - Multiple of 3 -> "Fizz"
    - Multiple of 5 -> "Buzz"
    - Otherwise -> string representation of the number
    """
    if not isinstance(n, int) or isinstance(n, bool):
        raise TypeError(f"Expected int, got {type(n).__name__}")
    if n < 1:
        raise ValueError(f"Number must be >= 1, got {n}")

    if n % 15 == 0:
        return "FizzBuzz"
    if n % 3 == 0:
        return "Fizz"
    if n % 5 == 0:
        return "Buzz"
    return str(n)


def generate_sequence(start: int = 1, end: int = 100) -> List[str]:
    """Generate the FizzBuzz sequence from start to end (inclusive)."""
    if start > end:
        raise ValueError(f"start ({start}) must be <= end ({end})")
    return [evaluate_number(n) for n in range(start, end + 1)]


def main() -> None:
    """Print the FizzBuzz sequence from 1 to 100."""
    for item in generate_sequence(1, 100):
        print(item)


if __name__ == "__main__":
    main()
