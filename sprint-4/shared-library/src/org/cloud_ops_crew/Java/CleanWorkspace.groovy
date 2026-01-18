package org.cloud_ops_crew.Java

class CleanWorkspace implements Serializable {
    def script

    CleanWorkspace(script) { 
        this.script = script 
    }
    
    def clear() {
        script.echo "cleaning workspace..."
        script.cleanWs()
    }
}

