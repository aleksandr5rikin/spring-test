package com.test.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Created by cocozub on 25.08.2016.
 */

@Entity
@Table(name="fields_values")
public class FieldValue {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @NotNull
    private String value;

    @NotNull
    @ManyToOne( fetch = FetchType.EAGER )
    @JoinColumn(name="field_id")
    private Field field;

    @NotNull
    @ManyToOne( fetch = FetchType.EAGER )
    @JoinColumn(name="user_id")
    private User user;

    public FieldValue(){}

    public FieldValue(String value, Field field, User user) {
        this.value = value;
        this.field = field;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public String getValue() {
        return value;
    }

    public Field getField() {
        return field;
    }

    public User getUser() {
        return user;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public void setField(Field field) {
        this.field = field;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
