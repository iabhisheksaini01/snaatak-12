
import org.cloud_ops_crew.Python.*

def call(Map config) {

    stage('Clean Workspace') {
        new CleanWorkspace(this).clear()
    }

    stage('Run ZAP Scan') {
        new ZapScan(this).runZapScan(
            config.targetUrl,
            'zap-report.html',
            config.zapPort,
            config.zapPath
        )
    }

    stage('Archive Report') {
        new ZapReport(this).archiveReports()
    }

    stage('Notification') {
        new Email(this).mail(true, config.email)
        new Slack(this).slackNotify(
            "SUCCESS",
            currentBuild.fullDisplayName,
            config.slackChannel
        )
    }
}

