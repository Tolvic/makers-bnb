# makers-bnb
A Makers challenge to create an Air BnB clone. The goal of this challenge was for us to experience working in a team, to create work flows and to follow agile practices. Ultimately, we did not finsh the week with a working solution but we that was not the goal of the week.  

## Specifications

### Headline specifications
* Any signed-up user can list a new space.
* Users can list multiple spaces.
* Users should be able to name their space, provide a short description of the space, and a price per night.
* Users should be able to offer a range of dates where their space is available.
* Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
* Nights for which a space has already been booked should not be available for users to book that space.
* Until a user has confirmed a booking request, that space can still be booked for that night.

### Nice-to-haves
* Users should receive an email whenever one of the following happens:
  * They sign up
  * They create a space
  * They update a space
  * A user requests to book their space
  * They confirm a request
  * They request to book a space
  * Their request to book a space is confirmed
  * Their request to book a space is denied
* Users should receive a text message to a provided number whenever one of the following happens:
  * A user requests to book their space
  * Their request to book a space is confirmed
  * Their request to book a space is denied
* A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
* Basic payment implementation though Stripe.


## User Stories
```
1
As a user (landlord)
so that i can have an account
I want to be able to sign up for Makers bnb

2
As a user
So that only I can list/rent a space
I want to log in to Maker's BnB

3
As a user
So that I can avoid others listing/renting as me
I want to log out of Maker's BnB

4
As a user (landlord)
so that i can rent out my space
I want to be able able to list a new space

5
As a user (landlord)
so that i can rent out multiple spaces
I want to be able able to list multiple spaces

6
As a user (landlord) who has listed a space
so that can provide additional info on my space
I want to be able to name my space

7
As a user (landlord) who has listed a space
so that can provide additional info on my space
I want to be able to provide a short description of the space

8
As a user (landlord) who has listed a space
so that can provide additional info on my space
I want to be able to list a price per night.

9
As a user (landlord)
so that my listing availability is clear to renters  
I want to set a range of dates where my space is available.

10
As a user (renter)
so that i can book a space for a night
I want to request to hire a space for one night

11
As a user (landlord)
so that I can rent my space out
I want to be able to approve a request to rent a space

12
As a user
so that spaces are not double booked
I want to see that the space is not available for dates it has already beed booked

13
As a user (landlord)
so that i do not lose potential renters
I want my space to still be available for booking requests until I approve one


```

## Set up
* bundle - to install dependent gems
* use homebrew to install Postgres sql


```
brew install postgresql
```

Allow Homebrew to start and stop the Postgres service

```
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

Connect to psql
Create the database using the psql command

```
CREATE DATABASE makers_bnb_db;
```

* Connect to the database using the pqsl command

```
\c makers_bnb_db;
```

* Run the query in the sql files contained within the db folder

* Repeat these steps but create a database called makers_bnb_db_test
