# JSP Servlet Book Store Website Project

## A Bookstore Web Application built using JSP (JavaServer Pages) and backed by a relational database. The website allows users to browse, search for, and purchase books online. The application also includes an admin panel for managing books, orders, and customer reviews.
### Feature:
- Browse Book: Users can view and search for books by categories, title.
- Shopping Cart: Users can add books to a shopping cart, view total price, and process to check out.
- Order Management: Users can place orders, view their order history, and track order status.
- Review: Users can review book.
- Admin panel: Admin can manager books, categories, orders, and view customer reviews.
### Technologies:
- **Frontend**: HTML, CSS(Bootstrap), Javascript.
- **Backend**: JSP, Servlets.
- **Database**: MySQL.
- **Others**: Apache Tomcat (Server), Hibernate (ORM).

### Requirements:
1. Java Development Kit: Version 8 or higher.
2. Apache Tomcat: Version 8.5 or higher. (Download: [Apache Tomcat](https://tomcat.apache.org/download-90.cgi) and extract it)  
3. Eclipse IDE for Java EE Developers. 
4. MySQL 8.0 or higher

### How to install:
1. Clone the Repository
    ```git clone https://github.com/nhd3009/BookStoreWebSite.git```
2. Import the Project into Eclipse
   - Go to File -> Import -> Maven -> Existing Maven Projects
3. Configure Tomcat Server
   - In Eclipse, navigate to the ***Servers*** tab.
   - Add a new Server: Apache Tomcat ***(Version you choose)***
4. Set up MySQL Database.
   - Use MySQL Workbench: ***Server -> Import***
   - Use MySQL command line: Create Database command -> Run command ```source [path-to-dump-file]```
5. Configure the database connection in the proect
   - Edit the persistence.xml to match your MySQL credentials.
6. Run the project
   - Right click the project, select ***Run As -> Run on Server***

### Screenshot
1. Home page:
![image](https://github.com/user-attachments/assets/6df86f9b-955b-49c5-a6a8-928c24da33c3)
2. Browse Books by Categories:
![image](https://github.com/user-attachments/assets/0ef6370d-4ba9-43b4-baba-3297f02a3c9a)
3. Searching Books:
![image](https://github.com/user-attachments/assets/5c1e09c4-c2b2-432f-9dbe-3e997063a376)
4. Book Detail:
![image](https://github.com/user-attachments/assets/aa2044fc-4815-41ef-ad6e-b136b201e510)
5. Review Book:
![image](https://github.com/user-attachments/assets/18a94c6f-997f-4762-bd34-4fd2465f7f40)
6. Shoping Cart:
![image](https://github.com/user-attachments/assets/4e2c3f5b-2939-488e-81af-4b7e0ee866fe)
7. Order Managerment:
![image](https://github.com/user-attachments/assets/ac8ec70d-1ab6-4256-98e9-ed3a5824c5dc)
8. Admin panel:
![image](https://github.com/user-attachments/assets/cbba3ecc-77c2-4b12-ae72-91b6d4b5262d)
9. Books Management (Admin side)
![image](https://github.com/user-attachments/assets/0ba71ed5-1068-4c42-8f88-c09521f37dae)
