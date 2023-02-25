pipeline {
    agent any

    stages {
        stage('CI') {
            steps {
                git 'https://github.com/MMamdouh996/Simple_Django_app.git'
                withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh """
                docker login -u ${USERNAME} -p ${PASSWORD}
                docker build . -t mohamedmamdouhiv/gp-django-app:v1.0 --network host
                docker push mohamedmamdouhiv/gp-django-app:v1.0
                """
                }
            }
        }
         stage('CD') {
            steps {
                git 'https://github.com/MMamdouh996/Simple_Django_app.git'
                withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh """
                kubectl apply -f /var/jenkins_home/workspace/GP-App/k8s-yamls/app.yaml
                kubectl apply -f /var/jenkins_home/workspace/GP-App/k8s-yamls/service-app.yaml
                """
                }
            }
        }
    }
}
