package org.cloud_ops_crew.Golang

class CheckoutRepo implements Serializable {
    def script   

    CheckoutRepo(script) {
        this.script = script
    }

    def checkout(String REPO_URL, String BRANCH_NAME = 'main', String credentialsId = null) {
        script.git url: REPO_URL, branch: BRANCH_NAME, credentialsId: credentialsId
    }
}

