package com.cognizant.exercise5.controller;

import com.cognizant.exercise5.entity.Country;
import com.cognizant.exercise5.exception.CountryNotFoundException;
import com.cognizant.exercise5.service.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.DeleteMapping;

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
    @PostMapping("/countries")
    public Country addCountry(@RequestBody Country country) {
        return countryService.addCountry(country);
    }
    @PutMapping("/countries")
    public Country updateCountry(@RequestBody Country country)
            throws CountryNotFoundException {

        return countryService.updateCountry(country);
    }
    @DeleteMapping("/countries/{code}")
    public String deleteCountry(@PathVariable String code)
            throws CountryNotFoundException {

        countryService.deleteCountry(code);
        return "Country deleted successfully";
    }
}