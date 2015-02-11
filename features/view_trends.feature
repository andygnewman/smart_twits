Feature: View trends

  As a time pressed news hungry individual
  I want to understand the meaning behind twitter top trends.

  Scenario: Trends
  Given I am on the homepage
  Then I should see "#ReplaceAMovieTitleWithGoat"

  Scenario: Click On Trends
  Given I am on the homepage
  When I follow "#ReplaceAMovieTitleWithGoat"
  Then I should see "trend"

