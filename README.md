# Sample project for non-activating panel issue

## Problem
When showing NSPanel (with .nonactivatingPanel style) without activating the application, mouse cursor doesn't change over areas such as text fields, text areas or links. E.g. if mouse is over a text field, mouse cursor should change to I-beam. Manually changing cursor using NSCursor.iBeam.push() doesn't work as well. There are examples of other apps that somehow worked around it:
* Spotlight - if I invoke spotlight search bar and mouse over it, the cursor will change to I-beam.
* 1Password Helper (see attached screenshot) - the app is not being activated, but the panel have proper i-beam cursor over the search field. 

## Repro steps
In the attached project, I'm showing a simple non-activating NSPanel, similar to Spotlight.
1. Open NonActivatingPanelIssue project and run
2. When the window shows up, observe that since the application is active, mouse cursor changes to I-beam when over the text field
3. Press 'Option + Space' to hide the panel. The app is not active now.
4. Press 'Option + Space' again to show the panel again.
5. Move mouse over the text field and observe that cursor stays an arrow no matter what

Expected behavior: There should be a way for making cursor behave normally when using non-activating panel.
