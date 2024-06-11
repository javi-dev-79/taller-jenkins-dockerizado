Repository for the "Jenkins: Herramientas para exprimir nuestro código" course from OpenWebinars.

Unlike the teacher, who uses a virtual machine with Vagrant, the application has been dockerized here.

---

# Compilation and Execution

### Compile

```bash
> make
```

### Run the code

```bash
> ./is_armstrong_number
```

### Clean

```bash
> make clean
```

---


# Jenkins Exercises

This repository contains a series of exercises to practice with Jenkins, including the installation and configuration of specific plugins.

## Requirements

To complete these exercises, you need to have Docker installed. Jenkins will run in a Docker container. Additionally, you need to install the following plugins:

- **HTML Publisher**: Allows publishing HTML reports generated during the execution of Jenkins jobs.
- **Warnings**: Helps capture and display warnings generated during the project build process.

## Setting Up Jenkins with Docker

Follow these steps to set up Jenkins using Docker:

1. Ensure Docker is installed on your machine. You can download Docker from [docker.com](https://www.docker.com/get-started).

2. Clone this repository:
    ```sh
    https://github.com/javi-dev-79/taller-jenkins-dockerizado.git
    ```

3. Start the container using Docker Compose:
    ```sh
    docker-compose up
    ```

4. Open your web browser and go to `http://localhost:9080` to access Jenkins.

5. After launching the application with 'docker-compose up' the password will be shown in the logs. Follow the initial setup instructions and install the recommended plugins. 

## Installing Required Plugins

1. In Jenkins, navigate to `Manage Jenkins` > `Manage Plugins`.
2. In the `Available` tab, search for and select the following plugins:
    - **HTML Publisher**
    - **Warnings**
3. Click `Install and restart`.

## Installing Required Dependencies

Follow these steps to install the required dependencies inside the Jenkins Docker container:

1. Open a shell in the Jenkins container as the root user:
    ```sh
    docker exec -it -u root new_jenkins /bin/bash
    ```

2. Update the package lists:
    ```sh
    apt-get update
    ```

3. Install the necessary packages:
    ```sh
    apt-get install -y doxygen dot2tex graphviz git nano vim
    ```

4. Install cmocka:
    ```sh
    apt-get install libcmocka0 libcmocka-dev
    ```

5. Clone the repository inside the container:
    ```sh
    git clone https://github.com/javi-dev-79/taller-jenkins-dockerizado.git /taller-jenkins-dockerizado
    ```

6. Change the ownership of the cloned repository to the jenkins user:
    ```sh
    chown -R jenkins:jenkins /taller-jenkins-dockerizado
    ```

7. Change the permissions of the cloned repository to allow full access:
    ```sh
    chmod -R 777 /taller-jenkins-dockerizado
    ```

8. Navigate to the cloned repository directory:
    ```sh
    cd /taller-jenkins-dockerizado
    ```

9. Update the package lists again and install additional required packages:
    ```sh
    apt-get update && apt-get install -y build-essential cppcheck
    ```

10. Clean the apt-get cache:
    ```sh
    rm -rf /var/lib/apt/lists/*
    ```

11. Run cppcheck on the C files in the repository:
    ```sh
    cppcheck *.c --enable=all --inconclusive --language=c *.c
    ```

## Exercise

1. Create a new task:
2. Enter an item name and select "Pipeline".
3. Press Ok.
4. In the "Pipeline" section, select "Pipeline script from SCM" under "Definition".
5. In "SCM", select Git.
6. Paste the repository URL in "Repository URL".
7. Specify the branch in "Branch Specifier (blank for 'any')".
8. In "Script Path", choose the Jenkinsfile from the repository. In this case, the file is named "Jenkinsfile".
9. Press "Apply" and "Save".
10. Press "Build Now".

## Exercise result

The Jenkins pipeline executed the following tasks:

1. Repository Cloning: The pipeline clones the specified repository in the Jenkins file.

2. Documentation generation: Using Doxygen, the channel generates documentation for the project.

3. Documentation archiving: the generated documentation is archived in a ZIP file called documentation.zip.

4. Static analysis: The pipeline performs static code analysis using cppcheck, which identifies problems in the code.

5. Quality gate evaluation: The quality gates defined in the Jenkins file have been evaluated and the result will be displayed, based on the number of files detected.

This exercise demonstrates automating repository management, documentation generation, and code analysis using Jenkins and tools such as Doxygen and cppcheck.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.


Thank you for your interest in these Jenkins exercises!
