@main_feed
Feature: Post List and Details

    This feature ensures users can view community posts and interact with them by adding emojis, comments, bookmarks, and shares.
    It verifies community-based filtering, visibility of pinned and View All posts, and proper display of post details, media, hashtags, and user status tags.

Superman:
      Superman should be able to comment, share and add emoji for all the posts and in all the communities.
      Superman should be able to add posts in all communities.
Macro:
    Scenario: View posts based on selected community 
        Given the user is logged into the application 
        When the user selects the English Community 
        Then  English Community posts should be displayed
        And both PAF posts and User posts should be visible
        And View All post should be visible irrespective of language.
        And pinned posts should be visible irrespective of langauge.
    Scenario: View Hindi community posts 
        Given the user is logged into the application 
        When the user selects the Hindi Community 
        Then Hindi Community posts should be displayed 
        And both PAF posts and User posts should be visible
        And View All post should be visible irrespective of language.
        And pinned posts should be visible irrespective of language.
    Scenario: View all posts should be visible 
        Given the user is logged into the application 
        When the user selects the Hindi Community or English Community or All.
        Then View All post should be visible irrespective of language.
    Scenario: Pinned posts should be visible 
        Given the user is logged into the application 
        When the user selects the Hindi Community or English Community.
        Then pinned posts should be visible at the top of the feed irrespective of language.
    Scenario: Newly added post appears at the top 
        Given the user has added a new post 
        When the user navigates to the post listing page 
        Then the newly added post should be visible at the top of the feed until page refreshed.
    Scenario: Verify user post basic details 
       Given a user post is visible in the feed 
       Then the user profile picture should be visible at the top left corner 
        And the user name should be visible at the top left corner
    Scenario: Verify user post additional UI elements 
       Given a user post is visible in the feed 
       Then the student progress card bar should be visible at the top of the post 
       And the translate option should be visible at the top left corner 
       And the post duration should be displayed at the top right corner
    Scenario: Verify media visibility on posts 
       Given a post contains images or videos 
       When the post is displayed in the feed 
       Then images should be visible for both User and PAF posts 
       And videos should be playable for both User and PAF posts
    Scenario: Verify emoji visibility on posts 
       Given emojis are added to a post 
       When the post is displayed 
       Then emojis should be visible on both User and PAF posts 
       And the number of emojis should be displayed on the post
    Scenario: Add emoji to a post 
       Given a User or PAF post is visible 
       When the User or PAF adds an emoji to the post 
       Then the emoji should be added successfully to the post
    Scenario: Add comment to a post 
       Given a User or PAF post is visible 
       When the User or PAF adds a comment 
       Then the comment should be added successfully 
       And the comment count should be updated on the post
    Scenario: View comments on a post 
       Given a post has comments 
       When the user clicks on the post 
       Then the list of comments should be displayed
    Scenario: User Bookmark  a post.
      Given a User or PAF post is visible 
       And the user bookmarks  the post  
       When User Clicks on the “View all” button on Toast message appeared on the bottom of the page 
       Then User is navigated to “Bookmarks” Tab of My profile page.
       And User should be able to the see the Bookmarked post in the list.
    Scenario: User Shares  a post.
      Given a User or PAF post is visible 
       When User Clicks on the “Share” button at the bottom of the post
       Then Bottom page with multiple options(WhatsApp, email ..Etc) are visible
       And User should be able to share the post with selected option.
    Scenario: Scroll through posts 
       Given multiple posts are available in the feed 
       When the user scrolls the page 
    Scenario: Scroll up icon should be deisplayed.
       Given multiple posts are available in the feed 
       When the user scrolls more than 6 posts
       And Scroll up utility button is displayed
       When  “Scroll up utility button” is Clicked.
       Then Quickly takes the user back to top of the page 
    Scenario: Verify post more options 
      Given a post is visible 
      When the user clicks on the three dots on the post 
      Then Copy link and Report abuse options should be displayed
    Scenario: Add emoji to a comment 
      Given a comment is visible on a post 
      When the user adds an emoji to the comment 
      Then the emoji should be added successfully to the comment
    Scenario: Add a comment for the comment.
      Given a comment is visible 
      When the user adds a reply to the comment 
      Then the comment should be added to the comment.
    Scenario: Interact with a comment 
      Given a comment is visible 
      When the user adds a  bookmarks, or shares the comment 
      Then the selected action should be completed successfully
    Scenario: Verify comment more options 
      Given a comment is visible 
      When the user clicks on the three dots on the comment 
      Then Copy link and Report abuse options should be displayed
    Scenario: Verify comment card details 
      Given a comment is visible 
      Then the profile picture and student progress card should be visible 
      And emoji, comment text, bookmark, share icon, and three dots should be visible 
      And the comment duration should be displayed at the top right corner
      And the translate option should be visible at the top left corner
    Scenario: Verify read more and show less options 
      Given a post contains long content 
      When the post is displayed 
      Then Read more and Show less options should be available
    Scenario: Hashtag visibility on posts 
      Given a post contains hashtags 
      When the post is displayed 
      Then hashtags should be visible on the post
    Scenario: Navigate using hashtags 
      Given hashtags are visible on a post 
      When the user clicks on a hashtag 
      Then the user should be navigated to a page showing posts with the same hashtag
    Scenario: Subsidised Severity Status shown on top of the post
       Given a user is Heavily Subsidised. 
       When the post is displayed 
       Then the Heavily Subsidised status should be shown on the top of the post.
    Scenario: Extremely Severity Status shown on top of the post
       Given a user is Extremely Subsidised. 
       When the post is displayed 
       Then the Extremely Subsidised Status should be shown on the top of the post.
    Scenario: PAF member tag should be visible at the top of the post 
       Given a PAF post is on the feed 
       When the PAF post is displayed 
       Then the “PAF Member” tag should be visible at the top of the post.
       Then the Extremely Subsidised Status should be shown on the top of the post.
    Scenario: “No Response yet” message should be displayed when user adds first comment. 
       Given a post is on the feed 
       When user clicks on the post with no comments added.
       Then the “No responses yet Say something to start the conversation Be the first to comment” message should be displayed below the post.
