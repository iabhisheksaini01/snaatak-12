import org.cloud_ops_crew.Golang.*

def call(Map config) {
    stage('Clean Workspace') {
        new CleanWorkspace(this).clear()
    }

    stage('Checkout Repo') {
        new CheckoutRepo(this).checkout(config.repoUrl, config.branch, config.credentialsId)
    }

    stage('Compile') {
    new GoBuild(this).compile(config.BINARY_NAME, config.MAIN_FILE)
    }
    
    stage('Notification') {
        new Email(this).mail(true, config.email)
        new Slack(this).slackNotify("SUCCESS", currentBuild.fullDisplayName, config.slackChannel)
    }
}
