package org.cloud_ops_crew.Golang

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

