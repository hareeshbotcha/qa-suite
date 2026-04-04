@actions_bar
Feature: Join Live

   Validates the Join Live functionality by ensuring correct navigation, UI behavior, and streaming experience based on session timing (before, at, and after start), including CTA visibility and seamless user entry into live sessions.

Superman:
      Superman should be able to join live sessions seamlessly before, at, and after scheduled time with correct UI behavior (bottom sheet/CTA/navigation).
      Superman should be able to join Verify live session loads reliably with proper access control, error handling, and smooth streaming across different scenarios and edge conditions.

Macro:
  Scenario: Join Live before scheduled time 
    Given Current time is before session time
    When User clicks on Join Live button
    Then Bottom sheet should be displayed
    And Session name should be shown in English and Hindi
  Scenario: Join Live at scheduled time
    Given Current time is equal to session time
    When User clicks on Join Live button
    Then User should be navigated to Live Session
    And Live session should load successfully
  Scenario: Join Live after scheduled time
    Given Current time is after session time
    When User clicks on Join Live button
    Then User should be navigated to Live Session
    And Streaming should start without issues
  Scenario: Join Live after scheduled time
    Given Current time is after session time
    When User Scroll the main feed
    Then Live seesion Started CTA should be displayed at top of the page 
  Scenario: Join Live after scheduled time
    Given Current time is after session time and user scrolling main feed page.
    When Live seesion Started CTA at top of the page is clicked
    Then Live session should load successfully
  Scenario: Join Live exactly at session start
    Given Current time matches session start time exactly
    When User clicks Join Live
    Then User should directly enter Live Session
    And No bottom sheet should be displayed
  Scenario: Rapid clicks on Join Live
    Given User is on main page
    When User clicks Join Live multiple times quickly
    Then Only one navigation should happen
    And App should not crash