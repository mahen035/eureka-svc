pipeline {
    agent any

    stages {
        stage('Build Eureka Service') {
            steps {
               checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mahen035/eureka-svc.git']])
               bat 'mvn clean install'
            }
        }
        
         stage('Build Eureka Service Docker Image') {
            steps {
               bat 'docker build -t mahen036/eureka-svc .'
            }
        }
        
        stage('Run Eureka Service') {
            steps {
               bat 'docker run -d --name eureka-cont --network stud-network -p 8761:8761 mahen036/eureka-svc'
            }
        }
        stage('Run Student Job') {
            steps {
                build 'student-job'
            }
        }
    }
}
