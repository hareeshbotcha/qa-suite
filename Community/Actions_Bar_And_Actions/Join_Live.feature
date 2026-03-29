@main_feed
Feature: Join Live

   A quick-access navigation panel that includes actions like Join Live, Schedule, Recordings, Exam, Invite, Groups, Attend In-Person, Gita Mission Guidelines, and Help, allowing users to easily access sessions, activities, and support features.
Superman:
      Superman should accesses the Action Bar and seamlessly performs all actions—joining live sessions, scheduling and viewing recordings, attempting exams, inviting others, engaging in groups, checking in-person events, reading guidelines, and accessing help—without any delays or errors.
      Superman should be able to load All features instantly, navigate correctly, and enable the user to complete tasks efficiently in a smooth end-to-end experience.

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
    Then User should be navigated to Live Session
    And Streaming should start without issues
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