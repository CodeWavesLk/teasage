# teasage

Tea Sage

TeaSage is an advanced web application designed for tea farmers to diagnose tea leaf diseases
and recommend appropriate fertilizers. It leverages machine learning for disease
classification and provides actionable insights through a user-friendly interface.

#Project Structure

● Backend: Symfony (PHP)

● Frontend: React (integrated using Symfony Webpack Encore)

● Machine Learning Model API: FastAPI (Tensoflow)

● Database: MySQL

#Features

● Tea Leaf Disease Prediction:

  ○  Uses a Convolutional Neural Network (CNN) model to identify diseases in tea
leaves.

● Fertilizer Recommendation:
  ○ Based on the predicted disease, appropriate fertilizers are suggested.

● React Frontend:
  ○ A user-friendly interface for farmers to upload images and view predictions.

● REST API:
  ○ Facilitates communication between the frontend and backend.
Technologies Used

● Symfony: Backend framework for handling the business logic and API endpoints.

● React: Frontend library for building the user interface.

● FastAPI: Handles the machine learning model for tea disease classification.

● MySQL: Database for storing information.

● Keras/TensorFlow: Machine learning libraries used for training and serving the CNN
model.

Project Setup

1. Clone the Repository

2. Backend Setup (Symfony)

  a. Install Dependencies
      Composer install

  b. Install Frontend Dependencie
      npm install

  c. Database Configuration
      Update the .env file with your MySQL credentials:
      DATABASE_URL="mysql://username:password@127.0.0.1:3306/teasage_db"

  d. Run Migrations

      php bin/console doctrine:database:create
      php bin/console doctrine:database:create php bin/console
      make:migration php bin/console doctrine:migrations:migrate

  e. Run the Application

Npm run watch

3. Machine Learning API Setup (FastAPI)

  a. Navigate to the FastAPI Directory
      cd fastapi/

  b. Set Up a Virtual Environment
      python3 -m venv venv
      source venv/bin/activate

  c. Install Dependencies
      pip install -r requirements.txt

  d. Run the application

4. Add Api url with “/predict” to the symfony project and then run the symfony code
