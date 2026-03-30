 @actions_bar
Feature: Join Live

    Validates navigation to the Session Schedule page, ensuring correct display of session categories, calendar (current & past months), and session details on scroll.

Superman:
      Superman should be able to access the Schedule page with all session categories (English, Hindi, Exam, Other Meetings) and view current/past months schedules in the calendar.
      Superman should be able to access session descriptions load correctly on scroll with smooth performance and accurate data.

Macro:
  Scenario: Navigate to Schedule page
    Given User is on main page
    When User clicks on Schedule button
    Then User should be navigated to Schedule page
    And Page should load successfully
  Scenario: View session categories
    Given User is on Schedule page
    When Page is loaded
    Then Name of the English Sessions list should be visible
    And Name of the Hindi Sessions list should be visible
    And Name of the Other Sessions list and Exam is visble.
  Scenario: View calendar months
    Given User is on Schedule page
    When User views calendar
    Then Current month schedule should be displayed
    And Previous month schedule should be accessible
    And Sessions Short form should be displayed below the dates.
  Scenario: Scroll and view session description 
    Given User is on Schedule page
    When User scrolls down
    Then Session descriptions should be visible in English and Hindi language respectively
    And Content should load properly
  Scenario: Month switching 
    Given User switches between months
    When User selects previous or next month
    Then Correct session data should be displayed
    And No incorrect sessions should appear
  Scenario: No sessions available
    Given No sessions exist
    When User opens Schedule page
    Then Calender dates should not be assigned with Sessions.
  Scenario: Select date with assigned session
    Given User is on Schedule page
    And Date has assigned sessions
    When User selects the date
    Then Selected date should be highlighted with colour
    And Assigned sessions should be displayed below the calendar
  Scenario: Select same date again 
    Given User has selected a date
    When User selects the same date again
    Then Date should remain highlighted
    And Sessions should remain unchanged
  Scenario: User select Next month 
    Given User is on Schedule page
    When User selects the next month arrow twice on calendar
    Then Only immediate next month calendar should be visible.