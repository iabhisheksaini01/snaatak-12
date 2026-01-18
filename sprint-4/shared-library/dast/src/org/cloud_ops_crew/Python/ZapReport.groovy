package org.cloud_ops_crew.Python

class ZapReport implements Serializable {
    def script

    ZapReport(script) {
        this.script = script
    }

    def archiveReports() {
        script.archiveArtifacts artifacts: 'zap-report.html'
    }
}
