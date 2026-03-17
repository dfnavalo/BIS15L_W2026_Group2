# BIS15L_W2026_Group2
Daniella - dfnavarrolopez@ucdavis.edu
Ale Murillo-Umanzor - ammurilloumanzor@ucdavis.edu
Aaliyah - axaali@ucdavis.edu

Data: Surgery Timing
Sessler et al. “Operation Timing and 30-Day Mortality After Elective General Surgery”.
Anesth Analg 2011; 113: 1423-8.

This project analyzes whether surgery timing is associated with patient outcomes using 
data from 32,001 elective general surgery patients treated at Cleveland Clinic between 
2005 and 2010.

Research Question
Does the timing of surgery (hour, day of the week, month, or moon phase) affect 30-day patient 
mortality rates?

Dataset Description
- Source: Sessler et al. (2011)
- Study Type: Retrospective cohort study
- Sample Size: 32,001 patients
- Setting: Cleveland Clinic (2005–2010)

The dataset includes:
- Patient demographics (age, gender, race, BMI)
- Health conditions (comorbidities such as diabetes, cardiovascular disease, etc.)
- Surgical risk indices

Timing variables:
- Hour of surgery
- Day of the week (dow)
- Month
- Moon phase

Outcomes:
- 30-day mortality (mort30)
- In-hospital complications
Most variables are complete, with minimal missing data (only BMI has some missing values) .

Key Variables
Some important variables used in our analysis include:
- hour → time of surgery (6 AM – 7 PM)
- dow → day of week (1 = Monday, ..., 5 = Friday)
- month → month of surgery (1 = January, ..., 12 = December)
- moonphase → phase of the moon (new moon, first quarter, full moon, last quarter)
- mort30 → 30-day mortality (0 = No, 1 = Yes)

Methods
We used R and the tidyverse package to clean, analyze and visualize the data.

Our analysis included:
- Grouping data by time-related variables (hour, day, month, moon phase)
- Calculating mortality rates for each category
- Creating visualizations (bar plots) to compare mortality across groups
- Exploring patterns to determine which timing is associated with better or worse outcomes

Shiny App
We developed a Shiny app to allow users to interactively explore how surgery timing relates to 
mortality.

Features:
- Select a time variable (hour, day, month, or moon phase)
- View mortality rates across categories
- Compare trends in patient outcomes

Results
Our analysis suggests that certain times, such as later hours of the day and the end of the 
workweek, show slightly higher mortality rates. However, these differences are small, indicating
that while timing may have some influence, other factors like patient health and type of surgery 
likely play a larger role.

Conclusion
Surgery timing shows slight variation in mortality outcomes, but it is not a strong predictor on 
its own. Other clinical factors are likely more important in determining patient outcomes.

