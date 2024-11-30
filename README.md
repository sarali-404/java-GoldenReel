
Setting Up the Project:

Clone the repository into your local machine.
Copy the contents of the src folder into your Eclipse project's src/main/java directory.
Add the .jar files from WebContent/WEB-INF/lib to your project's build path.
Add the relevant JSP files from the jsp/ folder to the webapp folder of your project.
Ensure the JSP files are placed in the correct location for your web application to function properly.

Database Setup:

Use the SQL file in the sql folder (cinema_db.sql) to set up the database in MySQL.
Update the DBConnect.java file in util/ with your local database connection details (e.g., username, password, database URL).


Running the Project:

Import the project into Eclipse as a dynamic web project.
Ensure your database server is running and the connection is configured correctly in DBConnect.java.
Deploy the project on a server like Apache Tomcat and run it.
Once you successfully run your part of the project:
Upload the updated JSP files to the jsp/ directory in the repository.
Upload the updated Java files to their respective folders in the src director
