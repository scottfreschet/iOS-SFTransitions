# SFTransitions
This project shows how to create annimations from one viewController to another.

## Overview
This projects shows how to create annimations. The model - which is used throughout the application - is as follows:

1. Handle a touch event
2. Save a picture of the views on screen (i.e. the screenshot)
3. Transition to another viewController, sending the previously mentioned screenshot to the new viewController via a NSNotification
4. In the new viewController, make sure you register for the NSNotification you are sending and then appropriately use the screenshot pass along to simulate the transition.
