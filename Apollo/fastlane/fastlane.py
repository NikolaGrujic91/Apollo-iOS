"""Script acting as a python wrapper around fastlane."""

import argparse
import subprocess
import shutil
from enum import Enum

class Lanes(Enum):
    """Enum of available lanes"""
    BUILD_DEBUG = 1,
    BUILD_RELEASE = 2,
    SCREENSHOTS = 3,
    SWIFTLINT_ANALYZE = 4,
    TESTS = 5

    def __str__(self):
        return str(self.name).lower()

    @classmethod
    def from_string(cls, value: str) -> "Lanes":
        """
        Returns an enum member from a string

        Args:
            value (str): String value to parse

        Raises:
            ValueError: If value is not a valid Lanes member

        Returns:
            Lanes: Enum member corresponding to the input string
        """
        for member in cls.__members__.values():
            if member.name.lower() == value.lower():
                return member
        raise ValueError(f"{value} is not a valid Lanes member")

def run_shell_command(command: str):
    """
    Execute shell command

    Args:
        command (str): Command to execute

    Returns:
        None
    """
    print(command)
    # Create a subprocess to execute the command
    process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE)

    # Wait for the command to complete
    stdout, stderr = process.communicate()

    # Print the output
    print("Output:", stdout.decode())
    if stderr is not None:
        print("Error:", stderr.decode())

    # Close the subprocess
    process.kill()
    process.wait()

    # Print the return code
    print(f"Process returned with code: {process.returncode}")

def delete_folder(folder: str) -> None:
    """Delete given folder

    Args:
        folder (str): Path to folder to delete

    Returns:
        None
    """
    try:
        shutil.rmtree(folder)
        print(f'{folder} deleted')
    except OSError as e:
        print(f"Error: {e.strerror}")

def run_lane(lane: Lanes) -> None:
    """
    Execute given lane

    Args:
        lane (Lanes): Lane to execute

    Returns:
        None
    """
    command = "fastlane ios"
    match lane:
        case Lanes.BUILD_DEBUG:
            run_shell_command(f"{command} {Lanes.BUILD_DEBUG}")
        # Build the debug version of the app

        case Lanes.BUILD_RELEASE:
            run_shell_command(f"{command} {Lanes.BUILD_RELEASE}")
        # Build the release version of the app

        case Lanes.SCREENSHOTS:
            run_shell_command(f"{command} {Lanes.SCREENSHOTS}")
        # Generate screenshots for the app

        case Lanes.SWIFTLINT_ANALYZE:
            run_shell_command(f"{command} {Lanes.SWIFTLINT_ANALYZE}")
        # Analyze Swift code with SwiftLint

        case Lanes.TESTS:
            delete_folder("../../CodeCoverageReports")
            delete_folder("../../TestReports")
            run_shell_command(f"{command} {Lanes.TESTS}")
        # Run unit tests and generate code coverage reports

        case _:
            run_shell_command(f"{command} {Lanes.BUILD_DEBUG}")
        # Default to building the debug version of the app

def parse_arguments() -> Lanes:
    """
    Parse arguments.

    Args:
        args: Command line arguments

    Returns:
        Lanes: Lane to execute
    """
    # Create the parser
    parser = argparse.ArgumentParser(description="Run Fastlane lanes")

    # Add positional arguments
    parser.add_argument(
        "-l",
        "--lane",
        choices=[
            f"{Lanes.BUILD_DEBUG}",
            f"{Lanes.BUILD_RELEASE}",
            f"{Lanes.SCREENSHOTS}",
            f"{Lanes.SWIFTLINT_ANALYZE}",
            f"{Lanes.TESTS}",
        ],
        help="Lane to execute. Defaults to building the debug version of the app.",
    )

    # Parse the arguments
    args = parser.parse_args()

    # Use the argument
    if args.lane:
        return Lanes.from_string(args.lane)

    return Lanes.BUILD_DEBUG

def main():
    """Main function"""
    run_lane(parse_arguments())

if __name__ == "__main__":
    main()
