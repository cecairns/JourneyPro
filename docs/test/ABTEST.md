(Meagan)
# A/B Test: “Simple vs. Detailed Add New Trip Layout”

- **User Story Number**: US3 (Trip Creation)

## HEART Metrics

- **Happiness**: User satisfaction with the ease of adding a trip
- **Engagement**: User activity in the trip creation process
- **Adoption**: New users completing the "Add New Trip" flow
- **Task Success**: Completion rate and time to add a new trip

## Hypothesis

A simpler, minimalist layout for the "Add New Trip" screen will lead to a higher completion rate and shorter time for users to add trips, as the streamlined experience will reduce user friction.

## Problem Statement

We have noticed a drop-off at the "Add New Trip" screen, especially among new users. Users may find the current detailed layout (which includes fields for various optional trip details) overwhelming. Reducing the amount of information required up front may improve the user experience by making the trip-creation process feel faster and simpler.

The impact of this drop-off is significant, as users are not able to complete the core action of the app (adding trips), which directly affects engagement and long-term retention.

## Experiment

- **Setup**: Use Firebase A/B Testing to randomly assign 50% of users to the existing "detailed" layout and 50% to a "simple" layout with minimal required fields.
- **Audience**: All users in the target demographic who attempt to add a new trip.
- **Tracking with Firebase Analytics**:
  - Track **completion rate** for each variation (percentage of users who complete the Add New Trip flow).
  - Track **time spent** on the "Add New Trip" screen to measure task success efficiency.
  - Collect user feedback through a prompt after the trip is successfully added (optional).
  - **HEART Metrics**:
    - **Engagement** (session length, number of times users add trips)
    - **Adoption** (number of new users who complete the "Add New Trip" flow)
    - **Task Success** (completion rate and time spent adding a new trip)

## Variations

1. **Control (Detailed Layout)**:
   - Current layout with fields for trip name, location, start and end dates, and optional fields like trip description, itinerary, travel companions, etc.

2. **Variation A (Simple Layout)**:
   - Reduced layout with only essential fields: trip name, location, start date, and end date. Optional fields are hidden under an expandable "Add More Details" section to simplify the screen.

### Design Work
- **Control Layout**: Existing design, no changes.
- **Variation A (Simple Layout)**: Mockup with only essential fields and an "Add More Details" button that expands to show optional fields if needed.


(Carrie) 
# A/B Test: "Homepage Layout Change"

**User Story Number**: US4

## HEART Metrics

- **Happiness**: User satisfaction with the ease of navigating the homepage.
- **Engagement**: Time spent on the homepage and interaction with primary homepage elements.
- **Adoption**: New users returning to the homepage within the first week.
- **Task Success**: The click-through rate on key buttons (e.g., "Explore," "Start," "Learn More").

## Hypothesis 

A simpler, minimalist homepage will enhance user engagement and satisfaction by reducing visual clutter and focusing attention on key actions, resulting in improved click-through rates and session lengths. The user interface (UI) will be edited to see which variant users prefer. 

## Problem Statement

We’ve observed a decrease in user engagement on the homepage, likely due to an overwhelming amount of content, which may cause users to feel overloaded. Simplifying the homepage could improve the experience by making it more intuitive and guiding users to primary actions more directly.

## Experiment

- **Setup**: Use Firebase A/B Testing (or similar tools) to randomly assign 50% of users to the existing “detailed” layout and 50% to a “minimalist” layout, featuring fewer elements and a cleaner design.
- **Audience**: All users landing on the homepage, with a focus on new and first-time users.
- **Tracking with Firebase Analytics:**
  - Track click-through rates on primary calls to action (CTAs) in both layouts.
  - Track session time on the homepage to measure user engagement. C
  - Collect optional user feedback through a prompt to gauge satisfaction with the homepage experience.

## Variations

- **Control (A)**: Current design - has the 'Upcoming Trips' label above the map. 'Add Trips' font not bolded. Feels cramped due to little spacing.
-  **Variant (B)**: New design - 'Upcoming Trips' label moved below the map. The 'Add Trips' font is now bolded to make it more prominent for users to see. Added a bit more spacing.

## Design Work

- **Control Layout**: Existing design, no changes. 
- **Variation A (Minimalist Layout):** Mockup with prominent CTAs and reduced information, with expandable options for additional sections.

(Darren)
# A/B Test: “login page layout change"

- **User Story Number**: US4

## HEART Metrics

- **Happiness**: User satisfaction with the ease of adding a trip
- **Engagement**: User activity in the trip creation process
- **Adoption**: New users completing the "Add New Trip" flow
- **Task Success**: Completion rate and time to add a new trip

## Hypothesis

A more in depth login screen that takes users to diffrent gpages depending on login or signup contrary to what we have now where both are on the same page.

## Problem Statement

We have noticed making signup and login on diffrent screens adds unnecessary clicks leading to user dissatisfaction
The impact of this is significant adding clicks and loading time that is avoidable using our prior version

## Experiment

- **Setup**: Use Firebase A/B Testing to randomly assign 50% of users to the existing "detailed" layout and 50% to a "simple" layout with minimal required fields.
- **Audience**: All users in the target demographic who attempt to signup or login.
- **Tracking with Firebase Analytics**:
  - Track **completion rate** for each variation (percentage of users who complete the signup or login flow).
  - Track **time spent** on the "login" and "signup" screen to measure task success efficiency.
  - Collect user feedback through a prompt after the signup or login is successful (optional).
  - **HEART Metrics**:
    - **Engagement** (session length, number of times users logs in)
    - **Adoption** (number of new users who complete the "login" + "signup" flow)
    - **Task Success** (completion rate and time spent "login" + "signup")

## Variations

1. **Control (Detailed Layout)**:
   - Current layout with one page and the signup and login are tabs that can be swapped between
2. **Variation A (Simple Layout)**:
   - The user is sent to a welcome page that has a signup and login button clicking one of them takes them to either signup or login page.
### Design Work
- **Control Layout**: Existing design, no changes.
- **Variation A (Simple Layout)**: Mockup with only essential fields and simpler ui in each of the signup and login pages

(Mithilesh)
# A/B Test: “Light Mode vs Dark Mode”

- **User Story Number**: US5

## HEART Metrics

- **Happiness**: User satisfaction with the look of the app
- **Engagement**: User activity in the app contents
- **Adoption**: New users signing up
- **Retention**: User keep coming back
- **Task Success**: Users go through the golden path

## Hypothesis

The problem we are trying to solve is does light mode or dark mode make the users use the app more. Hypothesis is dark mode could make the users use the app longer or more frequently.

## Experiment

- **Setup**: Use Firebase A/B Testing to randomly assign 50% of users to the existing light mode and 50% to dark mode.
- **Audience**: All users using the app.
- **Tracking with Firebase Analytics**: track time spent on the app on light mode and dark mode.

## Variations

1. **Control**:
   - Light mode.

2. **Variation**:
   - Dark mode.

Design Work
- **Control Layout**: Existing design, no changes, which is light mode
- **Variation**: Changes to the colors to make it dark mode

(Skye)
# A/B Test: "Primary Displayed Expense Item Currency"
**User Story Number**: US4

## HEART Metrics

- **Happiness**: User satisfaction with the ease of adding, removing, and viewing expenses.
- **Engagement**: User activity in the expense tracking process.
- **Adoption**: New users using the expense list functionality with their first new trip.
- **Task Success**: Users successfully tracking a list of expenses.

## Hypothesis

Users will want the most biggest and clearest number for each expense item to be the cost in an equivalent amount in their home currency, rather than the local currency they paid with.

## Experiment

- **Setup**: Use Firebase A/B Testing and remote config to randomly assign 50% of users a version where local currency is focused. and 50% where home currency is focused.
- **Audience**: All users using the app.
- **Tracking with Firebase Analytics**: Track usage data to see which half of users use the expense list more.

## Variations

1. **Control (Home Currency)**:
   - Current layout with the home currency being the primary shown cost for each item.

2. **Variation A (Local Currency)**:
   - Instead of home currency, the currency that was originally used to buy the item is shown as its primary cost.

### Design Work
- **Control Layout**: Existing design, no changes.
- **Variation A (Local Currency)**: Mockup with the local currency replacing the home on the expense item component.
