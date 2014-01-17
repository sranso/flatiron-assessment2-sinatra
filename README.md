ASSESSMENT 2: Sinatra and SQL
PART 1: Sinatra

Create a new github repo called "assessment2_sinatra". Build and push a Siantra application that fulfills the following criteria to this repo.

Criteria:

Has a single model, SpaceCats, with 4 attributes: Name, Home Planet, Tagline, Superpower
Has routes that follow a RESTful convention
Has a view that shows all SpaceCats
Has a view that shows a single SpaceCat
Allows the user to create a new SpaceCat
Stores data in a sqlite3 database
Uses any ORM you'd like (ActiveRecord, DataMapper, Sequel)
Uses either Twitter Bootstrap 2 or 3 as well as a custom stylesheet
Uses placekitten.com to provide a stock image for each SpaceCat
Ensure that your application runs locally and then add the link to your repo here:
  https://github.com/sranso/assessment2_sinatra

Now, answer these questions:

What is Sinatra? Where does it run?
  Sinatra is a simple web application framework that allows users to easily create web apps. Requests are sent from locally, on the client-side, and the server-side evaluates the request and sends a response back to the client.
  - web framework
  - written in ruby
  - runs on server side

What is a Gemfile? How do you use it in your Sinatra Application? Give step by step instructions.
  A Gemfile is where we require the gems we need to make the app run. You have to say on line one where to look for the gems (rubygems.org), and then require the gems you want. If there are gems you know you'll only need for production or development, you can group them so that they are not 'over-required' (no need to require something if you don't need it). Once you save Gemfile, you must run "bundle install" in terminal. This will create a file Gemfile.lock.
  - dependencies
  - must require bundler in app.rb

What is an ORM? What are the basic features of an ORM? Why is it helpful?
  Object-relational mapping. It is a map between objects in our system and the tables in our database. It's helpful because we need a way to talk to the tables in our database--to manipulate and play with them.
  - interface b/t models and db

What is the public folder? What do we use it for?
  Public folder is for things the client side will need, such as images css js webfonts etc.
  - for static assets
  - accessible to broser
  - don't need to define route

What is REST? Why is it useful?
  Representational State Transfer. Is a way to visualize and structure your routes so that they make sense according to what they actually do. So, '/spacecats' should show all of the spacecats because that makes sense logically, RESTfully.
  - convention for routes and resources
  - makes apps predictable and organized

Suppose I, with my browser, send an HTTP get request to the route that will render the view of all the SpaceCats. Walk me through step by step how your application handles that request.
  Request is sent from your browser, the client, to the server. App.rb confirms that yes, there is a route matching the one you requested. Inside the do-end of that get method, there is a line @spacecats = Spacecats.all. This sends the server to the database where it gets all spacecats in the database table and saves them in the local variable @spacecats. Next in app.rb there is haml :index, so the server looks to that file index.haml.html to see what it's supposed to evaulate and render to the client's screen. A string will be returned, which is what ultimately gets printed onto the client's screen.
  - browser > app > model > db > model > app > view > app > browser

PART 2: SQL

Create a database called wizards. The rest of the assesment all will take place in the wizards db.

Create a table called wizards with the following columns (name, age).
  CREATE TABLE wizards (name TEXT, age INTEGER);

Write a statement to count the number of rows in the wizards table. How many wizards are there?
  SELECT COUNT(name) FROM wizards;

Insert a wizard into the database.
  INSERT INTO wizards (name, age) VALUES ("gandalf", 12345644);

Write a statement to count the number of rows in the wizards table. How many wizards are there now?
  SELECT COUNT(name) FROM wizards;
  1

Insert another wizard into the database.

Write a statement to change the second wizards age to 21.
  UPDATE wizards SET age = 21 WHERE name = "voldy";

Write a statement to change all wizards ages to 40.
  UPDATE wizards SET age = 40;

Write a statement to delete the last wizard.
  DELETE FROM wizards WHERE name = "gandalf";

Write a statement to delete the wizards table.
  DROP TABLE wizards;

Create two data models for wizards. The wizards are going to have a name, an age and two powers each. Let's pretend we're in a world where wizards have many powers, but powers belong to one wizard (two wizards cant have the same power) Each power is going to have a name and a damage amount. Write out the sql to create the two schemas and some sample records. What are the costs/benefits of the two approaches? If you only see one way of doing this that's ok. Please explain any potential problems with your approach. What questions can this schema answer easily? What questions can this schema not answer easily?
  see datamodels.sql
  One way creates two tables and they reference each other (wizards has ids to the powers table) ( --> ALTHOUGH I don't think I wrote the ids right... call me let's talk about it <3 ). The other puts all the information in one table, where wizards hold the powers and the wizards info. The downside is the wizards table in the second example is probably a little slower to load because it holds more information, and it holds info that just logically seems like it should be split up. The downside with the first option, though, is that the information is split up where the powers are unique to each wizard, so maybe they should actually be together.

Retrieve all the wizards with powers that have the letter "l" in them.
  SELECT *
  FROM wizards w
  JOIN powers p
  ON w.power_id1 = p.id || w.power_id2 = p.id
  WHERE p.name.include? "l"

Retrieve all the wizards who have a combined damage of 10 or more.

Retrieve all the wizards sorted by their total damage. Your returned data should look like so.. wizard_name, total_damage.

Create a wizard that has no powers.
  INSERT INTO wizards(name, age)
  VALUES ("powerless", 1)

Retrieve all wizards that have no powers.
  SELECT *
  FROM wizards w
  WHERE w.power_id1 == nil && w.power_id2 == nil

Create a data model for wizards for a world where wizards have many powers and multiple wizards can have the same power. Create some sample records.
  see datamodels.sql

Retrieve the first wizard and any powers he/she has with damage greater than 5.
  

What's the difference between an outer and inner join?
  An inner join selects only records from the db tables that have matching values.
  An outer join selects selects all records from the db tables even if they don't have matching values.

If I just write JOIN, is that an inner or outer join?
  INNER

When would I want to use an outer join?
  Could be good when we want to see what entries are missing data that we think they should have.
