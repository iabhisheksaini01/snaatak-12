package org.cloud_ops_crew.Java

class SurefireReport implements Serializable {
    def script

    SurefireReport(script) {   
        this.script = script
    }

    def generateReport() {          
        script.sh 'mvn surefire-report:report-only'
    }
}

