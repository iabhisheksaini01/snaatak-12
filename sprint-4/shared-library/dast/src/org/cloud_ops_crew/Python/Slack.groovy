package org.cloud_ops_crew.Python

class Slack implements Serializable {
    def script

    Slack(script) {  
        this.script = script
    }

    def slackNotify(String status, String buildName, String channel) {
        if (status == 'SUCCESS') {
            script.slackSend(
                channel: channel,
                color: 'good',
                message: """Hello Abhishek,
SUCCESS: Build ${buildName} completed."""
            )
        } else {
            script.slackSend(
                channel: channel,
                color: 'danger',
                message: """Hello Abhishek,
FAILED: Build ${buildName} failed."""
            )
        }
    }
}

