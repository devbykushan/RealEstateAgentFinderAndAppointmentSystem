package org.example.realestateagentfinderandappointmentsystem.dataStructures;

import org.example.realestateagentfinderandappointmentsystem.models.Agent;

public class AgentTree {
    public AgentNode root;

    public AgentTree() {
        this.root = null;
    }

    public void insertNewAgent(Agent agent) {
        AgentNode newAgentNode = new AgentNode(agent);

        if (root == null) {
            root = newAgentNode;
        } else {
            AgentNode current = root;
            AgentNode parent;

            while (true) {
                parent = current;
                int newAgentId = Integer.parseInt(newAgentNode.getAgent().getUserId().substring(3, 6));
                int currentAgentId = Integer.parseInt(current.getAgent().getUserId().substring(3, 6));

                if (newAgentId < currentAgentId) {
                    current = current.left;

                    if (current == null) {
                        parent.left = newAgentNode;
                        return;
                    }
                } else {
                    current = current.right;

                    if (current == null) {
                        parent.right = newAgentNode;
                        return;
                    }
                }
            }
        }
    }

    public void InOrder(AgentNode localRoot) {
        if (localRoot != null) {
            InOrder(localRoot.left);
            localRoot.writeNode();
            InOrder(localRoot.right);
        }

    }

    public void preOrder(AgentNode localRoot) {
        if (localRoot != null) {
            localRoot.writeNode();
            preOrder(localRoot.left);
            preOrder(localRoot.right);
        }

    }

    public void postOrder(AgentNode localRoot) {
        if (localRoot != null) {
            postOrder(localRoot.left);
            postOrder(localRoot.right);
            localRoot.writeNode();
        }

    }
}