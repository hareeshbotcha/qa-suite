@actions_bar
Feature: Recordings

   Validates the Recordings feature including session selection, playback controls, progress tracking, downloads, and seamless navigation with language-based content display.

Superman:
      Superman should access, navigate, and play recordings (English/Hindi) with correct resume, controls, progress indicators, and chapter/verse mapping.
      Superman should access end-to-end recording experience including download, quality selection, mini-player behavior, and accurate display of session details.

Macro:
  Scenario: Navigate to Recordings page
    Given User is on Main Page
    When User clicks on Recordings option
    Then User should be navigated to Recordings page
    And English Sessions and Hindi Sessions sections should be visible
  Scenario: View English Sessions recordings
    Given User is on Recordings page
    When User clicks on English Sessions dropdown
    Then English Sessions recordings should be displayed
    And Continue Watching option should be visible for partially watched videos
  Scenario: View Hindi Sessions recordings
    Given User is on Recordings page
    When User clicks on Hindi Sessions dropdown
    Then Hindi Sessions recordings should be displayed
  Scenario: Open English session recording
    Given English Sessions recordings are displayed
    When User clicks on any English Session drop down
    Then Chapters dropdown should be visible
  Scenario: View chapters and verses
    Given User is on Recording page
    When User clicks on Chapters dropdown
    Then List of verse recordings should be displayed
    And All verses should belong to selected chapter
  Scenario: Play verse recording
    Given User selects a verse recording
    When Recording page loads
    Then Recording should start playing
    And Playback should start automatically
  Scenario: Resume partially watched recording
    Given User has partially watched a recording
    When User opens the same recording
    Then Video should resume from last watched time
    And Progress should be maintained
  Scenario: Display progress indicator
    Given Recording is partially watched
    When User views recording list
    Then Circular progress indicator should be visible
    And Percentage watched should be displayed
  Scenario: Recording player controls visibility
    Given Recording is playing
    When User is on Recording page
    Then Play, Next, Fast Forward and Fast Backward buttons should be visible
    And Controls should function correctly
  Scenario: Open video quality settings
    Given Recording is playing
    When User clicks on Settings icon
    Then Bottom sheet should open
    And List of video resolutions should be displayed
  Scenario: Default video quality
    Given User opens a recording
    When Video starts playing
    Then Default resolution should be 480p
    And Video should play without buffering
  Scenario: Back navigation with mini player
    Given Recording is playing
    When User clicks back button
    Then User should be navigated to Recordings page
    And Video should be minimized to bottom left corner
  Scenario: Mini player controls 
    Given Video is minimized
    When Mini player is visible
    Then Close, Play/Pause, Forward 10 sec and Backward 10 sec buttons should be visible
    And Controls should work correctly
  Scenario: Recording page content validation
    Given User is on Recording page
    When Page is loaded
    Then Session name and time should be displayed
    And Shlok and meaning should be visible
    And Main video and Q&A video options should be available
  Scenario: Read more and show less
    Given Recording description contains long text
    When User views description
    Then Read More option should be visible
    And On clicking Read More full content should expand
  Scenario: Download video from recording page
    Given User is on Recording page
    When User clicks on Download option
    Then Bottom sheet with resolutions should appear
    And User should be able to select resolution
  Scenario: Download selected resolution
    Given User selects resolution
    When User clicks Download
    Then Video should start downloading
    And Video should be visible in My Downloads page
  Scenario: Maximize and minimize player
    Given Video is playing
    When User clicks minimize or maximize button
    Then Player should resize accordingly
    And Playback should not be interrupted
  Scenario: Video type indication
    Given Recording page is open
    When Video is playing
    Then Indicator icon should show whether it is Main or Q&A video
    And Indicator should update on switching video
  Scenario: Seek bar functionality 
    Given Video is playing
    When User drags scroll bar
    Then Video should move forward or backward
    And Playback should continue from selected point
  Scenario: Video duration and timing display
    Given Video is playing
    When User views player
    Then Total duration should be visible
    And Current playback time should be displayed
  Scenario: Language-based translation
    Given User selects Hindi or English session
    When Recording is opened
    Then Shlok translation should match selected language
    And Content should be displayed correctly
  Scenario: Video recording is not avialable
    Given Recording file is not uploaded for a verse.
    When User tries to play recording
    Then Message "Recording for this session is not available yet" should be displayed in bottom sheet
  Scenario: Rapid navigation between recordings
    Given User is on recording page
    When User switches recordings quickly
    Then Only selected recording should play
    And App should not crash  
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