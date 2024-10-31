[HEART Framework](https://docs.google.com/presentation/d/1VOA3YK7CjZVaV2VCq1WkQrhVcTxIawuo-e9mk95e9C0/edit?usp=sharing)

Metric 1 - NPS (Net Promoter Score)

Collection Method: At the end of the "Golden Path" or other major user flows, users are prompted with an NPS question. Their responses (a score between 0–10) are recorded in the backend database. This data is later aggregated to calculate the overall NPS score.
Purpose: Measures user satisfaction and likelihood of recommending the app to others, providing insights into user happiness.

Metric 2 - Adoption

Collection Method: Monitored through Firebase Authentication for successful sign-ups. Every time a user creates an account, a new entry is logged. Additionally, app install data is collected from Firebase and app store analytics for a broader adoption view.
Purpose: Tracks how effectively the app attracts new users and converts them into registered users.

Metric 3 - DAU (Daily Active Users) 

Collection Method: Firebase Analytics provides built-in metrics for DAU and MAU. Daily active user counts are automatically tracked by Firebase based on user session activity.
Purpose: Indicates user engagement by showing how many users actively use the app each day.

Metric 4 - Retention

Collection Method: Firebase Analytics’ retention report shows user retention over time, such as 1-day, 7-day, and 30-day retention. This data is tracked automatically for all user sessions, helping to see how many users return to the app over these timeframes.
Purpose: Measures how often users return to the app, offering insights into long-term user engagement.

Metric 5 - CTR (Click Through Rate)

Collection Method: Custom events in Firebase Analytics are set up for specific points along the Golden Path. For example, if there’s a “Continue” or “Next” button that leads users through a flow, Firebase tracks each click. CTR is calculated by dividing the total clicks by the number of page views for that event.
Purpose: Helps measure user progression through key paths in the app and identifies where drop-offs might occur in the Golden Path
