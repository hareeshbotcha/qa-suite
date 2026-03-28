@main_feed
Feature: Action Bar and Actions

   quick-access navigation panel that includes actions like Join Live, Schedule, Recordings, Exam, Invite, Groups, Attend In-Person, Gita Mission Guidelines, and Help, allowing users to easily access sessions, activities, and support features.
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
  Scenario: Navigate to Schedule page
    Given User is on main page
    When User clicks on Schedule button
    Then User should be navigated to Schedule page
    And Page should load successfully
  Scenario: View session categories
    Given User is on Schedule page
    When Page is loaded
    Then English Sessions should be visible
    And Hindi Sessions should be visible
  Scenario: View calendar months
    Given User is on Schedule page
    When User views calendar
    Then Current month schedule should be displayed
    And Previous month schedule should be accessible
    And Sessions Short form should be displayed below the dates.
  Scenario: Scroll and view session description 
    Given User is on Schedule page
    When User scrolls down
    Then Session descriptions should be visible
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
    Then Only next month calendar should be visible.
  Scenario: Open recordings page
    Given User is on Main Page
    When User clicks Recordings
    Then Recordings page should open
  Scenario: Play recording
    Given User selects recording
    When Page loads
    Then Video should autoplay
    And Default quality should be 480p
  Scenario: Resume recording
    Given Partially watched video
    When User reopens recording
    Then Video should resume from last position
  Scenario: Play video till end 
    Given User watches full video
    When Video reaches end
    Then Playback should stop
    And Mark as completed
  Scenario:  Q&A video should autoplay after Main Video completes  
    Given User watches full main video
    When Video reaches end
    Then Q&A video should autoplay after Main Video completes
    And Main and Q&A video length should be dispalyed            
  Scenario: Seek beyond duration
    Given Video duration is fixed
    When User drags beyond duration
    Then Playback should stop at max duration
    And No crash should occur
  Scenario: Change quality during playback
    Given Video is playing
    When User changes resolution
    Then Video should continue playing
    And Playback position should persist
  Scenario: Video continues playing when app goes to background
    Given Video is playing
    When User sends the app to background
    Then Video should continue playing
    And Audio should be audible 
  Scenario: Interrupt playback
    Given Video is playing
    When Incoming call or interruption occurs
    Then Video should pause
    And Resume correctly after interruption
  Scenario: Show confirmation popup on clicking download again
    Given Video download is in progress
    When User clicks on download button again
    Then Confirmation popup should be displayed
    And Popup should contain "Yes" and "No" options
  Scenario: Stop download on clicking Yes
    Given Confirmation popup is displayed
    When User clicks on Yes option
    Then Download should be stopped
    And Partially downloaded video should be removed from downloads
    And "Download removed" toast message should be displayed
  Scenario: Continue download on clicking No
    Given Confirmation popup is displayed
    When User clicks on No option
    Then Download should continue
    And No data should be lost
  Scenario: Rapid clicks on Yes
    Given Confirmation popup is displayed
    When User clicks Yes multiple times
    Then Download should stop only once
    And App should not crash
  Scenario: Rapid clicks on No 
    Given Confirmation popup is displayed
    When User clicks No multiple times
    Then Download should continue normally
    And No duplicate actions should occur
  Scenario: Popup dismissal without selection
    Given Confirmation popup is displayed
    When User taps outside popup or presses back
    Then Popup should be dismissed
    And Download should continue
  Scenario: App in background during cancel
    Given Download is in progress
    When User clicks download button and app goes to background
    Then Popup state should persist or handle correctly
    And No crash should occur
  Scenario: Remove downloaded video 
    Given Video is downloaded and clicks on download button again
    When Confirmation popup is displayed and clicked on Yes
    Then Downloaded video should be removed from downloads
    And "Download removed" toast message should be displayed    
  Scenario: Download should conitnue in background
    Given Download is in progress
    When User clicks back button and close the video
    Then Download should continue.
  Scenario: Download completes
    Given Download is in progress
    When Download is completed
    Then Green tick mark downloaded text should be displayed. 
  Scenario: Download video
    Given User selects resolution
    When User clicks download
    Then Video should be downloaded
    And File should appear in My downloads
  Scenario: Low storage
    Given Device storage is almost full
    When User downloads video
    Then Warning should be displayed
    And Download should not proceed
  Scenario: Large file download
    Given High resolution selected
    When User downloads
    Then Download should complete successfully
    And App should not crash
  Scenario: Multiple downloads
    Given User starts multiple downloads
    When Downloads are in progress
    Then All downloads should process correctly
    And Performance should remain stable
  Scenario: Cancel download midway
    Given Download is in progress
    When User cancels download
    Then Download should stop
    And Partial file should be removed

Sanity:

  Scenario: Join Live without internet
    Given No internet connection
    When User clicks Join Live
    Then Error message should be displayed
    And User should not navigate
  Scenario: Download failure due to network 
    Given Network failure occurs
    When User downloads video
    Then Download should fail
    And User should be able to retry the download.