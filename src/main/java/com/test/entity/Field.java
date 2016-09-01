package com.test.entity;

import com.test.dto.FieldDto;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by cocozub on 19.08.2016.
 */

@Entity
@Table(name = "fields")
public class Field {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(unique = true)
    @NotNull
    private String name;

    @NotNull
    private String type;

    @OneToMany(orphanRemoval=true, fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy="field")
    private List<Option> options;

    @OneToMany(orphanRemoval=true, fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy="field")
    private List<FieldValue> fieldsValues;

    @NotNull
    private boolean required;

    @NotNull
    private boolean active;

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public List<Option> getOptions() {
        return options;
    }

    public boolean isRequired() {
        return required;
    }

    public boolean isActive() {
        return active;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String label) {
        this.name = label;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setOptions(List<Option> options) {
        this.options = options;
    }

    public void setRequired(boolean required) {
        this.required = required;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
