# Computer Science Email Archive Development Documentation

## Status

Hi! Our project was an email archive to act as a widely viewable recipient of Sam's CSC mailing list. 
Anybody with a grinnell email could make an account and look through the archive. In its current 
version, the archive supports search by dynamically added tags, string matching in the author, subject, 
and content field, and date. There is limited documentation in the actual code. 


## User Authentication

Our account registration is handled with Devise. 

## Message Model

The message model has several fields- author, subject, content, created_at, and updated_at. The tags
are included through a tagging gem, acts_as_taggable_on, which is accessed through GET requests. You 
can look at the fields under Schema.rb. Attachments are currently not supported.

## Gmail Server and Retrieval

We retrieve emails by popping them from a gmail server at regular intervals. Our gmail server is
csc322emailarchive@gmail.com. It is the same server that processes Devise users. 

Emails are only popped if they come from an authorized source, and emails without grinnell.edu 
domains are automatically rejected. 

## Tagging

Tagging is handled with a gem called acts_as_taggable_on. Tags are not actually message fields, 
but are associated with message objects. Tags can be added dynamically, and every tag in the 
archive is represented on the search page. Professors can add tags by adding square tags at the 
beginning of the subject field of their emails. The tags are then added to the message and stripped 
from the subject field as the message is entered into the database. 

Any tag can be accessed through a get request. To process a GET request for the tag CS Table,
enter the URL /messages?tag=CS Table. For Both tags CS Table and Internship, enter URL 
/messages?tag=CS Table, Internship. At the moment, there is no way for users to enter several 
tags beyond typing them in manually. Tags can be supplemented with searches, but in the same way-
only by manually entering the URL themselves. This seems like a clear place to improve on the 
existing archive. 

## Search

We use the gem called Ransack, which allows us to search every message field- are subject, content, author, and created_at.
tagged_with. 
For the tags, since tag is not a field of message, we use acts_as_taggable_on to which contains a method that allows us to search by tags.

## Layout and Other Details

After a user is authenticated, they are taken to the home page or root directory. There are search bars, 
all existing tags, and a "Newest Messages" button. The search bars and tags filter by search results, 
and to see the full archive simply click on the "Newest Messages" button. 

The "Newest Messages" button takes users to the /messages/ page, where archived emails are actually 
rendered. Ten emails are rendered per page, with most recent emails at the top (if the order isn't perfect,
it's because emails are sorted according to when they're popped from Gmail and added to the archive, not 
necessarily when they're sent). Pagination works with search results and with tagging. 

The bodies of emails are shortened according to the program at 