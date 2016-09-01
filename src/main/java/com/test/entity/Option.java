package com.test.entity;

import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Created by cocozub on 25.08.2016.
 */

@Entity
@Table(name="options")
public class Option {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @NotNull
    @ManyToOne( fetch = FetchType.EAGER )
    @JoinColumn(name="field_id")
    private Field field;

    @NotNull
    private String value;

    public Option(){}

    public Option(String value, Field field){
        this.value = value;
        this.field = field;
    }

    public int getId() {
        return id;
    }

    public Field getField() {
        return field;
    }

    public String getValue() {
        return value;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setField(Field field) {
        this.field = field;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
