# 05. Infrastructure and Deployment Guide

This document describes the cloud infrastructure and deployment process for the Cackle backend.

## 5.1. Overview

- **Technology:** Terraform is used for Infrastructure as Code (IaC).
- **Cloud Provider:** Amazon Web Services (AWS).
- **Deployment Target:** The containerized FastAPI backend is deployed to AWS Elastic Container Service (ECS).

All Terraform code is located in the `/infrastructure` directory.

## 5.2. Core AWS Resources Managed by Terraform

The Terraform configuration will provision the following key resources:

1.  **VPC (Virtual Private Cloud):** A dedicated and isolated network environment for the application.
2.  **Application Load Balancer (ALB):** A public-facing load balancer that receives incoming HTTPS traffic and routes it to the ECS service.
3.  **ECS Cluster:** A logical grouping of ECS services and tasks.
4.  **ECR (Elastic Container Registry):** A private Docker container registry used to store the backend's Docker images.
5.  **ECS Task Definition:** A blueprint that describes how to run the application container. It specifies the Docker image to use, CPU/memory allocation, and container port mappings.
6.  **ECS Service:** A service that maintains a specified number of running instances of the Task Definition. It ensures the application is running and handles tasks like auto-scaling and registering tasks with the ALB.
7.  **Security Groups:** Acts as a virtual firewall to control inbound and outbound traffic to the ALB and ECS tasks.

## 5.3. Deployment Workflow

Deploying a new version of the backend is a multi-step process that involves both building a new container image and applying Terraform changes if necessary.

### Step 1: Build and Push the Docker Image

Before a new version of the application can be deployed, it must be packaged into a Docker image and pushed to the ECR repository.

1.  **Define the Container:** A `Dockerfile` in the `/backend` directory contains the instructions for building the image. It copies the application code and installs dependencies.

2.  **Build the Image:** Use the `docker build` command to create the image.
    ```bash
    # Example build command
    docker build -t <your-ecr-repo-uri>:<image-tag> ./backend
    ```

3.  **Authenticate and Push:** Authenticate your Docker client with the AWS ECR registry and push the newly built image.
    ```bash
    # Example push commands
    aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <your-aws-account-id>.dkr.ecr.<your-region>.amazonaws.com
    docker push <your-ecr-repo-uri>:<image-tag>
    ```
    *(This process is typically automated in a CI/CD pipeline.)*

### Step 2: Apply Terraform Configuration

Once the new image is in ECR, you can deploy it by updating the infrastructure.

1.  **Initialize Terraform:**
    ```bash
    cd infrastructure
    terraform init
    ```

2.  **Update Task Definition:** Modify the Terraform variable that specifies the image tag for the ECS Task Definition to point to your new image version.

3.  **Plan and Apply:**
    ```bash
    # See what changes will be made
    terraform plan

    # Apply the changes to your AWS environment
    terraform apply
    ```
Terraform will then trigger a new deployment on ECS, which will pull the new image from ECR and start new tasks, gracefully draining connections from the old ones.
