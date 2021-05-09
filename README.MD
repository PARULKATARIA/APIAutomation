What is this Project all about?
This project shows how we can test the APIs for PetStore project.
PetStore API's : https://petstore.swagger.io/


Why Karate,Maven,JUnit?
Karate is an open-source tool by Intuit.It can be used to do API automation testing and performance testing.Karate is built on 
top of Cucumber, another BDD testing framework, and shares some of the same concepts. One of these is the use of a Gherkin file, 
which describes the tested feature. However, unlike Cucumber, tests aren't written in Java and are fully described in the 
Gherkin file.
Maven is the build tool which makes it easier to compile the project and execute test cases.
JUnit is the test framework which can be extremely helpful for executing test cases.

What is the setup process? 
Please make sure that you have eclipse IDE installed.
Please make sure that you have Java & Maven installed and path configured for both on your system.Please have cucumber 
eclipse plugin installed which will be used to open in the feature files in gherkin format.

Once you have imported the project in eclipse please follow the following steps:
1.Go to command line
2.Execute the following maven command(inside the project folder where pom.xml file is located): 
mvn clean install -DskipTests

How can I run tests from command line?
Execute the following maven command(inside the project folder where pom.xml file is located): mvn test

How can I run tests in case I am using eclipse as IDE?
Choose "Run as" --> Maven test
Choose "Run as" --> Junit test

Where can I see the test results report?
Karate Report ----> /RestAPIAutomation/build/reports/karate-reports/io.swagger.petstore.karate.features.petStore.html
Cucumber Report ---> /RestAPIAutomation/build/reports/karate-reports/cucumber-html-reports/overview-features.html