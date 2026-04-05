@actions_bar
Feature: Gita Exam

   The Exam module allows users to attempt Gita-based MCQ exams in English and Hindi with Easy (Novice) and Tough (Beginner) levels. Users can view syllabus via recordings, attempt exams within a defined time window, track results, review answer sheets, and access past exam history with detailed performance and marking scheme.

Superman:
      Superman should be able to seamlessly navigates to the Gita Exam page, selects language and level, attempts the exam within the allowed time, and submits successfully while accessing syllabus, recordings, and sharing questions without any issues.
      Superman should be able to view results, access past exams and answer sheets, and experience smooth navigation, accurate timer, and correct marking without delays or errors.

Macro:
  Scenario: Navigate to Gita Exam page
    Given User is on Main Page
    When User clicks on Exam button after scheduled time 
    Then User should be navigated to Gita Exam page
    And English and Hindi Exams options should be visible

  Scenario: View exam levels for selected language
    Given User selects English or Hindi
    When Exam page loads
    Then Easy (Novice) exam should be visible
    And Tough (Beginner) exam should be visible

  Scenario: Verify language mapping
    Given User selects English exam
    When Exam loads
    Then Questions should be from English sessions
    And Content should be in English

  Scenario: Verify language mapping
    Given User selects Hindi exam
    When Exam loads
    Then Questions should be from Hindi sessions
    And Content should be in Hindi    

  Scenario: View syllabus and navigate to recordings
    Given User is on Exam page
    When User clicks on any chapter in syllabus
    Then User should be navigated to Recording page
    And Relevant session recordings should be displayed

  Scenario: Expand and collapse exam description
    Given Exam description is long
    When User clicks on Show More
    Then Full description should be visible
    And On clicking Show Less description should collapse

  Scenario: Open Acharya Prashant framework link
    Given Framework link is available
    When User clicks on the link
    Then User should be navigated to respective language framework page
    And Page should load successfully

  Scenario: Timer display validation
    Given User is on Exam page
    When Page loads
    Then Countdown timer should display minutes and seconds remaining
    And Timer should update dynamically

  Scenario: Navigate to Past Exams
    Given User is on Exam page
    When User clicks on Past Exams button
    Then Past Exams page should be displayed
    And Exams history should be visible

  Scenario: Navigate back from Past Exams
    Given User is on Past Exams page
    When User clicks back button
    Then User should be navigated to Exam page
    And Page should retain previous state

  Scenario: View answer sheet from past exams
    Given Past exam has result
    When User clicks on View Answer Sheet
    Then User should be navigated to exam attempt page
    And Correct Answers marked as right and Wrong Ansers  marked with "X"

  Scenario: Back navigation from answer sheet
    Given User is on Answer Sheet page
    When User clicks back button
    Then User should be navigated to Past Exams page
    And History should be visible

  Scenario: Attempt exam within allowed time
    Given Current time is between 9 PM and 11:30 PM
    When User starts exam
    Then Exam should start successfully
    And Timer of 30 minutes should begin

  Scenario: Auto submit at 11:30 PM 
    Given Exam is ongoing
    When Time reaches 11:30 PM
    Then Exam should be auto-submitted
    And User should see submission confirmation

  Scenario: Attempt second exam after submission
    Given User completes first exam
    When Submission is successful
    Then Option to attempt second exam should be displayed
    And User should be able to start next exam

  Scenario: Submit exam manually
    Given User has answered questions
    When User clicks Submit button
    Then Exam should be submitted
    And Submitted answers count should be shown (e.g., 12/13)

  Scenario: Share question
    Given User is on exam question
    When User clicks Share button
    Then Bottom sheet should open
    And Sharing options should be displayed

  Scenario: Select multiple answers
    Given Question allows multiple answers
    When User selects multiple checkboxes
    Then All selected options should be marked
    And Selection should be saved

  Scenario: Back button popup during exam
    Given User is attempting exam
    When User clicks back button
    Then Confirmation popup should be displayed
    And Options Yes and No should be visible

  Scenario: Confirm exit without submission
    Given Popup is displayed
    When User clicks Yes
    Then User should exit exam
    And All submitted answers should be cleared

  Scenario: Cancel exit during exam
    Given Popup is displayed
    When User clicks No
    Then User should remain on exam page
    And Answers should be retained

  Scenario: Verify popup text and translation
    Given User clicks back button
    When Popup appears
    Then Warning message should be displayed in English
    And Same message should be displayed in Hindi

  Scenario: Attempt exam before allowed time
    Given Current time is before 9 PM
    When User tries to start exam
    Then Exam should not start
    And Remaining time(day:hr:mins:s) format is displayed 

  Scenario: Attempt exam after allowed time
    Given Current time is after 11:30 PM
    When User tries to start exam
    Then Exam should not start
    And Exam closed message should be shown

  Scenario: Skipped exam result behavior
    Given User did not attempt exam
    When User views Past Exams
    Then Exam date should be visible
    And Result should not be displayed
    And View Answer Sheet link should not be present

  Scenario: Marking scheme validation
    Given User submits exam
    When System calculates result
    Then Correct answer should give +1 mark
    And Incorrect selection should deduct 2 marks
    And Missing correct option should deduct 2 marks
    And Skipped question should deduct 2 marks

  Scenario: User should not be able to start same exam after submission
    Given User is on the exam page
    When User submits the exam
    Then User should not be able to start the same exam again

  Scenario: Dynamic exam description update
    Given Exam schedule changes
    When User views description
    Then Updated date and timing should be displayed
    And Old data should not be visible

Sanity:
  Scenario: Network failure during exam
    Given User is attempting exam
    And Network disconnects
    When User continues answering
    Then Answers should not be saved
    And User should not lose data unexpectedly

  Scenario: Rapid submission clicks
    Given User clicks submit multiple times
    When Submission is triggered
    Then Only one submission should occur
    And App should not crash