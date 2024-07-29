# Online Learning Platform

## Description
A platform for online learning with features for user authentication, course management, and payment integration. This project highlights backend development skills with Laravel and an ability to handle DevOps and testing.

## Technologies
- Laravel: Backend framework to handle routing, authentication, and database operations.
- MySQL: Database for storing user, course, and payment information.
- PHPUnit: For writing unit and integration tests.
- React: For building interactive front-end components.
- Node.js: For managing JavaScript packages.
- AWS S3: For storing course materials and user-uploaded files.
- AWS Lambda: For processing video files and generating thumbnails.
- AWS Cognito: For user authentication and authorization.
- Docker: For containerized environment

## User Stories and Acceptance Criteria

### User Story 1: User Authentication
**As a** user  
**I want to** register and log in  
**So that** I can access the platform

**Acceptance Criteria:**
1. **Given** I am a new user  
   **When** I navigate to the registration page  
   **Then** I should be able to create an account by providing my details and the data should be managed by AWS Cognito.
    - **Unit Test:** Verify that user data is correctly stored in the MySQL database and managed by AWS Cognito.
2. **Given** I am a registered user  
   **When** I navigate to the login page  
   **Then** I should be able to log in using my credentials managed by AWS Cognito.
    - **Integration Test:** Test the end-to-end process of user registration and login, ensuring the data is managed by AWS Cognito and stored in MySQL.
    - **UI Test:** Use Selenium or Cypress to automate UI interactions for registration and login, and verify that the UI updates correctly.
3. **Given** I am logged in  
   **When** I click on "Logout"  
   **Then** I should be logged out and redirected to the homepage.
    - **Integration Test:** Test the end-to-end process of user logout, ensuring the session is correctly terminated.
    - **UI Test:** Use Selenium or Cypress to automate UI interactions for logout, and verify that the UI updates correctly.

### User Story 2: Course Management
**As an** instructor  
**I want to** create, edit, and delete courses  
**So that** I can manage the content I teach

**Acceptance Criteria:**
1. **Given** I am logged in as an instructor  
   **When** I navigate to the "Courses" section  
   **Then** I should see a list of my courses with options to add, edit, and delete.
    - **Unit Test:** Verify that the course list is correctly retrieved from the MySQL database.
2. **Given** I click on "Add Course"  
   **When** I fill in the course details and upload course materials  
   **Then** the new course should be added to my course list and the materials should be stored in AWS S3.
    - **Unit Test:** Verify that the course details are correctly added to the MySQL database.
    - **Integration Test:** Test the end-to-end process of adding a course, ensuring the materials are stored in AWS S3 and the data is correctly managed in MySQL.
    - **UI Test:** Use Selenium or Cypress to automate UI interactions for adding a course and verify that the UI updates correctly.
3. **Given** I click on "Edit" for a specific course  
   **When** I modify the details and upload new materials  
   **Then** the course should be updated in my course list and the new materials should be stored in AWS S3.
    - **Unit Test:** Verify that the course details are correctly updated in the MySQL database.
    - **Integration Test:** Test the end-to-end process of editing a course, ensuring the materials are stored in AWS S3 and the data is correctly managed in MySQL.
    - **UI Test:** Use Selenium or Cypress to automate UI interactions for editing a course and verify that the UI updates correctly.
4. **Given** I click on "Delete" for a specific course  
   **When** I confirm the deletion  
   **Then** the course should be removed from my course list and the materials should be deleted from AWS S3.
    - **Unit Test:** Verify that the course details are correctly removed from the MySQL database.
    - **Integration Test:** Test the end-to-end process of deleting a course, ensuring the materials are deleted from AWS S3.
    - **UI Test:** Use Selenium or Cypress to automate UI interactions for deleting a course and verify that the UI updates correctly.

### User Story 3: Payment Integration
**As a** student  
**I want to** purchase courses  
**So that** I can access premium content

**Acceptance Criteria:**
1. **Given** I am logged in as a student  
   **When** I navigate to the course catalog  
   **Then** I should see a list of available courses with prices.
    - **Unit Test:** Verify that the course catalog is correctly retrieved from the MySQL database.
2. **Given** I select a course to purchase  
   **When** I proceed to checkout and enter my payment details  
   **Then** the payment should be processed, and I should receive access to the course.
    - **Integration Test:** Test the end-to-end process of purchasing a course, ensuring the payment is processed and access is granted.
    - **UI Test:** Use Selenium or Cypress to automate UI interactions for purchasing a course and verify that the UI updates correctly.

### User Story 4: Unit and Integration Testing
**As a** developer  
**I want to** ensure the application is reliable  
**So that** I can maintain high code quality

**Acceptance Criteria:**
1. **Given** I have written code for user registration  
   **When** I run PHPUnit tests  
   **Then** I should see all tests pass, confirming the registration process works correctly.
    - **Unit Test:** Test registration functionality, ensuring user data is correctly stored in the MySQL database and managed by AWS Cognito.
2. **Given** I have implemented the course management feature  
   **When** I run integration tests with PHPUnit  
   **Then** I should see all tests pass, confirming the course management works as expected.
    - **Integration Test:** Test the end-to-end process of adding, editing, and deleting courses, ensuring the data is correctly managed and stored in AWS S3 and MySQL.

## Installation and Setup
### Prerequisites
- Docker (for containerized environment setup)
- Docker Compose (to manage multi-container Docker applications)
- AWS Account (for S3, Lambda, and Cognito services)

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/YahorDubrouski/learning-platform.git
2. Execute the setup script:
   ```bash
   bash setup.sh
3. Look at the output to open the backend and frontend URL's
