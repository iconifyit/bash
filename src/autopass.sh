#!/bin/bash

# Dependencies:
# - https://github.com/georgeflanagin/passwordgenerator

# Generate a list of secure, random passwords
# @TODO: Add ability to pass arguments to the password generator.

function autopass
{
  python /Users/scott/github/georgeflanagin/passwordgenerator/passwords.py
}