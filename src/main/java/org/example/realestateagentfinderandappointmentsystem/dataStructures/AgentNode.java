package org.example.realestateagentfinderandappointmentsystem.dataStructures;

import org.example.realestateagentfinderandappointmentsystem.fileHandlers.AgentRegistrationFileHandler;
import org.example.realestateagentfinderandappointmentsystem.models.Agent;

public class AgentNode {
    private Agent agent;
    AgentNode left;
    AgentNode right;

    public AgentNode(Agent agent) {
        this.agent = agent;
        this.left = null;
        this.right = null;
    }

    public Agent getAgent() {
        return agent;
    }

    public void setAgent(Agent agent) {
        this.agent = agent;
    }

    public void writeNode() {
        AgentRegistrationFileHandler reg = new AgentRegistrationFileHandler();
        reg.writeToFile(agent);
    }

}
