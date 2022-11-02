# README
## Project: Custom To-Do List
Team Members: Zhaoyang Liu, Mitch Duerr, Max Spieler, Kaleabe Abera

# FIGMA UI Design Deck
https://www.figma.com/file/cHzFckuABphVBYuj8xSxKP/Untitled?node-id=0%3A1

## CGTD - Todo List - Iteration 1
Group: Zhaoyang Liu, Kaleabe Abera, Mitch Duerr, Maximilian Spieler
Heroku Link: https://protected-sands-05399.herokuapp.com/
GitHub Repo: https://github.com/msp230511/CGTD 
## Overview
To give a reminder of our general vision for this application: We would like to build our own custom Colgate-branded ToDo list application that allows users to share ToDo lists to collaborate with each other. 
For our first iteration of the CGTD [Colgate To Do] Todo List, we focused on implementing the basic CURDI actions and functionalities that we captured in our initial user stories and creating the beginnings of a visually pleasing design for the app. So far, there is a single to-do list that is backed by a todo_entry model, with no user authentication being present.  
Concerning the road ahead, for our next iteration, we plan on implementing user authentication and thus having separate ToDo lists for each user. We also plan on allowing users to create multiple separate ToDo lists, as well as edit, archive or delete these lists. This will likely require the creation of a <user> model and a <todo_list> model. The specifications for Iteration 2 may still change depending on the team development discussions we will have at the beginning of our next iteration. We may already implement ToDo list sharing and user collaboration in iteration 2, but we may also keep this for iteration 3.

## Responsibilities of Contributors for Iteration 1
GitHub Project Tracker: https://github.com/users/msp230511/projects/1/views/3
Each of us wrote the cucumber tests related to our area of specialty, i.e., every team member contributed at least one core app functionality and wrote the test code for it. 
The repo’s commit history does not necessarily reflect the full contribution of all members, since we sometimes had to revert several commits, and someone else ended up committing another person's new code in their own latest commit. We also pair programmed. 

### Zhaoyang Liu - Index Page
Zhaoyang’s primary CRUD-related responsibilities were the creation of the index page and the main homepage of the Todo list app. 
Zhaoyang first created a sketch of the app design to guide our development process toward a common goal. This visual, informed by our user stories, then informed our development and design process. https://www.figma.com/file/cHzFckuABphVBYuj8xSxKP/Untitled?node-id=0%3A1 He also wrote extensive documentation for the initial UI draft: https://docs.google.com/document/d/1EqyK5M48_DHm-hHImd5ZjXndZaCDvFxdcDjCdVGpzmU/edit 

### Kaleabe Abera - Show Functionality 
Kaleabe ’s primary CRUD-related responsibilities were the creation of the show functionality and show page, to allow users to view todo-entries in a focused/detailed view. 
### Mitch Duerr - Create/ Edit
Mitch’s primary CRUD-related responsibilities were the creation of the edit and create functionality to allow users to make new todo-entries and edit them.

### Maximilian Spieler - Complete/ Reactivate/ Delete & Infrastructure
For the first iteration, Max focused on setting up the development environment for the team and maintaining it, including the GitHub Project Page. He also set up the testing environments and gemfile. 

Max's primary CRUD-related responsibilities were the creation of the complete and reactivation functionality for tasks, allowing users to complete a task without deleting it and reactivating it if the task became relevant again, as well as the deletion functionality, which allows users to permanently delete a task without completing it if it is not relevant anymore. 


