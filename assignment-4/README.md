# Assignment 4

The creative idea I have used for this assignment is a database that documents a class of kids and their pets, including the pet type, name and age. You can then use the API to access the information to find out what pets there are in the class or to add new students or pets to the database, or to change the age of the pets each year.


## To use my API

When you clone my repo you will see that I have created a .env_EXAMPLE file for you to use to fill in your own details. You can copy this file and rename it to .env with your own details in for you to use.
Then you can
npm install 
This should look at all the packages that are on my json and install them all for you.
Otherwise, the external libraries you will need to install include:
>npm install express

>npm install cors body-parser

>npm install mysql2@latest

>npm install dotenv

Once you have everything installed you can then
>npm start

This should be running on Port 8000. To check this you can go onto 
http://localhost:8000 on your browser and you should see the message "Welcome to the Classroom Pets API!"

### Get Request

You can use the first get request to access all of the data from the Classroom_pets table.
To do this you go onto Postman, change the dropdown to GET and add the link: http://localhost:8000/Classroom_pets

You can then click on body and select 'raw', making sure that it is specified as JSON.
You can then click 'Send', and in the results you should see all of the data from the Classroom_pets table in the sql database, as shown below.

![alt text](<Screenshot 2024-07-02 at 21.23.49.png>)

### Post Request

You can use the post request to add more data to the table in our database. For example, you could use this if there was a new child in the class that you wanted to include in the data or if another child has a new pet.

In order to use this post request you need to go onto postman and change the dropdown from GET to POST. You are still using the same table so you can keep the http link the same. This time you can enter the values that you want to add to the database as shown below.

![alt text](<Screenshot 2024-07-02 at 21.01.09.png>)

When you click 'Send' this should produce
"message": "New pet added"

You can then go onto sql and check the table on your database to see if the new data has been successfully added into your table, as shown below. From this you can see that "Samantha" has successfully been added.

![alt text](<Screenshot 2024-06-30 at 21.30.55.png>)

### Delete Request

To use the delete request, when the server is running, go onto postman and change the dropdown to 'DELETE'.
Then in the URL add a "/123" with 123 being whatever the id is of the data you want to delete. 
For example, if I delete the "Samantha" child that I just added, I can use the URL
http://localhost:8000/Classroom_pets/137

![alt text](<Screenshot 2024-07-02 at 22.51.54.png>)

When you press 'Send' you should recieve this message:

![alt text](<Screenshot 2024-07-02 at 22.52.55.png>)

You can then check your database on sql to see if the data has successfully been deleted.

![alt text](<Screenshot 2024-07-02 at 22.53.57.png>)


I hope you enjoy using my API.