// Jenkinsfile
String TF_ENVIRONMENT = 'staging'

try {
  stage('checkout') {
    node {
      checkout scm
    }
  }

  // Run terraform init
  stage('init') {
    node(label: 'master') {
          sh "cd ${TF_ENVIRONMENT} && terraform init"
    }
  }

  // Run terraform plan
  stage('plan') {
    node(label: 'master') {
          sh "cd ${TF_ENVIRONMENT} && terraform plan"
    }
  }
  
  // Check if plan is valid and then proceed to terraform apply state
  timeout(time: 15, unit: "MINUTES") {
    input message: 'Do you want to approve this terraform plan and trigger terraform apply actions?', ok: 'Yes'
  }
  
  if (env.BRANCH_NAME == 'master') {

    // Run terraform apply
    stage('apply') {
      node(label: 'master') {
            sh "cd ${TF_ENVIRONMENT} && terraform apply -auto-approve"
      }
    }
    // Run terraform show
    stage('show') {
      node(label: 'master') {
            sh "cd ${TF_ENVIRONMENT} && terraform show"
      }
    }
  }
  currentBuild.result = 'SUCCESS'
}
catch (org.jenkinsci.plugins.workflow.steps.FlowInterruptedException flowError) {
  currentBuild.result = 'ABORTED'
}
catch (err) {
  currentBuild.result = 'FAILURE'
  throw err
}
finally {
  if (currentBuild.result == 'SUCCESS') {
    currentBuild.result = 'SUCCESS'
  }
}
