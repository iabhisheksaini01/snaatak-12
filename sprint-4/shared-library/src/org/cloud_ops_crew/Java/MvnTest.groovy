package org.cloud_ops_crew.Java

class MvnTest implements Serializable {
    def script
    
    MvnTest(script) {
        this.script = script
    }
    
    def test() {
        script.sh 'mvn test'
    }
}

