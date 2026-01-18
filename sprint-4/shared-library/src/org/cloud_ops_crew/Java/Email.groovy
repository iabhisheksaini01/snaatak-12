package org.cloud_ops_crew.Java

class Email implements Serializable {
    def script

    Email(script) {  
        this.script = script
    }

    def mail(boolean success, String recipientEmail) {
        if (success) {
            script.emailext(
                to: recipientEmail,
                subject: "Build SUCCESS: ${script.currentBuild.fullDisplayName}",
                body: """Hello,  

Your build has completed successfully.  
Please find the attached HTML test report for details.""",
                attachmentsPattern: 'target/site/surefire-report.html'
            )
        } else {
            script.emailext(
                to: recipientEmail,
                subject: "Build FAILED: ${script.currentBuild.fullDisplayName}",
                body: """Hello,  

Your build has failed.  
Logs and test report (if available) are attached for review.""",
                attachLog: true,
                attachmentsPattern: 'target/site/surefire-report.html'
            )
        }
    }
}

