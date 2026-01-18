package org.cloud_ops_crew.Java

class TestReport implements Serializable {
    def script

    TestReport(script) {  
        this.script = script
    }

    def archiveReport() {       
        script.junit '**/target/surefire-reports/*.xml'
        script.archiveArtifacts artifacts: 'target/**/*.jar, target/surefire-reports/*.*', fingerprint: true
    }
}

