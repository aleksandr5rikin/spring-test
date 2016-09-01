package com.test.repository;

import com.test.entity.Field;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by cocozub on 20.08.2016.
 */

@Repository
public interface FieldRepository extends JpaRepository<Field, Integer> {
    List<Field> findAll();

    @Query("select f  from Field f where f.active = true")
    List<Field> findActiveFields();

    Field findByName (String name);
}
