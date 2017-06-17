[![BCH compliance](https://bettercodehub.com/edge/badge/motri/Gilded_Rose_Kata?branch=master)](https://bettercodehub.com/)
![Travis-CI](https://travis-ci.org/motri/Gilded_Rose_Kata.svg?branch=master)
# GildedRose-Refactoring-Kata

This kata deals with legacy code and its subsequent refactoring. The original script a
41 line long conditional statement and required an extra feature added to the functionality.

## Technology
* Ruby.
* RSpec for testing.
* Rubcop for style.
* Simplecov for coverage.

## Usage
```
Clone the repo, run bundle install and rspec for testing. Additionally for a wider picture
of the scripts' features, run " ruby texttest_fixture.rb ".
```

## Approach

Dealing with legacy code affords great learning opportunities. In the case of the widely known GildedRose there is a lot of documentation, which I tried to avoid, for the most part. \
As a first step I decided to provide tests for the existing script before trying to add any extra features. My approach was to prove that the script did what it said and also allow me to have a reference as to what the new script needed to provide. \
Encapsulation seemed a logical next step. Extracting smaller functions from the main function. \
The structure of the tests allowed me to focus on individual parts when working to make
the original tests pass with new code in a methodical way. \
Then I proceeded to extract those functions into classes. \
