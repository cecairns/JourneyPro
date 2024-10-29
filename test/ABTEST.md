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

This A/B test measures the Happiness metrics. This test aims to gauge user satisfaction and the overall experience with the new homepage layout.
Hypothesis: A layout change on the homepage to give a less overwhelming UI. This change aims to better capture user interest and promote further exploration compared to the original layout. It moves the add trip button above the map unlike it's prior where it was below. This will tell us which users prefer as they will allow users to select areas of interest and make the page easier to read. 

## Hypothesis 

## Problem Statement

## Experiment

This A/B test will run for the next 3 days to gather data across the metrics (click through rate, time spent on homepage, navigation to other pages, bounce rates and exits from homepage). The winning variant will be based on the statistically significant improvement in whichevers click-through rates and time spent on the homepage. 

## Variations
- Control (A): Current design - has the 'Upcoming Trips' label above the map. 'Add Trips' font not bolded. Feels cramped due to little spacing.
-  Variant (B): New design - 'Upcoming Trips' label moved below the map. The 'Add Trips' font is now bolded to make it more prominent for users to see. Added a bit more spacing. 


