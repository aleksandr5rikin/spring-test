package com.test.dto;

import com.test.entity.Option;

import java.util.List;

/**
 * Created by cocozub on 24.08.2016.
 */
public class FieldDto {

    private String name;

    private String type;

    private List<String> options;

    private boolean required;

    private boolean active;

    public FieldDto(){}

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public List<String> getOptions() {
        return options;
    }

    public boolean isRequired() {
        return required;
    }

    public boolean isActive() {
        return active;
    }

    public void setName(String label) {
        this.name = label;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setOptions(List<String> options) {
        this.options = options;
    }

    public void setRequired(boolean required) {
        this.required = required;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
