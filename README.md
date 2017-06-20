# Introduction

This mobile application is intended for seminar moderators and presenters to
ensure that an individual talk is given on time to keep the overall event on
schedule.

This application moves through several phases to indicate the status of the
talk:

1. (Green) Talk Time: this is the time the speaker should be addressing his or
   her topic,
2. (Yellow) Wrap Up: the screen changes color to indicate that the speaker is
   approaching the end of the alloted time,
3. (Red) Overflow / Q&A: the screen changes color again to indicate that the
   talk has finished and any additional time spent is either overage or
   consuming question & answer time.  The timer also begins to count back up
   from zero to indicate how much additional time is being spent.

The basic design goals, in no particular order, are:

1. Simplicity: all the settings and controls on one screen,
2. Unintrusive: no audible alarms,
3. Availability: the screen does not "blank" when active,
4. Minimal dependencies: it's a timer, it shouldn't depend on anything else.

# Basic Operation:

1. Set the Talk Time, the total time that the speaker is expected to
   present,
2. Set the Wrap Up time, how long before the conclusion of the talk time to
   signal the speaker to begin concluding the talk
3. Press Start.

For example, a common talk format is 15 minutes for the talk and 5 minutes for
questions and answers giving each speaker 20 minutes total "on stage."  The
Seminar Timer application could be set for a Talk Time of 15 minutes and Wrap Up
time of 3 minutes.  In this instance, the application will be green from 0–12
minutes, yellow from 12–15 minutes, and will then go "red" at 15 minutes signalling that the speaker is overtime and must stop.  These
stages are shown below.

![Application Stages](include/readme_screen_progression.png)
