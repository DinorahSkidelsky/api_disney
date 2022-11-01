### CHALLENGE BACKEND - Ruby 🚀

Develop an API to explore the world of Disney, which will allow knowing and modifying the characters that make it up and understanding in which movies they participated. On the other hand, you will need to expose the information so that any frontend can consume it.

👉 Use Ruby on Rails.

👉 It is not necessary to assemble the Frontend.

👉 Routes must follow the REST pattern.

Technical requirements:


1️⃣ Database Modeling.

● Character: must have,

○ Image (does not need to be persisted in the database).

○ Name.

○ Age.

○ Weight.

○ History.

○ Associated movies or series.

● Film or Series: must have,

○ Image (does not need to be persisted in the database).

○ Title.

○ Creation date.

○ Rating (from 1 to 5).

○ Associated characters.

● Gender: must have,

○ Name.

○ Image (does not need to be persisted in the database).

○ Associated movies or series.


2️⃣ User Authentication

To make requests to subsequent endpoints, the user must have a token that
you will get when you authenticate. To do this, registration and login endpoints must be developed, which
allow to obtain the token.


3️⃣ List of Characters

The list must show:

● Image (it does not need to be persisted in the database).

● Name.


4️⃣ Character Creation, Editing, and Deletion (CRUD)

The basic operations of creating, editing and deleting characters should exist.


5️⃣ Character Detail

In the detail, all the attributes of the character must be listed, as well as their related movies or series.


6️⃣ Character Search

It should allow you to search by name, and filter by age, weight or movies/series in which you participated.

To specify the search term or filters, they must be sent as query parameters:

● GET /characters?name=name

● GET /characters?age=age

● GET /characters?movies=idMovie


7️⃣ List of Movies

It should show only the image, title and creation date fields.

The endpoint should be:

● GET /movies


8️⃣ Detail of Movie / Series with its characters

It will return all the fields of the movie or series along with the characters associated with it


9️⃣ Movie/Series Creation, Editing and Deletion (CRUD)

The basic operations of creating, editing and deleting movies or series must exist.


1️⃣0️⃣ Search for Movies or Series

It should allow you to search by title, and filter by genre. Also, allow to order the results by date of creation in an ascending or descending way.

The search term, filter or sort must be specified as query parameters:

● /movies?name=name

● /movies?genre=idGenre

● /movies?order=ASC | DESC


1️⃣1️⃣ Sending emails

When registering on the site, the user should receive a welcome email. It is recommended, the use of a third-party service such as SendGrid.

‼ Documentation: It is desirable and optional to document the endpoints using a tool such as Postman or Swagger.
 
