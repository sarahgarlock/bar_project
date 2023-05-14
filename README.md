# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
Bar can have many kegs
Table -> bar
-auto-generated ID (PK)
-name:string
-city:string
-tap_quantity:integer
-overnight_delivery:boolean
-created:datetime
-updated:datetime

Kegs belong to a Bar
Table -> kegs
-auto-generated ID (PK)
-bar_id:integer (FK)
-name:string
-type:string
-ordered:boolean
-abv:integer
-ibu:integer
-price:integer
-created:datetime
-updated:datetime

User Story 1, Parent Index Show ALL records of one model

For each parent table
As a visitor
When I visit '/bars'
Then I see the name of each parent record in the system<br>
[X] done

User Story 2, Parent Show 

As a visitor
When I visit '/bars/:id'
Then I see the parent with that id including the parent's attributes
(data from each column that is on the parent table)<br>
[X] done

User Story 3, Child Index 

As a visitor
When I visit '/kegs'
Then I see each Child in the system including the Child's attributes
(data from each column that is on the child table)<br>
[X] done

User Story 4, Child Show 

As a visitor
When I visit '/kegs/:id'
Then I see the child with that id including the child's attributes
(data from each column that is on the child table)<br>
[X] done

User Story 5, Parent Children Index 

As a visitor
When I visit '/parents/:parent_id/child_table_name'
Then I see each Child that is associated with that Parent with each Child's attributes
(data from each column that is on the child table)<br>
[X] done

Active Record

User Story 6, Parent Index sorted by Most Recently Created 

As a visitor
When I visit the parent index,
I see that records are ordered by most recently created first
And next to each of the records I see when it was created<br>
[X] done

User Story 7, Parent Child Count

As a visitor
When I visit a parent's show page
I see a count of the number of children associated with this parent<br>
[X] done


User Story 8, Child Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Child Index<br>
[ ] done

User Story 9, Parent Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Parent Index<br>
[ ] done

User Story 10, Parent Child Index Link

As a visitor
When I visit a parent show page ('/parents/:id')
Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')<br>
[ ] done