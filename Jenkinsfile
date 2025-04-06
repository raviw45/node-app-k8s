pipeline{
    agent any

    stages{
        stage("npm install"){
          steps{
            script{
            sh 'npm install'
            }
          }
        }

        stage("Build image"){
            steps{
              script{
                sh 'docker build -t raviw4/node-app .'
              }
            }
        }

        stage("Push Image to dockerhub"){
           steps{
             script{
                  withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhubpwd')]) {
                     sh 'docker login -u raviw4 -p ${dockerhubpwd}'
                   }
                   sh 'docker push raviw4/node-app'
             }
           }
        }

        stage("Deploy to k8s"){
            steps{
                script{
                    kubernetesDeploy configs: 'k8s.yml', kubeConfig: [path: ''], kubeconfigId: 'k8sconfig', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://']
                }
            }
        }
    }
}