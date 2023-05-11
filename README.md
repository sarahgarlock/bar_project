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

[ ] done

User Story 1, Parent Index Show ALL records of one model

For each parent table
As a visitor
When I visit '/bar'
Then I see the name of each parent record in the system
[ ] done



User Story 2, Parent Show 

As a visitor
When I visit '/parents/:id'
Then I see the parent with that id including the parent's attributes
(data from each column that is on the parent table)