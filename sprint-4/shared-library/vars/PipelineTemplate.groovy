import org.cloud_ops_crew.Java.*

def call(Map config) {
    stage('Clean Workspace') {
        new CleanWorkspace(this).clear()
    }

    stage('Checkout Repo') {
        new CheckoutRepo(this).checkout(config.repoUrl, config.branch, config.credentialsId)
    }

    stage('Run Tests') {
        new MvnTest(this).test()
    }

    stage('Generate Report') {
        new SurefireReport(this).generateReport()
    }

    stage('Archive Test Report') {
        new TestReport(this).archiveReport()
    }

    stage('Notification') {
        new Email(this).mail(true, config.email)
        new Slack(this).slackNotify("SUCCESS", currentBuild.fullDisplayName, config.slackChannel)
    }
}
