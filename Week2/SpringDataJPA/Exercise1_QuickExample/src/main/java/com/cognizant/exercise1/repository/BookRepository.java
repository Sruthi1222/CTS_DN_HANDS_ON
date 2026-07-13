package com.cognizant.exercise1.repository;

import com.cognizant.exercise1.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Integer> {

}