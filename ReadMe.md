# Student Management System

A robust, full-stack web application built using raw Java Servlets and JavaServer Pages (JSP). This project demonstrates a foundational understanding of the Model-View-Controller (MVC) architectural pattern, secure session management, and database integration without relying on heavy backend frameworks.

## Features
*   **Secure Authentication:** Custom login routing with session tracking and a secure logout implementation that invalidates HTTP sessions.
*   **Complete CRUD Operations:**
    *   **Create:** Add new students with backend validation to prevent duplicate Primary Keys.
    *   **Read:** Fetch and display individual student records or render the entire database dynamically using JSTL.
    *   **Update:** Flexible update logic that dynamically alters SQL queries based on which fields the user chooses to modify.
    *   **Delete:** Secure removal of records based on verified Student IDs.
*   **Defensive Backend Routing:** Servlets handle both `GET` and `POST` requests, ensuring users cannot bypass HTML frontend validation.

## Tech Stack
*   **Backend:** Java, Jakarta EE (Servlets)
*   **Frontend:** HTML, CSS, JSP, JSTL (Jakarta Standard Tag Library)
*   **Database:** MySQL (JDBC)
*   **Build Tool:** Maven
*   **Server:** Apache Tomcat (10+)

## Project Structure
The application strictly separates concerns into discrete packages:
*   `Controller/`: Servlets managing request lifecycles and business logic routing.
*   `DB/`: Database connection models and Data Access Object (DAO) methods.
*   `Util/`: Resource management, including JDBC connection handling.
*   `webapp/`: Presentation layer containing graphical JSP dashboards and data views.

## Acknowledgements
*   *Note: AI assistance was utilized during the development of this project specifically for accelerated generation of frontend JSP graphical layouts and for isolating backend routing/debugging edge cases.*