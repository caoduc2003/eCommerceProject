# eCommerceProject
This project is an e-commerce web application called Buylicious which is built on the Java Servlet platform

## Installation

**Software requirement:** Apache Tomcat 10.0.27, SSMS 19, SQL Server 2022,  Apache Netbeans 13 or later, IntelliJ IDEA

**Libraries:** Since this is a Maven project, all required libraries have been imported into pom.xml. You just have to deploy project and run.

**Database:** You will download script [here](https://drive.google.com/file/d/1e3FOU2VIK77_Umqjj839ZsSrBdO6B8cz/view?usp=sharing) and execute it to create a database with previously added values for the operation of the web application.

You can clone this project to run localhost from your machine via:

HTTPS

    https://github.com/caoduc2003/eCommerceProject.git
or

Github CLI

    gh repo clone caoduc2003/eCommerceProject
    
## Usage
   
**Step 1:**  Change your SQL account to make a connection to the database at `src/main/java/com/ecommerce/utils/DBContext.java`
   
**Step 2:** Execute the **script.sql** you have downloaded before.
   
**Step 3:** Add project to one of IDEs in **Software requirement** which I've listed above.
   
**Step 4:** Run the project, you can register a new account or use an existing account in the database to log in (All login information is saved in the Users table).

*Note: Due to security reason, I have to hide client id and client secret key and "login/register with Google" feature will not available, if you want to test this feature, please contact me to get these keys: email: ducldc@jsclub.dev or ducldche176120@fpt.edu.vn*

   

