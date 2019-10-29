# Planning my app
1. Answer questions
  - What am I building?
  - Who am I building it for?
  - What features do I need to have?
2. User stories
3. Model my Data
4. Think through the pages I need to have in my app


## Questions
1.
  - What am I building?
    I am building a website.
    A place where Parents can write little notes for their babies, about their babies and about their feelings during the time that the baby grows. Parents can add pictures of best moments and memorable things and will be able to download the final version of a little diary after certain period of time.
  - Who am I building it for?
    I am building it mainly for parents of young kids and newborns. Sharing what they are feeling and living every day, talking to their future adult kids and noting most important memorable moments to have a trace of it in the future.
  - What features I would like it to have?

    USER
     - Sign-in
     - Sign-out (Devise)

    NOTES
     - Create Update Edit Destroy

    CHILD
      - Create Edit

    PHOTO
      - Upload Delete

    FIRST_TIMES
     - Create Edit  


## 2. User Stories and acceptance criteria

  As a ..., I want to be able to .. so that ..

   - As an unauthenticated registered user I want to be able to log-in from the home page so that I can start journaling.
   Acceptance criteria:
    -- On the home page I follow the sign-in link as an existing user
    -- I am presented with a form with two fields: email and password and a sign-in button
    -- My password is not displayed as I type it in
    -- If I enter the valid email and password and press the sign in button, the page refreshes and shows me "Hello, my username"
    -- If I didn't enter the right credentials the error message appears and I am left unauthenticated
    -- If I am already signed in I do not see the option to sign-in

   - As an unauthenticated unregistered user I want to be able to sign-up from the home page so that I can start journaling.
   Acceptance criteria:
    -- I follow the sign-up link as a new user
    -- I am presented with a form with the following fields: name, last name, gender, DOB, dropdown menu to choose if I am a mother, a father, a grandfather, a grandmother, a sister, a brother or other caretaker, email and password. I can upload avatar.
    -- If I choose that I am an other caretaker it offers me to write who am I to the baby. It should be letters only word with no numbers or other symbols.
    -- My password is not displayed as I type it in
    -- If I fill in the forms with valid credentials and press the sign-up button, the page refreshes and shows me "Welcome, my username"
    -- If I didn't enter the the valid credentials the error message appears and I am left on the sign-up page unregistered in the system.

  - As an authenticated user(parent) I want to be able to create a new child record.
    Acceptance criteria:
    -- On my profile page I follow the link to create new child
    -- I am presented with a form with the following fields:
      Name(s), DOB(future possible 9 months from the date of creation), nickname, gender, baby_color_theme, and possible photo download.
    -- If I fill in all credentials correctly, select color_theme, gender and press save button I am redirected to the page of the child with all new details.
    -- If I do not provide all the correct details I receive error message and stay on the same page with the form pre-filled with all the details that I already provided.


  - As a authenticated user(parent) in the child record I want to be able to add child's name(s).
    Acceptance criteria:
    -- On my profile page I follow the link to create new child
    -- I am presented with a form with the field for child's name and last name(can be blanc):
    -- I can enter the name in all capitals, all small or starting with capital letter. No numbers or other symbols except from letters are accepted.
    -- If I provide the valid first name, add all other credentials and press save button I am redirected to the page of the child with all the details.
    -- If I provide invalid name I receive the error message depending on the type of the error I've made : "Child's name can't be blanc" and/or "Childs last name can only have letters"


  - As a authenticated user(parent) in the child record I want to be able to add child's birth date.
  Acceptance criteria:
    -- On my profile page I follow the link to create new child
    -- I am presented with a form with the field for child's birth date:
    -- I can select the birth date from the calendar, the system allows me to enter the birth date in the future ( 9 months after todays date).
    -- If I provide the valid birth date , add all other credentials and press save button I am redirected to the page of the child with all the details.
    -- If I provide invalid birth date (invalid format or too far in the future) I receive the error message depending on the type of the error I've made : "Birth date must be mm.dd.yyyy format" and/or "Birth date can be  only 9 months far in the future"



  - As a authenticated user(parent) I want to be able to add child's gender.
  Acceptance criteria:
    -- On my profile page I follow the link to create new child
    -- I am presented with a form with the toggle field for child's gender: 'girl', 'boy', 'prefer not to say'.
    -- I can select gender by selecting only one of the three options. The default option is set on 'prefer not to say'.
    -- If I do not select anything the options stays on default and the form will be saved successfully with other valid credentials.
    -- If I select the option 'girl' or 'boy' then the selected option is presented on the page after I press save button.



  - As a authenticated user(parent) I want to be able to pick the color theme for my child's page and downloadables.
  Acceptance criteria:
      -- On my profile page I follow the link to create new child
      -- I am presented with a form with the toggle field for child's color theme that will be used on the page: 'green', 'light-blue', 'pink', 'red', 'orange', 'beige', 'none'.
      -- I can select the theme by selecting only one of the options. The default option is set on 'none'.
      -- If I do not select anything the options stays on default and the form will be saved successfully with other valid credentials.
      -- If I select the particular option then the selected option is applied to the child's page

  - As a authenticated user(parent), I want to be able to create notes for my child and about my child so that I can share this information with child in the future and keep a memory for myself.
  Acceptance criteria:
     -- On my child's page I can click the link write a post OR
     -- On my profile page I can click the button with my child's name under section Create new  post for:
     -- I am getting to the page with the form for a new post
     -- I can select the child's name in case if I need to change it and par default it is set to the child's name that I already selected before getting to the new post page.
     -- I can enter a message for the baby
     -- I can select questions and answers for them(optional)
     -- I can upload 1-5 photos
     -- If I filled in the message area and click submit button I see the page with all messages for the baby sorted in ascending order (latest first)
     -- If I forget to add the message I receive the "Say something in your message please" error and see the form page for the message.

  - As a authenticated user(parent) I want to have several pre-set questions to answer to not forget to note milestones in my child's development
  Acceptance criteria:
    -- On the page for the new post I have 3 areas on the form that allow me to select 3 questions and answer them.
    -- In the drop down menu I see the following questions related to my child's age:
    Age 0 - 7 months/ Age 7 - 14 months/ Age 14 - 21 months:
     * Did your baby have a first bath this week/ today (choose)?
     * Did your baby smile at you for the first time this week/ today?
     * Did your baby rollover for the first time this week / today?
     * Did your baby hold head up for the first time this week / today?
     * Did your baby get a new tooth this week/ today?
     * Did your baby hold on to a toy for the first time this week/ today?
     * Did your baby try new food for the first time this week/ today?
     * Did your baby crawl for the first time this week/ today?
     * Did your baby laugh for the first time this week/ today?
     * Did your baby sleep through the night this week/ today?
     * Did your baby sat up for the first time this week/ today?
     * Did your baby crawl for the first time this week/ today?
     * Did your baby say a first word this week/ today?
     * Did your baby wave bye-bye for the first time this week/ today?
     * Did your baby eat herself for the fist time this week/ today?
     * Did your baby stand up for the first time this week/ today?
     * Did your child did a first step this week/ today?
     * Did your child stack one bloc on the top of another for the first time this week/ today?

    -- If I already answered "Yes" to the question the question will not appear on list next time.
    -- Once I selected the question I can choose 'Yes',  'Not yet', 'Almost' options in the toggle section following the question.
    -- Default options of all questions is set to "Nothing to add this week"
    -- If the default option is not changed then the question is not registered on the child's page and the answer to the question is not added to the database.

    -- If I filled in the message area, selected questions and click submit button I see the page with all messages for the baby sorted in ascending order (latest first). The notice about first_time_event in childs's life is added to the message on that day with a note "And this week(today) babys_name did first_time_event_name for the first time"
    -- If I forget to add the message I receive the "Say something in your message please" error and see the form page for the message.

  - As a authenticated user(parent), I want to be able to edit & destroy notes so that I can manage my diary.
  Acceptance criteria:
    -- On my profile page I can choose to see all posts for the selected child.
    -- Once on the posts page I can edit and delete any post
    --If I press delete button located near by the post I receive the pop-up message asking me to confirm that I want to delete the post
    -- If I confirm that I want to delete the post. It is deleted, I am on the posts page and the message stating the successful deletion appears on the posts page.

  - As a authenticated user(parent), I want to be able to upload photos of my child and of important moments in my child's development. And if needed add a little note to the photo.
  Acceptance criteria:
      -- On my child's page I can click the link write a post OR
      -- On my profile page I can click the button with my child's name under section Create new  post for:
      -- I am getting to the page with the form for a new post
      -- I fill in fill in all the necessary details
      -- If I click the link add photos I am redirected to the pop-up screen where I can select the source where I want to take photos.
      -- I can select to upload photos from the computer, take a picture or from the phone.
      -- I select the source and click on the button upload.
      -- If the photo meets the criteria and is of a valid format the photo uploads.
      -- If the photo does not meet the criteria or is not of a valid format, I receive an error message stating "The photo can only be .jpeg, .png, .gif, jpg and the size must be ???? (Google and Ask AmyLynn about the optimal size) "

  - As a authenticated user(parent), I want to be able to see the summary of my records with photos on preview page.
  Acceptance criteria:
   -- On my profile page or on the child's page if I click on the link "See all posts" I am redirected to the page showing all posts listed chronologically - latest posts first.


???  - As a authenticated user(parent) I want to be able to see photos only with dates on photo preview page.
  Acceptance criteria:
   --  On my profile page or on the child's page if I click on the link "See all posts" I am redirected to the page showing all posts listed chronologically - latest posts first.
   -- I can then select to filter photos only and the page will be presented with only photos and marked dates of the photos.
???

  - As a authenticated user(parent), I want to be able to download and print my dairy for set period of time with all the details and photos and nice decoration following the chosen color theme. I should get printable view in browser and then should have option to print in different formats.
  Acceptance criteria:
   -- From my profile page or from child's profile page I can click on the link "See all posts" I am redirected to the page showing all posts listed chronologically - latest posts first.
   -- I can click on the "Print all" button and I am presented with the print preview.
   -- On the preview all the diary details should be visible including child's name, date, note, photos, notes for photos and answered questions(first_timers).
   -- On the preview page I should option to print, download as:
    - PDF
    - Word
    - XML(?)
    - JPEG (?)
   -- All the items type should be printable
    - Photos
    - Text notes
    - Dates
    - Answered questions
  -- I should have an option 'Save as' or 'Print'.


## 3. Modeling my Data

  ** USER(parent) **
    Devise
    has_many: children
    admin?: boolean
    name: string
    last_name: string
    dob: string
    status: [mother, father, grandmother, grandfather, aunt, uncle, sister, brother, other caretaker] (string)
    caretaker: string
    email: string
    password: password
    mailer_reminders: [daily, weekly[set_week_day], monthly[set_date], yearly[set_date]] (string)

  ** CHILD **
    belongs_to: parent
    has_many: notes
    has_many: photos
    has_many: milestones

    name: string
    dob: string(?)
    gender: [boy, girl, prefer not to say]
    color_theme: string
    parent_id: integer

  ** NOTES **
  #this line allows me to use ActiveStorage to trace relations between the uploaded images and the notes
    has_many_attached: images
    belongs_to: child
    body: text
    child_id: integer


  ** MILESTONES **
    belongs_to: child
    question_body: text
    answer: string
    milestone_date: string
    autogenerated_note: text {"Baby_name did milestone_name on the milestone_date for the first time"}
    child_id: integer

 ##4. Pages that I need in my app

   - Home
   - User#sign_in(devise)
   - User#new(sign_up#devise)
   - User#show
   - User#edit
   - Child#new
   - Child#show
   - Child#edit
   - Post#new
   - Post#edit
   - Post#show
   - Posts#index
