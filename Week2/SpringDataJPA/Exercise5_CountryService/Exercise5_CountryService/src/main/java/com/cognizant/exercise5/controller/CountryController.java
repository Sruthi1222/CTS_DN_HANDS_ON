package com.cognizant.exercise5.controller;

import com.cognizant.exercise5.entity.Country;
import com.cognizant.exercise5.exception.CountryNotFoundException;
import com.cognizant.exercise5.service.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CountryController {

    @Autowired
    private CountryService countryService;

    @GetMapping("/countries")
    public List<Country> getAllCountries() {
        return countryService.getAllCountries();
    }

    @GetMapping("/countries/{code}")
    public Country getCountry(@PathVariable String code)
            throws CountryNotFoundException {

        return countryService.findCountryByCode(code);
    }
}