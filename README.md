# Teams
A football app built with Symfony 6 and Vue.js.

## Prerequisites
Before you begin, ensure you have the following software installed on your PC:

- Git: https://git-scm.com/downloads
- PHP (7.4 or higher): https://www.php.net/downloads
- Composer: https://getcomposer.org/download/
- Node.js and npm: https://nodejs.org/en/download/

## Installation and Setup
1. **Clone the repository:**
Open your terminal or command prompt and navigate to the desired directory where the project will be cloned. Run the
following command:
-git clone https://github.com/mosesegboh/teams.git


2. **Navigate to the project directory:**
After cloning the repository, navigate to the project directory by running:
- cd teams


3. **Install PHP dependencies:**
Run the following command to install the required PHP dependencies for your Symfony 6 application:
- run composer install


4. **Install JavaScript dependencies:**
Run the following command to install the required JavaScript dependencies for your Vue.js frontend:
- run npm install


5. **Configure the environment:**
Copy the `.env.example` file to create a new `.env.local` file, which will store your local environment variables:
- run mv .env.example .env.local
- Edit the `.env.local` file to configure any necessary variables, such as database connection settings, API keys, 
or other configurations specific to the local environment.


6. **Set up the database (if applicable):**
- To make things easier I have also attached my database file in the database/dump/teams.sql dir from the root directory of the project.
  just import this into your database and use accordingly.
- php bin/console doctrine:database:create
- php bin/console doctrine:migrations:migrate
- Run migrations to create the necessary tables.


7. **Compile FE assets**
- Run npm run dev or encore dev to compile FE assets for the vuejs FE.


8. **Run the development servers:**
Start the development server by running:
- symfony server:start


9. **Run Test:**
All tests has been written and passed on my local env so just run the below command to run the tests:
- php bin/phpunit


# Points and Reasons For Some functionality decisions made regarding the application
- Regarding the application, since one of the requirements stated 'Treat the task as a full-fledged project.', I tried 
  as much as possible to apply SOLID, DRY principles and proper design patterns because I feel it will allow for better 
  maintainability, re-usability and testability.

- Also, One of the requirements of the test stated 'Make a page where we can add a new team and its players.', which 
  in my interpretation, can mean the loggedin user does not have to be a member of the team and any loggedin user can 
  sell/buy players on behalf of the teams which is what was implemented. Could have done otherwise if the question 
  demanded so.

- Furthermore,one of the requirements of the team stated that 'Make a page where we can add a new team and its players.' 
  ,I intentionally didn't make an alternative functionality where the user could add existing players when adding new 
  players because players were meant to be bought/sold,so adding an existing player to a new Team without a transaction
  will not be functional in the real world. Therefore,a new Team should not be able to add a player that is already in a
  team.

- All features has been added regarding the test requirements and unnecessary features were intentionally omitted due to
  time constraints.
 
- The application works fine in my on my local environment, and all test passed so kindly let me know if you are 
  experiencing any errors.
