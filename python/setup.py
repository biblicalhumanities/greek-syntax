from setuptools import setup

setup(
    name = "greeksyntax",
    version = "0.1.dev0",
    license = "Apache 2.0",
    author = "Jonathan Robie",
    author_email = "jonathan.robie@biblicalhumanities.org",
    packages = ["greeksyntax"],
    install_requires=[
          'BaseXClient',
    ],
)

