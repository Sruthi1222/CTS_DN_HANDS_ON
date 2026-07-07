package com.library.LibraryManagement.controller;
import com.library.LibraryManagement.entity.Book;
import com.library.LibraryManagement.repository.BookRepository;
import org.springframework.web.bind.annotation.*;
import java.util.List;
@RestController
@RequestMapping("/books")
public class BookController {
    private final BookRepository repository;
    public BookController(BookRepository repository) {
        this.repository = repository;
    }
    @PostMapping
    public Book addBook(@RequestBody Book book) {
        return repository.save(book);
    }
    @GetMapping
    public List<Book> getBooks() {
        return repository.findAll();
    }
}