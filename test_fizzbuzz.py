#!/usr/bin/env python3
"""Unit tests for the FizzBuzz module."""

import io
import unittest
from contextlib import redirect_stdout

from fizzbuzz import evaluate_number, generate_sequence, main


class TestFizzBuzz(unittest.TestCase):
    """Test suite verifying FizzBuzz acceptance criteria and edge cases."""

    def test_regular_numbers_return_string_number(self) -> None:
        for num, expected in [(1, "1"), (2, "2"), (4, "4"), (7, "7"), (98, "98")]:
            with self.subTest(num=num):
                self.assertEqual(evaluate_number(num), expected)

    def test_multiples_of_three_return_fizz(self) -> None:
        for num in [3, 6, 9, 12, 33, 99]:
            with self.subTest(num=num):
                self.assertEqual(evaluate_number(num), "Fizz")

    def test_multiples_of_five_return_buzz(self) -> None:
        for num in [5, 10, 20, 25, 50, 95, 100]:
            with self.subTest(num=num):
                self.assertEqual(evaluate_number(num), "Buzz")

    def test_multiples_of_three_and_five_return_fizzbuzz(self) -> None:
        for num in [15, 30, 45, 60, 75, 90]:
            with self.subTest(num=num):
                self.assertEqual(evaluate_number(num), "FizzBuzz")

    def test_generate_sequence_length_and_boundaries(self) -> None:
        sequence = generate_sequence(1, 100)
        self.assertEqual(len(sequence), 100)
        self.assertEqual(sequence[0], "1")
        self.assertEqual(sequence[2], "Fizz")
        self.assertEqual(sequence[4], "Buzz")
        self.assertEqual(sequence[14], "FizzBuzz")
        self.assertEqual(sequence[99], "Buzz")

    def test_main_prints_100_lines(self) -> None:
        buffer = io.StringIO()
        with redirect_stdout(buffer):
            main()
        lines = buffer.getvalue().strip().splitlines()
        self.assertEqual(len(lines), 100)
        self.assertEqual(lines[0], "1")
        self.assertEqual(lines[14], "FizzBuzz")
        self.assertEqual(lines[99], "Buzz")

    def test_invalid_inputs_raise_errors(self) -> None:
        with self.assertRaises(ValueError):
            evaluate_number(0)
        with self.assertRaises(ValueError):
            evaluate_number(-3)
        with self.assertRaises(TypeError):
            evaluate_number("15")  # type: ignore[arg-type]
        with self.assertRaises(TypeError):
            evaluate_number(True)  # type: ignore[arg-type]
        with self.assertRaises(ValueError):
            generate_sequence(10, 1)


if __name__ == "__main__":
    unittest.main(verbosity=2)

