#!/usr/bin/env groovy
pipeline{
    agent any
    environment{
        AWS_ACCESS_KEY_ID = credendtials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credendtials('AWS_SECRET_ACCESS_KEY')
        AWS_SESSION_TOKEN = credendtials('AWS_SESSION_TOKEN')
        AWS_DEFAULT_REGION = "us-west-2"

    }
    stages{
        stage("Create an EKS clsuter") {
            steps{
                script{
                    dir('jenkins_pipeline-deploy-eks/terraform') {
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
        stage("Deploy to EKS") {
            steps{
                script{
                    dir('jenkins_pipeline-deploy-eks/kuberenetes') {
                        sh 'aws eks update-kubeconfig --name myapp-eks-cluster'
                        sh 'kubectl apply -f nginx-deployment.yaml'
                        sh 'kubectl apply -f nginx-service.yaml'
                    }
                }
            }
    }}
}