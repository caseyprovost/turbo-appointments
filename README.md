# Turbo Schedule

Take-home coding exercise for front-end candidates at HouseAccount.

Current opening: https://jobs.rubyonrails.org/jobs/474

## Setup

1. Clone the current repo to your local machine
1. Run `bundle install` to install dependencies
1. Run `rails s` to start the Rails server
1. Open http://localhost:3000 in your browser

![setup](https://github.com/HouseAccountEng/turbo_schedule/assets/10076/dc830999-6bfc-4acb-9fc4-f18b5d189b00)

## Assignments

The following tasks are meant to evaluate your familiarity with JavaScript libraries that belong to [Hotwire](https://hotwired.dev/).
Please complete them using Turbo or Stimulus (or both). You are free to use any version (current or beta).

Once you are done with an assignment, create a `git commit` with your code changes and use the commit message
to communicate anything you deem important (what choices you made, why you went a certain route, and so on).
If possible, have a separate commit for each assignment.

Once you are done with the code changes, simply open a Pull Request against the `main` branch with your commits. Thanks!

### Assignment #1: let users create appointments without a full page reload

Currently users create appointments by selecting a future date and clicking on "Create Appointment".
`AppointmentsController#create` stores the new appointment in the database and redirects the user to the main page where appointments are displayed.

https://github.com/HouseAccountEng/turbo_schedule/blob/88fb12742092fd0d60cebb0dba6feb3b2bb7e377/app/controllers/appointments_controller.rb#L12-L13

This flow works correctly but is slow: the full page (including its assets) is reloaded at every submission.
Your first assignment is to keep the same flow while avoiding a full page reload.
When an appointment is created, it should be added to the DOM without modifying the rest of the page.

You can verify that the page doesn't fully reload by looking at the `<title>` of the page. 
The number in parenthesis (53238 in the image above) is the timestamp of when the page is loaded and shouldn't change after the form submission.

There are also tests that you can run with `rspec` that should pass before and after your code changes.

### Assignment #2: display validation errors without a full page reload

Appointments can only be created for dates in the future that do not already have appointments.

https://github.com/HouseAccountEng/turbo_schedule/blob/88fb12742092fd0d60cebb0dba6feb3b2bb7e377/app/models/appointment.rb#L3-L4

When users try to create an invalid appointment, a validation error is displayed.

![error](https://github.com/HouseAccountEng/turbo_schedule/assets/10076/7cb7bce0-c242-4367-a6ee-21abae0d5ea0)

This flow works but, once again, is slow: the full page is reloaded in case of error.
Your second assignment is to add the error to the DOM without modifying the rest of the page.

### Assignment #3: let users cancel appointments without a full page reload

Currently users cancel appointments by selecting an appointment and clicking on "Destroy this appointment".

![cancel](https://github.com/HouseAccountEng/turbo_schedule/assets/10076/1a6e85f0-5b96-43b2-bfe2-50da7666b949)

`AppointmentsController#destroy` removes the appointment from the database and redirects the user to the main page.

https://github.com/HouseAccountEng/turbo_schedule/blob/88fb12742092fd0d60cebb0dba6feb3b2bb7e377/app/controllers/appointments_controller.rb#L21-L22

This flow works but, once again, is slow: the full page is reloaded.
Your third assignment is to remove the canceled appointment from the DOM without modifying the rest of the page.

### Assignment #4: prevent users from picking invalid dates

Appointments can only be created for dates in the future that do not already have appointments.
The current interface doesn't give any indication of this rule, therefore it's easy for users to pick an invalid date.

Your fourth assignment is to ensure as much as possible that users can only pick valid dates from the calendar.
In order to do this, you are free to use any third-party calendar library. Users should be able to select only valid dates.

Here's something to consider. While the user is on the page, someone else might book an appointment on a future date.
Then, all of a sudden, that date will not be available anymore. 
If possible, your calendar should reflect this: as soon as any user picks a date, that date becomes unavailable for all other users (without needing to reload the page).

<!--
### Assignment #5: make any CSS improvement you deem appropriate

Currently the application links to [Simple.css](https://simplecss.org/) to have some basic styling

https://github.com/HouseAccountEng/turbo_schedule/blob/88fb12742092fd0d60cebb0dba6feb3b2bb7e377/app/views/layouts/application.html.erb#L8

Your fifth assignment is to replace Simple.css with a modern framework like [Tailwind CSS](https://tailwindcss.com/docs/guides/ruby-on-rails)
and to apply any classes that you deem appropriate to keep it usable and responsive and different widths.
-->

## Videos

The following screenshares might help you understand the assignments better by showing you what the initial app looks like
and what is expected from your work. Thanks! 

### Expected result

https://github.com/rails/importmap-rails/assets/10076/662e1327-3416-4ac8-988b-7673708e1e4a

### Your assignment

https://github.com/rails/importmap-rails/assets/10076/e44d25ac-9f9d-457f-825a-52842ea8c3ec

### The codebase

https://github.com/rails/importmap-rails/assets/10076/259f440f-caae-47f2-98c6-c8a608aeb822

