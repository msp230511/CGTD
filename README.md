# README
## Project Proposal: Custom To-Do List
Team Members: Zhaoyang Liu, Mitch Duerr, Max Spieler, Kaleabe Abera

## Description
We plan to create a custom To-Do list application for ourselves and others who are interested in using it.
We plan on having an iterative agile development process.
First iteration: Planning to achieve basic To-Do list functionality for each user separately.
Second iteration: Planning on enabling team-based To-Do lists for collaborative projects and task history.
Third iteration: Planning on adding additional functionality such as multiple different lists for the same user at later stages, or email notifications with deadlines. Still, we will decide which path to take after completing the second iteration.

## Motivation/ Why this is valuable
Publicly available To-Do lists often require a subscription fee and lack customizability of functionality.
By creating our To-Do app, we will be making an application that we could use ourselves in the years to come and customize as we see fit to match our individual needs.

## Development Roadmap
### Iteration 1
Accomplishing the basic To-Do list functionality with access controls and security protocols:
- The user should be able to go to the website and add items to a To-Do list, adding an entry and saving it.
- The user should be able to remove the items from the To-Do list, indicating success.
- Items should be default ordered by urgency.
- Users should not be able to access others' To-Do Lists. 
- Ensure there is flash feedback, so users know if actions were successful or not.
- User Model with email and password and unique user ID.
- The idea for the Todo-entry-mode structure:
- Entry ID [primary key], User ID [foreign key], [String] Task Name, [Text] Task Description, [String Dropdown] Task Urgency, [Autofilled] Task DateTime Created, [Boolean] Completed
- After completing an item, it should leave the active tasks section and move to a completed tasks state.

### Iteration 2+
Some of the following features may not be implemented in the final version of the product.
- There should be a history with completed tasks listed.
- Users should be able to Edit tasks.
- Users should be able to sort tasks based on features (for example: date created).
- Team Collaboration (Collaborative To-Do list).
- Multiple, different, separate To-Do lists.
- Additional features such as email notifications with deadlines.


## Useful Testing Docs
RSPEC: https://www.theodinproject.com/lessons/ruby-introduction-to-rspec

SIMPLECOV: https://tmtarpinian.com/using-simplecov-for-ruby-tests/