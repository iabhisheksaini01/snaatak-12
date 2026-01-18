package org.cloud_ops_crew.Python

class ZapScan implements Serializable {
    def script

    ZapScan(script) {
        this.script = script
    }

    def runZapScan(String targetUrl, String reportName, int zapPort, String zapPath) {
        script.sh """
            echo "Using ZAP at ${zapPath}"

            "${zapPath}" \
                -cmd -port ${zapPort} \
                -quickurl "${targetUrl}" \
                -quickout "\${WORKSPACE}/${reportName}"
        """
    }
}
