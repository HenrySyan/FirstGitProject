package com.example.demo.repository;

import com.example.demo.model.NewRelease;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NewReleaseRepository extends JpaRepository<NewRelease,Integer> {

}
