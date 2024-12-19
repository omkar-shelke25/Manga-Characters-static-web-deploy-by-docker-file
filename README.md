# Manga Characters Static Website

Welcome to the Epic Characters Static Website! This project showcases a static website featuring characters from various popular series. Each character has a dedicated section with information and media.

## Characters Featured

- **Naruto Uzumaki** (*Naruto*)
- **Monkey D. Luffy** (*One Piece*)
- **Eren Jaeger** (*Attack on Titan*)
- **Ryomen Sukuna** (*Jujutsu Kaisen*)
- **Thorfinn Karlsefni** (*Vinland Saga*)
- **Jin-woo Sung** (*Solo Leveling*)
- **Jinx** (*Arcane*)
- **Loid Forger**, **Yor Forger**, and **Anya Forger** (*Spy x Family*)

## Project Structure

- `index.html` - The main landing page for the website.
- `styles/` - Contains CSS files for styling.
- `scripts/` - Contains JavaScript files for interactivity.
- `images/` - Contains images related to the characters.

# Deploying a Static Website with Docker: A Comprehensive Guide

## **Introduction**

Welcome to the Epic Characters Static Website Deployment Guide! This tutorial will walk you through the process of deploying a static website using Docker. We’ll cover every aspect of the Dockerfile and the Docker commands required to containerize and deploy the website, which showcases characters from various popular series. The goal is to provide a thorough understanding of each step involved.

### Prerequisites:
- Basic knowledge of HTML.
- Familiarity with GitHub commands.
- Understanding of Docker commands

Note: Please download the [GitHub repository](https://github.com/omkar-shelke25/Manga-Characters-static-web-deploy-by-docker-file) to your system for reference. The repository contains the static website code and resources needed for deployment.



## **Dockerfile**

```Dockerfile
FROM nginx

WORKDIR /usr/share/nginx/html

RUN apt-get update && \
    apt-get install git -y && \
    rm -rf  * && \
    git clone https://github.com/omkar-shelke25/Manga-Characters-static-web-deploy-by-docker-file.git .

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
```

### **1. Base Image**

```Dockerfile
FROM nginx
```

**Description:**

- `FROM` sets the base image for the Docker container. We use the official Nginx image, which includes a pre-configured Nginx web server.

**Detailed Insight:**

- **Nginx Image**: The official `nginx` image is maintained by Docker and provides a minimal environment with Nginx pre-installed. Nginx is renowned for its high performance and low resource usage, making it a preferred choice for serving static files.
- **Image Layers**: Docker images are built in layers, starting with a base image. Each layer represents a change or addition, such as installing software or copying files.

### **2. Working Directory**

```Dockerfile
WORKDIR /usr/share/nginx/html
```

**Description:**

- `WORKDIR` sets the working directory inside the container. This is where the static files will be served from.

**Detailed Insight:**

- **Purpose**: By setting a working directory, you ensure that all subsequent commands are executed in this context. This is particularly useful for organizing and managing files within the container.
- **Default Nginx Directory**: Nginx serves static files from `/usr/share/nginx/html` by default, so setting this as the working directory aligns with Nginx’s configuration.

### **3. Install Git and Clone Repository**

```Dockerfile
RUN apt-get update && \
    apt-get install git -y && \
    rm -rf * && \
    git clone https://github.com/omkar-shelke25/Manga-Characters-static-web-deploy-by-docker-file.git .
```

**Description:**

- `RUN` executes commands in a new layer on top of the current image. This command updates package lists, installs Git, removes any existing files, and clones the Git repository into the working directory.

**Detailed Insight:**

- **`apt-get update`**: Updates the list of available packages and their versions, but does not install or upgrade any packages.
- **`apt-get install git -y`**: Installs Git, which is necessary for cloning the repository. The `-y` flag automatically confirms the installation.
- **`rm -rf *`**: Deletes all files in the working directory to ensure there are no conflicts with the files being cloned.
- **`git clone <repository-url> .`**: Clones the specified Git repository into the current directory (`.`). The repository contains the static website files.

### **4. Expose Port**

```Dockerfile
EXPOSE 8080
```

**Description:**

- `EXPOSE` informs Docker that the container will listen on port 8080 at runtime.

**Detailed Insight:**

- **Purpose**: `EXPOSE` is used for documentation purposes and to indicate which ports the container will use. It does not publish the port; this is done with the `-p` option when running the container.
- **Default Port**: Nginx typically listens on port 80, but in this setup, we’re using port 8080 to avoid conflicts with other services.

### **5. Command to Run Nginx**

```Dockerfile
CMD ["nginx", "-g", "daemon off;"]
```

**Description:**

- `CMD` specifies the default command to run when the container starts. Here, it starts Nginx in the foreground.

**Detailed Insight:**

- **`nginx -g 'daemon off;'`**: Runs Nginx in the foreground. By default, Nginx runs as a background process (daemon). This command prevents it from detaching, ensuring the container keeps running.

## **Docker Commands Explained**

#### **1. Build the Docker Image**

```bash
docker build . -t manga-v1
```

**Description:**

- `docker build` creates a Docker image from the Dockerfile located in the current directory.

**Detailed Insight:**

- **Context**: The `.` specifies the build context, which is the current directory. Docker sends this context to the Docker daemon, which then builds the image based on the Dockerfile.
- **Tagging**: `-t manga-v1` tags the built image with the name `manga-v1`. This makes it easier to reference the image in subsequent commands.


![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/bnxrx98p7qzf52mjn456.png)

#### **2. Run the Docker Container**

```bash
docker run -dit --name server1 -p 8080:8080 -P manga-v1
```

**Description:**

- `docker run` creates and starts a container from the specified image.

**Detailed Insight:**

- **Detached Mode**: `-d` runs the container in the background (detached mode), allowing the terminal to be freed up for other commands.
- **Interactive and TTY**: `-i` and `-t` keep STDIN open and allocate a pseudo-TTY, respectively. This is useful for debugging and interactive sessions but might not be necessary for this use case.
- **Container Naming**: `--name server1` gives the container a human-readable name. This helps in managing and identifying containers.
- **Port Mapping**: `-p 8080:8080` maps port 8080 of the host machine to port 8080 of the container, making the web server accessible from the host.
- **Automatic Port Mapping**: `-P` maps all exposed ports to random ports on the host. In this case, it’s redundant since we are already specifying port mappings.


![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/tvzdwc55ecrjdjprvh0w.png)

Then final output is...

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/hqgopuk42xn1dxhdj895.png)
### **Summary**

Following these steps will help you containerize and deploy a static website using Docker and Nginx. Docker ensures consistency and ease of deployment across various environments. 





