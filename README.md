
# Blog-App
This is a Blog App.
## Prerequisits
  * Git
  * Ruby 2.6.3
  * Rails 5.2.8
  * PostgreSQL 14.4
## Clone the Repository and move to project directory
  * git clone https://github.com/iamshahrukhfazal/Rails-Blog-Test-App.git
  * cd Rails-Blog-Test-App
## Install Dependencies
  * bundle
## Environment Variables
  * Open the credentials file with 'EDITOR=vim rails credentials:edit'
  * Provide gmail_smtp variables with values
  * email:
  * password:
## Create and Migrate Database
  * Run the following command to create and migrate the database
  * rails db:create
  * rails db:migrate
## Start the rails server to make the app running
  * Run the following command to start the server
  * rails s
  * Now your server is up and running
  * Go to your browser and go to the following address
  * http://localhost:3000/