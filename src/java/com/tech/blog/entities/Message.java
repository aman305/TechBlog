    
package com.tech.blog.entities;

public class Message {
    
    private String content;
    private String type;
    private String cssClass;

    public Message(String content, String type, String cssString) {
        this.content = content;
        this.type = type;
        this.cssClass = cssString;
    }

    public String getContent() {
        return content;
    }

    public String getType() {
        return type;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setCssClass(String cssString) {
        this.cssClass = cssString;
    }
    
    
}
