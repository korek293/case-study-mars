def evaluate_number(n: int) -> str:
    """Evaluate number and return corresponding FizzBuzz result"""
    if n % 15 == 0:
        return "FizzBuzz"
    elif n % 3 == 0:
        return "Fizz"
    elif n % 5 == 0:
        return "Buzz"
    else:
        return str(n)

def printing_numbers_from_1_to_100() -> None:
    """Print the FizzBuzz sequence from 1 to 100"""
    for number in range(1, 101):
        print(evaluate_number(number))


if __name__ == "__main__":
    printing_numbers_from_1_to_100()
