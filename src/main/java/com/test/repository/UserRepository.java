package com.test.repository;

import com.test.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by cocozub on 20.08.2016.
 */
@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    List<User> findAll();
}
