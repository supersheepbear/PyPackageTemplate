"""Console script for cookiecutter_test."""
import cookiecutter_test

import typer
from rich.console import Console

app = typer.Typer()
console = Console()


@app.command()
def main():
    """Console script for cookiecutter_test."""
    console.print("Replace this message by putting your code into "
               "cookiecutter_test.cli.main")
    console.print("See Typer documentation at https://typer.tiangolo.com/")
    


if __name__ == "__main__":
    app()
